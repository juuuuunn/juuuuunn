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
      category: '矢倉系の囲い',
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
      category: '居飛車その他の囲い',
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
      category: '居飛車その他の囲い',
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
      category: '美濃系の囲い',
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
      category: '汎用戦法（居飛車・振り飛車共通）',
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
      category: '居飛車その他の囲い',
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
      category: '汎用戦法（居飛車・振り飛車共通）',
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
      category: '相居飛車の戦法',
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
      category: '居飛車その他の囲い',
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
      category: '左美濃系の囲い',
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
      category: '美濃系の囲い',
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
      category: '居飛車その他の囲い',
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
      category: '振り飛車その他の囲い',
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
      category: '美濃系の囲い',
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
      category: '振り飛車その他の囲い',
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
      category: '穴熊系の囲い',
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
    // ── 汎用戦法（居飛車・振り飛車共通） ────────────────────────────
    {
      id: 'ichiken-bisha',
      name: '一間飛車',
      category: '汎用戦法（居飛車・振り飛車共通）',
      description: '飛車を1筋（端筋）に振る戦法。端攻めと連動して相手の玉頭を直撃する奇襲的な構想。1筋の歩を突いて飛車の利きを活かす。',
      moves: [
        { from:'7g', to:'7f', label:'７六歩',              player:0 },
        { from:'3c', to:'3d', label:'３四歩',              player:1 },
        { from:'2h', to:'1h', label:'飛１八（一間飛車）',  player:0 },
        { from:'8c', to:'8d', label:'８四歩',              player:1 },
        { from:'1g', to:'1f', label:'１六歩',              player:0 },
        { from:'7a', to:'6b', label:'銀６二',              player:1 },
        { from:'1f', to:'1e', label:'１五歩',              player:0 },
        { from:'5a', to:'4b', label:'玉４二',              player:1 },
        { from:'5i', to:'4h', label:'玉４八',              player:0 },
        { from:'4b', to:'3b', label:'玉３二',              player:1 },
        { from:'4h', to:'3h', label:'玉３八',              player:0 },
        { from:'8d', to:'8e', label:'８五歩',              player:1 },
        { from:'3i', to:'4h', label:'銀４八',              player:0 },
        { from:'6b', to:'5c', label:'銀５三',              player:1 },
      ]
    },
    {
      id: 'sode-bisha',
      name: '袖飛車',
      category: '汎用戦法（居飛車・振り飛車共通）',
      description: '飛車を3筋に振り、そこから端攻めや中央攻めを狙う戦法。袖（そで）のように横に広がる動きが特徴で、柔軟な攻めが可能。',
      moves: [
        { from:'7g', to:'7f', label:'７六歩',              player:0 },
        { from:'3c', to:'3d', label:'３四歩',              player:1 },
        { from:'2h', to:'3h', label:'飛３八（袖飛車）',    player:0 },
        { from:'8c', to:'8d', label:'８四歩',              player:1 },
        { from:'3g', to:'3f', label:'３六歩',              player:0 },
        { from:'7a', to:'6b', label:'銀６二',              player:1 },
        { from:'5i', to:'6h', label:'玉６八',              player:0 },
        { from:'5a', to:'4b', label:'玉４二',              player:1 },
        { from:'6h', to:'7h', label:'玉７八',              player:0 },
        { from:'4b', to:'3b', label:'玉３二',              player:1 },
        { from:'7h', to:'8h', label:'玉８八',              player:0 },
        { from:'8d', to:'8e', label:'８五歩',              player:1 },
        { from:'7i', to:'7h', label:'銀７八',              player:0 },
        { from:'6b', to:'5c', label:'銀５三',              player:1 },
      ]
    },
    {
      id: 'migi-gyoku',
      name: '右玉',
      category: '汎用戦法（居飛車・振り飛車共通）',
      description: '玉を飛車の右側（2〜3筋）に移動させる戦法。相手の振り飛車に対して、玉を遠ざけながら居飛車で戦う独特の構想。',
      moves: [
        { from:'7g', to:'7f', label:'７六歩',              player:0 },
        { from:'8c', to:'8d', label:'８四歩',              player:1 },
        { from:'2g', to:'2f', label:'２六歩',              player:0 },
        { from:'3c', to:'3d', label:'３四歩',              player:1 },
        { from:'4i', to:'5h', label:'金５八',              player:0 },
        { from:'7a', to:'6b', label:'銀６二',              player:1 },
        { from:'5i', to:'4h', label:'玉４八（右玉へ）',    player:0 },
        { from:'5a', to:'4b', label:'玉４二',              player:1 },
        { from:'4h', to:'3h', label:'玉３八',              player:0 },
        { from:'4b', to:'3b', label:'玉３二',              player:1 },
        { from:'3h', to:'2h', label:'玉２八（右玉完成）',  player:0 },
        { from:'6b', to:'5c', label:'銀５三',              player:1 },
        { from:'3i', to:'3h', label:'銀３八',              player:0 },
        { from:'4a', to:'4b', label:'金４二',              player:1 },
      ]
    },
    // ── 相居飛車の戦法 ────────────────────────────────────────────
    {
      id: 'yagura-37gin',
      name: '矢倉３七銀',
      category: '相居飛車の戦法',
      description: '矢倉囲いを組んだ後、銀を3七まで前進させて攻撃力を高める戦法。銀が前線に出ることで相手陣への圧力が増し、積極的な攻めが可能になる。',
      moves: [
        { from:'7g', to:'7f', label:'７六歩',              player:0 },
        { from:'8c', to:'8d', label:'８四歩',              player:1 },
        { from:'6g', to:'6f', label:'６六歩',              player:0 },
        { from:'3c', to:'3d', label:'３四歩',              player:1 },
        { from:'7i', to:'7h', label:'銀７八',              player:0 },
        { from:'7a', to:'6b', label:'銀６二',              player:1 },
        { from:'6i', to:'6h', label:'金６八',              player:0 },
        { from:'5a', to:'4b', label:'玉４二',              player:1 },
        { from:'7h', to:'7g', label:'銀７七',              player:0 },
        { from:'4b', to:'3b', label:'玉３二',              player:1 },
        { from:'5i', to:'4h', label:'玉４八',              player:0 },
        { from:'3a', to:'4b', label:'銀４二',              player:1 },
        { from:'3i', to:'3h', label:'銀３八（３七銀へ）',  player:0 },
        { from:'4b', to:'5c', label:'銀５三',              player:1 },
      ]
    },
    {
      id: 'suzume-sashi',
      name: '雀刺し',
      category: '相居飛車の戦法',
      description: '9筋（端）の歩を連続して突き進める端攻め戦法。雀が連続してついばむように端の歩を前進させ、相手の端に隙を作る。居飛車同士の戦いで有効。',
      moves: [
        { from:'9g', to:'9f', label:'９六歩',              player:0 },
        { from:'9c', to:'9d', label:'９四歩',              player:1 },
        { from:'7g', to:'7f', label:'７六歩',              player:0 },
        { from:'8c', to:'8d', label:'８四歩',              player:1 },
        { from:'2g', to:'2f', label:'２六歩',              player:0 },
        { from:'3c', to:'3d', label:'３四歩',              player:1 },
        { from:'9f', to:'9e', label:'９五歩（端攻め開始）', player:0 },
        { from:'7a', to:'6b', label:'銀６二',              player:1 },
        { from:'9i', to:'9h', label:'香９八',              player:0 },
        { from:'5a', to:'4b', label:'玉４二',              player:1 },
        { from:'9h', to:'9g', label:'香９七（雀刺し準備）', player:0 },
        { from:'4b', to:'3b', label:'玉３二',              player:1 },
        { from:'6i', to:'6h', label:'金６八',              player:0 },
        { from:'8d', to:'8e', label:'８五歩',              player:1 },
      ]
    },
    {
      id: 'aigakari',
      name: '相掛かり',
      category: '相居飛車の戦法',
      description: '先後双方が飛車先の歩を突き合い、早い段階で飛車が活発に動く激しい戦型。序盤から中盤にかけて飛車の位置争いが生じ、プロでも高い人気を誇る。',
      moves: [
        { from:'2g', to:'2f', label:'２六歩',              player:0 },
        { from:'8c', to:'8d', label:'８四歩',              player:1 },
        { from:'2f', to:'2e', label:'２五歩',              player:0 },
        { from:'8d', to:'8e', label:'８五歩',              player:1 },
        { from:'2h', to:'2f', label:'飛２六（相掛かり）',  player:0 },
        { from:'3c', to:'3d', label:'３四歩',              player:1 },
        { from:'3i', to:'3h', label:'銀３八',              player:0 },
        { from:'7a', to:'6b', label:'銀６二',              player:1 },
        { from:'3h', to:'2g', label:'銀２七',              player:0 },
        { from:'5a', to:'4b', label:'玉４二',              player:1 },
        { from:'2g', to:'2f', label:'銀２六（棒銀）',      player:0 },
        { from:'4b', to:'3b', label:'玉３二',              player:1 },
        { from:'5i', to:'4h', label:'玉４八',              player:0 },
        { from:'6b', to:'5c', label:'銀５三',              player:1 },
      ]
    },
    {
      id: 'hineri-bisha',
      name: 'ひねり飛車',
      category: '相居飛車の戦法',
      description: '飛車を2六に上げてから8筋に転回する「ひねり」のある戦法。2六から8六へと飛車を大きく動かし、相手の意表をついた攻めを展開する。',
      moves: [
        { from:'7g', to:'7f', label:'７六歩',              player:0 },
        { from:'8c', to:'8d', label:'８四歩',              player:1 },
        { from:'2g', to:'2f', label:'２六歩',              player:0 },
        { from:'8d', to:'8e', label:'８五歩',              player:1 },
        { from:'2h', to:'2f', label:'飛２六',              player:0 },
        { from:'3c', to:'3d', label:'３四歩',              player:1 },
        { from:'2f', to:'8f', label:'飛８六（ひねり）',    player:0 },
        { from:'7a', to:'6b', label:'銀６二',              player:1 },
        { from:'8f', to:'8e', label:'飛８五',              player:0 },
        { from:'5a', to:'4b', label:'玉４二',              player:1 },
        { from:'3i', to:'3h', label:'銀３八',              player:0 },
        { from:'4b', to:'3b', label:'玉３二',              player:1 },
        { from:'3h', to:'2g', label:'銀２七',              player:0 },
        { from:'6b', to:'5c', label:'銀５三',              player:1 },
      ]
    },
    {
      id: 'itteson-kakugawari',
      name: '一手損角換わり',
      category: '相居飛車の戦法',
      description: '後手が一手損を承知で早めに角交換を誘う戦法。後手が手損することで独自のペースを作り、先手の矢倉・雁木に対して有力な変化が生まれる現代的戦型。',
      moves: [
        { from:'7g', to:'7f', label:'７六歩',              player:0 },
        { from:'3c', to:'3d', label:'３四歩',              player:1 },
        { from:'8h', to:'6f', label:'角６六',              player:0 },
        { from:'8c', to:'8d', label:'８四歩',              player:1 },
        { from:'6f', to:'2b', label:'角２二成（角交換）',  player:0, promote:true },
        { from:'3a', to:'2b', label:'銀同',                player:1 },
        { from:'4i', to:'5h', label:'金５八',              player:0 },
        { from:'2b', to:'3c', label:'銀３三',              player:1 },
        { from:'3i', to:'4h', label:'銀４八',              player:0 },
        { from:'7a', to:'6b', label:'銀６二',              player:1 },
        { from:'5i', to:'4i', label:'玉４九',              player:0 },
        { from:'5a', to:'4b', label:'玉４二',              player:1 },
        { from:'4i', to:'3h', label:'玉３八',              player:0 },
        { from:'4b', to:'3b', label:'玉３二',              player:1 },
      ]
    },
    {
      id: 'sujichigai-kaku',
      name: '筋違い角',
      category: '相居飛車の戦法',
      description: '角を本来の筋から外れた位置に進出させる奇襲戦法。角が6六に出ることで相手の歩組みを乱し、不均一な盤面から優位を狙う独特の戦法。',
      moves: [
        { from:'7g', to:'7f', label:'７六歩',              player:0 },
        { from:'3c', to:'3d', label:'３四歩',              player:1 },
        { from:'8h', to:'6f', label:'角６六（筋違い角）',  player:0 },
        { from:'8c', to:'8d', label:'８四歩',              player:1 },
        { from:'5i', to:'5h', label:'玉５八',              player:0 },
        { from:'7a', to:'6b', label:'銀６二',              player:1 },
        { from:'3i', to:'4h', label:'銀４八',              player:0 },
        { from:'5a', to:'4b', label:'玉４二',              player:1 },
        { from:'6f', to:'7g', label:'角７七（配置換え）',  player:0 },
        { from:'4b', to:'3b', label:'玉３二',              player:1 },
        { from:'4h', to:'3g', label:'銀３七',              player:0 },
        { from:'6b', to:'5c', label:'銀５三',              player:1 },
        { from:'2g', to:'2f', label:'２六歩',              player:0 },
        { from:'4a', to:'4b', label:'金４二',              player:1 },
      ]
    },
    {
      id: 'hayaguri-gin',
      name: '早繰り銀',
      category: '相居飛車の戦法',
      description: '銀を素早く前線に繰り出す急戦戦法。銀が5六まで前進して中央を押さえ、飛車と連動した強力な攻めを展開する。角換わり後の主流戦法のひとつ。',
      moves: [
        { from:'7g', to:'7f', label:'７六歩',              player:0 },
        { from:'8c', to:'8d', label:'８四歩',              player:1 },
        { from:'2g', to:'2f', label:'２六歩',              player:0 },
        { from:'8d', to:'8e', label:'８五歩',              player:1 },
        { from:'7i', to:'6h', label:'銀６八',              player:0 },
        { from:'3c', to:'3d', label:'３四歩',              player:1 },
        { from:'6h', to:'5g', label:'銀５七',              player:0 },
        { from:'7a', to:'6b', label:'銀６二',              player:1 },
        { from:'5g', to:'4f', label:'銀４六',              player:0 },
        { from:'5a', to:'4b', label:'玉４二',              player:1 },
        { from:'4f', to:'3e', label:'銀３五（早繰り銀！）', player:0 },
        { from:'4b', to:'3b', label:'玉３二',              player:1 },
        { from:'2f', to:'2e', label:'２五歩',              player:0 },
        { from:'6b', to:'5c', label:'銀５三',              player:1 },
      ]
    },
    {
      id: 'yokofu-tori',
      name: '横歩取り',
      category: '相居飛車の戦法',
      description: '先手が飛車を2四に進出させた後、横歩（8四の歩）を取る超急戦戦法。互いに激しい攻め合いになる将棋界屈指の激戦型で、数多くの定跡が研究されてきた。',
      moves: [
        { from:'2g', to:'2f', label:'２六歩',              player:0 },
        { from:'8c', to:'8d', label:'８四歩',              player:1 },
        { from:'2f', to:'2e', label:'２五歩',              player:0 },
        { from:'8d', to:'8e', label:'８五歩',              player:1 },
        { from:'7g', to:'7f', label:'７六歩',              player:0 },
        { from:'3c', to:'3d', label:'３四歩',              player:1 },
        { from:'2e', to:'2d', label:'２四歩',              player:0 },
        { from:'2c', to:'2d', label:'２四同歩',            player:1 },
        { from:'2h', to:'2d', label:'２四飛（歩取り）',    player:0 },
        { from:'8e', to:'8f', label:'８六歩（反撃）',      player:1 },
        { from:'8g', to:'8f', label:'８六同歩',            player:0 },
        { from:'8b', to:'8f', label:'飛８六（飛取り）',    player:1 },
        { from:'2d', to:'8d', label:'飛８四（横歩取り！）', player:0 },
        { from:'7a', to:'6b', label:'銀６二',              player:1 },
      ]
    },
    // ── 対振り飛車の戦法 ─────────────────────────────────────────
    {
      id: 'gyokuto-idori',
      name: '玉頭位取り',
      category: '対振り飛車の戦法',
      description: '玉頭（5筋・6筋）に位を張って中央を制圧する居飛車持久戦戦法。中央の制空権を握り、振り飛車の飛車を封じ込める。',
      moves: [
        { from:'7g', to:'7f', label:'７六歩',              player:0 },
        { from:'3c', to:'3d', label:'３四歩',              player:1 },
        { from:'5g', to:'5f', label:'５六歩（中央制圧）',  player:0 },
        { from:'8c', to:'8d', label:'８四歩',              player:1 },
        { from:'5f', to:'5e', label:'５五歩（位を取る）',  player:0 },
        { from:'4a', to:'3b', label:'金３二',              player:1 },
        { from:'6i', to:'6h', label:'金６八',              player:0 },
        { from:'7a', to:'6b', label:'銀６二',              player:1 },
        { from:'7i', to:'7h', label:'銀７八',              player:0 },
        { from:'5a', to:'4b', label:'玉４二',              player:1 },
        { from:'7h', to:'6g', label:'銀６七（玉頭守備）',  player:0 },
        { from:'4b', to:'3b', label:'玉３二',              player:1 },
        { from:'5i', to:'6h', label:'玉６八',              player:0 },
        { from:'2b', to:'5b', label:'飛５二',              player:1 },
      ]
    },
    {
      id: 'gosuji-idori',
      name: '5筋位取り',
      category: '対振り飛車の戦法',
      description: '5筋に歩の位を取り、中央を制する居飛車持久戦戦法。5五の地点を押さえることで振り飛車の反撃を防ぎながら、着実に優位を築く。',
      moves: [
        { from:'5g', to:'5f', label:'５六歩',              player:0 },
        { from:'3c', to:'3d', label:'３四歩',              player:1 },
        { from:'7g', to:'7f', label:'７六歩',              player:0 },
        { from:'8c', to:'8d', label:'８四歩',              player:1 },
        { from:'5f', to:'5e', label:'５五歩（位取り）',    player:0 },
        { from:'4a', to:'3b', label:'金３二',              player:1 },
        { from:'2h', to:'5h', label:'飛５八（中飛車）',    player:0 },
        { from:'7a', to:'6b', label:'銀６二',              player:1 },
        { from:'5i', to:'4h', label:'玉４八',              player:0 },
        { from:'5a', to:'4b', label:'玉４二',              player:1 },
        { from:'4h', to:'3h', label:'玉３八',              player:0 },
        { from:'4b', to:'3b', label:'玉３二',              player:1 },
        { from:'6i', to:'5h', label:'金５八（完成）',      player:0 },
        { from:'6b', to:'5c', label:'銀５三',              player:1 },
      ]
    },
    {
      id: 'chikatetsu-bisha',
      name: '地下鉄飛車',
      category: '対振り飛車の戦法',
      description: '飛車を4筋や5筋に置いて「地下鉄」のように盤下（後ろ）から縦に前進させる戦法。相手の隙を突いて飛車が突如前線に現れる奇襲的な効果がある。',
      moves: [
        { from:'7g', to:'7f', label:'７六歩',              player:0 },
        { from:'3c', to:'3d', label:'３四歩',              player:1 },
        { from:'4g', to:'4f', label:'４六歩',              player:0 },
        { from:'8c', to:'8d', label:'８四歩',              player:1 },
        { from:'2h', to:'4h', label:'飛４八（地下鉄飛車）', player:0 },
        { from:'4a', to:'3b', label:'金３二',              player:1 },
        { from:'6i', to:'6h', label:'金６八',              player:0 },
        { from:'7a', to:'6b', label:'銀６二',              player:1 },
        { from:'5i', to:'6i', label:'玉６九',              player:0 },
        { from:'5a', to:'4b', label:'玉４二',              player:1 },
        { from:'6i', to:'7h', label:'玉７八',              player:0 },
        { from:'4b', to:'3b', label:'玉３二',              player:1 },
        { from:'4f', to:'4e', label:'４五歩（地下鉄前進）', player:0 },
        { from:'6b', to:'5c', label:'銀５三',              player:1 },
      ]
    },
    {
      id: 'bokin',
      name: '棒金',
      category: '対振り飛車の戦法',
      description: '金将を一直線に前進させる攻撃的な対振り飛車戦法。金が5七→5六→5五と前進し、振り飛車の飛車に圧力をかける。シンプルながら有力な戦術。',
      moves: [
        { from:'7g', to:'7f', label:'７六歩',              player:0 },
        { from:'3c', to:'3d', label:'３四歩',              player:1 },
        { from:'5g', to:'5f', label:'５六歩',              player:0 },
        { from:'8c', to:'8d', label:'８四歩',              player:1 },
        { from:'4i', to:'5h', label:'金５八',              player:0 },
        { from:'4a', to:'3b', label:'金３二',              player:1 },
        { from:'5h', to:'5g', label:'金５七',              player:0 },
        { from:'7a', to:'6b', label:'銀６二',              player:1 },
        { from:'5g', to:'5f', label:'金５六（棒金前進！）', player:0 },
        { from:'5a', to:'4b', label:'玉４二',              player:1 },
        { from:'2g', to:'2f', label:'２六歩',              player:0 },
        { from:'4b', to:'3b', label:'玉３二',              player:1 },
        { from:'2f', to:'2e', label:'２五歩',              player:0 },
        { from:'6b', to:'5c', label:'銀５三',              player:1 },
      ]
    },
    // ── 振り飛車の戦法 ───────────────────────────────────────────
    {
      id: 'ishida-ryu',
      name: '石田流',
      category: '振り飛車の戦法',
      description: '三間飛車に7五歩を加えた積極的な振り飛車戦法。7五の位と3筋の飛車が連動し、相手陣を圧迫する。石田直木名人が得意とした歴史ある攻撃的戦型。',
      moves: [
        { from:'7g', to:'7f', label:'７六歩',              player:0 },
        { from:'3c', to:'3d', label:'３四歩',              player:1 },
        { from:'7f', to:'7e', label:'７五歩（石田流！）',  player:0 },
        { from:'8c', to:'8d', label:'８四歩',              player:1 },
        { from:'2h', to:'3h', label:'飛３八（三間飛車）',  player:0 },
        { from:'7a', to:'6b', label:'銀６二',              player:1 },
        { from:'8h', to:'7g', label:'角７七',              player:0 },
        { from:'5a', to:'4b', label:'玉４二',              player:1 },
        { from:'5i', to:'6h', label:'玉６八',              player:0 },
        { from:'4b', to:'3b', label:'玉３二',              player:1 },
        { from:'6h', to:'7h', label:'玉７八',              player:0 },
        { from:'6b', to:'5c', label:'銀５三',              player:1 },
        { from:'7h', to:'8h', label:'玉８八（石田流完成）', player:0 },
        { from:'4a', to:'4b', label:'金４二',              player:1 },
      ]
    },
    {
      id: 'hayaishida',
      name: '早石田',
      category: '振り飛車の戦法',
      description: '石田流を超急ピッチで組む奇襲戦法。序盤早々に7六歩・7五歩と突き、相手が対策する前に石田流の形を完成させる。角の働きが強力な将棋になる。',
      moves: [
        { from:'7g', to:'7f', label:'７六歩',              player:0 },
        { from:'8c', to:'8d', label:'８四歩',              player:1 },
        { from:'7f', to:'7e', label:'７五歩（早石田！）',  player:0 },
        { from:'8d', to:'8e', label:'８五歩',              player:1 },
        { from:'8h', to:'7g', label:'角７七',              player:0 },
        { from:'3c', to:'3d', label:'３四歩',              player:1 },
        { from:'2h', to:'7h', label:'飛７八（早石田）',    player:0 },
        { from:'7a', to:'6b', label:'銀６二',              player:1 },
        { from:'7i', to:'8h', label:'銀８八',              player:0 },
        { from:'5a', to:'4b', label:'玉４二',              player:1 },
        { from:'5i', to:'6h', label:'玉６八',              player:0 },
        { from:'4b', to:'3b', label:'玉３二',              player:1 },
        { from:'6h', to:'7i', label:'玉７九',              player:0 },
        { from:'6b', to:'5c', label:'銀５三',              player:1 },
      ]
    },
    {
      id: 'shiken-bisha',
      name: '四間飛車',
      category: '振り飛車の戦法',
      description: '飛車を4筋に振り、美濃囲いと組み合わせる振り飛車の基本形。攻守のバランスが優れ、プロ・アマ問わず最も親しまれてきた振り飛車戦法。',
      moves: [
        { from:'7g', to:'7f', label:'７六歩',              player:0 },
        { from:'8c', to:'8d', label:'８四歩',              player:1 },
        { from:'2h', to:'4h', label:'飛４八（四間飛車）',  player:0 },
        { from:'8d', to:'8e', label:'８五歩',              player:1 },
        { from:'8h', to:'7g', label:'角７七',              player:0 },
        { from:'3c', to:'3d', label:'３四歩',              player:1 },
        { from:'5i', to:'6h', label:'玉６八',              player:0 },
        { from:'7a', to:'6b', label:'銀６二',              player:1 },
        { from:'6h', to:'7h', label:'玉７八',              player:0 },
        { from:'5a', to:'4b', label:'玉４二',              player:1 },
        { from:'7h', to:'8h', label:'玉８八（美濃囲い）',  player:0 },
        { from:'4b', to:'3b', label:'玉３二',              player:1 },
        { from:'7i', to:'7h', label:'銀７八',              player:0 },
        { from:'6b', to:'7c', label:'銀７三',              player:1 },
      ]
    },
    {
      id: 'gokigen-nakabisha',
      name: 'ゴキゲン中飛車',
      category: '振り飛車の戦法',
      description: '後手が早々に飛車を5二に振る後手中飛車。近藤正和六段が開発した戦法で、後手番でも積極的に主導権を握れることから「ゴキゲン（上機嫌）」と命名された。',
      moves: [
        { from:'7g', to:'7f', label:'７六歩',              player:0 },
        { from:'5c', to:'5d', label:'５四歩（ゴキゲン）', player:1 },
        { from:'2g', to:'2f', label:'２六歩',              player:0 },
        { from:'8b', to:'5b', label:'飛５二（中飛車！）',  player:1 },
        { from:'2f', to:'2e', label:'２五歩',              player:0 },
        { from:'5d', to:'5e', label:'５五歩（中央進出）',  player:1 },
        { from:'6g', to:'6f', label:'６六歩',              player:0 },
        { from:'3a', to:'4b', label:'銀４二',              player:1 },
        { from:'5i', to:'4h', label:'玉４八',              player:0 },
        { from:'4b', to:'5c', label:'銀５三',              player:1 },
        { from:'6i', to:'6h', label:'金６八',              player:0 },
        { from:'5a', to:'4b', label:'玉４二',              player:1 },
        { from:'4h', to:'3h', label:'玉３八',              player:0 },
        { from:'4b', to:'3b', label:'玉３二',              player:1 },
      ]
    },
    {
      id: 'tsunogin-nakabisha',
      name: 'ツノ銀中飛車',
      category: '振り飛車の戦法',
      description: '中飛車に銀を「角（ツノ）」のような形に配置する戦法。銀が3七・5七に位置し、飛車の横利きを補強しながら安定した陣形を形成する。',
      moves: [
        { from:'5g', to:'5f', label:'５六歩',              player:0 },
        { from:'3c', to:'3d', label:'３四歩',              player:1 },
        { from:'2h', to:'5h', label:'飛５八（中飛車）',    player:0 },
        { from:'8c', to:'8d', label:'８四歩',              player:1 },
        { from:'3i', to:'3h', label:'銀３八',              player:0 },
        { from:'7a', to:'6b', label:'銀６二',              player:1 },
        { from:'3h', to:'3g', label:'銀３七',              player:0 },
        { from:'6b', to:'5c', label:'銀５三（ツノ銀）',    player:1 },
        { from:'7i', to:'6h', label:'銀６八',              player:0 },
        { from:'4a', to:'3b', label:'金３二',              player:1 },
        { from:'6h', to:'5g', label:'銀５七（ツノ銀）',    player:0 },
        { from:'5a', to:'4b', label:'玉４二',              player:1 },
        { from:'5i', to:'4h', label:'玉４八',              player:0 },
        { from:'4b', to:'3b', label:'玉３二',              player:1 },
      ]
    },
    {
      id: 'kazaguruma',
      name: '風車',
      category: '振り飛車の戦法',
      description: '飛車と角が風車のように連動して攻める振り飛車戦法。飛車を振りながら角も活用し、相手陣を多方向から攻めるダイナミックな戦法。',
      moves: [
        { from:'7g', to:'7f', label:'７六歩',              player:0 },
        { from:'3c', to:'3d', label:'３四歩',              player:1 },
        { from:'2h', to:'3h', label:'飛３八（三間飛車）',  player:0 },
        { from:'8c', to:'8d', label:'８四歩',              player:1 },
        { from:'8h', to:'7g', label:'角７七',              player:0 },
        { from:'2b', to:'3c', label:'角３三（風車の形）',  player:1 },
        { from:'5i', to:'6h', label:'玉６八',              player:0 },
        { from:'7a', to:'6b', label:'銀６二',              player:1 },
        { from:'6h', to:'7h', label:'玉７八',              player:0 },
        { from:'5a', to:'4b', label:'玉４二',              player:1 },
        { from:'6i', to:'6h', label:'金６八',              player:0 },
        { from:'4b', to:'3b', label:'玉３二',              player:1 },
        { from:'3g', to:'3f', label:'３六歩（風車展開）',  player:0 },
        { from:'6b', to:'5c', label:'銀５三',              player:1 },
      ]
    },
    {
      id: 'hirame',
      name: '平目',
      category: '振り飛車の戦法',
      description: '飛車と角を横並びに配置する「平目」のような陣形の振り飛車戦法。駒が横に広がった形から命名され、広い視野で攻守両面をカバーする。',
      moves: [
        { from:'7g', to:'7f', label:'７六歩',              player:0 },
        { from:'8c', to:'8d', label:'８四歩',              player:1 },
        { from:'6g', to:'6f', label:'６六歩',              player:0 },
        { from:'3c', to:'3d', label:'３四歩',              player:1 },
        { from:'2h', to:'6h', label:'飛６八（平目の形）',  player:0 },
        { from:'7a', to:'6b', label:'銀６二',              player:1 },
        { from:'7i', to:'6g', label:'銀６七',              player:0 },
        { from:'5a', to:'4b', label:'玉４二',              player:1 },
        { from:'5i', to:'5h', label:'玉５八',              player:0 },
        { from:'4b', to:'3b', label:'玉３二',              player:1 },
        { from:'4i', to:'5i', label:'金５九',              player:0 },
        { from:'8d', to:'8e', label:'８五歩',              player:1 },
        { from:'8h', to:'7g', label:'角７七',              player:0 },
        { from:'6b', to:'5c', label:'銀５三',              player:1 },
      ]
    },
    {
      id: 'kakukawari-furi',
      name: '角交換振り飛車',
      category: '振り飛車の戦法',
      description: '角を交換した後に飛車を振る戦法。持ち角を使った速攻が脅威で、相手が囲いを完成させる前に激しい攻撃を仕掛ける。現代将棋で注目の戦型。',
      moves: [
        { from:'7g', to:'7f', label:'７六歩',              player:0 },
        { from:'3c', to:'3d', label:'３四歩',              player:1 },
        { from:'8h', to:'2b', label:'角２二成（角交換）',  player:0, promote:true },
        { from:'3a', to:'2b', label:'銀同',                player:1 },
        { from:'2h', to:'4h', label:'飛４八（振り飛車へ）', player:0 },
        { from:'8c', to:'8d', label:'８四歩',              player:1 },
        { from:'5i', to:'6h', label:'玉６八',              player:0 },
        { from:'7a', to:'6b', label:'銀６二',              player:1 },
        { from:'6h', to:'7h', label:'玉７八',              player:0 },
        { from:'5a', to:'4b', label:'玉４二',              player:1 },
        { from:'7h', to:'8h', label:'玉８八',              player:0 },
        { from:'4b', to:'3b', label:'玉３二',              player:1 },
        { from:'7i', to:'7h', label:'銀７八',              player:0 },
        { from:'6b', to:'5c', label:'銀５三',              player:1 },
      ]
    },
    {
      id: 'aifuri-bisha',
      name: '相振り飛車',
      category: '振り飛車の戦法',
      description: '先後双方が飛車を振る戦型。相振り飛車では玉の囲いや飛車の位置が重要で、金無双・美濃・穴熊など各種囲いを駆使した戦いになる。',
      moves: [
        { from:'7g', to:'7f', label:'７六歩',              player:0 },
        { from:'3c', to:'3d', label:'３四歩',              player:1 },
        { from:'2h', to:'3h', label:'飛３八（三間飛車）',  player:0 },
        { from:'3b', to:'4b', label:'金４二',              player:1 },
        { from:'8h', to:'7g', label:'角７七',              player:0 },
        { from:'2b', to:'5b', label:'飛５二（後手中飛車）', player:1 },
        { from:'5i', to:'6h', label:'玉６八',              player:0 },
        { from:'5a', to:'4a', label:'玉４一',              player:1 },
        { from:'6h', to:'7h', label:'玉７八',              player:0 },
        { from:'4a', to:'3a', label:'玉３一',              player:1 },
        { from:'7h', to:'8h', label:'玉８八',              player:0 },
        { from:'3a', to:'2b', label:'玉２二',              player:1 },
        { from:'7i', to:'7h', label:'銀７八',              player:0 },
        { from:'7a', to:'6b', label:'銀６二',              player:1 },
      ]
    },
    // ── その他の戦法 ────────────────────────────────────────────
    {
      id: 'yodo-furi',
      name: '陽動振り飛車',
      category: 'その他の戦法',
      description: '居飛車のふりをして相手が対策を決めてから振り飛車に転換する陽動戦法。相手の対策を無効化する目的で、奇襲的な効果がある。',
      moves: [
        { from:'2g', to:'2f', label:'２六歩（居飛車のふり）', player:0 },
        { from:'8c', to:'8d', label:'８四歩',              player:1 },
        { from:'2f', to:'2e', label:'２五歩',              player:0 },
        { from:'8d', to:'8e', label:'８五歩',              player:1 },
        { from:'7g', to:'7f', label:'７六歩',              player:0 },
        { from:'3c', to:'3d', label:'３四歩',              player:1 },
        { from:'6i', to:'6h', label:'金６八（居飛車態勢）', player:0 },
        { from:'7a', to:'6b', label:'銀６二',              player:1 },
        { from:'2h', to:'4h', label:'飛４八（振り飛車へ転換！）', player:0 },
        { from:'5a', to:'4b', label:'玉４二',              player:1 },
        { from:'5i', to:'6i', label:'玉６九',              player:0 },
        { from:'4b', to:'3b', label:'玉３二',              player:1 },
        { from:'6i', to:'7h', label:'玉７八（陽動完成）',  player:0 },
        { from:'6b', to:'5c', label:'銀５三',              player:1 },
      ]
    },
    {
      id: 'kamaitachi',
      name: 'かまいたち',
      category: 'その他の戦法',
      description: '銀と桂馬を素早く活用する奇襲的な攻撃戦法。まるで「かまいたち」（鎌鼬）が素早く切り込むように、相手の意表をついた急激な攻めを展開する。',
      moves: [
        { from:'7g', to:'7f', label:'７六歩',              player:0 },
        { from:'8c', to:'8d', label:'８四歩',              player:1 },
        { from:'2g', to:'2f', label:'２六歩',              player:0 },
        { from:'8d', to:'8e', label:'８五歩',              player:1 },
        { from:'7i', to:'6h', label:'銀６八',              player:0 },
        { from:'3c', to:'3d', label:'３四歩',              player:1 },
        { from:'6h', to:'7g', label:'銀７七',              player:0 },
        { from:'7a', to:'6b', label:'銀６二',              player:1 },
        { from:'2f', to:'2e', label:'２五歩',              player:0 },
        { from:'5a', to:'4b', label:'玉４二',              player:1 },
        { from:'3i', to:'3h', label:'銀３八',              player:0 },
        { from:'4b', to:'3b', label:'玉３二',              player:1 },
        { from:'3h', to:'2g', label:'銀２七（棒銀型）',    player:0 },
        { from:'6b', to:'5c', label:'銀５三',              player:1 },
      ]
    },
    {
      id: 'yonyon-pakkuman',
      name: '４四歩パックマン',
      category: 'その他の戦法',
      description: '4四歩を突いて駒を次々と吸い込む「パックマン」的戦法。4四の位を利用して中央の制圧を目指し、独特のリズムで相手陣を崩す個性的な作戦。',
      moves: [
        { from:'7g', to:'7f', label:'７六歩',              player:0 },
        { from:'4c', to:'4d', label:'４四歩（パックマン）', player:1 },
        { from:'2g', to:'2f', label:'２六歩',              player:0 },
        { from:'3c', to:'3d', label:'３四歩',              player:1 },
        { from:'5g', to:'5f', label:'５六歩',              player:0 },
        { from:'4d', to:'4e', label:'４五歩（更に前進）',  player:1 },
        { from:'6g', to:'6f', label:'６六歩',              player:0 },
        { from:'4a', to:'4b', label:'金４二',              player:1 },
        { from:'5i', to:'4h', label:'玉４八',              player:0 },
        { from:'5a', to:'4a', label:'玉４一',              player:1 },
        { from:'6i', to:'6h', label:'金６八',              player:0 },
        { from:'7a', to:'6b', label:'銀６二',              player:1 },
        { from:'4h', to:'3h', label:'玉３八',              player:0 },
        { from:'8c', to:'8d', label:'８四歩',              player:1 },
      ]
    },
    // ── 矢倉系の囲い ────────────────────────────────────────────
    {
      id: 'gin-yagura',
      name: '銀矢倉',
      category: '矢倉系の囲い',
      description: '矢倉の金の位置に銀を配置した変形囲い。玉7八・銀7七・銀6八の形で、標準的な矢倉より玉のコビンが強化されている。攻撃的な変形矢倉。',
      moves: [
        { from:'7g', to:'7f', label:'７六歩',              player:0 },
        { from:'8c', to:'8d', label:'８四歩',              player:1 },
        { from:'6g', to:'6f', label:'６六歩',              player:0 },
        { from:'3c', to:'3d', label:'３四歩',              player:1 },
        { from:'7i', to:'7h', label:'銀７八',              player:0 },
        { from:'7a', to:'6b', label:'銀６二',              player:1 },
        { from:'7h', to:'7g', label:'銀７七',              player:0 },
        { from:'5a', to:'4b', label:'玉４二',              player:1 },
        { from:'3i', to:'4h', label:'銀４八',              player:0 },
        { from:'4b', to:'3b', label:'玉３二',              player:1 },
        { from:'4h', to:'5g', label:'銀５七',              player:0 },
        { from:'6b', to:'7c', label:'銀７三',              player:1 },
        { from:'5i', to:'4h', label:'玉４八（銀矢倉へ）',  player:0 },
        { from:'4a', to:'4b', label:'金４二',              player:1 },
      ]
    },
    {
      id: 'kata-yagura',
      name: '片矢倉',
      category: '矢倉系の囲い',
      description: '矢倉囲いの片側だけを組んだ簡易形。玉7八・銀7七・金6八のミニマルな形で、手数を省いて速攻に備える。完全矢倉への発展も可能。',
      moves: [
        { from:'7g', to:'7f', label:'７六歩',              player:0 },
        { from:'8c', to:'8d', label:'８四歩',              player:1 },
        { from:'6g', to:'6f', label:'６六歩',              player:0 },
        { from:'3c', to:'3d', label:'３四歩',              player:1 },
        { from:'7i', to:'7h', label:'銀７八',              player:0 },
        { from:'7a', to:'6b', label:'銀６二',              player:1 },
        { from:'7h', to:'7g', label:'銀７七',              player:0 },
        { from:'5a', to:'4b', label:'玉４二',              player:1 },
        { from:'6i', to:'6h', label:'金６八（片矢倉完成）', player:0 },
        { from:'4b', to:'3b', label:'玉３二',              player:1 },
        { from:'5i', to:'6i', label:'玉６九',              player:0 },
        { from:'6b', to:'7c', label:'銀７三',              player:1 },
        { from:'2g', to:'2f', label:'２六歩',              player:0 },
        { from:'4a', to:'4b', label:'金４二',              player:1 },
      ]
    },
    {
      id: 'so-yagura',
      name: '総矢倉',
      category: '矢倉系の囲い',
      description: '金銀4枚すべてを矢倉形に配置した最強の矢倉囲い。銀7七・金7八・金6八・銀6七が完全に揃い、上部と横からの攻めに対し最高の堅さを誇る。',
      moves: [
        { from:'7g', to:'7f', label:'７六歩',              player:0 },
        { from:'8c', to:'8d', label:'８四歩',              player:1 },
        { from:'6g', to:'6f', label:'６六歩',              player:0 },
        { from:'3c', to:'3d', label:'３四歩',              player:1 },
        { from:'7i', to:'7h', label:'銀７八',              player:0 },
        { from:'7a', to:'6b', label:'銀６二',              player:1 },
        { from:'7h', to:'7g', label:'銀７七',              player:0 },
        { from:'5a', to:'4b', label:'玉４二',              player:1 },
        { from:'6i', to:'6h', label:'金６八',              player:0 },
        { from:'4b', to:'3b', label:'玉３二',              player:1 },
        { from:'3i', to:'4h', label:'銀４八（総矢倉へ）',  player:0 },
        { from:'6b', to:'7c', label:'銀７三',              player:1 },
        { from:'4h', to:'6h', label:'銀６八（銀追加）',    player:0 },
        { from:'4a', to:'4b', label:'金４二',              player:1 },
      ]
    },
    {
      id: 'kikuichi-yagura',
      name: '菊水矢倉',
      category: '矢倉系の囲い',
      description: '矢倉の7七に桂馬を配置した変形囲い。菊水という美しい名前通り独特の形で、桂馬が7七に位置することで横への守りが変化する珍しい囲い。',
      moves: [
        { from:'7g', to:'7f', label:'７六歩',              player:0 },
        { from:'8c', to:'8d', label:'８四歩',              player:1 },
        { from:'6g', to:'6f', label:'６六歩',              player:0 },
        { from:'3c', to:'3d', label:'３四歩',              player:1 },
        { from:'6i', to:'6h', label:'金６八',              player:0 },
        { from:'7a', to:'6b', label:'銀６二',              player:1 },
        { from:'5i', to:'6i', label:'玉６九',              player:0 },
        { from:'5a', to:'4b', label:'玉４二',              player:1 },
        { from:'6i', to:'7h', label:'玉７八',              player:0 },
        { from:'4b', to:'3b', label:'玉３二',              player:1 },
        { from:'7h', to:'8h', label:'玉８八（菊水形）',    player:0 },
        { from:'6b', to:'7c', label:'銀７三',              player:1 },
        { from:'8i', to:'7g', label:'桂７七（菊水矢倉）',  player:0 },
        { from:'4a', to:'4b', label:'金４二',              player:1 },
      ]
    },
    {
      id: 'gin-tachi-yagura',
      name: '銀立ち矢倉',
      category: '矢倉系の囲い',
      description: '矢倉で銀が6七に立った形。銀が6七に位置することで前方への守りが強化され、相手の攻めを受け止めやすい。実戦的な矢倉の変形。',
      moves: [
        { from:'7g', to:'7f', label:'７六歩',              player:0 },
        { from:'8c', to:'8d', label:'８四歩',              player:1 },
        { from:'6g', to:'6f', label:'６六歩',              player:0 },
        { from:'3c', to:'3d', label:'３四歩',              player:1 },
        { from:'7i', to:'7h', label:'銀７八',              player:0 },
        { from:'7a', to:'6b', label:'銀６二',              player:1 },
        { from:'7h', to:'7g', label:'銀７七',              player:0 },
        { from:'5a', to:'4b', label:'玉４二',              player:1 },
        { from:'6i', to:'6h', label:'金６八',              player:0 },
        { from:'4b', to:'3b', label:'玉３二',              player:1 },
        { from:'5i', to:'4h', label:'玉４八',              player:0 },
        { from:'6b', to:'5c', label:'銀５三',              player:1 },
        { from:'3i', to:'4g', label:'銀４七（銀立ち）',    player:0 },
        { from:'4a', to:'4b', label:'金４二',              player:1 },
      ]
    },
    {
      id: 'hishi-yagura',
      name: '菱矢倉',
      category: '矢倉系の囲い',
      description: '矢倉の金銀が菱形に配置される変形囲い。金6七・銀7七・金7九・銀6九の形が菱のような外観を持ち、独特の守備力を持つ。',
      moves: [
        { from:'7g', to:'7f', label:'７六歩',              player:0 },
        { from:'8c', to:'8d', label:'８四歩',              player:1 },
        { from:'6g', to:'6f', label:'６六歩',              player:0 },
        { from:'3c', to:'3d', label:'３四歩',              player:1 },
        { from:'7i', to:'7h', label:'銀７八',              player:0 },
        { from:'7a', to:'6b', label:'銀６二',              player:1 },
        { from:'7h', to:'7g', label:'銀７七',              player:0 },
        { from:'5a', to:'4b', label:'玉４二',              player:1 },
        { from:'4i', to:'4h', label:'金４八',              player:0 },
        { from:'4b', to:'3b', label:'玉３二',              player:1 },
        { from:'4h', to:'5g', label:'金５七（菱形へ）',    player:0 },
        { from:'6b', to:'7c', label:'銀７三',              player:1 },
        { from:'5g', to:'6g', label:'金６七（菱矢倉）',    player:0 },
        { from:'4a', to:'4b', label:'金４二',              player:1 },
      ]
    },
    {
      id: 'fujimi-yagura',
      name: '富士見矢倉',
      category: '矢倉系の囲い',
      description: '金5七・銀6七と前方に配置した積極的な矢倉変形。富士山のような堂々とした形から命名。玉の前線に金銀を置き、攻めにも転じやすい陣形。',
      moves: [
        { from:'7g', to:'7f', label:'７六歩',              player:0 },
        { from:'8c', to:'8d', label:'８四歩',              player:1 },
        { from:'6g', to:'6f', label:'６六歩',              player:0 },
        { from:'3c', to:'3d', label:'３四歩',              player:1 },
        { from:'7i', to:'7h', label:'銀７八',              player:0 },
        { from:'7a', to:'6b', label:'銀６二',              player:1 },
        { from:'7h', to:'7g', label:'銀７七',              player:0 },
        { from:'5a', to:'4b', label:'玉４二',              player:1 },
        { from:'6i', to:'5h', label:'金５八（富士見へ）',  player:0 },
        { from:'4b', to:'3b', label:'玉３二',              player:1 },
        { from:'5h', to:'5g', label:'金５七',              player:0 },
        { from:'6b', to:'7c', label:'銀７三',              player:1 },
        { from:'3i', to:'4h', label:'銀４八',              player:0 },
        { from:'4a', to:'4b', label:'金４二',              player:1 },
      ]
    },
    {
      id: 'yagura-anaguma',
      name: '矢倉穴熊',
      category: '矢倉系の囲い',
      description: '矢倉の形から玉を9八まで潜らせる超強力な囲い。矢倉の堅さと穴熊の堅さを組み合わせた最高峰の持久戦形。組むまでに時間がかかるのが難点。',
      moves: [
        { from:'7g', to:'7f', label:'７六歩',              player:0 },
        { from:'8c', to:'8d', label:'８四歩',              player:1 },
        { from:'6g', to:'6f', label:'６六歩',              player:0 },
        { from:'3c', to:'3d', label:'３四歩',              player:1 },
        { from:'7i', to:'7h', label:'銀７八',              player:0 },
        { from:'7a', to:'6b', label:'銀６二',              player:1 },
        { from:'7h', to:'7g', label:'銀７七',              player:0 },
        { from:'5a', to:'4b', label:'玉４二',              player:1 },
        { from:'6i', to:'6h', label:'金６八',              player:0 },
        { from:'4b', to:'3b', label:'玉３二',              player:1 },
        { from:'5i', to:'6i', label:'玉６九',              player:0 },
        { from:'6b', to:'7c', label:'銀７三',              player:1 },
        { from:'6i', to:'7h', label:'玉７八',              player:0 },
        { from:'4a', to:'4b', label:'金４二',              player:1 },
      ]
    },
    {
      id: 'hekomi-yagura',
      name: 'へこみ矢倉',
      category: '矢倉系の囲い',
      description: '矢倉で金が6九に引いた「へこんだ」形。通常の矢倉より金の位置が一段低く、横からの攻めには強くなるが上部が薄くなる変形囲い。',
      moves: [
        { from:'7g', to:'7f', label:'７六歩',              player:0 },
        { from:'8c', to:'8d', label:'８四歩',              player:1 },
        { from:'6g', to:'6f', label:'６六歩',              player:0 },
        { from:'3c', to:'3d', label:'３四歩',              player:1 },
        { from:'7i', to:'7h', label:'銀７八',              player:0 },
        { from:'7a', to:'6b', label:'銀６二',              player:1 },
        { from:'7h', to:'7g', label:'銀７七',              player:0 },
        { from:'5a', to:'4b', label:'玉４二',              player:1 },
        { from:'5i', to:'4h', label:'玉４八',              player:0 },
        { from:'4b', to:'3b', label:'玉３二',              player:1 },
        { from:'4h', to:'3h', label:'玉３八（へこみへ）',  player:0 },
        { from:'6b', to:'7c', label:'銀７三',              player:1 },
        { from:'6i', to:'6h', label:'金６八（へこみ矢倉）', player:0 },
        { from:'4a', to:'4b', label:'金４二',              player:1 },
      ]
    },
    {
      id: 'nagare-yagura',
      name: '流れ矢倉',
      category: '矢倉系の囲い',
      description: '金が5八に位置する流れるような矢倉変形。硬い守りよりも流動的な金の使い方を優先し、攻守の切り替えがスムーズな現代的感覚の囲い。',
      moves: [
        { from:'7g', to:'7f', label:'７六歩',              player:0 },
        { from:'8c', to:'8d', label:'８四歩',              player:1 },
        { from:'6g', to:'6f', label:'６六歩',              player:0 },
        { from:'3c', to:'3d', label:'３四歩',              player:1 },
        { from:'7i', to:'7h', label:'銀７八',              player:0 },
        { from:'7a', to:'6b', label:'銀６二',              player:1 },
        { from:'7h', to:'7g', label:'銀７七',              player:0 },
        { from:'5a', to:'4b', label:'玉４二',              player:1 },
        { from:'4i', to:'5h', label:'金５八（流れ矢倉）',  player:0 },
        { from:'4b', to:'3b', label:'玉３二',              player:1 },
        { from:'5i', to:'4h', label:'玉４八',              player:0 },
        { from:'6b', to:'7c', label:'銀７三',              player:1 },
        { from:'4h', to:'3h', label:'玉３八',              player:0 },
        { from:'4a', to:'4b', label:'金４二',              player:1 },
      ]
    },
    {
      id: 'ryusen-yagura',
      name: '流線矢倉',
      category: '矢倉系の囲い',
      description: '矢倉をベースに流線形のようにスムーズな形を目指す変形囲い。金銀の配置が滑らかで、攻守両面への転換が素早い現代的な矢倉の形。',
      moves: [
        { from:'7g', to:'7f', label:'７六歩',              player:0 },
        { from:'8c', to:'8d', label:'８四歩',              player:1 },
        { from:'6g', to:'6f', label:'６六歩',              player:0 },
        { from:'3c', to:'3d', label:'３四歩',              player:1 },
        { from:'7i', to:'6h', label:'銀６八',              player:0 },
        { from:'7a', to:'6b', label:'銀６二',              player:1 },
        { from:'6h', to:'6g', label:'銀６七',              player:0 },
        { from:'5a', to:'4b', label:'玉４二',              player:1 },
        { from:'6i', to:'7h', label:'金７八（流線形）',    player:0 },
        { from:'4b', to:'3b', label:'玉３二',              player:1 },
        { from:'5i', to:'6i', label:'玉６九',              player:0 },
        { from:'6b', to:'7c', label:'銀７三',              player:1 },
        { from:'4i', to:'5i', label:'金５九',              player:0 },
        { from:'4a', to:'4b', label:'金４二',              player:1 },
      ]
    },
    {
      id: 'kaku-yagura',
      name: '角矢倉',
      category: '矢倉系の囲い',
      description: '矢倉形に角を7七に残したまま囲う形。角が7七に位置することで斜め方向の守りが強化され、独特のバランスを持つ変形矢倉。',
      moves: [
        { from:'7g', to:'7f', label:'７六歩',              player:0 },
        { from:'8c', to:'8d', label:'８四歩',              player:1 },
        { from:'6g', to:'6f', label:'６六歩',              player:0 },
        { from:'3c', to:'3d', label:'３四歩',              player:1 },
        { from:'8h', to:'7g', label:'角７七（角矢倉）',    player:0 },
        { from:'7a', to:'6b', label:'銀６二',              player:1 },
        { from:'6i', to:'6h', label:'金６八',              player:0 },
        { from:'5a', to:'4b', label:'玉４二',              player:1 },
        { from:'7i', to:'7h', label:'銀７八',              player:0 },
        { from:'4b', to:'3b', label:'玉３二',              player:1 },
        { from:'5i', to:'4h', label:'玉４八',              player:0 },
        { from:'6b', to:'7c', label:'銀７三',              player:1 },
        { from:'4h', to:'3h', label:'玉３八',              player:0 },
        { from:'4a', to:'4b', label:'金４二',              player:1 },
      ]
    },
    // ── 左美濃系の囲い ──────────────────────────────────────────
    {
      id: 'yonmai-mino',
      name: '四枚美濃（ダイヤモンド美濃）',
      category: '左美濃系の囲い',
      description: '居飛車の左美濃を金銀4枚で強化した最強形。金7九・銀7八・銀6七・金6九がダイヤモンド形に配置された堅牢な囲い。対振り飛車の持久戦で活躍。',
      moves: [
        { from:'7g', to:'7f', label:'７六歩',              player:0 },
        { from:'3c', to:'3d', label:'３四歩',              player:1 },
        { from:'5i', to:'6h', label:'玉６八',              player:0 },
        { from:'8c', to:'8d', label:'８四歩',              player:1 },
        { from:'8h', to:'7g', label:'角７七',              player:0 },
        { from:'4a', to:'3b', label:'金３二',              player:1 },
        { from:'6h', to:'7h', label:'玉７八',              player:0 },
        { from:'7a', to:'6b', label:'銀６二',              player:1 },
        { from:'7h', to:'8h', label:'玉８八',              player:0 },
        { from:'5a', to:'4b', label:'玉４二',              player:1 },
        { from:'7i', to:'7h', label:'銀７八',              player:0 },
        { from:'4b', to:'3b', label:'玉３二',              player:1 },
        { from:'6i', to:'7i', label:'金７九',              player:0 },
        { from:'6b', to:'5c', label:'銀５三',              player:1 },
      ]
    },
    {
      id: 'tenshukaku-mino',
      name: '天守閣美濃',
      category: '左美濃系の囲い',
      description: '居飛車が玉を9九まで移動させ天守閣（最上部）のような高い位置に囲う形。玉が端に潜ることで横からの攻めに強く、対振り飛車の有力な持久戦形。',
      moves: [
        { from:'7g', to:'7f', label:'７六歩',              player:0 },
        { from:'3c', to:'3d', label:'３四歩',              player:1 },
        { from:'5i', to:'6h', label:'玉６八',              player:0 },
        { from:'8c', to:'8d', label:'８四歩',              player:1 },
        { from:'8h', to:'7g', label:'角７七',              player:0 },
        { from:'4a', to:'3b', label:'金３二',              player:1 },
        { from:'6h', to:'7h', label:'玉７八',              player:0 },
        { from:'7a', to:'6b', label:'銀６二',              player:1 },
        { from:'7h', to:'8h', label:'玉８八',              player:0 },
        { from:'5a', to:'4b', label:'玉４二',              player:1 },
        { from:'8h', to:'9h', label:'玉９八',              player:0 },
        { from:'4b', to:'3b', label:'玉３二',              player:1 },
        { from:'9h', to:'9i', label:'玉９九（天守閣美濃）', player:0 },
        { from:'6b', to:'5c', label:'銀５三',              player:1 },
      ]
    },
    // ── 居飛車その他の囲い ───────────────────────────────────────
    {
      id: 'millennium',
      name: 'ミレニアム囲い',
      category: '居飛車その他の囲い',
      description: '玉を8九に置き、金銀で固める特殊な囲い。2000年頃に注目された持久戦形で、横からの攻めに強い陣形。コンピュータ将棋でも研究された現代的囲い。',
      moves: [
        { from:'7g', to:'7f', label:'７六歩',              player:0 },
        { from:'3c', to:'3d', label:'３四歩',              player:1 },
        { from:'8i', to:'7g', label:'桂７七（桂跳ね）',    player:0 },
        { from:'8c', to:'8d', label:'８四歩',              player:1 },
        { from:'6i', to:'6h', label:'金６八',              player:0 },
        { from:'7a', to:'6b', label:'銀６二',              player:1 },
        { from:'5i', to:'6i', label:'玉６九',              player:0 },
        { from:'5a', to:'4b', label:'玉４二',              player:1 },
        { from:'6i', to:'7h', label:'玉７八',              player:0 },
        { from:'4b', to:'3b', label:'玉３二',              player:1 },
        { from:'7h', to:'8i', label:'玉８九（ミレニアム）', player:0 },
        { from:'6b', to:'5c', label:'銀５三',              player:1 },
        { from:'4i', to:'5h', label:'金５八',              player:0 },
        { from:'4a', to:'4b', label:'金４二',              player:1 },
      ]
    },
    {
      id: 'kushikatsu',
      name: '串カツ囲い',
      category: '居飛車その他の囲い',
      description: '金6八・銀5八・金4八と縦に並ぶ串カツのような形の変形囲い。縦方向への守りが厚く、横からの攻めには対応力が問われる個性的な陣形。',
      moves: [
        { from:'7g', to:'7f', label:'７六歩',              player:0 },
        { from:'8c', to:'8d', label:'８四歩',              player:1 },
        { from:'6i', to:'6h', label:'金６八',              player:0 },
        { from:'3c', to:'3d', label:'３四歩',              player:1 },
        { from:'7i', to:'5h', label:'銀５八（串カツ）',    player:0 },
        { from:'7a', to:'6b', label:'銀６二',              player:1 },
        { from:'4i', to:'4h', label:'金４八',              player:0 },
        { from:'5a', to:'4b', label:'玉４二',              player:1 },
        { from:'5i', to:'4i', label:'玉４九',              player:0 },
        { from:'4b', to:'3b', label:'玉３二',              player:1 },
        { from:'2g', to:'2f', label:'２六歩',              player:0 },
        { from:'8d', to:'8e', label:'８五歩',              player:1 },
        { from:'3i', to:'3h', label:'銀３八',              player:0 },
        { from:'6b', to:'5c', label:'銀５三',              player:1 },
      ]
    },
    {
      id: 'nakasumi',
      name: '中住まい',
      category: '居飛車その他の囲い',
      description: '玉が5八に留まる囲い。金銀を展開しながら玉はほぼ中央に残り、攻守の均衡を保つ。囲いの種類というより戦略的な待機形であり、柔軟な対応が可能。',
      moves: [
        { from:'7g', to:'7f', label:'７六歩',              player:0 },
        { from:'8c', to:'8d', label:'８四歩',              player:1 },
        { from:'2g', to:'2f', label:'２六歩',              player:0 },
        { from:'3c', to:'3d', label:'３四歩',              player:1 },
        { from:'6i', to:'6h', label:'金６八',              player:0 },
        { from:'7a', to:'6b', label:'銀６二',              player:1 },
        { from:'4i', to:'5h', label:'金５八',              player:0 },
        { from:'5a', to:'4b', label:'玉４二',              player:1 },
        { from:'5i', to:'5h', label:'玉５八（中住まい）',  player:0 },
        { from:'4b', to:'3b', label:'玉３二',              player:1 },
        { from:'3i', to:'4h', label:'銀４八',              player:0 },
        { from:'8d', to:'8e', label:'８五歩',              player:1 },
        { from:'2f', to:'2e', label:'２五歩',              player:0 },
        { from:'6b', to:'5c', label:'銀５三',              player:1 },
      ]
    },
    {
      id: 'nakahara-gakoi',
      name: '中原囲い',
      category: '居飛車その他の囲い',
      description: '中原誠名人が愛用した囲い。玉6八・金5七の形が特徴で、攻守のバランスが取れた実用的な囲い。相居飛車の戦いで数多くの名局を生んだ。',
      moves: [
        { from:'7g', to:'7f', label:'７六歩',              player:0 },
        { from:'8c', to:'8d', label:'８四歩',              player:1 },
        { from:'2g', to:'2f', label:'２六歩',              player:0 },
        { from:'3c', to:'3d', label:'３四歩',              player:1 },
        { from:'5i', to:'6h', label:'玉６八（中原囲い）',  player:0 },
        { from:'7a', to:'6b', label:'銀６二',              player:1 },
        { from:'4i', to:'5h', label:'金５八',              player:0 },
        { from:'5a', to:'4b', label:'玉４二',              player:1 },
        { from:'5h', to:'5g', label:'金５七',              player:0 },
        { from:'4b', to:'3b', label:'玉３二',              player:1 },
        { from:'3i', to:'4h', label:'銀４八',              player:0 },
        { from:'8d', to:'8e', label:'８五歩',              player:1 },
        { from:'2f', to:'2e', label:'２五歩',              player:0 },
        { from:'6b', to:'5c', label:'銀５三',              player:1 },
      ]
    },
    {
      id: 'bonanza-gakoi',
      name: 'ボナンザ囲い',
      category: '居飛車その他の囲い',
      description: 'コンピュータ将棋ソフト「ボナンザ」が多用した囲い。舟囲いを若干変形させた形で、金6八・玉6九・金5八の配置がコンピュータ的な合理性を持つ。',
      moves: [
        { from:'7g', to:'7f', label:'７六歩',              player:0 },
        { from:'8c', to:'8d', label:'８四歩',              player:1 },
        { from:'2g', to:'2f', label:'２六歩',              player:0 },
        { from:'8d', to:'8e', label:'８五歩',              player:1 },
        { from:'6i', to:'6h', label:'金６八',              player:0 },
        { from:'3c', to:'3d', label:'３四歩',              player:1 },
        { from:'5i', to:'6i', label:'玉６九（ボナンザ）',  player:0 },
        { from:'7a', to:'6b', label:'銀６二',              player:1 },
        { from:'7i', to:'7h', label:'銀７八',              player:0 },
        { from:'5a', to:'4b', label:'玉４二',              player:1 },
        { from:'4i', to:'5h', label:'金５八',              player:0 },
        { from:'4b', to:'3b', label:'玉３二',              player:1 },
        { from:'3i', to:'4h', label:'銀４八',              player:0 },
        { from:'6b', to:'5c', label:'銀５三',              player:1 },
      ]
    },
    {
      id: 'chudan-gyoku',
      name: '中段玉',
      category: '居飛車その他の囲い',
      description: '玉を中段（5段目など）まで前進させる特殊戦略。玉が中央に位置することで守りよりも攻撃的な役割を担い、終盤での玉の活用を見据えた構想。',
      moves: [
        { from:'7g', to:'7f', label:'７六歩',              player:0 },
        { from:'8c', to:'8d', label:'８四歩',              player:1 },
        { from:'2g', to:'2f', label:'２六歩',              player:0 },
        { from:'3c', to:'3d', label:'３四歩',              player:1 },
        { from:'5i', to:'5h', label:'玉５八',              player:0 },
        { from:'7a', to:'6b', label:'銀６二',              player:1 },
        { from:'5h', to:'5g', label:'玉５七',              player:0 },
        { from:'5a', to:'4b', label:'玉４二',              player:1 },
        { from:'5g', to:'5f', label:'玉５六（中段へ）',    player:0 },
        { from:'4b', to:'3b', label:'玉３二',              player:1 },
        { from:'4i', to:'5g', label:'金５七（玉を支える）', player:0 },
        { from:'8d', to:'8e', label:'８五歩',              player:1 },
        { from:'3i', to:'4h', label:'銀４八',              player:0 },
        { from:'6b', to:'5c', label:'銀５三',              player:1 },
      ]
    },
    {
      id: 'saikyo-gakoi',
      name: '最強囲い',
      category: '居飛車その他の囲い',
      description: '金銀4枚すべてを玉周辺に集めた究極の守り。「最強囲い」の名の通り、あらゆる方向からの攻めに備えた理想形。実戦では組むまでの手数と引き換えに最高の堅さを誇る。',
      moves: [
        { from:'7g', to:'7f', label:'７六歩',              player:0 },
        { from:'3c', to:'3d', label:'３四歩',              player:1 },
        { from:'8h', to:'7g', label:'角７七',              player:0 },
        { from:'8c', to:'8d', label:'８四歩',              player:1 },
        { from:'5i', to:'6h', label:'玉６八',              player:0 },
        { from:'7a', to:'6b', label:'銀６二',              player:1 },
        { from:'6h', to:'7h', label:'玉７八',              player:0 },
        { from:'5a', to:'4b', label:'玉４二',              player:1 },
        { from:'7h', to:'8h', label:'玉８八',              player:0 },
        { from:'4b', to:'3b', label:'玉３二',              player:1 },
        { from:'7i', to:'7h', label:'銀７八',              player:0 },
        { from:'6b', to:'7c', label:'銀７三',              player:1 },
        { from:'6i', to:'7i', label:'金７九',              player:0 },
        { from:'4a', to:'4b', label:'金４二',              player:1 },
      ]
    },
    // ── 美濃系の囲い ────────────────────────────────────────────
    {
      id: 'gin-mino',
      name: '銀美濃',
      category: '美濃系の囲い',
      description: '美濃囲いの金を銀に変えた変形囲い。玉8八・銀7八・銀7七の形で、標準美濃より斜め方向の守りが強化される。振り飛車でよく見られる堅実な囲い。',
      moves: [
        { from:'7g', to:'7f', label:'７六歩',              player:0 },
        { from:'8c', to:'8d', label:'８四歩',              player:1 },
        { from:'2h', to:'4h', label:'飛４八（四間飛車）',  player:0 },
        { from:'8d', to:'8e', label:'８五歩',              player:1 },
        { from:'8h', to:'7g', label:'角７七',              player:0 },
        { from:'3c', to:'3d', label:'３四歩',              player:1 },
        { from:'5i', to:'6h', label:'玉６八',              player:0 },
        { from:'7a', to:'6b', label:'銀６二',              player:1 },
        { from:'6h', to:'7h', label:'玉７八',              player:0 },
        { from:'5a', to:'4b', label:'玉４二',              player:1 },
        { from:'7h', to:'8h', label:'玉８八',              player:0 },
        { from:'4b', to:'3b', label:'玉３二',              player:1 },
        { from:'7i', to:'7h', label:'銀７八（銀美濃）',    player:0 },
        { from:'6b', to:'5c', label:'銀５三',              player:1 },
      ]
    },
    {
      id: 'diamond-mino',
      name: 'ダイヤモンド美濃',
      category: '美濃系の囲い',
      description: '振り飛車の美濃を4枚に強化した囲い。金7九・銀7八・銀6七・金6九がダイヤモンド形に並ぶことで、全方位への守りが強化された最強美濃形。',
      moves: [
        { from:'7g', to:'7f', label:'７六歩',              player:0 },
        { from:'8c', to:'8d', label:'８四歩',              player:1 },
        { from:'2h', to:'4h', label:'飛４八（四間飛車）',  player:0 },
        { from:'3c', to:'3d', label:'３四歩',              player:1 },
        { from:'8h', to:'7g', label:'角７七',              player:0 },
        { from:'7a', to:'6b', label:'銀６二',              player:1 },
        { from:'5i', to:'6h', label:'玉６八',              player:0 },
        { from:'5a', to:'4b', label:'玉４二',              player:1 },
        { from:'6h', to:'7h', label:'玉７八',              player:0 },
        { from:'4b', to:'3b', label:'玉３二',              player:1 },
        { from:'7h', to:'8h', label:'玉８八',              player:0 },
        { from:'6b', to:'7c', label:'銀７三',              player:1 },
        { from:'7i', to:'7h', label:'銀７八',              player:0 },
        { from:'4a', to:'4b', label:'金４二',              player:1 },
      ]
    },
    {
      id: 'kimura-mino',
      name: '木村美濃',
      category: '美濃系の囲い',
      description: '木村名人が好んだ美濃の変形。美濃囲いに金4七を加えることで玉頭と4筋の守りを強化した堅牢な囲い。振り飛車での持久戦形として優秀。',
      moves: [
        { from:'7g', to:'7f', label:'７六歩',              player:0 },
        { from:'8c', to:'8d', label:'８四歩',              player:1 },
        { from:'2h', to:'4h', label:'飛４八（四間飛車）',  player:0 },
        { from:'8d', to:'8e', label:'８五歩',              player:1 },
        { from:'8h', to:'7g', label:'角７七',              player:0 },
        { from:'3c', to:'3d', label:'３四歩',              player:1 },
        { from:'5i', to:'6h', label:'玉６八',              player:0 },
        { from:'7a', to:'6b', label:'銀６二',              player:1 },
        { from:'6h', to:'7h', label:'玉７八',              player:0 },
        { from:'5a', to:'4b', label:'玉４二',              player:1 },
        { from:'7h', to:'8h', label:'玉８八',              player:0 },
        { from:'4b', to:'3b', label:'玉３二',              player:1 },
        { from:'7i', to:'7h', label:'銀７八',              player:0 },
        { from:'6b', to:'5c', label:'銀５三',              player:1 },
      ]
    },
    {
      id: 'kata-mino',
      name: '片美濃',
      category: '美濃系の囲い',
      description: '美濃囲いの最小形。玉8八・銀7八のみで構成され、わずか2〜3手で完成する。速攻への対応や相手の出方を見てから完全美濃に発展できる柔軟な形。',
      moves: [
        { from:'7g', to:'7f', label:'７六歩',              player:0 },
        { from:'8c', to:'8d', label:'８四歩',              player:1 },
        { from:'2h', to:'4h', label:'飛４八（四間飛車）',  player:0 },
        { from:'8d', to:'8e', label:'８五歩',              player:1 },
        { from:'8h', to:'7g', label:'角７七',              player:0 },
        { from:'3c', to:'3d', label:'３四歩',              player:1 },
        { from:'5i', to:'6h', label:'玉６八',              player:0 },
        { from:'7a', to:'6b', label:'銀６二',              player:1 },
        { from:'6h', to:'7h', label:'玉７八',              player:0 },
        { from:'5a', to:'4b', label:'玉４二',              player:1 },
        { from:'7h', to:'8h', label:'玉８八（片美濃完成）', player:0 },
        { from:'4b', to:'3b', label:'玉３二',              player:1 },
        { from:'2g', to:'2f', label:'２六歩',              player:0 },
        { from:'6b', to:'7c', label:'銀７三',              player:1 },
      ]
    },
    {
      id: 'chonmage-mino',
      name: 'ちょんまげ美濃',
      category: '美濃系の囲い',
      description: '美濃囲いに桂馬が8七に位置する「ちょんまげ」のような形。桂馬が玉頭に鎮座する独特のシルエットから命名された変形美濃で、端への守りが強化される。',
      moves: [
        { from:'7g', to:'7f', label:'７六歩',              player:0 },
        { from:'8c', to:'8d', label:'８四歩',              player:1 },
        { from:'2h', to:'4h', label:'飛４八（四間飛車）',  player:0 },
        { from:'8d', to:'8e', label:'８五歩',              player:1 },
        { from:'8h', to:'7g', label:'角７七',              player:0 },
        { from:'3c', to:'3d', label:'３四歩',              player:1 },
        { from:'5i', to:'6h', label:'玉６八',              player:0 },
        { from:'7a', to:'6b', label:'銀６二',              player:1 },
        { from:'6h', to:'7h', label:'玉７八',              player:0 },
        { from:'5a', to:'4b', label:'玉４二',              player:1 },
        { from:'7h', to:'8h', label:'玉８八',              player:0 },
        { from:'4b', to:'3b', label:'玉３二',              player:1 },
        { from:'8i', to:'8g', label:'桂８七（ちょんまげ）', player:0 },
        { from:'6b', to:'7c', label:'銀７三',              player:1 },
      ]
    },
    {
      id: 'bozuhead-mino',
      name: '坊主美濃',
      category: '美濃系の囲い',
      description: '美濃囲いで端歩を省いた「坊主頭」のような形。9六歩を突かないことで一手省略して速攻を優先する。端攻めへの対応は薄れるが、速度を重視した実戦的な囲い。',
      moves: [
        { from:'7g', to:'7f', label:'７六歩',              player:0 },
        { from:'8c', to:'8d', label:'８四歩',              player:1 },
        { from:'2h', to:'4h', label:'飛４八（四間飛車）',  player:0 },
        { from:'8d', to:'8e', label:'８五歩',              player:1 },
        { from:'8h', to:'7g', label:'角７七',              player:0 },
        { from:'3c', to:'3d', label:'３四歩',              player:1 },
        { from:'5i', to:'6h', label:'玉６八',              player:0 },
        { from:'7a', to:'6b', label:'銀６二',              player:1 },
        { from:'6h', to:'7h', label:'玉７八',              player:0 },
        { from:'5a', to:'4b', label:'玉４二',              player:1 },
        { from:'7h', to:'8h', label:'玉８八（坊主美濃）',  player:0 },
        { from:'4b', to:'3b', label:'玉３二',              player:1 },
        { from:'7i', to:'7h', label:'銀７八',              player:0 },
        { from:'4a', to:'4b', label:'金４二',              player:1 },
      ]
    },
    // ── 穴熊系の囲い ────────────────────────────────────────────
    {
      id: 'ginkanmuri-anaguma',
      name: '銀冠穴熊',
      category: '穴熊系の囲い',
      description: '銀冠から玉を9八に潜らせた最強と称される囲い。玉9八・銀8八・銀7七の形で上部と横双方への守りが完璧。現代将棋で最も堅固とされる囲いのひとつ。',
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
        { from:'8h', to:'9h', label:'玉９八',              player:0 },
        { from:'4b', to:'3b', label:'玉３二',              player:1 },
        { from:'7i', to:'8h', label:'銀８八（銀冠穴熊）',  player:0 },
        { from:'6b', to:'7c', label:'銀７三',              player:1 },
      ]
    },
    {
      id: 'big-four',
      name: 'ビッグ４',
      category: '穴熊系の囲い',
      description: '金銀4枚すべてが玉周辺を守る超堅陣。玉9九・金8八・金7九・銀8七（または類似形）と全ての金銀が集結した防御陣。攻める駒が少なくなる代わりに最大の堅さを持つ。',
      moves: [
        { from:'7g', to:'7f', label:'７六歩',              player:0 },
        { from:'3c', to:'3d', label:'３四歩',              player:1 },
        { from:'8h', to:'7g', label:'角７七',              player:0 },
        { from:'8c', to:'8d', label:'８四歩',              player:1 },
        { from:'5i', to:'6h', label:'玉６八',              player:0 },
        { from:'7a', to:'6b', label:'銀６二',              player:1 },
        { from:'6h', to:'7h', label:'玉７八',              player:0 },
        { from:'5a', to:'4b', label:'玉４二',              player:1 },
        { from:'7h', to:'8h', label:'玉８八',              player:0 },
        { from:'4b', to:'3b', label:'玉３二',              player:1 },
        { from:'8h', to:'9h', label:'玉９八',              player:0 },
        { from:'6b', to:'5c', label:'銀５三',              player:1 },
        { from:'9h', to:'9i', label:'玉９九（ビッグ４へ）', player:0 },
        { from:'4a', to:'4b', label:'金４二',              player:1 },
      ]
    },
    // ── 振り飛車その他の囲い ─────────────────────────────────────
    {
      id: 'migi-yagura',
      name: '右矢倉',
      category: '振り飛車その他の囲い',
      description: '振り飛車で右辺（2〜3筋）に矢倉を組む囲い。玉を2八方向に移動させ、金銀で固める形で振り飛車の持久戦形として用いられる。',
      moves: [
        { from:'7g', to:'7f', label:'７六歩',              player:0 },
        { from:'3c', to:'3d', label:'３四歩',              player:1 },
        { from:'2h', to:'3h', label:'飛３八（三間飛車）',  player:0 },
        { from:'8c', to:'8d', label:'８四歩',              player:1 },
        { from:'8h', to:'7g', label:'角７七',              player:0 },
        { from:'7a', to:'6b', label:'銀６二',              player:1 },
        { from:'4i', to:'4h', label:'金４八',              player:0 },
        { from:'5a', to:'4b', label:'玉４二',              player:1 },
        { from:'5i', to:'4i', label:'玉４九',              player:0 },
        { from:'4b', to:'3b', label:'玉３二',              player:1 },
        { from:'4i', to:'3i', label:'玉３九',              player:0 },
        { from:'3b', to:'2b', label:'玉２二',              player:1 },
        { from:'3i', to:'2i', label:'玉２九（右矢倉）',    player:0 },
        { from:'6b', to:'5c', label:'銀５三',              player:1 },
      ]
    },
    {
      id: 'sante-gakoi',
      name: '三手囲い',
      category: '振り飛車その他の囲い',
      description: '3手で完成する超速の囲い。玉4八・金6八の2手で最低限の防衛を確保し、素早く攻めに転じる。',
      moves: [
        { from:'7g', to:'7f', label:'７六歩',              player:0 },
        { from:'3c', to:'3d', label:'３四歩',              player:1 },
        { from:'5i', to:'4h', label:'玉４八',              player:0 },
        { from:'8c', to:'8d', label:'８四歩',              player:1 },
        { from:'6i', to:'6h', label:'金６八（三手囲い）',  player:0 },
        { from:'5a', to:'4b', label:'玉４二',              player:1 },
        { from:'2h', to:'5h', label:'飛５八（中飛車）',    player:0 },
        { from:'4b', to:'3b', label:'玉３二',              player:1 },
        { from:'3i', to:'4h', label:'銀４八（強化）',      player:0 },
        { from:'7a', to:'6b', label:'銀６二',              player:1 },
        { from:'5g', to:'5f', label:'５六歩',              player:0 },
        { from:'6b', to:'5c', label:'銀５三',              player:1 },
      ]
    },
    {
      id: 'taden-gakoi',
      name: '多伝囲い',
      category: '振り飛車その他の囲い',
      description: '振り飛車で用いる囲い。玉7九・金6九・銀6八の形で、少ない手数で堅実な守りを築く。速攻型の振り飛車との組み合わせで素早い展開が可能。',
      moves: [
        { from:'7g', to:'7f', label:'７六歩',              player:0 },
        { from:'3c', to:'3d', label:'３四歩',              player:1 },
        { from:'2h', to:'3h', label:'飛３八（三間飛車）',  player:0 },
        { from:'8c', to:'8d', label:'８四歩',              player:1 },
        { from:'5i', to:'6h', label:'玉６八',              player:0 },
        { from:'7a', to:'6b', label:'銀６二',              player:1 },
        { from:'6h', to:'7i', label:'玉７九（多伝囲い）',  player:0 },
        { from:'5a', to:'4b', label:'玉４二',              player:1 },
        { from:'6i', to:'6h', label:'金６八',              player:0 },
        { from:'4b', to:'3b', label:'玉３二',              player:1 },
        { from:'7i', to:'6i', label:'銀６九',              player:0 },
        { from:'6b', to:'5c', label:'銀５三',              player:1 },
        { from:'3g', to:'3f', label:'３六歩（攻め準備）',  player:0 },
        { from:'4a', to:'4b', label:'金４二',              player:1 },
      ]
    },
  ];

  // === アプリ状態 ===
  const CATEGORY_ORDER_GLOBAL = [
    '汎用戦法（居飛車・振り飛車共通）',
    '相居飛車の戦法',
    '対振り飛車の戦法',
    '振り飛車の戦法',
    'その他の戦法',
    '矢倉系の囲い',
    '左美濃系の囲い',
    '居飛車その他の囲い',
    '美濃系の囲い',
    '穴熊系の囲い',
    '振り飛車その他の囲い',
  ];

  let state = {
    openingIndex: -1,
    moveIndex: 0,
    boards: [initialBoard()],
    hands: [{ 0: {}, 1: {} }],
    collapsedCats: new Set(CATEGORY_ORDER_GLOBAL), // 初期は全て折りたたみ
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
    renderOpeningList(); // アクティブ更新＋アコーディオン再描画
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
    const grouped = {};
    OPENINGS.forEach((o, i) => {
      const cat = o.category || 'その他';
      if (!grouped[cat]) grouped[cat] = [];
      grouped[cat].push({ o, i });
    });

    // ※ 自動展開しない — ユーザーが手動で開く

    let html = '';
    const allCats = [
      ...CATEGORY_ORDER_GLOBAL.filter(c => grouped[c]),
      ...Object.keys(grouped).filter(c => !CATEGORY_ORDER_GLOBAL.includes(c)),
    ];

    allCats.forEach(cat => {
      const isCollapsed = state.collapsedCats.has(cat);
      const arrow = isCollapsed ? '▶' : '▼';
      html += `<li class="cat-header${isCollapsed ? ' collapsed' : ''}" data-cat="${cat}"><span class="cat-arrow">${arrow}</span>${cat}</li>`;
      if (!isCollapsed) {
        grouped[cat].forEach(({ o, i }) => {
          html += `<li data-idx="${i}"${i === state.openingIndex ? ' class="active"' : ''}>${o.name}</li>`;
        });
      }
    });

    ul.innerHTML = html;

    // カテゴリヘッダーのクリック→折りたたみトグル
    ul.querySelectorAll('li.cat-header').forEach(li => {
      li.addEventListener('click', () => {
        const cat = li.dataset.cat;
        if (state.collapsedCats.has(cat)) {
          state.collapsedCats.delete(cat);
        } else {
          state.collapsedCats.add(cat);
        }
        renderOpeningList();
        // ページスクロールを起こさず、サイドバー内だけスクロール
        requestAnimationFrame(() => {
          const sidebar = document.querySelector('.sidebar-left');
          const header = ul.querySelector(`li.cat-header[data-cat="${cat}"]`);
          if (sidebar && header) {
            const relTop = header.offsetTop - sidebar.offsetTop;
            sidebar.scrollTop = Math.max(0, relTop - 8);
          }
        });
      });
    });

    ul.querySelectorAll('li[data-idx]').forEach(li => {
      li.addEventListener('click', () => {
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
  renderBoard();
  renderControls();
  loadOpening(0); // loadOpening内でrenderOpeningListも呼ばれる
})();
