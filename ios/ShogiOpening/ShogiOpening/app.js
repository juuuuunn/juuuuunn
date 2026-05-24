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
      category: '居飛車の囲い',
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
        { from:'3a', to:'4b', label:'銀４二',   player:1 },
        { from:'4h', to:'3h', label:'玉３八',   player:0 },
        { from:'6b', to:'7c', label:'銀７三',   player:1 },
      ]
    },
    {
      id: 'funagakoi',
      name: '舟囲い',
      category: '居飛車の囲い',
      description: '居飛車で飛車先の歩を伸ばしながら金銀で玉を守る囲い。組むまでの手数が少なく攻守のバランスが良い。振り飛車への対抗策として頻繁に用いられる。',
      moves: [
        { from:'7g', to:'7f', label:'７六歩',          player:0 },
        { from:'8c', to:'8d', label:'８四歩',          player:1 },
        { from:'2g', to:'2f', label:'２六歩',          player:0 },
        { from:'8d', to:'8e', label:'８五歩',          player:1 },
        { from:'6i', to:'6h', label:'金６八',          player:0 },
        { from:'3c', to:'3d', label:'３四歩',          player:1 },
        { from:'7i', to:'7h', label:'銀７八',          player:0 },
        { from:'7a', to:'6b', label:'銀６二',          player:1 },
        { from:'5i', to:'6i', label:'玉６九',          player:0 },
        { from:'5a', to:'4b', label:'玉４二',          player:1 },
        { from:'4i', to:'5h', label:'金５八（舟囲い完成）', player:0 },
        { from:'4b', to:'3b', label:'玉３二',          player:1 },
      ]
    },
    {
      id: 'gangi',
      name: '雁木',
      category: '居飛車の囲い',
      description: '銀を6七・4七に配置する居飛車の囲い。金銀の連携が取れた守りで、相居飛車の将棋でよく現れる。持久戦・急戦両方に対応できる柔軟な陣形。',
      moves: [
        { from:'7g', to:'7f', label:'７六歩',          player:0 },
        { from:'3c', to:'3d', label:'３四歩',          player:1 },
        { from:'6g', to:'6f', label:'６六歩',          player:0 },
        { from:'8c', to:'8d', label:'８四歩',          player:1 },
        { from:'7i', to:'6h', label:'銀６八',          player:0 },
        { from:'7a', to:'6b', label:'銀６二',          player:1 },
        { from:'6h', to:'6g', label:'銀６七',          player:0 },
        { from:'5a', to:'4b', label:'玉４二',          player:1 },
        { from:'3i', to:'4h', label:'銀４八',          player:0 },
        { from:'4b', to:'3b', label:'玉３二',          player:1 },
        { from:'4h', to:'4g', label:'銀４七',          player:0 },
        { from:'6b', to:'5c', label:'銀５三',          player:1 },
        { from:'4i', to:'4h', label:'金４八（雁木完成）', player:0 },
        { from:'4a', to:'4b', label:'金４二',          player:1 },
      ]
    },
    {
      id: 'mino',
      name: '美濃囲い（四間飛車）',
      category: '振り飛車の囲い',
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
      category: '振り飛車の戦法',
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
        { from:'6a', to:'5b', label:'金５二',            player:1 },
        { from:'3i', to:'3h', label:'銀３八',            player:0 },
        { from:'7a', to:'6b', label:'銀６二',            player:1 },
        { from:'4g', to:'4f', label:'４六歩',            player:0 },
        { from:'6b', to:'5c', label:'銀５三',            player:1 },
      ]
    },
    {
      id: 'bogin',
      name: '棒銀',
      category: '居飛車の戦法',
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
      name: '居飛車穴熊',
      category: '居飛車の囲い',
      description: '玉を9八に潜らせ金銀で固める超堅陣。守りは将棋最強クラスだが組むまでに手数がかかる。居飛車での持久戦に多用される現代将棋の定番戦型。',
      moves: [
        { from:'7g', to:'7f', label:'７六歩',              player:0 },
        { from:'3c', to:'3d', label:'３四歩',              player:1 },
        { from:'8h', to:'7g', label:'角７七（玉道を開ける）', player:0 },
        { from:'8c', to:'8d', label:'８四歩',              player:1 },
        { from:'5i', to:'6h', label:'玉６八',              player:0 },
        { from:'5a', to:'4b', label:'玉４二',              player:1 },
        { from:'6h', to:'7h', label:'玉７八',              player:0 },
        { from:'7a', to:'6b', label:'銀６二',              player:1 },
        { from:'7h', to:'8h', label:'玉８八',              player:0 },
        { from:'4b', to:'3b', label:'玉３二',              player:1 },
        { from:'8h', to:'9h', label:'玉９八（穴熊へ！）',  player:0 },
        { from:'6b', to:'5c', label:'銀５三',              player:1 },
        { from:'6i', to:'7h', label:'金７八（固める）',    player:0 },
        { from:'4a', to:'4b', label:'金４二',              player:1 },
      ]
    },
    {
      id: 'sangen',
      name: '三間飛車',
      category: '振り飛車の戦法',
      description: '飛車を3筋に振る振り飛車戦法。飛車が3筋から8筋への攻めに転じやすく、石田流など多くの有力な変化がある。美濃囲いと組み合わせるのが定番。',
      moves: [
        { from:'7g', to:'7f', label:'７六歩',              player:0 },
        { from:'3c', to:'3d', label:'３四歩',              player:1 },
        { from:'2h', to:'3h', label:'飛３八（三間飛車）',  player:0 },
        { from:'8c', to:'8d', label:'８四歩',              player:1 },
        { from:'8h', to:'7g', label:'角７七',              player:0 },
        { from:'8d', to:'8e', label:'８五歩',              player:1 },
        { from:'3g', to:'3f', label:'３六歩',              player:0 },
        { from:'7a', to:'6b', label:'銀６二',              player:1 },
        { from:'5i', to:'6h', label:'玉６八',              player:0 },
        { from:'5a', to:'4b', label:'玉４二',              player:1 },
        { from:'6h', to:'7h', label:'玉７八',              player:0 },
        { from:'4b', to:'3b', label:'玉３二',              player:1 },
        { from:'7h', to:'8h', label:'玉８八（美濃の形）',  player:0 },
        { from:'6b', to:'7c', label:'銀７三',              player:1 },
      ]
    },
    {
      id: 'mukaibisha',
      name: '向かい飛車',
      category: '振り飛車の戦法',
      description: '飛車を相手の飛車と向かい合う8筋に振る戦法。飛車交換を狙いながら積極的に攻める。相手の飛先を牽制する効果もある。',
      moves: [
        { from:'7g', to:'7f', label:'７六歩',              player:0 },
        { from:'8c', to:'8d', label:'８四歩',              player:1 },
        { from:'8h', to:'7g', label:'角７七',              player:0 },
        { from:'8d', to:'8e', label:'８五歩',              player:1 },
        { from:'2h', to:'8h', label:'飛８八（向かい飛車）', player:0 },
        { from:'3c', to:'3d', label:'３四歩',              player:1 },
        { from:'7i', to:'7h', label:'銀７八',              player:0 },
        { from:'7a', to:'6b', label:'銀６二',              player:1 },
        { from:'6i', to:'7i', label:'金７九',              player:0 },
        { from:'5a', to:'4b', label:'玉４二',              player:1 },
        { from:'5i', to:'6h', label:'玉６八',              player:0 },
        { from:'4b', to:'3b', label:'玉３二',              player:1 },
        { from:'4i', to:'5h', label:'金５八',              player:0 },
        { from:'6b', to:'7c', label:'銀７三',              player:1 },
      ]
    },
    {
      id: 'migi-shiken',
      name: '右四間飛車',
      category: '居飛車の戦法',
      description: '飛車を4筋に移動させ4筋から積極的に攻める居飛車の急戦戦法。4五歩・銀と連動した攻撃が強力。振り飛車への有力な対策の一つ。',
      moves: [
        { from:'7g', to:'7f', label:'７六歩',              player:0 },
        { from:'3c', to:'3d', label:'３四歩',              player:1 },
        { from:'2h', to:'4h', label:'飛４八（右四間飛車）', player:0 },
        { from:'4c', to:'4d', label:'４四歩',              player:1 },
        { from:'4g', to:'4f', label:'４六歩',              player:0 },
        { from:'8c', to:'8d', label:'８四歩',              player:1 },
        { from:'4f', to:'4e', label:'４五歩',              player:0 },
        { from:'4d', to:'4e', label:'４五同歩（歩取り）',  player:1 },
        { from:'4h', to:'4e', label:'４五飛（歩取り）',    player:0 },
        { from:'7a', to:'6b', label:'銀６二',              player:1 },
        { from:'3i', to:'4h', label:'銀４八',              player:0 },
        { from:'5a', to:'4b', label:'玉４二',              player:1 },
        { from:'4h', to:'4g', label:'銀４七（右四間の形）', player:0 },
        { from:'4b', to:'3b', label:'玉３二',              player:1 },
      ]
    },
    {
      id: 'kakugawari',
      name: '角換わり腰掛け銀',
      category: '居飛車の戦法',
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
    // ── 居飛車の囲い（追加）─────────────────────────────────────
    {
      id: 'kani',
      name: 'カニ囲い',
      category: '居飛車の囲い',
      description: '４手で完成する超速攻の囲い。玉6九・金7八・銀6八・金5八の形がカニに似ていることから命名。上からの攻めに強く、すぐ攻撃に移れるのが魅力。',
      moves: [
        { from:'7g', to:'7f', label:'７六歩',              player:0 },
        { from:'8c', to:'8d', label:'８四歩',              player:1 },
        { from:'6i', to:'7h', label:'金７八',              player:0 },
        { from:'3c', to:'3d', label:'３四歩',              player:1 },
        { from:'7i', to:'6h', label:'銀６八',              player:0 },
        { from:'8d', to:'8e', label:'８五歩',              player:1 },
        { from:'5i', to:'6i', label:'玉６九',              player:0 },
        { from:'7a', to:'6b', label:'銀６二',              player:1 },
        { from:'4i', to:'5h', label:'金５八（カニ囲い完成）', player:0 },
        { from:'5a', to:'4b', label:'玉４二',              player:1 },
        { from:'2g', to:'2f', label:'２六歩（攻めへ）',    player:0 },
        { from:'4b', to:'3b', label:'玉３二',              player:1 },
      ]
    },
    {
      id: 'hidari-mino',
      name: '左美濃囲い',
      category: '居飛車の囲い',
      description: '居飛車が美濃囲いに類似した形を組む囲い。玉8八・銀7八・角7七で構成され、手数が少なく対振り飛車で効果的。穴熊への発展形としても優秀。',
      moves: [
        { from:'7g', to:'7f', label:'７六歩',              player:0 },
        { from:'3c', to:'3d', label:'３四歩',              player:1 },
        { from:'5i', to:'6h', label:'玉６八',              player:0 },
        { from:'8c', to:'8d', label:'８四歩',              player:1 },
        { from:'8h', to:'7g', label:'角７七',              player:0 },
        { from:'8d', to:'8e', label:'８五歩',              player:1 },
        { from:'6h', to:'7h', label:'玉７八',              player:0 },
        { from:'7a', to:'6b', label:'銀６二',              player:1 },
        { from:'7h', to:'8h', label:'玉８八（左美濃完成）', player:0 },
        { from:'5a', to:'4b', label:'玉４二',              player:1 },
        { from:'7i', to:'7h', label:'銀７八',              player:0 },
        { from:'4b', to:'3b', label:'玉３二',              player:1 },
        { from:'6i', to:'7i', label:'金７九',              player:0 },
        { from:'6b', to:'7c', label:'銀７三',              player:1 },
      ]
    },
    {
      id: 'ginkanmuri',
      name: '銀冠',
      category: '居飛車の囲い',
      description: '左美濃をさらに発展させた囲い。玉9八・銀8八で玉頭を銀で守る形。上部への攻めに対し高い耐性を持ち、相居飛車・対振り飛車双方で活躍する。',
      moves: [
        { from:'7g', to:'7f', label:'７六歩',              player:0 },
        { from:'3c', to:'3d', label:'３四歩',              player:1 },
        { from:'5i', to:'6h', label:'玉６八',              player:0 },
        { from:'8c', to:'8d', label:'８四歩',              player:1 },
        { from:'8h', to:'7g', label:'角７七',              player:0 },
        { from:'8d', to:'8e', label:'８五歩',              player:1 },
        { from:'6h', to:'7h', label:'玉７八',              player:0 },
        { from:'7a', to:'6b', label:'銀６二',              player:1 },
        { from:'7h', to:'8h', label:'玉８八',              player:0 },
        { from:'5a', to:'4b', label:'玉４二',              player:1 },
        { from:'8h', to:'9h', label:'玉９八（銀冠へ）',    player:0 },
        { from:'4b', to:'3b', label:'玉３二',              player:1 },
        { from:'7i', to:'8h', label:'銀８八（銀冠完成）',  player:0 },
        { from:'6b', to:'7c', label:'銀７三',              player:1 },
      ]
    },
    {
      id: 'elmo',
      name: 'elmo囲い',
      category: '居飛車の囲い',
      description: 'AIソフト「elmo」が考案した対振り飛車囲い。玉7八・銀6八上・金7九・金5九の形で、攻守のバランスが高く2017年頃から急速に普及した現代的な囲い。',
      moves: [
        { from:'7g', to:'7f', label:'７六歩',              player:0 },
        { from:'3c', to:'3d', label:'３四歩',              player:1 },
        { from:'3i', to:'4h', label:'銀４八',              player:0 },
        { from:'8c', to:'8d', label:'８四歩',              player:1 },
        { from:'5i', to:'6h', label:'玉６八',              player:0 },
        { from:'7a', to:'6b', label:'銀６二',              player:1 },
        { from:'6h', to:'7h', label:'玉７八',              player:0 },
        { from:'5a', to:'4b', label:'玉４二',              player:1 },
        { from:'7i', to:'6h', label:'銀６八上',            player:0 },
        { from:'4b', to:'3b', label:'玉３二',              player:1 },
        { from:'6i', to:'7i', label:'金７九',              player:0 },
        { from:'6b', to:'5c', label:'銀５三',              player:1 },
        { from:'4i', to:'5i', label:'金５九（elmo完成）',  player:0 },
        { from:'4a', to:'4b', label:'金４二',              player:1 },
      ]
    },
    {
      id: 'hayagakoi',
      name: '早囲い（壁囲い）',
      category: '居飛車の囲い',
      description: '金6八・玉6九で形成する超速囲い。わずか2手で完成し、攻撃重視の展開に向く。玉の上に金が乗る「壁」の形から壁囲いとも呼ばれる。',
      moves: [
        { from:'7g', to:'7f', label:'７六歩',              player:0 },
        { from:'8c', to:'8d', label:'８四歩',              player:1 },
        { from:'6i', to:'6h', label:'金６八',              player:0 },
        { from:'8d', to:'8e', label:'８五歩',              player:1 },
        { from:'5i', to:'6i', label:'玉６九（早囲い完成）', player:0 },
        { from:'3c', to:'3d', label:'３四歩',              player:1 },
        { from:'2g', to:'2f', label:'２六歩',              player:0 },
        { from:'7a', to:'6b', label:'銀６二',              player:1 },
        { from:'3i', to:'3h', label:'銀３八',              player:0 },
        { from:'5a', to:'4b', label:'玉４二',              player:1 },
        { from:'3h', to:'2g', label:'銀２七',              player:0 },
        { from:'4b', to:'3b', label:'玉３二',              player:1 },
        { from:'2g', to:'3f', label:'銀３六（攻め態勢）',  player:0 },
        { from:'6b', to:'7c', label:'銀７三',              player:1 },
      ]
    },
    // ── 振り飛車の囲い（追加）─────────────────────────────────────
    {
      id: 'taka-mino',
      name: '高美濃',
      category: '振り飛車の囲い',
      description: '美濃囲いから発展した上部の強い囲い。金5七・金6七と金を前線に繰り出した形で、コビン（6八-7七の斜め）の弱点を解消した改良型。',
      moves: [
        { from:'7g', to:'7f', label:'７六歩',              player:0 },
        { from:'8c', to:'8d', label:'８四歩',              player:1 },
        { from:'2h', to:'4h', label:'飛４八（四間飛車）',  player:0 },
        { from:'8d', to:'8e', label:'８五歩',              player:1 },
        { from:'5i', to:'6h', label:'玉６八',              player:0 },
        { from:'3c', to:'3d', label:'３四歩',              player:1 },
        { from:'6h', to:'7h', label:'玉７八',              player:0 },
        { from:'7a', to:'6b', label:'銀６二',              player:1 },
        { from:'7h', to:'8h', label:'玉８八（美濃）',      player:0 },
        { from:'5a', to:'4b', label:'玉４二',              player:1 },
        { from:'7i', to:'7h', label:'銀７八',              player:0 },
        { from:'4b', to:'3b', label:'玉３二',              player:1 },
        { from:'6i', to:'7i', label:'金７九',              player:0 },
        { from:'6b', to:'7c', label:'銀７三',              player:1 },
        { from:'4i', to:'5h', label:'金５八（高美濃完成）', player:0 },
        { from:'4a', to:'4b', label:'金４二',              player:1 },
      ]
    },
    {
      id: 'kinmusou',
      name: '金無双',
      category: '振り飛車の囲い',
      description: '振り飛車で用いる囲い。玉6九・金7八・金5八と金2枚で玉を挟む形で横からの攻めに強い。相振り飛車でも頻出の実戦的な囲い。',
      moves: [
        { from:'7g', to:'7f', label:'７六歩',              player:0 },
        { from:'3c', to:'3d', label:'３四歩',              player:1 },
        { from:'2h', to:'3h', label:'飛３八（三間飛車）',  player:0 },
        { from:'8c', to:'8d', label:'８四歩',              player:1 },
        { from:'6i', to:'7h', label:'金７八',              player:0 },
        { from:'7a', to:'6b', label:'銀６二',              player:1 },
        { from:'5i', to:'6i', label:'玉６九',              player:0 },
        { from:'5a', to:'4b', label:'玉４二',              player:1 },
        { from:'4i', to:'5h', label:'金５八（金無双完成）', player:0 },
        { from:'4b', to:'3b', label:'玉３二',              player:1 },
        { from:'3g', to:'3f', label:'３六歩（攻め準備）',  player:0 },
        { from:'6b', to:'5c', label:'銀５三',              player:1 },
      ]
    },
    {
      id: 'furi-anaguma',
      name: '振り飛車穴熊',
      category: '振り飛車の囲い',
      description: '飛車を振り飛車に置きながら玉を9八に潜らせる超強力な囲い。攻守ともに最高水準で、相穴熊の戦いは将棋の醍醐味の一つ。',
      moves: [
        { from:'5g', to:'5f', label:'５六歩',              player:0 },
        { from:'3c', to:'3d', label:'３四歩',              player:1 },
        { from:'2h', to:'5h', label:'飛５八（中飛車）',    player:0 },
        { from:'8c', to:'8d', label:'８四歩',              player:1 },
        { from:'8h', to:'7g', label:'角７七',              player:0 },
        { from:'7a', to:'6b', label:'銀６二',              player:1 },
        { from:'5i', to:'6h', label:'玉６八',              player:0 },
        { from:'5a', to:'4b', label:'玉４二',              player:1 },
        { from:'6h', to:'7h', label:'玉７八',              player:0 },
        { from:'4b', to:'3b', label:'玉３二',              player:1 },
        { from:'7h', to:'8h', label:'玉８八',              player:0 },
        { from:'6b', to:'7c', label:'銀７三',              player:1 },
        { from:'8h', to:'9h', label:'玉９八（振り飛車穴熊！）', player:0 },
        { from:'4a', to:'4b', label:'金４二',              player:1 },
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

    // wrapper 内のみスクロール（ページ全体をスクロールさせない）
    const wrapper = document.getElementById('move-list-wrapper');
    const cur = listEl.querySelector('.current');
    if (cur && wrapper) {
      const itemTop    = cur.offsetTop;
      const itemBot    = itemTop + cur.offsetHeight;
      const wrapTop    = wrapper.scrollTop;
      const wrapBot    = wrapTop + wrapper.clientHeight;
      if (itemTop < wrapTop) {
        wrapper.scrollTop = itemTop - 4;
      } else if (itemBot > wrapBot) {
        wrapper.scrollTop = itemBot - wrapper.clientHeight + 4;
      }
    }
  }

  function renderOpeningList() {
    const ul = document.getElementById('opening-list');
    // カテゴリ順
    const CATEGORY_ORDER = ['居飛車の囲い', '居飛車の戦法', '振り飛車の囲い', '振り飛車の戦法'];
    const grouped = {};
    OPENINGS.forEach((o, i) => {
      const cat = o.category || 'その他';
      if (!grouped[cat]) grouped[cat] = [];
      grouped[cat].push({ o, i });
    });
    let html = '';
    CATEGORY_ORDER.forEach(cat => {
      if (!grouped[cat]) return;
      html += `<li class="cat-header" data-cat="${cat}">${cat}</li>`;
      grouped[cat].forEach(({ o, i }) => {
        html += `<li data-idx="${i}"${i === state.openingIndex ? ' class="active"' : ''}>${o.name}</li>`;
      });
    });
    // カテゴリに含まれないものも表示
    Object.keys(grouped).forEach(cat => {
      if (!CATEGORY_ORDER.includes(cat)) {
        html += `<li class="cat-header">${cat}</li>`;
        grouped[cat].forEach(({ o, i }) => {
          html += `<li data-idx="${i}"${i === state.openingIndex ? ' class="active"' : ''}>${o.name}</li>`;
        });
      }
    });
    ul.innerHTML = html;
    ul.querySelectorAll('li[data-idx]').forEach(li => {
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
    // クリック後のフォーカスを外しブラウザの自動スクロールを防止
    if (document.activeElement instanceof HTMLElement) document.activeElement.blur();
  }

  // === ボタン ===
  document.getElementById('btn-first').addEventListener('click', e => {
    state.moveIndex = 0; renderBoard(); renderMoveList();
    e.currentTarget.blur();
  });
  document.getElementById('btn-prev').addEventListener('click', () => navigate(-1));
  document.getElementById('btn-next').addEventListener('click', () => navigate(1));
  document.getElementById('btn-last').addEventListener('click', e => {
    if (state.openingIndex < 0) return;
    state.moveIndex = OPENINGS[state.openingIndex].moves.length;
    renderBoard(); renderMoveList();
    e.currentTarget.blur();
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
