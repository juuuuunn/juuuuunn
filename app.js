(() => {
  "use strict";

  // --- データ管理 ---
  const STORAGE_KEY = "chinchilla_weight_app";

  function loadData() {
    const raw = localStorage.getItem(STORAGE_KEY);
    if (!raw) return { chinchillas: [], selectedId: null };
    try {
      return JSON.parse(raw);
    } catch {
      return { chinchillas: [], selectedId: null };
    }
  }

  function saveData(data) {
    localStorage.setItem(STORAGE_KEY, JSON.stringify(data));
  }

  function generateId() {
    return Date.now().toString(36) + Math.random().toString(36).slice(2, 7);
  }

  // --- DOM要素 ---
  const elSelect = document.getElementById("chinchilla-select");
  const elNewName = document.getElementById("new-chinchilla-name");
  const elNewBirthday = document.getElementById("new-chinchilla-birthday");
  const elBtnAdd = document.getElementById("btn-add-chinchilla");
  const elBtnDelete = document.getElementById("btn-delete-chinchilla");
  const elInfo = document.getElementById("chinchilla-info");
  const elWeightDate = document.getElementById("weight-date");
  const elWeightValue = document.getElementById("weight-value");
  const elWeightMemo = document.getElementById("weight-memo");
  const elBtnAddWeight = document.getElementById("btn-add-weight");
  const elTbody = document.getElementById("weight-tbody");
  const elNoData = document.getElementById("no-data-msg");
  const elCanvas = document.getElementById("weight-chart");

  let chart = null;
  let data = loadData();

  // --- 初期化 ---
  function init() {
    elWeightDate.value = todayStr();
    renderChinchillaSelect();
    if (data.selectedId) {
      elSelect.value = data.selectedId;
    }
    onSelectChange();

    elBtnAdd.addEventListener("click", addChinchilla);
    elNewName.addEventListener("keydown", (e) => {
      if (e.key === "Enter") addChinchilla();
    });
    elBtnDelete.addEventListener("click", deleteChinchilla);
    elSelect.addEventListener("change", onSelectChange);
    elBtnAddWeight.addEventListener("click", addWeight);
    elWeightValue.addEventListener("keydown", (e) => {
      if (e.key === "Enter") addWeight();
    });
  }

  function todayStr() {
    return new Date().toISOString().slice(0, 10);
  }

  // --- チンチラ管理 ---
  function renderChinchillaSelect() {
    const options = data.chinchillas.map(
      (c) => `<option value="${c.id}">${escapeHtml(c.name)}</option>`
    );
    elSelect.innerHTML =
      '<option value="">-- チンチラを選択 --</option>' + options.join("");
  }

  function getSelected() {
    return data.chinchillas.find((c) => c.id === elSelect.value) || null;
  }

  function addChinchilla() {
    const name = elNewName.value.trim();
    if (!name) {
      elNewName.focus();
      return;
    }
    const chinchilla = {
      id: generateId(),
      name,
      birthday: elNewBirthday.value || null,
      records: [],
    };
    data.chinchillas.push(chinchilla);
    data.selectedId = chinchilla.id;
    saveData(data);
    renderChinchillaSelect();
    elSelect.value = chinchilla.id;
    elNewName.value = "";
    elNewBirthday.value = "";
    onSelectChange();
  }

  function deleteChinchilla() {
    const chin = getSelected();
    if (!chin) return;
    if (!confirm(`「${chin.name}」を削除しますか？\nすべての体重記録も削除されます。`))
      return;
    data.chinchillas = data.chinchillas.filter((c) => c.id !== chin.id);
    data.selectedId = null;
    saveData(data);
    renderChinchillaSelect();
    elSelect.value = "";
    onSelectChange();
  }

  function onSelectChange() {
    const chin = getSelected();
    data.selectedId = chin ? chin.id : null;
    saveData(data);
    elBtnDelete.disabled = !chin;

    if (chin) {
      let infoHtml = `<strong>${escapeHtml(chin.name)}</strong>`;
      if (chin.birthday) {
        infoHtml += ` ／ 誕生日: ${chin.birthday}`;
        const age = calcAge(chin.birthday);
        if (age) infoHtml += `（${age}）`;
      }
      if (chin.records.length > 0) {
        const latest = chin.records[chin.records.length - 1];
        infoHtml += ` ／ 最新体重: <strong>${latest.weight}g</strong>（${latest.date}）`;
      }
      elInfo.innerHTML = infoHtml;
      elInfo.classList.remove("hidden");
    } else {
      elInfo.classList.add("hidden");
    }

    renderTable();
    renderChart();
  }

  function calcAge(birthday) {
    const birth = new Date(birthday);
    const now = new Date();
    let years = now.getFullYear() - birth.getFullYear();
    let months = now.getMonth() - birth.getMonth();
    if (months < 0) {
      years--;
      months += 12;
    }
    if (now.getDate() < birth.getDate()) {
      months--;
      if (months < 0) {
        years--;
        months += 12;
      }
    }
    if (years > 0) return `${years}歳${months}ヶ月`;
    if (months > 0) return `${months}ヶ月`;
    return null;
  }

  // --- 体重記録 ---
  function addWeight() {
    const chin = getSelected();
    if (!chin) {
      alert("チンチラを選択してください。");
      return;
    }
    const dateVal = elWeightDate.value;
    const weightVal = parseFloat(elWeightValue.value);
    if (!dateVal) {
      elWeightDate.focus();
      return;
    }
    if (isNaN(weightVal) || weightVal <= 0) {
      elWeightValue.focus();
      return;
    }

    const record = {
      id: generateId(),
      date: dateVal,
      weight: weightVal,
      memo: elWeightMemo.value.trim(),
    };
    chin.records.push(record);
    chin.records.sort((a, b) => a.date.localeCompare(b.date));
    saveData(data);
    elWeightValue.value = "";
    elWeightMemo.value = "";
    onSelectChange();
  }

  function deleteWeight(recordId) {
    const chin = getSelected();
    if (!chin) return;
    chin.records = chin.records.filter((r) => r.id !== recordId);
    saveData(data);
    onSelectChange();
  }

  // --- テーブル描画 ---
  function renderTable() {
    const chin = getSelected();
    const records = chin ? chin.records : [];

    if (records.length === 0) {
      elTbody.innerHTML = "";
      elNoData.style.display = "block";
      return;
    }
    elNoData.style.display = "none";

    // 新しい順に表示
    const sorted = [...records].reverse();
    elTbody.innerHTML = sorted
      .map((r, i) => {
        const prevIdx = records.length - 1 - i - 1;
        let diffHtml = '<span class="diff-same">--</span>';
        if (prevIdx >= 0) {
          const diff = r.weight - records[prevIdx].weight;
          const sign = diff > 0 ? "+" : "";
          const cls =
            diff > 0 ? "diff-up" : diff < 0 ? "diff-down" : "diff-same";
          diffHtml = `<span class="${cls}">${sign}${diff.toFixed(1)}g</span>`;
        }
        return `<tr>
          <td>${r.date}</td>
          <td>${r.weight}g</td>
          <td>${diffHtml}</td>
          <td>${escapeHtml(r.memo || "")}</td>
          <td><button class="btn btn-danger btn-sm" onclick="window._deleteWeight('${r.id}')">削除</button></td>
        </tr>`;
      })
      .join("");
  }

  // グローバル公開（テーブルのonclickから呼ぶため）
  window._deleteWeight = deleteWeight;

  // --- グラフ描画 ---
  function renderChart() {
    const chin = getSelected();
    const records = chin ? chin.records : [];

    if (chart) {
      chart.destroy();
      chart = null;
    }

    if (records.length === 0) return;

    const labels = records.map((r) => r.date);
    const values = records.map((r) => r.weight);

    chart = new Chart(elCanvas, {
      type: "line",
      data: {
        labels,
        datasets: [
          {
            label: "体重 (g)",
            data: values,
            borderColor: "#a68b6b",
            backgroundColor: "rgba(166,139,107,0.1)",
            fill: true,
            tension: 0.3,
            pointRadius: 4,
            pointBackgroundColor: "#a68b6b",
          },
        ],
      },
      options: {
        responsive: true,
        maintainAspectRatio: false,
        plugins: {
          legend: { display: false },
          tooltip: {
            callbacks: {
              label: (ctx) => `${ctx.parsed.y}g`,
            },
          },
        },
        scales: {
          x: {
            ticks: { maxTicksLimit: 10, font: { size: 11 } },
            grid: { display: false },
          },
          y: {
            ticks: {
              callback: (v) => v + "g",
              font: { size: 11 },
            },
            grid: { color: "#f0ebe5" },
          },
        },
      },
    });
  }

  // --- ユーティリティ ---
  function escapeHtml(str) {
    const div = document.createElement("div");
    div.textContent = str;
    return div.innerHTML;
  }

  // --- 起動 ---
  init();
})();
