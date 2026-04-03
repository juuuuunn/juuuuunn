(() => {
  "use strict";

  // --- データ管理 ---
  const STORAGE_KEY = "chinchilla_health_app";

  function loadData() {
    const raw = localStorage.getItem(STORAGE_KEY);
    if (!raw) {
      return {
        chinchillas: [],
        selectedId: null,
      };
    }
    try {
      return JSON.parse(raw);
    } catch {
      return {
        chinchillas: [],
        selectedId: null,
      };
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

  let currentChart = null;
  let foodChart = null;
  let healthChart = null;
  let data = loadData();

  // --- 初期化 ---
  function init() {
    // チンチラ管理
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

    // 体重タブ
    setupWeightTab();

    // 食事タブ
    setupFoodTab();

    // 健康チェックタブ
    setupHealthTab();

    // 行動タブ
    setupBehaviorTab();

    // 医療タブ
    setupMedicalTab();

    // 環境タブ
    setupEnvironmentTab();

    // タブ切り替え
    setupTabNavigation();

    // 分析タブ
    setupAnalyticsTab();
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
      weight: [],
      food: [],
      health: [],
      behavior: [],
      medical: [],
      environment: [],
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
    if (
      !confirm(
        `「${chin.name}」を削除しますか？\nすべてのデータも削除されます。`
      )
    )
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
      if (chin.weight && chin.weight.length > 0) {
        const latest = chin.weight[chin.weight.length - 1];
        infoHtml += ` ／ 最新体重: <strong>${latest.weight}g</strong>（${latest.date}）`;
      }
      elInfo.innerHTML = infoHtml;
      elInfo.classList.remove("hidden");
    } else {
      elInfo.classList.add("hidden");
    }

    updateAllTabs();
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

  // --- 体重タブ ---
  function setupWeightTab() {
    const elWeightDate = document.getElementById("weight-date");
    const elWeightValue = document.getElementById("weight-value");
    const elWeightMemo = document.getElementById("weight-memo");
    const elBtnAddWeight = document.getElementById("btn-add-weight");

    elWeightDate.value = todayStr();

    elBtnAddWeight.addEventListener("click", addWeight);
    elWeightValue.addEventListener("keydown", (e) => {
      if (e.key === "Enter") addWeight();
    });

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
      if (!chin.weight) chin.weight = [];
      chin.weight.push(record);
      chin.weight.sort((a, b) => a.date.localeCompare(b.date));
      saveData(data);
      elWeightValue.value = "";
      elWeightMemo.value = "";
      updateWeightTab();
    }

    window._deleteWeight = function (recordId) {
      const chin = getSelected();
      if (!chin || !chin.weight) return;
      chin.weight = chin.weight.filter((r) => r.id !== recordId);
      saveData(data);
      updateWeightTab();
    };
  }

  function updateWeightTab() {
    const chin = getSelected();
    const records = (chin && chin.weight) || [];

    // テーブル
    const elTbody = document.getElementById("weight-tbody");
    const elNoData = document.getElementById("weight-no-data-msg");

    if (records.length === 0) {
      elTbody.innerHTML = "";
      elNoData.style.display = "block";
    } else {
      elNoData.style.display = "none";
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

    // グラフ
    renderWeightChart(records);
  }

  function renderWeightChart(records) {
    const elCanvas = document.getElementById("weight-chart");
    if (currentChart && currentChart.canvas && currentChart.canvas.id === "weight-chart") {
      currentChart.destroy();
    }

    if (records.length === 0) return;

    const labels = records.map((r) => r.date);
    const values = records.map((r) => r.weight);

    currentChart = new Chart(elCanvas, {
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

  // --- 食事タブ ---
  function setupFoodTab() {
    const elFoodDate = document.getElementById("food-date");
    const elFoodTime = document.getElementById("food-time");
    const elFoodType = document.getElementById("food-type");
    const elFoodAmount = document.getElementById("food-amount");
    const elFoodMemo = document.getElementById("food-memo");
    const elBtnAddFood = document.getElementById("btn-add-food");

    elFoodDate.value = todayStr();

    elBtnAddFood.addEventListener("click", addFood);

    function addFood() {
      const chin = getSelected();
      if (!chin) {
        alert("チンチラを選択してください。");
        return;
      }
      const dateVal = elFoodDate.value;
      const timeVal = elFoodTime.value || "12:00";
      const typeVal = elFoodType.value;
      const amountVal = parseFloat(elFoodAmount.value);

      if (!dateVal || !typeVal) {
        alert("日付と食材を選択してください。");
        return;
      }
      if (isNaN(amountVal) || amountVal <= 0) {
        alert("量を入力してください。");
        return;
      }

      const record = {
        id: generateId(),
        date: dateVal,
        time: timeVal,
        type: typeVal,
        amount: amountVal,
        memo: elFoodMemo.value.trim(),
      };
      if (!chin.food) chin.food = [];
      chin.food.push(record);
      chin.food.sort((a, b) => {
        const dateA = new Date(`${a.date}T${a.time}`);
        const dateB = new Date(`${b.date}T${b.time}`);
        return dateA - dateB;
      });
      saveData(data);
      elFoodAmount.value = "";
      elFoodMemo.value = "";
      elFoodType.value = "";
      updateFoodTab();
    }

    window._deleteFood = function (recordId) {
      const chin = getSelected();
      if (!chin || !chin.food) return;
      chin.food = chin.food.filter((r) => r.id !== recordId);
      saveData(data);
      updateFoodTab();
    };
  }

  function updateFoodTab() {
    const chin = getSelected();
    const records = (chin && chin.food) || [];

    const elTbody = document.getElementById("food-tbody");
    const elNoData = document.getElementById("food-no-data-msg");

    if (records.length === 0) {
      elTbody.innerHTML = "";
      elNoData.style.display = "block";
    } else {
      elNoData.style.display = "none";
      const sorted = [...records].reverse();
      const foodTypeMap = {
        timothy: "チモシー",
        pellet: "ペレット",
        vegetable: "野菜",
        fruit: "果物",
        treat: "おやつ",
        water: "水",
        other: "その他",
      };
      elTbody.innerHTML = sorted
        .map((r) => {
          return `<tr>
            <td>${r.date}</td>
            <td>${r.time}</td>
            <td>${foodTypeMap[r.type] || r.type}</td>
            <td>${r.amount}g</td>
            <td>${escapeHtml(r.memo || "")}</td>
            <td><button class="btn btn-danger btn-sm" onclick="window._deleteFood('${r.id}')">削除</button></td>
          </tr>`;
        })
        .join("");
    }
  }

  // --- 健康チェックタブ ---
  function setupHealthTab() {
    const elHealthDate = document.getElementById("health-date");
    const elHealthFur = document.getElementById("health-fur");
    const elHealthEyes = document.getElementById("health-eyes");
    const elHealthStool = document.getElementById("health-stool");
    const elHealthAppetite = document.getElementById("health-appetite");
    const elHealthNotes = document.getElementById("health-notes");
    const elBtnAddHealth = document.getElementById("btn-add-health");

    elHealthDate.value = todayStr();

    elBtnAddHealth.addEventListener("click", addHealth);

    function addHealth() {
      const chin = getSelected();
      if (!chin) {
        alert("チンチラを選択してください。");
        return;
      }
      const dateVal = elHealthDate.value;
      if (!dateVal) {
        elHealthDate.focus();
        return;
      }

      const record = {
        id: generateId(),
        date: dateVal,
        fur: elHealthFur.value || null,
        eyes: elHealthEyes.value || null,
        stool: elHealthStool.value || null,
        appetite: elHealthAppetite.value || null,
        notes: elHealthNotes.value.trim(),
      };
      if (!chin.health) chin.health = [];
      chin.health.push(record);
      chin.health.sort((a, b) => a.date.localeCompare(b.date));
      saveData(data);
      elHealthFur.value = "";
      elHealthEyes.value = "";
      elHealthStool.value = "";
      elHealthAppetite.value = "";
      elHealthNotes.value = "";
      updateHealthTab();
      updateAlerts();
    }

    window._deleteHealth = function (recordId) {
      const chin = getSelected();
      if (!chin || !chin.health) return;
      chin.health = chin.health.filter((r) => r.id !== recordId);
      saveData(data);
      updateHealthTab();
      updateAlerts();
    };
  }

  function updateHealthTab() {
    const chin = getSelected();
    const records = (chin && chin.health) || [];

    const elTbody = document.getElementById("health-tbody");
    const elNoData = document.getElementById("health-no-data-msg");

    if (records.length === 0) {
      elTbody.innerHTML = "";
      elNoData.style.display = "block";
    } else {
      elNoData.style.display = "none";
      const sorted = [...records].reverse();
      const labelMap = {
        fur: { excellent: "優秀", good: "良好", normal: "普通", poor: "悪い" },
        eyes: { bright: "明るい", normal: "普通", dull: "曇りがち" },
        stool: { normal: "普通", soft: "軟便", hard: "硬い", abnormal: "異常" },
        appetite: {
          excellent: "優秀",
          good: "良好",
          normal: "普通",
          poor: "食べない",
        },
      };

      elTbody.innerHTML = sorted
        .map((r) => {
          const furLabel =
            r.fur && labelMap.fur[r.fur] ? labelMap.fur[r.fur] : "-";
          const eyesLabel =
            r.eyes && labelMap.eyes[r.eyes] ? labelMap.eyes[r.eyes] : "-";
          const stoolLabel =
            r.stool && labelMap.stool[r.stool]
              ? labelMap.stool[r.stool]
              : "-";
          const appetiteLabel =
            r.appetite && labelMap.appetite[r.appetite]
              ? labelMap.appetite[r.appetite]
              : "-";
          return `<tr>
            <td>${r.date}</td>
            <td>${furLabel}</td>
            <td>${eyesLabel}</td>
            <td>${stoolLabel}</td>
            <td>${appetiteLabel}</td>
            <td>${escapeHtml(r.notes || "")}</td>
            <td><button class="btn btn-danger btn-sm" onclick="window._deleteHealth('${r.id}')">削除</button></td>
          </tr>`;
        })
        .join("");
    }
  }

  // --- 行動タブ ---
  function setupBehaviorTab() {
    const elBehaviorDate = document.getElementById("behavior-date");
    const elBehaviorActivity = document.getElementById("behavior-activity");
    const elBehaviorSleep = document.getElementById("behavior-sleep");
    const elBehaviorNotes = document.getElementById("behavior-notes");
    const elBtnAddBehavior = document.getElementById("btn-add-behavior");

    elBehaviorDate.value = todayStr();

    elBtnAddBehavior.addEventListener("click", addBehavior);

    function addBehavior() {
      const chin = getSelected();
      if (!chin) {
        alert("チンチラを選択してください。");
        return;
      }
      const dateVal = elBehaviorDate.value;
      if (!dateVal) {
        elBehaviorDate.focus();
        return;
      }

      const record = {
        id: generateId(),
        date: dateVal,
        activity: elBehaviorActivity.value || null,
        sleep: parseFloat(elBehaviorSleep.value) || null,
        notes: elBehaviorNotes.value.trim(),
      };
      if (!chin.behavior) chin.behavior = [];
      chin.behavior.push(record);
      chin.behavior.sort((a, b) => a.date.localeCompare(b.date));
      saveData(data);
      elBehaviorActivity.value = "";
      elBehaviorSleep.value = "";
      elBehaviorNotes.value = "";
      updateBehaviorTab();
    }

    window._deleteBehavior = function (recordId) {
      const chin = getSelected();
      if (!chin || !chin.behavior) return;
      chin.behavior = chin.behavior.filter((r) => r.id !== recordId);
      saveData(data);
      updateBehaviorTab();
    };
  }

  function updateBehaviorTab() {
    const chin = getSelected();
    const records = (chin && chin.behavior) || [];

    const elTbody = document.getElementById("behavior-tbody");
    const elNoData = document.getElementById("behavior-no-data-msg");

    if (records.length === 0) {
      elTbody.innerHTML = "";
      elNoData.style.display = "block";
    } else {
      elNoData.style.display = "none";
      const sorted = [...records].reverse();
      const activityMap = {
        "very-active": "非常に活発",
        active: "活発",
        normal: "普通",
        quiet: "静か",
        sleeping: "寝てばかり",
      };
      elTbody.innerHTML = sorted
        .map((r) => {
          const activityLabel =
            r.activity && activityMap[r.activity]
              ? activityMap[r.activity]
              : "-";
          const sleepLabel = r.sleep ? `${r.sleep}時間` : "-";
          return `<tr>
            <td>${r.date}</td>
            <td>${activityLabel}</td>
            <td>${sleepLabel}</td>
            <td>${escapeHtml(r.notes || "")}</td>
            <td><button class="btn btn-danger btn-sm" onclick="window._deleteBehavior('${r.id}')">削除</button></td>
          </tr>`;
        })
        .join("");
    }
  }

  // --- 医療タブ ---
  function setupMedicalTab() {
    const elMedicalDate = document.getElementById("medical-date");
    const elMedicalType = document.getElementById("medical-type");
    const elMedicalClinic = document.getElementById("medical-clinic");
    const elMedicalDoctor = document.getElementById("medical-doctor");
    const elMedicalDetails = document.getElementById("medical-details");
    const elBtnAddMedical = document.getElementById("btn-add-medical");

    elMedicalDate.value = todayStr();

    elBtnAddMedical.addEventListener("click", addMedical);

    function addMedical() {
      const chin = getSelected();
      if (!chin) {
        alert("チンチラを選択してください。");
        return;
      }
      const dateVal = elMedicalDate.value;
      const typeVal = elMedicalType.value;
      if (!dateVal || !typeVal) {
        alert("日付と記録タイプを選択してください。");
        return;
      }

      const record = {
        id: generateId(),
        date: dateVal,
        type: typeVal,
        clinic: elMedicalClinic.value.trim(),
        doctor: elMedicalDoctor.value.trim(),
        details: elMedicalDetails.value.trim(),
      };
      if (!chin.medical) chin.medical = [];
      chin.medical.push(record);
      chin.medical.sort((a, b) => a.date.localeCompare(b.date));
      saveData(data);
      elMedicalType.value = "";
      elMedicalClinic.value = "";
      elMedicalDoctor.value = "";
      elMedicalDetails.value = "";
      updateMedicalTab();
    }

    window._deleteMedical = function (recordId) {
      const chin = getSelected();
      if (!chin || !chin.medical) return;
      chin.medical = chin.medical.filter((r) => r.id !== recordId);
      saveData(data);
      updateMedicalTab();
    };
  }

  function updateMedicalTab() {
    const chin = getSelected();
    const records = (chin && chin.medical) || [];

    const elTbody = document.getElementById("medical-tbody");
    const elNoData = document.getElementById("medical-no-data-msg");

    if (records.length === 0) {
      elTbody.innerHTML = "";
      elNoData.style.display = "block";
    } else {
      elNoData.style.display = "none";
      const sorted = [...records].reverse();
      const typeMap = {
        checkup: "健康診断",
        treatment: "治療",
        medication: "投薬",
        vaccination: "予防接種",
        other: "その他",
      };
      elTbody.innerHTML = sorted
        .map((r) => {
          const typeLabel = typeMap[r.type] || r.type;
          const clinic = r.clinic ? escapeHtml(r.clinic) : "-";
          const details = escapeHtml(
            r.details.substring(0, 30) + (r.details.length > 30 ? "..." : "")
          );
          return `<tr>
            <td>${r.date}</td>
            <td>${typeLabel}</td>
            <td>${clinic}</td>
            <td title="${escapeHtml(r.details)}">${details}</td>
            <td><button class="btn btn-danger btn-sm" onclick="window._deleteMedical('${r.id}')">削除</button></td>
          </tr>`;
        })
        .join("");
    }
  }

  // --- 環境タブ ---
  function setupEnvironmentTab() {
    const elEnvDate = document.getElementById("environment-date");
    const elEnvTime = document.getElementById("environment-time");
    const elEnvTemp = document.getElementById("environment-temp");
    const elEnvHumidity = document.getElementById("environment-humidity");
    const elEnvNotes = document.getElementById("environment-notes");
    const elBtnAddEnv = document.getElementById("btn-add-environment");

    elEnvDate.value = todayStr();
    elEnvTime.value = "12:00";

    elBtnAddEnv.addEventListener("click", addEnvironment);

    function addEnvironment() {
      const chin = getSelected();
      if (!chin) {
        alert("チンチラを選択してください。");
        return;
      }
      const dateVal = elEnvDate.value;
      const timeVal = elEnvTime.value;
      const tempVal = parseFloat(elEnvTemp.value);
      const humidityVal = parseFloat(elEnvHumidity.value);

      if (!dateVal) {
        elEnvDate.focus();
        return;
      }
      if (isNaN(tempVal) || isNaN(humidityVal)) {
        alert("気温と湿度を入力してください。");
        return;
      }

      const record = {
        id: generateId(),
        date: dateVal,
        time: timeVal,
        temp: tempVal,
        humidity: humidityVal,
        notes: elEnvNotes.value.trim(),
      };
      if (!chin.environment) chin.environment = [];
      chin.environment.push(record);
      chin.environment.sort((a, b) => {
        const dateA = new Date(`${a.date}T${a.time}`);
        const dateB = new Date(`${b.date}T${b.time}`);
        return dateA - dateB;
      });
      saveData(data);
      elEnvTemp.value = "";
      elEnvHumidity.value = "";
      elEnvNotes.value = "";
      updateEnvironmentTab();
      updateAlerts();
    }

    window._deleteEnvironment = function (recordId) {
      const chin = getSelected();
      if (!chin || !chin.environment) return;
      chin.environment = chin.environment.filter((r) => r.id !== recordId);
      saveData(data);
      updateEnvironmentTab();
      updateAlerts();
    };
  }

  function updateEnvironmentTab() {
    const chin = getSelected();
    const records = (chin && chin.environment) || [];

    const elTbody = document.getElementById("environment-tbody");
    const elNoData = document.getElementById("environment-no-data-msg");

    if (records.length === 0) {
      elTbody.innerHTML = "";
      elNoData.style.display = "block";
    } else {
      elNoData.style.display = "none";
      const sorted = [...records].reverse();
      elTbody.innerHTML = sorted
        .map((r) => {
          return `<tr>
            <td>${r.date}</td>
            <td>${r.time}</td>
            <td>${r.temp}°C</td>
            <td>${r.humidity}%</td>
            <td>${escapeHtml(r.notes || "")}</td>
            <td><button class="btn btn-danger btn-sm" onclick="window._deleteEnvironment('${r.id}')">削除</button></td>
          </tr>`;
        })
        .join("");
    }
  }

  // --- タブナビゲーション ---
  function setupTabNavigation() {
    const tabBtns = document.querySelectorAll(".tab-btn");
    const tabContents = document.querySelectorAll(".tab-content");

    tabBtns.forEach((btn) => {
      btn.addEventListener("click", () => {
        const tabName = btn.getAttribute("data-tab");

        // すべてのタブボタンと内容を非アクティブに
        tabBtns.forEach((b) => b.classList.remove("active"));
        tabContents.forEach((c) => c.classList.remove("active"));

        // 選択されたタブをアクティブに
        btn.classList.add("active");
        document.getElementById(`${tabName}-tab`).classList.add("active");

        // 分析タブの場合はグラフを更新
        if (tabName === "analytics") {
          updateAnalyticsTab();
        }
      });
    });
  }

  // --- アラート ---
  function updateAlerts() {
    const chin = getSelected();
    const elAlertsContainer = document.getElementById("alerts-container");
    const elAlertsEmpty = document.getElementById("alerts-empty");
    const alerts = [];

    if (!chin) {
      elAlertsEmpty.style.display = "block";
      elAlertsContainer.innerHTML = "";
      return;
    }

    // 体重チェック
    if (chin.weight && chin.weight.length >= 2) {
      const latest = chin.weight[chin.weight.length - 1];
      const prev = chin.weight[chin.weight.length - 2];
      const diff = latest.weight - prev.weight;

      if (Math.abs(diff) > 10) {
        alerts.push({
          level: "danger",
          title: "体重の急激な変化",
          message: `最新の体重は${latest.weight}g で、前回（${prev.weight}g）から ${diff > 0 ? "+" : ""}${diff.toFixed(1)}g の変化があります。`,
        });
      }
    }

    // 環境チェック（気温・湿度）
    if (chin.environment && chin.environment.length > 0) {
      const latest = chin.environment[chin.environment.length - 1];
      if (latest.temp > 27) {
        alerts.push({
          level: "warning",
          title: "気温が高い",
          message: `現在の気温は ${latest.temp}°C です。チンチラは高温に弱いため、注意してください。`,
        });
      }
      if (latest.humidity > 60) {
        alerts.push({
          level: "warning",
          title: "湿度が高い",
          message: `現在の湿度は ${latest.humidity}% です。カビ対策に注意してください。`,
        });
      }
    }

    // 健康チェック
    if (chin.health && chin.health.length > 0) {
      const latest = chin.health[chin.health.length - 1];
      if (
        latest.stool === "soft" ||
        latest.stool === "hard" ||
        latest.stool === "abnormal"
      ) {
        alerts.push({
          level: "warning",
          title: "便の異常",
          message: `${latest.date}の健康チェックで便に異常が見られています。`,
        });
      }
      if (latest.appetite === "poor") {
        alerts.push({
          level: "danger",
          title: "食欲の低下",
          message: `${latest.date}の健康チェックで食欲が低下しています。原因を確認してください。`,
        });
      }
      if (latest.notes) {
        alerts.push({
          level: "info",
          title: "健康メモ",
          message: `${latest.date}: ${escapeHtml(latest.notes)}`,
        });
      }
    }

    if (alerts.length === 0) {
      elAlertsEmpty.style.display = "block";
      elAlertsContainer.innerHTML = "";
    } else {
      elAlertsEmpty.style.display = "none";
      elAlertsContainer.innerHTML = alerts
        .map(
          (a) => `
        <div class="alert-box alert-${a.level}">
          <div class="alert-title">${escapeHtml(a.title)}</div>
          <div class="alert-message">${escapeHtml(a.message)}</div>
        </div>
      `
        )
        .join("");
    }
  }

  // --- 分析タブ ---
  function setupAnalyticsTab() {
    // 初期化時は何もしない
  }

  function updateAnalyticsTab() {
    const chin = getSelected();
    if (!chin) return;

    // 統計サマリー
    updateAnalyticsSummary(chin);

    // グラフ
    updateAnalyticsWeightChart(chin);
    updateAnalyticsFoodChart(chin);
    updateAnalyticsHealthChart(chin);
  }

  function updateAnalyticsSummary(chin) {
    const elSummary = document.getElementById("analytics-summary");
    let html = '<div class="stats-grid">';

    // 体重統計
    if (chin.weight && chin.weight.length > 0) {
      const weights = chin.weight.map((r) => r.weight);
      const avg = (weights.reduce((a, b) => a + b, 0) / weights.length).toFixed(
        1
      );
      const latest = weights[weights.length - 1];
      html += `
        <div class="stat-card">
          <div class="stat-label">現在の体重</div>
          <div class="stat-value">${latest}<span class="stat-unit">g</span></div>
        </div>
        <div class="stat-card">
          <div class="stat-label">平均体重</div>
          <div class="stat-value">${avg}<span class="stat-unit">g</span></div>
        </div>
        <div class="stat-card">
          <div class="stat-label">最高体重</div>
          <div class="stat-value">${Math.max(...weights)}<span class="stat-unit">g</span></div>
        </div>
        <div class="stat-card">
          <div class="stat-label">最低体重</div>
          <div class="stat-value">${Math.min(...weights)}<span class="stat-unit">g</span></div>
        </div>
      `;
    }

    // 食事統計
    if (chin.food && chin.food.length > 0) {
      const totalFood = chin.food.reduce((sum, r) => sum + r.amount, 0);
      const avgFood = (totalFood / chin.food.length).toFixed(1);
      html += `
        <div class="stat-card">
          <div class="stat-label">合計食事量</div>
          <div class="stat-value">${totalFood}<span class="stat-unit">g</span></div>
        </div>
        <div class="stat-card">
          <div class="stat-label">平均食事量</div>
          <div class="stat-value">${avgFood}<span class="stat-unit">g</span></div>
        </div>
      `;
    }

    // 健康スコア
    if (chin.health && chin.health.length > 0) {
      const latestHealth = chin.health[chin.health.length - 1];
      let score = 0;
      if (latestHealth.fur === "excellent") score += 25;
      else if (latestHealth.fur === "good") score += 20;
      else if (latestHealth.fur === "normal") score += 15;
      else if (latestHealth.fur === "poor") score += 5;

      if (latestHealth.eyes === "bright") score += 25;
      else if (latestHealth.eyes === "normal") score += 15;
      else if (latestHealth.eyes === "dull") score += 5;

      if (latestHealth.stool === "normal") score += 25;
      else if (latestHealth.stool === "soft") score += 10;
      else if (latestHealth.stool === "hard") score += 10;
      else if (latestHealth.stool === "abnormal") score += 0;

      if (latestHealth.appetite === "excellent") score += 25;
      else if (latestHealth.appetite === "good") score += 20;
      else if (latestHealth.appetite === "normal") score += 15;
      else if (latestHealth.appetite === "poor") score += 0;

      html += `
        <div class="stat-card">
          <div class="stat-label">健康スコア</div>
          <div class="stat-value">${score}<span class="stat-unit">/100</span></div>
        </div>
      `;
    }

    html += "</div>";
    elSummary.innerHTML = html;
  }

  function updateAnalyticsWeightChart(chin) {
    const elCanvas = document.getElementById("analytics-weight-chart");
    if (!chin.weight || chin.weight.length === 0) return;

    if (currentChart && currentChart.canvas && currentChart.canvas.id === "analytics-weight-chart") {
      currentChart.destroy();
    }

    const labels = chin.weight.map((r) => r.date);
    const values = chin.weight.map((r) => r.weight);

    currentChart = new Chart(elCanvas, {
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

  function updateAnalyticsFoodChart(chin) {
    const elCanvas = document.getElementById("analytics-food-chart");
    if (!chin.food || chin.food.length === 0) return;

    if (foodChart) foodChart.destroy();

    const foodTypeMap = {
      timothy: "チモシー",
      pellet: "ペレット",
      vegetable: "野菜",
      fruit: "果物",
      treat: "おやつ",
      water: "水",
      other: "その他",
    };

    const foodTypeTotals = {};
    chin.food.forEach((r) => {
      const type = foodTypeMap[r.type] || r.type;
      foodTypeTotals[type] = (foodTypeTotals[type] || 0) + r.amount;
    });

    const labels = Object.keys(foodTypeTotals);
    const values = Object.values(foodTypeTotals);

    const colors = [
      "#a68b6b",
      "#c9a961",
      "#76b82a",
      "#f8b739",
      "#e57373",
      "#64b5f6",
      "#ba68c8",
    ];

    foodChart = new Chart(elCanvas, {
      type: "doughnut",
      data: {
        labels,
        datasets: [
          {
            data: values,
            backgroundColor: colors.slice(0, labels.length),
            borderColor: "#fff",
            borderWidth: 2,
          },
        ],
      },
      options: {
        responsive: true,
        maintainAspectRatio: false,
        plugins: {
          legend: {
            position: "bottom",
            labels: { padding: 15, font: { size: 11 } },
          },
          tooltip: {
            callbacks: {
              label: (ctx) => `${ctx.label}: ${ctx.parsed}g`,
            },
          },
        },
      },
    });
  }

  function updateAnalyticsHealthChart(chin) {
    const elCanvas = document.getElementById("analytics-health-chart");
    if (!chin.health || chin.health.length === 0) return;

    if (healthChart) healthChart.destroy();

    const healthScores = chin.health.map((h) => {
      let score = 0;
      if (h.fur === "excellent") score += 25;
      else if (h.fur === "good") score += 20;
      else if (h.fur === "normal") score += 15;
      else if (h.fur === "poor") score += 5;

      if (h.eyes === "bright") score += 25;
      else if (h.eyes === "normal") score += 15;
      else if (h.eyes === "dull") score += 5;

      if (h.stool === "normal") score += 25;
      else if (h.stool === "soft") score += 10;
      else if (h.stool === "hard") score += 10;
      else if (h.stool === "abnormal") score += 0;

      if (h.appetite === "excellent") score += 25;
      else if (h.appetite === "good") score += 20;
      else if (h.appetite === "normal") score += 15;
      else if (h.appetite === "poor") score += 0;

      return score;
    });

    healthChart = new Chart(elCanvas, {
      type: "line",
      data: {
        labels: chin.health.map((h) => h.date),
        datasets: [
          {
            label: "健康スコア",
            data: healthScores,
            borderColor: "#76b82a",
            backgroundColor: "rgba(118,184,42,0.1)",
            fill: true,
            tension: 0.3,
            pointRadius: 4,
            pointBackgroundColor: "#76b82a",
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
              label: (ctx) => `スコア: ${ctx.parsed.y}/100`,
            },
          },
        },
        scales: {
          x: {
            ticks: { maxTicksLimit: 10, font: { size: 11 } },
            grid: { display: false },
          },
          y: {
            min: 0,
            max: 100,
            ticks: {
              callback: (v) => v,
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

  function updateAllTabs() {
    updateWeightTab();
    updateFoodTab();
    updateHealthTab();
    updateBehaviorTab();
    updateMedicalTab();
    updateEnvironmentTab();
    updateAlerts();
  }

  // --- 起動 ---
  init();
})();
