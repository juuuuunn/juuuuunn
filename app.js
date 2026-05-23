(() => {
  "use strict";

  // === 駒の定義 ===
  const KANJI = { K:'玉', R:'飛', B:'角', G:'金', S:'銀', N:'桂', L:'香', P:'歩' };
  const PROMOTED_KANJI = { R:'龍', B:'馬', S:'全', N:'圭', L:'杏', P:'と' };

  function pieceLabel(p) {
    return p.promoted ? (PROMOTED_KANJI[p.type] || KANJI[p.type]) : KANJI[p.type];
  }

  // === 座標変換 ===
  // USI "8h" → file=8, rank=h(8) → row=7, col=1
  function sqToRC(sq) {
    const file = parseInt(sq[0]);
    const rank = sq.charCodeAt(1) - 97 + 1; // 'a'=97
    return { row: rank - 1, col: 9 - file };
  }

  // === 初期局面 (SFEN: lnsgkgsnl/1r5b1/ppppppppp/9/9/9/PPPPPPPPP/1B5R1/LNSGKGSNL) ===
  function initialBoard() {
    const b = Array.from({ length: 9 }, () => Array(9).fill(null));
    const back = ['L','N','S','G','K','G','S','N','L']; // file 9→1 = col 0→8

    // 後手（row 0, player=1）
    for (let c = 0; c < 9; c++) b[0][c] = { type: back[c], promoted: false, player: 1 };
    b[1][1] = { type: 'R', promoted: false, player: 1 }; // 8二飛 (file8=col1)
    b[1][7] = { type: 'B', promoted: false, player: 1 }; // 2二角 (file2=col7)
    for (let c = 0; c < 9; c++) b[2][c] = { type: 'P', promoted: false, player: 1 };

    // 先手（row 8, player=0）
    for (let c = 0; c < 9; c++) b[8][c] = { type: back[c], promoted: false, player: 0 };
    b[7][1] = { type: 'B', promoted: false, player: 0 }; // 8八角 (file8=col1)
    b[7][7] = { type: 'R', promoted: false, player: 0 }; // 2八飛 (file2=col7)
    for (let c = 0; c < 9; c++) b[6][c] = { type: 'P', promoted: false, player: 0 };

    return b;
  }

  // === 指し手の適用 ===
  function applyMove(board, hand, move) {
    const b = board.map(row => row.map(p => p ? { ...p } : null));
    const h = { 0: { ...hand[0] }, 1: { ...hand[1] } };

    if (move.drop) {
      const { row, col } = sqToRC(move.to);
      h[move.player][move.drop] = (h[move.player][move.drop] || 0) - 1;
      b[row][col] = { type: move.drop, promoted: false, player: move.player };
    } else {
      const fr = sqToRC(move.from);
      const tr = sqToRC(move.to);
      const piece = { ...b[fr.row][fr.col] };
      const captured = b[tr.row][tr.col];
      if (captured) {
        h[piece.player][captured.type] = (h[piece.player][captured.type] || 0) + 1;
      }
      if (move.promote) piece.promoted = true;
      b[fr.row][fr.col] = null;
      b[tr.row][tr.col] = piece;
    }
    return { board: b, hand: h };
  }

  // === 定跡データ ===
  // 座標: USI形式 (file1-9 + rank a-i)
  // 先手: player=0（偶数番手）、後手: player=1（奇数番手）
  const OPENINGS = [
    {
      id: 'yagura',
      name: '矢倉囲い',
      description: '居飛車の代表的な囲い。金銀3枚で堅く王を守る陣形。相矢倉・角換わり矢倉など変化が豊富で、プロでも長年愛用されてきた。',
      moves: [
        { from:'7g', to:'7f', label:'７六歩',   player:0 },
        { from:'8c', to:'8d', label:'８四歩',   player:1 },
        { from:'6g', to:'6f', label:'６六歩',   player:0 },
        { from:'3c', to:'3d', label:'３四歩',   player:1 },
        { from:'7i', to:'7h', label:'銀７八',   player:0 },
        { from:'7a', to:'6b', label:'銀６二',   player:1 },
        { from:'6i', to:'6h', label:'金６八',   player:0 },
        { from:'5a', to:'4b', label:'玉４二',   player:1 },
        { from:'7h', to:'7g', label:'銀７七',   player:0 },
        { from:'4b', to:'3b', label:'玉３二',   player:1 },
        { from:'5i', to:'4h', label:'玉４八',   player:0 },
        { from:'3b', to:'2b', label:'玉２二',   player:1 },
        { from:'4h', to:'3h', label:'玉３八',   player:0 },
        { from:'6b', to:'7c', label:'銀７三',   player:1 },
      ]
    },
    {
      id: 'mino',
      name: '美濃囲い（四間飛車）',
      description: '振り飛車の定番囲い。少ない手数で玉を安全に移動できる。四間飛車（飛車を4筋に振る）との組み合わせが最も多い。',
      moves: [
        { from:'7g', to:'7f', label:'７六歩',            player:0 },
        { from:'8c', to:'8d', label:'８四歩',            player:1 },
        { from:'2h', to:'4h', label:'飛４八（四間飛車）', player:0 },
        { from:'8d', to:'8e', label:'８五歩',            player:1 },
        { from:'5i', to:'6h', label:'玉６八',            player:0 },
        { from:'4a', to:'3b', label:'金３二',            player:1 },
        { from:'6h', to:'7h', label:'玉７八',            player:0 },
        { from:'5a', to:'4b', label:'玉４二',            player:1 },
        { from:'7h', to:'8h', label:'玉８八（美濃完成）', player:0 },
        { from:'4b', to:'3b', label:'玉３二',            player:1 },
        { from:'7i', to:'7h', label:'銀７八',            player:0 },
        { from:'3b', to:'2b', label:'玉２二',            player:1 },
        { from:'6i', to:'7i', label:'金７九',            player:0 },
        { from:'2b', to:'1b', label:'玉１二',            player:1 },
      ]
    },
    {
      id: 'nakabisha',
      name: '中飛車',
      description: '飛車を中央（5筋）に構える振り飛車戦法。中央の制圧を狙い積極的に攻める。ゴキゲン中飛車が特に有名。',
      moves: [
        { from:'5g', to:'5f', label:'５六歩',            player:0 },
        { from:'8c', to:'8d', label:'８四歩',            player:1 },
        { from:'2h', to:'5h', label:'飛５八（中飛車）',  player:0 },
        { from:'3c', to:'3d', label:'３四歩',            player:1 },
        { from:'5i', to:'4h', label:'玉４八',            player:0 },
        { from:'5a', to:'4b', label:'玉４二',            player:1 },
        { from:'4h', to:'3h', label:'玉３八',            player:0 },
        { from:'4b', to:'3b', label:'玉３二',            player:1 },
        { from:'3h', to:'2h', label:'玉２八',            player:0 },
        { from:'3b', to:'2b', label:'玉２二',            player:1 },
        { from:'3i', to:'3h', label:'銀３八',            player:0 },
        { from:'7a', to:'6b', label:'銀６二',            player:1 },
        { from:'4g', to:'4f', label:'４六歩',            player:0 },
        { from:'6b', to:'5c', label:'銀５三',            player:1 },
      ]
    },
    {
      id: 'bogin',
      name: '棒銀',
      description: '銀将を一直線に前進させ飛車と連動して相手の陣を崩す戦法。シンプルながら破壊力が高く、将棋入門者にも人気。',
      moves: [
        { from:'7g', to:'7f', label:'７六歩',            player:0 },
        { from:'8c', to:'8d', label:'８四歩',            player:1 },
        { from:'2g', to:'2f', label:'２六歩',            player:0 },
        { from:'8d', to:'8e', label:'８五歩',            player:1 },
        { from:'2f', to:'2e', label:'２五歩（飛先の歩を伸ばす）', player:0 },
        { from:'3c', to:'3d', label:'３四歩',            player:1 },
        { from:'3i', to:'3h', label:'銀３八',            player:0 },
        { from:'2b', to:'3c', label:'角３三（角引き）',   player:1 },
        { from:'3h', to:'2g', label:'銀２七',            player:0 },
        { from:'7a', to:'6b', label:'銀６二',            player:1 },
        { from:'2g', to:'2f', label:'銀２六（棒銀完成！）', player:0 },
        { from:'5a', to:'4b', label:'玉４二',            player:1 },
        { from:'4g', to:'4f', label:'４六歩',            player:0 },
        { from:'4b', to:'3b', label:'玉３二',            player:1 },
      ]
    },
    {
      id: 'anaguma',
      name: '穴熊',
      description: '玉を盤端に潜らせ金銀で固める超堅陣。守りは最強クラスだが組むまでに手数がかかる。現代将棋でも頻出の戦法。',
      moves: [
        { from:'7g', to:'7f', label:'７六歩',              player:0 },
        { from:'3c', to:'3d', label:'３四歩',              player:1 },
        { from:'5i', to:'4h', label:'玉４八',              player:0 },
        { from:'5a', to:'4b', label:'玉４二',              player:1 },
        { from:'4h', to:'3h', label:'玉３八',              player:0 },
        { from:'4b', to:'3b', label:'玉３二',              player:1 },
        { from:'3h', to:'2h', label:'玉２八',              player:0 },
        { from:'3b', to:'2b', label:'玉２二',              player:1 },
        { from:'2h', to:'1h', label:'玉１八',              player:0 },
        { from:'2b', to:'1b', label:'玉１二',              player:1 },
        { from:'4i', to:'3h', label:'金３八（王を固める）', player:0 },
        { from:'4a', to:'3b', label:'金３二（王を固める）', player:1 },
        { from:'3h', to:'2h', label:'金２八（穴熊完成！）', player:0 },
        { from:'3b', to:'2b', label:'金２二（穴熊完成！）', player:1 },
      ]
    },
    {
      id: 'kakugawari',
      name: '角換わり腰掛け銀',
      description: '序盤に角を交換し合う現代将棋の主流戦法。持ち角を活かした終盤が魅力。腰掛け銀で中央から積極的に攻める。',
      moves: [
        { from:'7g', to:'7f', label:'７六歩',              player:0 },
        { from:'3c', to:'3d', label:'３四歩',              player:1 },
        { from:'8h', to:'2b', label:'角２二成（角交換！）', player:0, promote:true },
        { from:'3a', to:'2b', label:'銀同（角を取る）',     player:1 },
        { from:'4i', to:'5h', label:'金５八',              player:0 },
        { from:'7a', to:'6b', label:'銀６二',              player:1 },
        { from:'3i', to:'4h', label:'銀４八',              player:0 },
        { from:'6b', to:'5c', label:'銀５三',              player:1 },
        { from:'4h', to:'5g', label:'銀５七（腰掛け銀）',  player:0 },
        { from:'5c', to:'4d', label:'銀４四（腰掛け銀）',  player:1 },
        { from:'5i', to:'4h', label:'玉４八',              player:0 },
        { from:'5a', to:'4b', label:'玉４二',              player:1 },
        { from:'4h', to:'3h', label:'玉３八',              player:0 },
        { from:'4b', to:'3b', label:'玉３二',              player:1 },
      ]
    },
  ];

  // === アプリ状態 ===
  let state = {
    openingIndex: -1,
    moveIndex: 0,
    boards: [initialBoard()],
    hands: [{ 0: {}, 1: {} }],
  };

  // === 定跡の読み込み ===
  function loadOpening(idx) {
    state.openingIndex = idx;
    state.moveIndex = 0;
    state.boards = [initialBoard()];
    state.hands = [{ 0: {}, 1: {} }];

    for (const move of OPENINGS[idx].moves) {
      const prev = state.boards[state.boards.length - 1];
      const prevH = state.hands[state.hands.length - 1];
      try {
        const result = applyMove(prev, prevH, move);
        state.boards.push(result.board);
        state.hands.push(result.hand);
      } catch {
        state.boards.push(prev.map(r => r.map(p => p ? { ...p } : null)));
        state.hands.push({ 0: { ...prevH[0] }, 1: { ...prevH[1] } });
      }
    }

    document.getElementById('opening-title').textContent = OPENINGS[idx].name;
    document.getElementById('opening-desc').textContent = OPENINGS[idx].description;
    renderMoveList();
    renderBoard();
  }

  // === 盤面描画 ===
  function renderBoard() {
    const boardEl = document.getElementById('shogi-board');
    const board = state.boards[state.moveIndex];
    const opening = state.openingIndex >= 0 ? OPENINGS[state.openingIndex] : null;
    const lastMove = (state.moveIndex > 0 && opening) ? opening.moves[state.moveIndex - 1] : null;

    let fromRC = null, toRC = null;
    if (lastMove) {
      if (lastMove.from) fromRC = sqToRC(lastMove.from);
      toRC = sqToRC(lastMove.to);
    }

    // 星マーク位置（将棋盤の目印）
    const STAR_CELLS = new Set(['2,2','2,6','4,4','6,2','6,6']);

    boardEl.innerHTML = '';
    for (let row = 0; row < 9; row++) {
      for (let col = 0; col < 9; col++) {
        const cell = document.createElement('div');
        cell.className = 'cell';
        if (fromRC && fromRC.row === row && fromRC.col === col) cell.classList.add('highlight-from');
        if (toRC && toRC.row === row && toRC.col === col) cell.classList.add('highlight-to');
        if (STAR_CELLS.has(`${row},${col}`)) {
          const star = document.createElement('div');
          star.className = 'star-mark';
          cell.appendChild(star);
        }

        const piece = board[row][col];
        if (piece) {
          const el = document.createElement('div');
          el.className = `piece ${piece.player === 0 ? 'sente' : 'gote'}${piece.promoted ? ' promoted' : ''}`;
          el.textContent = pieceLabel(piece);
          cell.appendChild(el);
        }
        boardEl.appendChild(cell);
      }
    }

    renderHands();
    renderControls();
  }

  function renderHands() {
    const hand = state.hands[state.moveIndex];
    const fmt = h => Object.entries(h).filter(([,n]) => n > 0)
      .map(([t,n]) => KANJI[t] + (n > 1 ? n : '')).join(' ') || 'なし';
    document.getElementById('hand-sente-pieces').textContent = fmt(hand[0]);
    document.getElementById('hand-gote-pieces').textContent = fmt(hand[1]);
  }

  function renderMoveList() {
    const listEl = document.getElementById('move-list');
    if (state.openingIndex < 0) { listEl.innerHTML = ''; return; }

    const moves = OPENINGS[state.openingIndex].moves;
    listEl.innerHTML = moves.map((m, i) => {
      const isCur = (i + 1) === state.moveIndex;
      const badge = m.player === 0
        ? '<span class="player-badge">先手</span>'
        : '<span class="player-badge gote">後手</span>';
      return `<li class="${isCur ? 'current' : ''}" data-idx="${i + 1}">${badge}${m.label}</li>`;
    }).join('');

    listEl.querySelectorAll('li').forEach(li => {
      li.addEventListener('click', () => {
        state.moveIndex = parseInt(li.dataset.idx);
        renderBoard();
        renderMoveList();
      });
    });

    const cur = listEl.querySelector('.current');
    if (cur) cur.scrollIntoView({ block: 'nearest', behavior: 'instant' });
  }

  function renderOpeningList() {
    const ul = document.getElementById('opening-list');
    ul.innerHTML = OPENINGS.map((o, i) =>
      `<li data-idx="${i}"${i === state.openingIndex ? ' class="active"' : ''}>${o.name}</li>`
    ).join('');
    ul.querySelectorAll('li').forEach(li => {
      li.addEventListener('click', () => {
        ul.querySelectorAll('li').forEach(x => x.classList.remove('active'));
        li.classList.add('active');
        loadOpening(parseInt(li.dataset.idx));
      });
    });
  }

  function renderControls() {
    const total = state.openingIndex >= 0 ? OPENINGS[state.openingIndex].moves.length : 0;
    document.getElementById('move-counter').textContent = `${state.moveIndex} / ${total}`;
    document.getElementById('btn-first').disabled = state.moveIndex === 0;
    document.getElementById('btn-prev').disabled = state.moveIndex === 0;
    document.getElementById('btn-next').disabled = state.moveIndex >= total;
    document.getElementById('btn-last').disabled = state.moveIndex >= total;
  }

  function navigate(delta) {
    if (state.openingIndex < 0) return;
    const total = OPENINGS[state.openingIndex].moves.length;
    state.moveIndex = Math.max(0, Math.min(total, state.moveIndex + delta));
    renderBoard();
    renderMoveList();
  }

  // === ボタン ===
  document.getElementById('btn-first').addEventListener('click', () => { state.moveIndex = 0; renderBoard(); renderMoveList(); });
  document.getElementById('btn-prev').addEventListener('click', () => navigate(-1));
  document.getElementById('btn-next').addEventListener('click', () => navigate(1));
  document.getElementById('btn-last').addEventListener('click', () => {
    if (state.openingIndex < 0) return;
    state.moveIndex = OPENINGS[state.openingIndex].moves.length;
    renderBoard(); renderMoveList();
  });

  // === キーボード ===
  document.addEventListener('keydown', e => {
    if (e.key === 'ArrowRight' || e.key === 'ArrowDown') {
      e.preventDefault(); // ページスクロールを抑止
      navigate(1);
    }
    if (e.key === 'ArrowLeft' || e.key === 'ArrowUp') {
      e.preventDefault(); // ページスクロールを抑止
      navigate(-1);
    }
  });

  // === 初期化 ===
  renderOpeningList();
  renderBoard();
  renderControls();
  loadOpening(0);
  renderOpeningList(); // re-render to mark active
})();
