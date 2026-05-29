import Foundation

// swiftlint:disable file_length line_length
let allProverbs: [Proverb] = [

    // MARK: - 努力・根気 (ids 1-40)

    Proverb(id: 1, text: "石の上にも三年", reading: "いしのうえにもさんねん",
            meaning: "つらくても辛抱して続けていれば、いつかは成し遂げることができるというたとえ。",
            example: "なかなか上達しないけど、石の上にも三年という気持ちで練習を続けた。", category: .effort),

    Proverb(id: 2, text: "継続は力なり", reading: "けいぞくはちからなり",
            meaning: "何事も諦めずに続けていれば、やがて大きな力になるということ。",
            example: "毎日少しずつ英語を勉強し、継続は力なりを実感した。", category: .effort),

    Proverb(id: 3, text: "七転び八起き", reading: "ななころびやおき",
            meaning: "何度失敗してもくじけずに立ち上がること。不屈の精神を表す。",
            example: "起業に何度も失敗したが、七転び八起きの精神で挑戦し続けた。", category: .effort),

    Proverb(id: 4, text: "千里の道も一歩から", reading: "せんりのみちもいっぽから",
            meaning: "どんな大きな目標も、まず最初の一歩を踏み出すことから始まるということ。",
            example: "論文執筆は気が遠くなるけど、千里の道も一歩からだと思って書き始めた。", category: .effort),

    Proverb(id: 5, text: "ローマは一日にして成らず", reading: "ローマはいちにちにしてならず",
            meaning: "大きな成果は長い年月と努力の積み重ねによってのみ生まれるということ。",
            example: "体を鍛えるには時間がかかる。ローマは一日にして成らずだ。", category: .effort),

    Proverb(id: 6, text: "塵も積もれば山となる", reading: "ちりもつもればやまとなる",
            meaning: "わずかなものでも積み重ねれば大きなものになるというたとえ。",
            example: "毎月の貯金は少ないが、塵も積もれば山となる、10年後には大きな金額になっていた。", category: .effort),

    Proverb(id: 7, text: "鉄は熱いうちに打て", reading: "てつはあついうちにうて",
            meaning: "人も若くて素直なうちに教育・鍛錬することが大切。また、好機を逃さず即座に行動せよということ。",
            example: "新しいスキルを覚えるなら鉄は熱いうちに打て、興味があるうちに集中して学ぼう。", category: .effort),

    Proverb(id: 8, text: "雨垂れ石を穿つ", reading: "あまだれいしをうがつ",
            meaning: "小さな努力でも継続すれば、やがて大きな成果を生むことのたとえ。",
            example: "ちょっとずつでも毎日書いていれば、雨垂れ石を穿つで必ず作品が完成する。", category: .effort),

    Proverb(id: 9, text: "為せば成る", reading: "なせばなる",
            meaning: "意志を持ってやり遂げようとすれば、何でも成し遂げられるということ。",
            example: "難しそうに見えるが、為せば成る、まずやってみよう。", category: .effort),

    Proverb(id: 10, text: "苦は楽の種", reading: "くはらくのたね",
            meaning: "今の苦労は後の楽につながるということ。",
            example: "今は大変だけど、苦は楽の種だと信じて頑張ろう。", category: .effort),

    Proverb(id: 11, text: "苦あれば楽あり", reading: "くあればらくあり",
            meaning: "苦しいことがあれば、その後には必ず楽しいことがあるということ。",
            example: "苦あれば楽ありというから、今の試練もいつかは終わる。", category: .effort),

    Proverb(id: 12, text: "艱難汝を玉にす", reading: "かんなんなんじをたまにす",
            meaning: "苦労や困難を乗り越えることで、人は磨かれ立派になるということ。",
            example: "留学での苦労も、艱難汝を玉にすだと思えば乗り越えられる。", category: .effort),

    Proverb(id: 13, text: "失敗は成功の母", reading: "しっぱいはせいこうのはは",
            meaning: "失敗を繰り返すことで、その経験が成功につながるということ。",
            example: "試行錯誤を重ねたが、失敗は成功の母、ついに良い結果が出た。", category: .effort),

    Proverb(id: 14, text: "桃栗三年柿八年", reading: "ももくりさんねんかきはちねん",
            meaning: "何事も結果が出るまでにはそれ相応の時間がかかるということ。",
            example: "桃栗三年柿八年というように、スキルが身につくには時間がかかる。", category: .effort),

    Proverb(id: 15, text: "一念岩をも通す", reading: "いちねんいわをもとおす",
            meaning: "強い意志があれば、どんな困難も乗り越えられるということ。",
            example: "一念岩をも通す、どれだけ難しくても絶対にやり遂げてみせる。", category: .effort),

    Proverb(id: 16, text: "臥薪嘗胆", reading: "がしんしょうたん",
            meaning: "目的を達成するために、長い間苦労・苦難に耐えること。",
            example: "資格取得のために臥薪嘗胆の毎日を過ごした。", category: .effort),

    Proverb(id: 17, text: "粉骨砕身", reading: "ふんこつさいしん",
            meaning: "骨身を惜しまず、力の限り努力すること。",
            example: "プロジェクトを成功させるために粉骨砕身の思いで取り組んだ。", category: .effort),

    Proverb(id: 18, text: "不撓不屈", reading: "ふとうふくつ",
            meaning: "どんな困難にも屈せず、くじけないこと。",
            example: "不撓不屈の精神で何度も挑戦し続けた。", category: .effort),

    Proverb(id: 19, text: "切磋琢磨", reading: "せっさたくま",
            meaning: "仲間と互いに刺激し合いながら、学問・技術・人格を磨くこと。",
            example: "チームで切磋琢磨することで、全員のスキルが向上した。", category: .effort),

    Proverb(id: 20, text: "一意専心", reading: "いちいせんしん",
            meaning: "一つのことに心を集中して、他のことは一切考えないこと。",
            example: "一意専心で研究に打ち込んだ結果、大きな発見につながった。", category: .effort),

    Proverb(id: 21, text: "七転八起", reading: "しちてんはっき",
            meaning: "何度失敗しても諦めずに立ち上がること。七転び八起きと同意。",
            example: "七転八起の精神を胸に、再チャレンジした。", category: .effort),

    Proverb(id: 22, text: "百折不撓", reading: "ひゃくせつふとう",
            meaning: "何度失敗・挫折しても、決して屈しないこと。",
            example: "百折不撓の姿勢で、諦めずに目標に向かい続けた。", category: .effort),

    Proverb(id: 23, text: "天は自ら助くる者を助く", reading: "てんはみずからたすくるものをたすく",
            meaning: "自分自身が努力する者には、天もそれを助けてくれるということ。",
            example: "天は自ら助くる者を助く、まず自分でできることを全部やろう。", category: .effort),

    Proverb(id: 24, text: "辛抱する木に金がなる", reading: "しんぼうするきにかねがなる",
            meaning: "辛抱強くやり続ければ、やがて報われるということ。",
            example: "辛抱する木に金がなるというから、もう少しだけ続けてみよう。", category: .effort),

    Proverb(id: 25, text: "苦労は買ってでもせよ", reading: "くろうはかってでもせよ",
            meaning: "若いうちに進んで苦労を経験することが、将来の力になるということ。",
            example: "苦労は買ってでもせよというから、あえて難しい仕事を引き受けた。", category: .effort),

    Proverb(id: 26, text: "骨身を惜しまず", reading: "ほねみをおしまず",
            meaning: "労苦を厭わず、一生懸命働くこと。",
            example: "骨身を惜しまず働いたおかげで、ようやく認められた。", category: .effort),

    Proverb(id: 27, text: "一日一善", reading: "いちにちいちぜん",
            meaning: "毎日一つはよいことをしようということ。",
            example: "一日一善を心がけて、小さな親切を積み重ねている。", category: .effort),

    Proverb(id: 28, text: "勇往邁進", reading: "ゆうおうまいしん",
            meaning: "目標に向かって、勇ましく突き進むこと。",
            example: "困難を乗り越えながら勇往邁進、ついに目標を達成した。", category: .effort),

    Proverb(id: 29, text: "全力投球", reading: "ぜんりょくとうきゅう",
            meaning: "持てる力をすべて出し切ること。",
            example: "どんな仕事にも全力投球で取り組む姿勢が大切だ。", category: .effort),

    Proverb(id: 30, text: "一所懸命", reading: "いっしょけんめい",
            meaning: "命がけで、一つのことに全力を尽くすこと。",
            example: "一所懸命にやれば、必ず道は開けると信じている。", category: .effort),

    Proverb(id: 31, text: "大器晩成", reading: "たいきばんせい",
            meaning: "偉大な人物は、遅れて世に出るものだということ。",
            example: "彼は学生時代は目立たなかったが、大器晩成、今は第一線で活躍している。", category: .effort),

    Proverb(id: 32, text: "日進月歩", reading: "にっしんげっぽ",
            meaning: "日に日に絶えず進歩すること。",
            example: "テクノロジーは日進月歩で、常に学び続けなければならない。", category: .effort),

    Proverb(id: 33, text: "初志貫徹", reading: "しょしかんてつ",
            meaning: "最初に決めた志を最後まで貫くこと。",
            example: "どんな誘惑があっても初志貫徹、決めた道を進む。", category: .effort),

    Proverb(id: 34, text: "前人未踏", reading: "ぜんじんみとう",
            meaning: "まだ誰も成し遂げていないこと、到達していない境地。",
            example: "前人未踏の記録に挑戦する選手の姿に感動した。", category: .effort),

    Proverb(id: 35, text: "刻苦勉励", reading: "こっくべんれい",
            meaning: "苦労を厭わずに一生懸命勉強・努力すること。",
            example: "合格するために刻苦勉励して試験に臨んだ。", category: .effort),

    Proverb(id: 36, text: "初心忘るべからず", reading: "しょしんわするべからず",
            meaning: "物事を始めた頃の謙虚な気持ちや志を、いつまでも忘れてはならないということ。",
            example: "仕事にも慣れてきたが、初心忘るべからずの言葉を胸に刻んでいる。", category: .effort),

    Proverb(id: 37, text: "負けるが勝ち", reading: "まけるがかち",
            meaning: "目先の争いに負けても、長い目で見れば譲った方が賢く得策であるということ。",
            example: "今は黙っておこう。負けるが勝ちという言葉もある。", category: .effort),

    Proverb(id: 38, text: "精進", reading: "しょうじん",
            meaning: "一つのことに懸命に取り組み、自らを高めていくこと。",
            example: "料理の精進を続け、ついに一流の料理人になった。", category: .effort),

    Proverb(id: 39, text: "敢闘精神", reading: "かんとうせいしん",
            meaning: "困難にも敢えて立ち向かおうとする精神。",
            example: "敢闘精神を忘れずに、最後まで戦い続けた。", category: .effort),

    Proverb(id: 40, text: "七難八苦", reading: "しちなんはっく",
            meaning: "あらゆる苦難・困難のこと。それを乗り越えようとする強さも指す。",
            example: "七難八苦を乗り越えて、ようやく夢を実現させた。", category: .effort),

    // MARK: - 知恵・学び (ids 41-80)

    Proverb(id: 41, text: "聞くは一時の恥、聞かぬは一生の恥", reading: "きくはいっときのはじ、きかぬはいっしょうのはじ",
            meaning: "わからないことを聞くのは一時的に恥ずかしくても、聞かないまま過ごすほうが長い目で見て損だということ。",
            example: "新人のうちは、聞くは一時の恥、聞かぬは一生の恥の気持ちで積極的に質問した。", category: .wisdom),

    Proverb(id: 42, text: "転ばぬ先の杖", reading: "ころばぬさきのつえ",
            meaning: "失敗する前にあらかじめ準備・用心をしておくこと。",
            example: "旅行の前に保険に加入した。転ばぬ先の杖だ。", category: .wisdom),

    Proverb(id: 43, text: "三人寄れば文殊の知恵", reading: "さんにんよればもんじゅのちえ",
            meaning: "普通の人でも三人集まって考えれば、すぐれた知恵が出るということ。",
            example: "一人では解けなかった問題も、三人寄れば文殊の知恵で解決できた。", category: .wisdom),

    Proverb(id: 44, text: "学問に近道なし", reading: "がくもんにちかみちなし",
            meaning: "学問を修めるには、地道な努力を積み重ねるしかなく、楽をする方法はないということ。",
            example: "語学の習得には学問に近道なし、毎日コツコツ練習するしかない。", category: .wisdom),

    Proverb(id: 45, text: "温故知新", reading: "おんこちしん",
            meaning: "古いことを学び直して、そこから新しい知識や道理を見つけ出すこと。",
            example: "温故知新で古典を読み返すと、現代に通じる教えが発見できた。", category: .wisdom),

    Proverb(id: 46, text: "習うより慣れよ", reading: "ならうよりなれよ",
            meaning: "理論で学ぶより、実際に経験を積むほうが上達は早いということ。",
            example: "料理は習うより慣れよ、とにかく毎日作ることが大事だ。", category: .wisdom),

    Proverb(id: 47, text: "知らぬが仏", reading: "しらぬがほとけ",
            meaning: "知ってしまうと腹も立つし苦しいが、知らないでいる間は穏やかでいられるということ。",
            example: "そのうわさは本人は知らぬが仏で、穏やかに過ごしていた。", category: .wisdom),

    Proverb(id: 48, text: "百聞は一見に如かず", reading: "ひゃくぶんはいっけんにしかず",
            meaning: "人から何度聞くよりも、一度自分の目で見るほうが確実だということ。",
            example: "百聞は一見に如かず、実際に現地を訪れて状況を理解した。", category: .wisdom),

    Proverb(id: 49, text: "能ある鷹は爪を隠す", reading: "のうあるたかはつめをかくす",
            meaning: "本当に実力のある人は、むやみにその力を誇示しないということ。",
            example: "彼は普段は静かだが、能ある鷹は爪を隠す、いざというときに実力を発揮する。", category: .wisdom),

    Proverb(id: 50, text: "浅い川も深く渡れ", reading: "あさいかわもふかくわたれ",
            meaning: "たとえ簡単そうに見えても、油断せず慎重に行動すべきだということ。",
            example: "浅い川も深く渡れ、簡単な仕事ほど丁寧に確認することが大切だ。", category: .wisdom),

    Proverb(id: 51, text: "知識は力なり", reading: "ちしきはちからなり",
            meaning: "知識を持つことが力や能力の源となるということ。",
            example: "知識は力なり、勉強を続けることで選択肢が広がる。", category: .wisdom),

    Proverb(id: 52, text: "他山の石", reading: "たざんのいし",
            meaning: "他人の失敗や欠点を、自分の修養・反省に役立てること。",
            example: "同僚のミスを他山の石として、自分は同じ間違いをしないよう気をつけた。", category: .wisdom),

    Proverb(id: 53, text: "臨機応変", reading: "りんきおうへん",
            meaning: "その場の状況に応じて、適切な判断や対応をすること。",
            example: "トラブル発生時には臨機応変に対処することが求められる。", category: .wisdom),

    Proverb(id: 54, text: "一知半解", reading: "いちちはんかい",
            meaning: "物事を十分に理解せず、中途半端に知っていること。",
            example: "一知半解のまま発言してしまい、恥をかいた。", category: .wisdom),

    Proverb(id: 55, text: "一を聞いて十を知る", reading: "いちをきいてじゅうをしる",
            meaning: "一つのことを聞いただけで、それに関連する多くのことを理解できること。",
            example: "彼女は一を聞いて十を知るほど理解が早く、すぐに仕事を覚えた。", category: .wisdom),

    Proverb(id: 56, text: "郷に入っては郷に従え", reading: "ごうにいってはごうにしたがえ",
            meaning: "その土地や社会に入ったら、その地のしきたりや習慣に従うべきだということ。",
            example: "海外赴任では郷に入っては郷に従え、現地の文化を尊重することが大切だ。", category: .wisdom),

    Proverb(id: 57, text: "餅は餅屋", reading: "もちはもちや",
            meaning: "何事もその道の専門家に任せるのが一番良いということ。",
            example: "法律の問題は餅は餅屋、弁護士に相談するのが一番だ。", category: .wisdom),

    Proverb(id: 58, text: "読書百遍義自ずから見る", reading: "どくしょひゃっぺんぎおのずからあらわる",
            meaning: "難しい書物でも繰り返し読めば、自然と意味が理解できるようになるということ。",
            example: "読書百遍義自ずから見る、難しい論文も何度も読むうちに理解できた。", category: .wisdom),

    Proverb(id: 59, text: "机上の空論", reading: "きじょうのくうろん",
            meaning: "頭の中だけで考えた、実際には役に立たない理論や計画のこと。",
            example: "その計画は机上の空論で、現場の実態を考慮していなかった。", category: .wisdom),

    Proverb(id: 60, text: "経験は最良の教師", reading: "けいけんはさいりょうのきょうし",
            meaning: "どんな教えよりも、実際の経験から学ぶことが最も身になるということ。",
            example: "経験は最良の教師、失敗から学んだことが今の糧になっている。", category: .wisdom),

    Proverb(id: 61, text: "岡目八目", reading: "おかめはちもく",
            meaning: "当事者よりも第三者のほうが、物事を冷静に見て正確に判断できること。",
            example: "岡目八目というから、外部の意見を取り入れてみよう。", category: .wisdom),

    Proverb(id: 62, text: "先見の明", reading: "せんけんのめい",
            meaning: "物事の先行きを見通す、優れた判断力・洞察力のこと。",
            example: "彼の投資判断は先見の明があり、10年前に今の主力産業に目をつけていた。", category: .wisdom),

    Proverb(id: 63, text: "博覧強記", reading: "はくらんきょうき",
            meaning: "広く書物を読んで、多くのことを記憶していること。",
            example: "博覧強記の教授の講義は、いつも豊富な知識に満ちていた。", category: .wisdom),

    Proverb(id: 64, text: "木を見て森を見ず", reading: "きをみてもりをみず",
            meaning: "細かいことにとらわれて、全体を把握できないこと。",
            example: "木を見て森を見ずにならないよう、大局的な視点を持つことが重要だ。", category: .wisdom),

    Proverb(id: 65, text: "知行合一", reading: "ちこうごういつ",
            meaning: "知識と行動は一体であり、真の知は行動を伴うものだということ。",
            example: "知行合一の精神で、学んだことはすぐに実践するようにしている。", category: .wisdom),

    Proverb(id: 66, text: "守破離", reading: "しゅはり",
            meaning: "学習・修行の三段階。まず型を守り、やがて型を破り、型から離れて独自の境地へ進むこと。",
            example: "守破離のプロセスを経て、師匠の教えを超えた独自のスタイルを確立した。", category: .wisdom),

    Proverb(id: 67, text: "論語読みの論語知らず", reading: "ろんごよみのろんごしらず",
            meaning: "書物を読んでいても、その意味や精神を実生活に活かせていないこと。",
            example: "論語読みの論語知らずにならないよう、読んだことを実践することが大切だ。", category: .wisdom),

    Proverb(id: 68, text: "一隅を照らす", reading: "いちぐうをてらす",
            meaning: "自分のいる場所で、小さくとも誠実に尽くすことの大切さ。",
            example: "一隅を照らす精神で、自分の持ち場で丁寧に仕事をした。", category: .wisdom),

    Proverb(id: 69, text: "明鏡止水", reading: "めいきょうしすい",
            meaning: "曇りなき鏡と静まり返った水のように、邪念がなく澄み切った心の状態。",
            example: "試合前は明鏡止水の境地で、無駄な雑念を排除して臨んだ。", category: .wisdom),

    Proverb(id: 70, text: "七歩の才", reading: "しちほのさい",
            meaning: "詩を七歩歩く間に作れるほどの卓越した才能のこと。曹植の故事から。",
            example: "彼女の即興スピーチは七歩の才と称えられるほど見事だった。", category: .wisdom),

    Proverb(id: 71, text: "人を見て法を説け", reading: "ひとをみてほうをとけ",
            meaning: "教えを説くときは、相手の理解力や状況に合わせて話すべきだということ。",
            example: "人を見て法を説けというから、相手に合わせた説明を心がけている。", category: .wisdom),

    Proverb(id: 72, text: "三思一言", reading: "さんしいちげん",
            meaning: "何かを言う前に三度考えてから一言発すること。慎重な発言の大切さ。",
            example: "SNSに投稿する前は三思一言で内容をよく確認している。", category: .wisdom),

    Proverb(id: 73, text: "博学多才", reading: "はくがくたさい",
            meaning: "広い学識と多くの才能を持っていること。",
            example: "博学多才な先生の授業は、いつも幅広い話題に富んでいた。", category: .wisdom),

    Proverb(id: 74, text: "隣の芝生は青い", reading: "となりのしばふはあおい",
            meaning: "他人のものや状況はよく見えてしまうが、自分のものをよく見直すと同じくらい良いものがあるということ。",
            example: "隣の芝生は青いと感じるが、自分の環境を見直すとよいところがたくさんある。", category: .wisdom),

    Proverb(id: 75, text: "無知の知", reading: "むちのち",
            meaning: "自分が無知であることを自覚することが、真の知恵の始まりであるということ。ソクラテスの哲学から。",
            example: "無知の知を胸に、どんなに学んでも謙虚に学び続ける姿勢を忘れない。", category: .wisdom),

    Proverb(id: 76, text: "積学累功", reading: "せきがくるいこう",
            meaning: "学問を積み重ね、功績を積み上げていくこと。",
            example: "積学累功の末、ついに博士号を取得した。", category: .wisdom),

    Proverb(id: 77, text: "井の中の蛙、大海を知らず", reading: "いのなかのかわず、たいかいをしらず",
            meaning: "狭い世界に閉じこもって、外の広い世界のことを知らないこと。",
            example: "海外に出て初めて、自分がいかに井の中の蛙、大海を知らずだったかがわかった。", category: .wisdom),

    Proverb(id: 78, text: "虎の巻", reading: "とらのまき",
            meaning: "ある物事を成し遂げるための秘訣・手引き書のこと。",
            example: "先輩から受け取った仕事の虎の巻は、本当に役に立った。", category: .wisdom),

    Proverb(id: 79, text: "反面教師", reading: "はんめんきょうし",
            meaning: "良い手本とはならないが、反対の意味で教訓を与えてくれる人・事柄。",
            example: "あの上司の失敗は反面教師として、自分の戒めにしている。", category: .wisdom),

    Proverb(id: 80, text: "教学相長", reading: "きょうがくあいちょう",
            meaning: "教えることと学ぶことは互いに助け合って向上するものだということ。",
            example: "教学相長、人に教えることで自分の理解も深まった。", category: .wisdom),

    // MARK: - 人間関係 (ids 81-120)

    Proverb(id: 81, text: "親しき仲にも礼儀あり", reading: "したしきなかにもれいぎあり",
            meaning: "どんなに仲がよくても、礼儀やマナーを忘れてはいけないということ。",
            example: "長年の友人でも、親しき仲にも礼儀あり、時間は守るようにしている。", category: .relationships),

    Proverb(id: 82, text: "袖振り合うも多生の縁", reading: "そでふりあうもたしょうのえん",
            meaning: "道でちょっと触れ合うようなわずかな出会いも、前世からの深い縁によるものだということ。",
            example: "旅先で出会った人と意気投合した。袖振り合うも多生の縁だね。", category: .relationships),

    Proverb(id: 83, text: "人のふり見て我がふり直せ", reading: "ひとのふりみてわがふりなおせ",
            meaning: "他人の言動を見て、自分の言動を反省し改めよということ。",
            example: "同僚の遅刻を見て、人のふり見て我がふり直せと自分を戒めた。", category: .relationships),

    Proverb(id: 84, text: "類は友を呼ぶ", reading: "るいはともをよぶ",
            meaning: "気質や趣味の似た者同士は自然と集まるということ。",
            example: "サークルを見ると、類は友を呼ぶで似たような人が集まっていた。", category: .relationships),

    Proverb(id: 85, text: "情けは人のためならず", reading: "なさけはひとのためならず",
            meaning: "人に情けをかけることは、回り回って自分に返ってくるということ。",
            example: "困っている人を助けたら、のちに自分も助けてもらえた。情けは人のためならずだ。", category: .relationships),

    Proverb(id: 86, text: "以心伝心", reading: "いしんでんしん",
            meaning: "言葉を使わなくても、心と心が通じ合うこと。",
            example: "長年の相棒とは、以心伝心でお互いの考えがわかる。", category: .relationships),

    Proverb(id: 87, text: "一期一会", reading: "いちごいちえ",
            meaning: "一生に一度しかない出会いを大切にすること。",
            example: "旅で出会う人との縁は一期一会、誠実に接するようにしている。", category: .relationships),

    Proverb(id: 88, text: "縁の下の力持ち", reading: "えんのしたのちからもち",
            meaning: "表には出ないが、陰で人や組織を支えている人や存在のこと。",
            example: "チームを支えるサポートスタッフは、縁の下の力持ちとして欠かせない存在だ。", category: .relationships),

    Proverb(id: 89, text: "割れ鍋に綴じ蓋", reading: "われなべにとじぶた",
            meaning: "どんな人にも、その人にふさわしい相手や仲間がいるということ。",
            example: "二人は正反対の性格だが、割れ鍋に綴じ蓋で互いを補い合っている。", category: .relationships),

    Proverb(id: 90, text: "縁は異なもの味なもの", reading: "えんはいなものあじなもの",
            meaning: "男女の縁というのは、不思議でおもしろいものだということ。",
            example: "まさか幼馴染と結婚するとは。縁は異なもの味なものだ。", category: .relationships),

    Proverb(id: 91, text: "目には目を、歯には歯を", reading: "めにはめを、はにははを",
            meaning: "受けた仕打ちと同じ方法・程度でやり返すべきだという考え方。",
            example: "目には目を歯には歯をの精神では、争いが終わらないとも言われる。", category: .relationships),

    Proverb(id: 92, text: "恩を仇で返す", reading: "おんをあだでかえす",
            meaning: "受けた恩に対して、恩返しするどころか害を与えること。",
            example: "親切にしてあげたのに、まさか恩を仇で返されるとは思わなかった。", category: .relationships),

    Proverb(id: 93, text: "孟母三遷", reading: "もうぼさんせん",
            meaning: "子の教育のためには、環境選びが重要だということ。孟子の母が子のために三度引っ越した故事から。",
            example: "孟母三遷のように、子どもの環境を整えることに力を入れた。", category: .relationships),

    Proverb(id: 94, text: "親の心子知らず", reading: "おやのこころこしらず",
            meaning: "親が子を思う深い気持ちを、子どもはなかなか理解できないということ。",
            example: "当時は反抗してばかりだったが、今になると親の心子知らずだったとつくづく思う。", category: .relationships),

    Proverb(id: 95, text: "子は親の鏡", reading: "こはおやのかがみ",
            meaning: "子どもの言動は、親の言動や家庭環境を映し出しているということ。",
            example: "子は親の鏡というから、子どもの前で良いお手本を見せるよう心がけた。", category: .relationships),

    Proverb(id: 96, text: "魚心あれば水心", reading: "うおごころあればみずごころ",
            meaning: "相手が自分に好意を持てば、こちらも相手に好意を持つようになるということ。",
            example: "魚心あれば水心、相手を思いやれば、相手も思いやってくれるものだ。", category: .relationships),

    Proverb(id: 97, text: "朱に交われば赤くなる", reading: "しゅにまじわればあかくなる",
            meaning: "人は付き合う仲間によって、良くも悪くも影響を受けるということ。",
            example: "朱に交われば赤くなる、良い仲間と過ごすことが人格形成に大切だ。", category: .relationships),

    Proverb(id: 98, text: "門前の小僧習わぬ経を読む", reading: "もんぜんのこぞうならわぬきょうをよむ",
            meaning: "日常的に接していることは、意識せずとも自然に身についていくということ。",
            example: "門前の小僧習わぬ経を読む、音楽家の家庭で育った子は自然と音感が身につく。", category: .relationships),

    Proverb(id: 99, text: "遠くの親戚より近くの他人", reading: "とおくのしんせきよりちかくのたにん",
            meaning: "遠くに住む親戚よりも、近所の人のほうが何かと助けになるということ。",
            example: "遠くの親戚より近くの他人、ご近所さんには日頃からお世話になっている。", category: .relationships),

    Proverb(id: 100, text: "触らぬ神に祟りなし", reading: "さわらぬかみにたたりなし",
            meaning: "余計なことに手を出したり、関わったりしなければ、災いを招くことはないということ。",
            example: "触らぬ神に祟りなし、その件には関わらないほうがよさそうだ。", category: .relationships),

    Proverb(id: 101, text: "喧嘩両成敗", reading: "けんかりょうせいばい",
            meaning: "喧嘩においては、どちらが先に始めたかにかかわらず、両方とも同じように罰せられるということ。",
            example: "喧嘩両成敗で、二人とも反省するよう言った。", category: .relationships),

    Proverb(id: 102, text: "沈黙は金、雄弁は銀", reading: "ちんもくはきん、ゆうべんはぎん",
            meaning: "時に沈黙は、上手な話し方よりもさらに価値があるということ。",
            example: "沈黙は金、雄弁は銀というから、余計なことは言わずにいた。", category: .relationships),

    Proverb(id: 103, text: "友あり、遠方より来たる", reading: "ともあり、えんぽうよりきたる",
            meaning: "遠くからわざわざ訪ねてきてくれる友人がいることは、非常にうれしいことだということ。",
            example: "友あり遠方より来たる、旧友が仕事で近くに来て、久しぶりに会えた。", category: .relationships),

    Proverb(id: 104, text: "和を以って尊しとなす", reading: "わをもってとうとしとなす",
            meaning: "仲間の間で和を保ち、互いに仲良くすることが最も大切だということ。",
            example: "和を以って尊しとなす、チームワークを大切にして仕事を進めた。", category: .relationships),

    Proverb(id: 105, text: "親の七光り", reading: "おやのななひかり",
            meaning: "子が親の地位や名声の恩恵を受けること。",
            example: "彼の成功は親の七光りだという人もいるが、本人の努力があってこそだ。", category: .relationships),

    Proverb(id: 106, text: "目は口ほどに物を言う", reading: "めはくちほどにものをいう",
            meaning: "目の表情は、言葉と同じくらい豊かに気持ちを伝えるということ。",
            example: "目は口ほどに物を言う、彼女の目を見ればすぐに気持ちがわかった。", category: .relationships),

    Proverb(id: 107, text: "他人の飯を食え", reading: "たにんのめしをくえ",
            meaning: "親元を離れ、他人の家や社会で苦労を経験することで、人間的に成長できるということ。",
            example: "他人の飯を食えというから、若いうちに一人暮らしをして自立心を養った。", category: .relationships),

    Proverb(id: 108, text: "出る杭は打たれる", reading: "でるくいはうたれる",
            meaning: "能力があって目立つ人は、周囲から妬まれたり批判されたりするということ。",
            example: "出る杭は打たれるといっても、自分の意見を臆さず言うべきだ。", category: .relationships),

    Proverb(id: 109, text: "寄らば大樹の陰", reading: "よらばたいじゅのかげ",
            meaning: "頼るなら力のある人や大きな組織に頼るほうが安心・安全だということ。",
            example: "寄らば大樹の陰と大企業に就職したが、自分で考える力も大切だと気づいた。", category: .relationships),

    Proverb(id: 110, text: "虎の威を借る狐", reading: "とらのいをかるきつね",
            meaning: "権力や実力のある者の威光を借りて、いばり散らすこと。",
            example: "上司の名前を出して偉そうにしているが、虎の威を借る狐そのものだ。", category: .relationships),

    Proverb(id: 111, text: "鬼も十八、番茶も出花", reading: "おにもじゅうはち、ばんちゃもでばな",
            meaning: "女性は18歳くらいになると、どんな人でも美しく見えるということ。",
            example: "鬼も十八番茶も出花、若さというのはそれ自体が輝いているものだ。", category: .relationships),

    Proverb(id: 112, text: "老いては子に従え", reading: "おいてはこにしたがえ",
            meaning: "年老いたら、子ども世代の意見や判断に従うほうが良いということ。",
            example: "老いては子に従えと、デジタル機器の操作は子どもに教えてもらっている。", category: .relationships),

    Proverb(id: 113, text: "陰口は身を滅ぼす", reading: "かげぐちはみをほろぼす",
            meaning: "人の陰口は回り回って自分に返ってきて、自分の評価を下げるということ。",
            example: "陰口は身を滅ぼすというから、不満があれば直接話し合うようにしている。", category: .relationships),

    Proverb(id: 114, text: "馬が合う", reading: "うまがあう",
            meaning: "互いに気が合って、付き合いがうまくいくこと。",
            example: "初対面なのに馬が合って、すぐに打ち解けることができた。", category: .relationships),

    Proverb(id: 115, text: "七人の敵がある", reading: "しちにんのてきがある",
            meaning: "社会に出て活動すると、多くの敵や障害に出会うものだということ。",
            example: "七人の敵があるというが、敵を作らない工夫も必要だ。", category: .relationships),

    Proverb(id: 116, text: "朋友有信", reading: "ほうゆうゆうしん",
            meaning: "友人間では、誠実さと信義を持って接することが大切だということ。",
            example: "朋友有信、友達との約束は必ず守るようにしている。", category: .relationships),

    Proverb(id: 117, text: "信頼は時間をかけて築く", reading: "しんらいはじかんをかけてきずく",
            meaning: "本当の信頼関係は、一朝一夕にはできず、長い時間をかけて積み重ねるものだということ。",
            example: "信頼は時間をかけて築くもの、焦らずコツコツと関係を深めていった。", category: .relationships),

    Proverb(id: 118, text: "人を見かけで判断するな", reading: "ひとをみかけでだんずるな",
            meaning: "外見や第一印象だけで人を判断すべきではないということ。",
            example: "人を見かけで判断するなというように、話してみると思わぬ素晴らしい面が見えた。", category: .relationships),

    Proverb(id: 119, text: "腐れ縁", reading: "くされえん",
            meaning: "切れそうで切れない、好ましくないような関係が続くこと。",
            example: "あいつとは腐れ縁で、喧嘩しても結局また一緒にいる。", category: .relationships),

    Proverb(id: 120, text: "烏合の衆", reading: "うごうのしゅう",
            meaning: "規律がなく、ただ集まっているだけの集団のこと。",
            example: "烏合の衆ではなく、目標を共有した本物のチームを作りたい。", category: .relationships),

    // MARK: - 自然・時間 (ids 121-155)

    Proverb(id: 121, text: "光陰矢のごとし", reading: "こういんやのごとし",
            meaning: "月日が経つのはとても速いということ。",
            example: "あっという間に一年が過ぎた。光陰矢のごとしとはよく言ったものだ。", category: .nature),

    Proverb(id: 122, text: "花より団子", reading: "はなよりだんご",
            meaning: "風雅より実益を好むことのたとえ。外見より内容・実質を重視すること。",
            example: "お花見に行っても、花より団子で食べ物ばかりに目が行く。", category: .nature),

    Proverb(id: 123, text: "明日は明日の風が吹く", reading: "あしたはあしたのかぜがふく",
            meaning: "将来のことをくよくよ心配しても仕方がない。なるようになるということ。",
            example: "試験のことで悩んでいたが、明日は明日の風が吹く、と気持ちを切り替えた。", category: .nature),

    Proverb(id: 124, text: "時は金なり", reading: "ときはかねなり",
            meaning: "時間はお金と同じくらい大切なものだから、むだにしてはいけないということ。",
            example: "時は金なりというので、移動時間も有効に使うようにしている。", category: .nature),

    Proverb(id: 125, text: "月とすっぽん", reading: "つきとすっぽん",
            meaning: "形は似ていても中身や価値が全く違うものを比較するたとえ。",
            example: "彼と私の実力差は月とすっぽんほどある。", category: .nature),

    Proverb(id: 126, text: "実るほど頭を垂れる稲穂かな", reading: "みのるほどこうべをたれるいなほかな",
            meaning: "学識や実力のある人ほど、謙虚に振る舞うものだということ。",
            example: "実るほど頭を垂れる稲穂かな、あの偉大な先生は誰にでも丁寧だ。", category: .nature),

    Proverb(id: 127, text: "秋の日はつるべ落とし", reading: "あきのひはつるべおとし",
            meaning: "秋の日没は、井戸のつるべが落ちるように急に暮れること。時間の速さのたとえ。",
            example: "秋の日はつるべ落とし、気づいたらもう暗くなっていた。", category: .nature),

    Proverb(id: 128, text: "春眠暁を覚えず", reading: "しゅんみんあかつきをおぼえず",
            meaning: "春の夜は心地よく、夜明けになっても目が覚めないということ。孟浩然の詩から。",
            example: "春眠暁を覚えず、今朝も気づいたら二度寝していた。", category: .nature),

    Proverb(id: 129, text: "花鳥風月", reading: "かちょうふうげつ",
            meaning: "自然の美しい景物。また、それを鑑賞する風流なこと。",
            example: "花鳥風月を楽しむ日本の文化は、心を豊かにしてくれる。", category: .nature),

    Proverb(id: 130, text: "山紫水明", reading: "さんしすいめい",
            meaning: "山は紫にかすみ、川は清く澄み渡る、自然の美しい景色のこと。",
            example: "この地方は山紫水明の地として、多くの観光客が訪れる。", category: .nature),

    Proverb(id: 131, text: "天高く馬肥ゆる秋", reading: "てんたかくうまこゆるあき",
            meaning: "秋は空が高く澄み渡り、馬もよく肥える良い季節だということ。",
            example: "天高く馬肥ゆる秋、食欲の秋を満喫している。", category: .nature),

    Proverb(id: 132, text: "諸行無常", reading: "しょぎょうむじょう",
            meaning: "この世のすべての物事は常に変化し、同じ状態に留まることはないということ。",
            example: "諸行無常の理を知れば、変化を恐れず受け入れることができる。", category: .nature),

    Proverb(id: 133, text: "盛者必衰", reading: "じょうしゃひっすい",
            meaning: "栄えているものは必ず衰える時が来るということ。",
            example: "盛者必衰の理は歴史が証明している。かつての大企業も消えていった。", category: .nature),

    Proverb(id: 134, text: "流水腐らず", reading: "りゅうすいくさらず",
            meaning: "常に動いている流れの水は腐らないように、活動し続けることで新鮮さを保てること。",
            example: "流水腐らず、常に新しいことに挑戦し続けることが活力を生む。", category: .nature),

    Proverb(id: 135, text: "雨後のたけのこ", reading: "うごのたけのこ",
            meaning: "雨が降った後に次々とたけのこが生えるように、物事が次々と現れること。",
            example: "スマホアプリは雨後のたけのこのように次々と生まれている。", category: .nature),

    Proverb(id: 136, text: "焼け石に水", reading: "やけいしにみず",
            meaning: "効果がほとんどなく、何の役にも立たないことのたとえ。",
            example: "この予算では焼け石に水で、問題の根本的な解決にはならない。", category: .nature),

    Proverb(id: 137, text: "水は低きに流れる", reading: "みずはひくきにながれる",
            meaning: "水は自然に低い所へ流れるように、物事は自然の理にしたがって動くということ。",
            example: "水は低きに流れる、情報も自然と必要な人のところへ集まっていく。", category: .nature),

    Proverb(id: 138, text: "大山鳴動して鼠一匹", reading: "たいざんめいどうしてねずみいっぴき",
            meaning: "大騒ぎした割に、結果がごく小さいものであったということ。",
            example: "大騒ぎしていた問題も、大山鳴動して鼠一匹、結果は小さなものだった。", category: .nature),

    Proverb(id: 139, text: "三寒四温", reading: "さんかんしおん",
            meaning: "冬から春にかけて寒暖が繰り返されること。転じて、物事の好不調が交互に来ること。",
            example: "三寒四温のように、仕事もうまくいく時期と苦しい時期が交互に来る。", category: .nature),

    Proverb(id: 140, text: "草木もなびく", reading: "くさきもなびく",
            meaning: "強い力や権威の前には、草木でさえも従うということ。圧倒的な力のたとえ。",
            example: "草木もなびくような彼女のカリスマ性は、誰をも惹きつける。", category: .nature),

    Proverb(id: 141, text: "閑古鳥が鳴く", reading: "かんこどりがなく",
            meaning: "客が来ず、商売などがひどく暇なこと。",
            example: "このご時世で閑古鳥が鳴く状態の店も多く、胸が痛む。", category: .nature),

    Proverb(id: 142, text: "春来たりなば冬もまた遠からじ", reading: "はるきたりなばふゆもまたとおからじ",
            meaning: "春が来たなら、次の冬もそんなに遠くはない。物事は必ず循環するということ。",
            example: "春来たりなば冬もまた遠からじ、良い時期が続いても準備を怠らない。", category: .nature),

    Proverb(id: 143, text: "風光明媚", reading: "ふうこうめいび",
            meaning: "自然の眺めが美しく、景色のすばらしいこと。",
            example: "この海沿いの町は風光明媚で、多くの旅人が訪れる。", category: .nature),

    Proverb(id: 144, text: "川の流れのように", reading: "かわのながれのように",
            meaning: "人生は川の流れのように、とどまることなく変化し続けるもの。",
            example: "川の流れのように、変化を受け入れながら前に進んでいこう。", category: .nature),

    Proverb(id: 145, text: "木漏れ日", reading: "こもれび",
            meaning: "木の葉の間から差し込んでくる柔らかな日光。日本語独特の美的感覚を表す言葉。",
            example: "木漏れ日の中を歩くと、自然と気持ちが穏やかになる。", category: .nature),

    Proverb(id: 146, text: "潮の満ち引き", reading: "しおのみちひき",
            meaning: "海の潮が満ちたり引いたりするように、物事には好調・不調の波があるということ。",
            example: "潮の満ち引きがあるように、ビジネスにも波がある。引き潮のときに備えることが大切だ。", category: .nature),

    Proverb(id: 147, text: "七草", reading: "ななくさ",
            meaning: "春の七草（セリ・ナズナ・ゴギョウ・ハコベラ・ホトケノザ・スズナ・スズシロ）。1月7日の七草粥は無病息災を願う。",
            example: "お正月明けの七草粥は、胃腸を休めつつ健康を願う日本の習慣だ。", category: .nature),

    Proverb(id: 148, text: "春は曙", reading: "はるはあけぼの",
            meaning: "春は夜明けが最も趣深い。清少納言「枕草子」の冒頭。",
            example: "春は曙、早起きして空が明るくなっていくのを眺めた。", category: .nature),

    Proverb(id: 149, text: "桜散る", reading: "さくらちる",
            meaning: "桜の花が散ること。日本では物事の儚さや潔さを象徴する。",
            example: "桜散るように、全力を出し切ってから潔く散るのも美しい。", category: .nature),

    Proverb(id: 150, text: "一雨一情", reading: "いちうじょう",
            meaning: "雨が降るたびに情感が深まること。雨が人の心を豊かにするということ。",
            example: "一雨一情というか、雨の日はなんとなく懐かしい気持ちになる。", category: .nature),

    Proverb(id: 151, text: "初雪", reading: "はつゆき",
            meaning: "その冬に初めて降る雪のこと。新たな始まりや清らかさを象徴する。",
            example: "初雪が降った朝は、世界が白く染まり心が洗われるようだった。", category: .nature),

    Proverb(id: 152, text: "秋風が吹く", reading: "あきかぜがふく",
            meaning: "涼しい秋風が吹くこと。また、人の気持ちが冷めてきたことを表す慣用表現。",
            example: "二人の関係に秋風が吹いているように見えた。", category: .nature),

    Proverb(id: 153, text: "七夕", reading: "たなばた",
            meaning: "7月7日、織姫と彦星が天の川を渡って年に一度会う日。願い事をする風習がある。",
            example: "七夕の短冊に、家族の健康を願って書いた。", category: .nature),

    Proverb(id: 154, text: "自然は最良の師", reading: "しぜんはさいりょうのし",
            meaning: "自然の中に学ぶべき知恵や法則があるということ。",
            example: "自然は最良の師というように、植物の生命力から多くを学んだ。", category: .nature),

    Proverb(id: 155, text: "七色の空", reading: "しちいろのそら",
            meaning: "様々な色が混じり合う美しい空のこと。多彩な可能性のたとえにも使われる。",
            example: "夕暮れ時の七色の空を眺めながら、明日への活力をもらった。", category: .nature),

    // MARK: - 行動・判断 (ids 156-200)

    Proverb(id: 156, text: "急がば回れ", reading: "いそがばまわれ",
            meaning: "急いでいるときほど、危険な近道より安全な遠回りを選ぶほうが結局早いということ。",
            example: "バグ修正を急ぐあまり手を抜くと後で大変になる。急がば回れだ。", category: .action),

    Proverb(id: 157, text: "虎穴に入らずんば虎子を得ず", reading: "こけつにいらずんばこじをえず",
            meaning: "危険を冒さなければ、大きな成果を得ることはできないということ。",
            example: "起業は怖いが、虎穴に入らずんば虎子を得ずの精神で挑戦した。", category: .action),

    Proverb(id: 158, text: "当たって砕けろ", reading: "あたってくだけろ",
            meaning: "結果はどうあれ、思い切ってやってみるべきだということ。",
            example: "告白するか迷ったが、当たって砕けろと気持ちを伝えた。", category: .action),

    Proverb(id: 159, text: "後悔先に立たず", reading: "こうかいさきにたたず",
            meaning: "後から後悔しても取り返しがつかないので、何事も慎重に行動すべきだということ。",
            example: "言ってしまってから後悔した。後悔先に立たずとはこのことだ。", category: .action),

    Proverb(id: 160, text: "二兎を追う者は一兎をも得ず", reading: "にとをおうものはいっとをもえず",
            meaning: "欲を出して二つのものを同時に得ようとすると、両方とも失敗するということ。",
            example: "副業と本業の両立は難しい。二兎を追う者は一兎をも得ずにならないよう注意している。", category: .action),

    Proverb(id: 161, text: "案ずるより産むが易し", reading: "あんずるよりうむがやすし",
            meaning: "やる前にあれこれ心配するよりも、実際にやってみると意外と簡単だということ。",
            example: "怖くてなかなか踏み出せなかったが、案ずるより産むが易しで始めてみたらうまくいった。", category: .action),

    Proverb(id: 162, text: "石橋を叩いて渡る", reading: "いしばしをたたいてわたる",
            meaning: "堅固な石橋でも叩いて安全を確かめながら渡るように、用心の上にも用心すること。",
            example: "彼は石橋を叩いて渡るタイプで、契約書を何度も読み直してから署名した。", category: .action),

    Proverb(id: 163, text: "口は禍の門", reading: "くちはわざわいのかど",
            meaning: "不用意な発言が、自分にとっての災いのもととなるということ。",
            example: "口は禍の門というから、SNSへの投稿は慎重に行うようにしている。", category: .action),

    Proverb(id: 164, text: "善は急げ", reading: "ぜんはいそげ",
            meaning: "よいことだと思ったら、すぐに実行すべきだということ。",
            example: "迷っている暇はない。善は急げで申し込みを済ませた。", category: .action),

    Proverb(id: 165, text: "過ぎたるは猶及ばざるが如し", reading: "すぎたるはなおおよばざるがごとし",
            meaning: "何事もやりすぎることは、不十分であることと同様に良くないということ。",
            example: "過ぎたるは猶及ばざるが如し、褒めすぎも逆効果になることがある。", category: .action),

    Proverb(id: 166, text: "船頭多くして船山に上る", reading: "せんどうおおくしてふねやまにのぼる",
            meaning: "指揮する人が多すぎると、かえって物事がうまくいかないということ。",
            example: "船頭多くして船山に上る、会議でリーダーが決まらずに迷走した。", category: .action),

    Proverb(id: 167, text: "捕らぬ狸の皮算用", reading: "とらぬたぬきのかわざんよう",
            meaning: "まだ手に入れていないものをあてにして計算・計画すること。",
            example: "捕らぬ狸の皮算用はやめて、確実な収入をベースに計画を立てよう。", category: .action),

    Proverb(id: 168, text: "泥棒を捕らえて縄を綯う", reading: "どろぼうをとらえてなわをなう",
            meaning: "事が起こってから慌てて準備すること。事前の備えの大切さを示す。",
            example: "泥棒を捕らえて縄を綯うのでは遅い、日頃からバックアップを取っておこう。", category: .action),

    Proverb(id: 169, text: "後の祭り", reading: "あとのまつり",
            meaning: "手遅れで、もうどうしようもない状態のこと。",
            example: "申し込み期限が過ぎてしまった。後の祭りだ。", category: .action),

    Proverb(id: 170, text: "用意周到", reading: "よういしゅうとう",
            meaning: "準備が行き届いていて、抜かりがないこと。",
            example: "彼女は用意周到な性格で、プレゼン前に全てのシナリオを想定していた。", category: .action),

    Proverb(id: 171, text: "悪銭身につかず", reading: "あくせんみにつかず",
            meaning: "不正な方法で得たお金は、すぐに使ってしまって身にならないということ。",
            example: "悪銭身につかず、楽して稼いだお金はすぐに消えてしまった。", category: .action),

    Proverb(id: 172, text: "本末転倒", reading: "ほんまつてんとう",
            meaning: "大切なことと、そうでないことの順序が逆になってしまうこと。",
            example: "節約のために交通費を削ったら仕事の効率が落ちた。本末転倒だった。", category: .action),

    Proverb(id: 173, text: "一刀両断", reading: "いっとうりょうだん",
            meaning: "物事をためらわずに、思い切りよく決断・処理すること。",
            example: "長引く議論を一刀両断、リーダーが決断を下した。", category: .action),

    Proverb(id: 174, text: "朝令暮改", reading: "ちょうれいぼかい",
            meaning: "朝出した命令を夕方には改めるほど、方針や指示がころころ変わること。",
            example: "朝令暮改では部下が困る。一度決めたことは貫くべきだ。", category: .action),

    Proverb(id: 175, text: "漁夫の利", reading: "ぎょふのり",
            meaning: "二者が争っている間に、第三者が苦労もせずに利益を得ること。",
            example: "二社が値下げ競争をしている間に、漁夫の利を得た別会社がシェアを伸ばした。", category: .action),

    Proverb(id: 176, text: "短気は損気", reading: "たんきはそんき",
            meaning: "短気を起こすと物事をうまく進められず、かえって損をするということ。",
            example: "短気は損気、冷静に話し合えばよかったと後悔した。", category: .action),

    Proverb(id: 177, text: "禍を転じて福となす", reading: "わざわいをてんじてふくとなす",
            meaning: "不運な出来事を逆手にとって、よい結果を生み出すこと。",
            example: "失業を機に独立し、禍を転じて福となすことができた。", category: .action),

    Proverb(id: 178, text: "一か八か", reading: "いちかばちか",
            meaning: "結果がどうなるかわからないが、思い切って行動すること。",
            example: "一か八かで提案してみたら、意外にも採用された。", category: .action),

    Proverb(id: 179, text: "三十六計逃げるに如かず", reading: "さんじゅうろっけいにげるにしかず",
            meaning: "不利な状況ではあれこれ策を練るよりも、いさぎよく退いた方が得策だということ。",
            example: "これ以上続けても無意味だ。三十六計逃げるに如かずで撤退することにした。", category: .action),

    Proverb(id: 180, text: "蛙の子は蛙", reading: "かえるのこはかえる",
            meaning: "子どもの能力や素質は親に似るもので、非凡な親から非凡な子は生まれにくいということ。",
            example: "蛙の子は蛙というが、その子はやはり親と同じ職業を選んだ。", category: .action),

    Proverb(id: 181, text: "猿も木から落ちる", reading: "さるもきからおちる",
            meaning: "どんな名人でも、失敗することがあるということ。",
            example: "猿も木から落ちる、普段は完璧な彼女でも今日はミスをした。", category: .action),

    Proverb(id: 182, text: "弘法も筆の誤り", reading: "こうぼうもふでのあやまり",
            meaning: "どんなに優れた人でも失敗することがあるということ。",
            example: "弘法も筆の誤り、天才といわれる彼もたまには計算を間違える。", category: .action),

    Proverb(id: 183, text: "河童の川流れ", reading: "かっぱのかわながれ",
            meaning: "その道の名人でも失敗することがあるということ。",
            example: "河童の川流れ、水泳のプロも溺れることがある。油断は禁物だ。", category: .action),

    Proverb(id: 184, text: "虎は死して皮を留め、人は死して名を残す",
            reading: "とらはししてかわをとどめ、ひとはししてなをのこす",
            meaning: "動物は死後に皮を残すが、人間は死後に名声を残すことが大切だということ。",
            example: "虎は死して皮を留め人は死して名を残す、後世に語り継がれる仕事をしたい。", category: .action),

    Proverb(id: 185, text: "先手必勝", reading: "せんてひっしょう",
            meaning: "先に行動した方が有利で、勝利を得やすいということ。",
            example: "先手必勝で、競合より先に新市場に参入した。", category: .action),

    Proverb(id: 186, text: "備えあれば憂いなし", reading: "そなえあればうれいなし",
            meaning: "日頃からきちんと準備・対策をしておけば、いざというときに困らないということ。",
            example: "備えあれば憂いなし、緊急時のためにいつも非常食を用意している。", category: .action),

    Proverb(id: 187, text: "柳の下にいつもどじょうはいない", reading: "やなぎのしたにいつもどじょうはいない",
            meaning: "一度うまくいったからといって、同じ方法がいつも通じるわけではないということ。",
            example: "柳の下にいつもどじょうはいない、前回の成功を当てにしすぎた。", category: .action),

    Proverb(id: 188, text: "急いては事を仕損じる", reading: "せいてはことをしそんじる",
            meaning: "焦って急ぎすぎると、かえって失敗してしまうということ。",
            example: "急いては事を仕損じる、落ち着いて一つ一つ確認しながら進もう。", category: .action),

    Proverb(id: 189, text: "早起きは三文の徳", reading: "はやおきはさんもんのとく",
            meaning: "早起きをすれば、何かしらよいことがあるということ。",
            example: "早起きは三文の徳というから、毎朝6時に起きて朝活をしている。", category: .action),

    Proverb(id: 190, text: "清濁合わせ飲む", reading: "せいだくあわせのむ",
            meaning: "良いことも悪いことも、分け隔てなく受け入れること。度量の大きさを示す。",
            example: "優れたリーダーは清濁合わせ飲む器量を持っている。", category: .action),

    Proverb(id: 191, text: "百発百中", reading: "ひゃっぱつひゃくちゅう",
            meaning: "矢・弾が必ず的に当たること。転じて、計画や予測が全て当たること。",
            example: "彼の売上予測は百発百中で、チームから絶大な信頼を得ている。", category: .action),

    Proverb(id: 192, text: "一石二鳥", reading: "いっせきにちょう",
            meaning: "一つの行動で二つの利益を得ること。",
            example: "通勤中に語学を勉強するのは一石二鳥だ。", category: .action),

    Proverb(id: 193, text: "五十歩百歩", reading: "ごじっぽひゃっぽ",
            meaning: "どちらも大差はなく、本質的には同じだということ。",
            example: "少し改善したといっても五十歩百歩、根本的な解決にはなっていない。", category: .action),

    Proverb(id: 194, text: "腹を割って話す", reading: "はらをわってはなす",
            meaning: "本音や本心を隠さずに、率直に話し合うこと。",
            example: "腹を割って話した結果、長年の誤解が解けた。", category: .action),

    Proverb(id: 195, text: "馬耳東風", reading: "ばじとうふう",
            meaning: "人の意見や批評を全く気にしないで、聞き流してしまうこと。",
            example: "何を注意してもあの人は馬耳東風で、全く聞く耳を持たない。", category: .action),

    Proverb(id: 196, text: "柳に雪折れなし", reading: "やなぎにゆきおれなし",
            meaning: "柳の枝は積もった雪の重さでしなっても折れない。柔軟に対応することの強さを表す。",
            example: "柳に雪折れなし、頑固に抵抗せず柔軟に対応することで乗り越えた。", category: .action),

    Proverb(id: 197, text: "点滴穿石", reading: "てんてきせんせき",
            meaning: "小さな努力の積み重ねが、やがて大きな成果につながるということ。雨垂れ石を穿つと同義。",
            example: "点滴穿石、地道な取り組みが実って大きなプロジェクトを受注できた。", category: .action),

    Proverb(id: 198, text: "二の舞を踏む", reading: "にのまいをふむ",
            meaning: "他人と同じ失敗を繰り返すこと。",
            example: "先輩の失敗の二の舞を踏まないよう、しっかり準備した。", category: .action),

    Proverb(id: 199, text: "渡りに船", reading: "わたりにふね",
            meaning: "ちょうど必要としているときに、好都合なことが起こること。",
            example: "困っていたところに助けの申し出があった。まさに渡りに船だ。", category: .action),

    Proverb(id: 200, text: "棒ほど願って針ほど叶う", reading: "ぼうほどねがってはりほどかなう",
            meaning: "大きな望みを持って努力しても、叶うのはわずかなものだということ。高望みの戒め。",
            example: "棒ほど願って針ほど叶う、現実的な目標設定が大切だと学んだ。", category: .action),

    // MARK: - 運・運命 (ids 201-235)

    Proverb(id: 201, text: "果報は寝て待て", reading: "かほうはねてまて",
            meaning: "幸運はあせって求めるものではなく、時機を待って落ち着いていれば自然とやってくるということ。",
            example: "選考結果が出るまで何もできない。果報は寝て待てだ。", category: .luck),

    Proverb(id: 202, text: "棚から牡丹餅", reading: "たなからぼたもち",
            meaning: "思いがけない幸運が転がり込んでくること。",
            example: "応募もしていない仕事のオファーが来た。まさに棚から牡丹餅だ。", category: .luck),

    Proverb(id: 203, text: "禍福はあざなえる縄のごとし", reading: "かふくはあざなえるなわのごとし",
            meaning: "幸福と不幸は表裏一体で、交互にやってくるということ。",
            example: "事故にあったが命が助かり、禍福はあざなえる縄のごとしと感じた。", category: .luck),

    Proverb(id: 204, text: "人間万事塞翁が馬", reading: "にんげんばんじさいおうがうま",
            meaning: "人生の幸・不幸は予測できず、何がよくて何が悪いかは簡単に判断できないということ。",
            example: "失業したときは絶望したが、人間万事塞翁が馬、その後より良い職場に出会えた。", category: .luck),

    Proverb(id: 205, text: "運も実力のうち", reading: "うんもじつりょくのうち",
            meaning: "運を引き寄せることも実力のうちだということ。",
            example: "「運が良かっただけ」と謙遜するが、運も実力のうちだと思う。", category: .luck),

    Proverb(id: 206, text: "捨てる神あれば拾う神あり", reading: "すてるかみあればひろうかみあり",
            meaning: "見捨てる人がいる一方で、助けてくれる人も必ずいるということ。",
            example: "出版を断られ続けたが、捨てる神あれば拾う神あり、ある出版社が採用してくれた。", category: .luck),

    Proverb(id: 207, text: "雨降って地固まる", reading: "あめふってじかたまる",
            meaning: "もめごとや困難な出来事があった後は、かえって物事がしっかりと安定するということ。",
            example: "チームで大きなトラブルがあったが、雨降って地固まる、その後より結束が強まった。", category: .luck),

    Proverb(id: 208, text: "因果応報", reading: "いんがおうほう",
            meaning: "過去の善悪の行いに応じた報いが、必ず返ってくるということ。",
            example: "因果応報というように、人に親切にしてきたおかげで、困ったときに助けてもらえた。", category: .luck),

    Proverb(id: 209, text: "千載一遇", reading: "せんざいいちぐう",
            meaning: "千年に一度あるかないかの、またとない機会のこと。",
            example: "この案件は千載一遇のチャンス、絶対に逃したくない。", category: .luck),

    Proverb(id: 210, text: "吉凶は糾える縄のごとし", reading: "きっきょうはあざなえるなわのごとし",
            meaning: "幸運と不運はより合わせた縄のように、交互に繰り返されるということ。",
            example: "吉凶は糾える縄のごとし、今の不運も必ずよい方向へ転じる。", category: .luck),

    Proverb(id: 211, text: "幸運の女神には前髪しかない", reading: "こううんのめがみにはまえがみしかない",
            meaning: "チャンスはすれ違いざまにしかつかめない。通り過ぎてからでは遅いということ。",
            example: "幸運の女神には前髪しかない、このチャンスを逃すな。", category: .luck),

    Proverb(id: 212, text: "九死一生", reading: "きゅうしいっしょう",
            meaning: "ほとんど助からないような危険な状況から、かろうじて生き延びること。",
            example: "登山中に遭難し、九死一生の思いで生還した。", category: .luck),

    Proverb(id: 213, text: "天の時、地の利、人の和", reading: "てんのとき、ちのり、ひとのわ",
            meaning: "物事を成功させるには、時の運・地理的な有利さ・人々の協力が必要だということ。",
            example: "天の時地の利人の和が揃って、プロジェクトは大成功を収めた。", category: .luck),

    Proverb(id: 214, text: "ものは試し", reading: "ものはためし",
            meaning: "何事もとにかく一度やってみることが大切だということ。",
            example: "ものは試しで応募してみたら、思いがけず採用された。", category: .luck),

    Proverb(id: 215, text: "蒔かぬ種は生えぬ", reading: "まかぬたねははえぬ",
            meaning: "何も努力・行動しなければ、何も生まれないということ。",
            example: "蒔かぬ種は生えぬ、まず行動しなければ何も始まらない。", category: .luck),

    Proverb(id: 216, text: "神のみぞ知る", reading: "かみのみぞしる",
            meaning: "結果は誰にもわからず、神だけが知っているということ。",
            example: "どちらが正しいかは、神のみぞ知るだ。", category: .luck),

    Proverb(id: 217, text: "七福神", reading: "しちふくじん",
            meaning: "恵比寿・大黒天・毘沙門天・弁財天・福禄寿・寿老人・布袋の七柱の福の神。",
            example: "七福神詣りをして、一年の幸運を祈った。", category: .luck),

    Proverb(id: 218, text: "因縁", reading: "いんねん",
            meaning: "仏教の言葉で、ある結果を生む原因（因）とそれを助ける条件（縁）のこと。転じて宿命的な結びつき。",
            example: "二人の出会いにはどこか因縁を感じる。", category: .luck),

    Proverb(id: 219, text: "宿命", reading: "しゅくめい",
            meaning: "生まれながらに定められた運命のこと。",
            example: "宿命を嘆くより、与えられた状況で最善を尽くすことが大切だ。", category: .luck),

    Proverb(id: 220, text: "偶然は必然", reading: "ぐうぜんはひつぜん",
            meaning: "偶然に見える出来事も、深く考えれば必然的な理由があるということ。",
            example: "偶然は必然というように、その出会いも振り返れば必然だったと思う。", category: .luck),

    Proverb(id: 221, text: "流れに任せる", reading: "ながれにまかせる",
            meaning: "物事の成り行きに逆らわず、自然の流れに従って生きること。",
            example: "流れに任せて生きていたら、自然と良い縁がつながってきた。", category: .luck),

    Proverb(id: 222, text: "運命の赤い糸", reading: "うんめいのあかいいと",
            meaning: "運命で結ばれた二人を繋ぐとされる、目には見えない糸。",
            example: "運命の赤い糸で結ばれたような出会いを信じている。", category: .luck),

    Proverb(id: 223, text: "天命", reading: "てんめい",
            meaning: "天が人間に与えた使命・運命のこと。",
            example: "自分の天命を知り、その使命を全うしようと決意した。", category: .luck),

    Proverb(id: 224, text: "末は博士か大臣か", reading: "すえははかせかだいじんか",
            meaning: "将来は大きく出世するだろうという期待を込めた言葉。",
            example: "末は博士か大臣かという言葉をかけられた子どもが、本当に大成した。", category: .luck),

    Proverb(id: 225, text: "転んでもただでは起きない", reading: "ころんでもただではおきない",
            meaning: "失敗してもそこから何かを得て、ただでは帰らないこと。",
            example: "転んでもただでは起きない、失敗から貴重な教訓を得た。", category: .luck),

    Proverb(id: 226, text: "縁起を担ぐ", reading: "えんぎをかつぐ",
            meaning: "縁起の良し悪しをとても気にして、吉兆・凶兆を大事にすること。",
            example: "試合前は縁起を担いで、必ずカツ丼を食べる。", category: .luck),

    Proverb(id: 227, text: "瓢箪から駒", reading: "ひょうたんからこま",
            meaning: "ありえないような所から思いがけないものが出ること。意外な結果のたとえ。",
            example: "冗談で言ったことが実現してしまった。まさに瓢箪から駒だ。", category: .luck),

    Proverb(id: 228, text: "逆境が人を育てる", reading: "ぎゃっきょうがひとをそだてる",
            meaning: "苦しい状況や逆境の中でこそ、人は本当の力を身につけられるということ。",
            example: "逆境が人を育てる、あの苦しかった時期があったから今の自分がある。", category: .luck),

    Proverb(id: 229, text: "浮き沈み", reading: "うきしずみ",
            meaning: "人生や物事において、好調な時期と不調な時期が繰り返されること。",
            example: "人生には浮き沈みがあるもの、今の低迷期も必ず終わる。", category: .luck),

    Proverb(id: 230, text: "好機到来", reading: "こうきとうらい",
            meaning: "良い機会がやってきたこと。",
            example: "好機到来、このチャンスを逃さず全力で取り組もう。", category: .luck),

    Proverb(id: 231, text: "七変化", reading: "しちへんげ",
            meaning: "様々な姿に変わること。状況に応じて柔軟に対応できること。",
            example: "七変化のように、どんな状況でも適応できる人が生き残る。", category: .luck),

    Proverb(id: 232, text: "星の巡り合わせ", reading: "ほしのめぐりあわせ",
            meaning: "星の配置によって決まるような、人知の及ばない運命的な巡り合わせ。",
            example: "二人の出会いは星の巡り合わせとしか言いようがない。", category: .luck),

    Proverb(id: 233, text: "宝の山に入って手ぶらで帰る", reading: "たからのやまにはいってうでぶらでかえる",
            meaning: "せっかくのチャンスや機会を生かせずに、何も得られずに終わること。",
            example: "宝の山に入って手ぶらで帰るようなことにならないよう、準備を整えた。", category: .luck),

    Proverb(id: 234, text: "九転十起", reading: "きゅうてんじっき",
            meaning: "何度倒れても、それ以上の回数立ち上がること。不屈の精神を表す。",
            example: "九転十起の精神で、何度失敗しても再挑戦し続けた。", category: .luck),

    Proverb(id: 235, text: "招福", reading: "しょうふく",
            meaning: "幸福を呼び込むこと。福を招く行いや心がけ。",
            example: "招福の心を持ち、いつも感謝の気持ちで過ごすようにしている。", category: .luck),

    // MARK: - 感情・心 (ids 236-270)

    Proverb(id: 236, text: "喜怒哀楽", reading: "きどあいらく",
            meaning: "喜び・怒り・悲しみ・楽しみの四つ。人間のあらゆる感情を表す言葉。",
            example: "あの映画は喜怒哀楽すべての感情を味わわせてくれる傑作だ。", category: .emotion),

    Proverb(id: 237, text: "七転八倒", reading: "しちてんばっとう",
            meaning: "ひどい苦しみや痛みで転げまわること。",
            example: "腹痛がひどく、七転八倒の苦しみだった。", category: .emotion),

    Proverb(id: 238, text: "笑う門には福来たる", reading: "わらうかどにはふくきたる",
            meaning: "いつも明るく笑いの絶えない家庭には、自然と幸福がやってくるということ。",
            example: "どんな時も笑う門には福来たるの精神で、明るく過ごすようにしている。", category: .emotion),

    Proverb(id: 239, text: "腹が立てば親の顔思え", reading: "はらがたてばおやのかおおもえ",
            meaning: "怒りを感じたときは、育ててくれた親の顔を思い浮かべて冷静になれということ。",
            example: "カッとなりそうになったとき、腹が立てば親の顔思えと自分に言い聞かせた。", category: .emotion),

    Proverb(id: 240, text: "怒りは敵と思え", reading: "いかりはてきとおもえ",
            meaning: "激しい怒りの感情は自分の判断を誤らせ、身を滅ぼすもととなるので、敵として戒めよということ。",
            example: "怒りは敵と思え、感情的になる前に一度深呼吸するようにした。", category: .emotion),

    Proverb(id: 241, text: "一喜一憂", reading: "いっきいちゆう",
            meaning: "状況が変わるたびに、喜んだり心配したりすること。",
            example: "試合の流れに一喜一憂しながら応援した。", category: .emotion),

    Proverb(id: 242, text: "笑顔は七難隠す", reading: "えがおはしちなんかくす",
            meaning: "笑顔はどんな欠点も隠してしまうほど人の印象を良くするということ。",
            example: "どんなに疲れていても笑顔でいよう。笑顔は七難隠すというから。", category: .emotion),

    Proverb(id: 243, text: "心頭滅却すれば火もまた涼し", reading: "しんとうめっきゃくすればひもまたすずし",
            meaning: "無念無想の境地に達すれば、火の熱さも感じない。心の持ちようで何事も乗り越えられるということ。",
            example: "心頭滅却すれば火もまた涼し、気持ちの持ちようで暑さも感じなくなった。", category: .emotion),

    Proverb(id: 244, text: "無我夢中", reading: "むがむちゅう",
            meaning: "我を忘れて、一つのことに夢中になること。",
            example: "無我夢中で作業に集中していたら、気づいたら夜になっていた。", category: .emotion),

    Proverb(id: 245, text: "もののあわれ", reading: "もののあわれ",
            meaning: "物事や自然に触れたときに生じる、しみじみとした感動や哀愁の感情。日本独特の美意識。",
            example: "散る桜を見てもののあわれを感じ、日本の美の心を再認識した。", category: .emotion),

    Proverb(id: 246, text: "侘び寂び", reading: "わびさび",
            meaning: "不完全・不十分さの中に美しさを見出す、日本独特の美意識。",
            example: "侘び寂びの精神が宿る古い茶室には、独特の静けさと美しさがあった。", category: .emotion),

    Proverb(id: 247, text: "心機一転", reading: "しんきいってん",
            meaning: "気持ちをがらりと切り替えて、新たな気持ちで取り組むこと。",
            example: "心機一転、新しい環境で一からやり直そうと決意した。", category: .emotion),

    Proverb(id: 248, text: "胸が高鳴る", reading: "むねがたかなる",
            meaning: "期待や興奮で心臓が速く打つこと。",
            example: "憧れの人に会える日が近づき、胸が高鳴っている。", category: .emotion),

    Proverb(id: 249, text: "目頭が熱くなる", reading: "めがしらがあつくなる",
            meaning: "感動や悲しみで涙が出そうになること。",
            example: "感動的なスピーチに目頭が熱くなった。", category: .emotion),

    Proverb(id: 250, text: "腸が煮えくり返る", reading: "はらわたがにえくりかえる",
            meaning: "激しい怒りを感じること。",
            example: "理不尽な扱いに腸が煮えくり返る思いだったが、冷静さを保った。", category: .emotion),

    Proverb(id: 251, text: "天にも昇る気持ち", reading: "てんにものぼるきもち",
            meaning: "この上なく嬉しくて、天まで飛び上がりそうなほど有頂天になること。",
            example: "合格通知を受け取ったとき、天にも昇る気持ちだった。", category: .emotion),

    Proverb(id: 252, text: "喜色満面", reading: "きしょくまんめん",
            meaning: "顔全体に喜びが溢れている様子。",
            example: "孫が生まれたと知らせを受けたおじいさんは、喜色満面だった。", category: .emotion),

    Proverb(id: 253, text: "悲喜交交", reading: "ひきこもごも",
            meaning: "悲しみと喜びが入り混じること。",
            example: "卒業式は悲喜交交、別れの悲しさと新出発の喜びが入り混じった。", category: .emotion),

    Proverb(id: 254, text: "恋は盲目", reading: "こいはもうもく",
            meaning: "恋をすると理性が働かなくなり、相手の欠点が見えなくなること。",
            example: "恋は盲目というが、冷静に考えれば問題点に気づけたはずだ。", category: .emotion),

    Proverb(id: 255, text: "感謝の心", reading: "かんしゃのこころ",
            meaning: "周囲の人や物事に対して、ありがたいと思う気持ちを常に持つこと。",
            example: "感謝の心を忘れずに、日々の小さな幸せに気づけるよう心がけている。", category: .emotion),

    Proverb(id: 256, text: "平常心", reading: "へいじょうしん",
            meaning: "どんな状況でも、慌てたり動揺したりしない落ち着いた平静な心。",
            example: "大舞台でも平常心を保てるよう、普段から練習で緊張感を高めている。", category: .emotion),

    Proverb(id: 257, text: "不動心", reading: "ふどうしん",
            meaning: "何が起きても動じない、強くしっかりとした心。",
            example: "批判されても不動心を持って自分の信念を貫いた。", category: .emotion),

    Proverb(id: 258, text: "幽玄", reading: "ゆうげん",
            meaning: "奥深く、しみじみとした趣。日本の芸術・文化における重要な美意識。",
            example: "能舞台に漂う幽玄の美は、他の芸術にはない深みがある。", category: .emotion),

    Proverb(id: 259, text: "切ない", reading: "せつない",
            meaning: "胸が締め付けられるような、やるせない悲しい感情。",
            example: "別れの場面を思い出すだけで、切ない気持ちが込み上げてきた。", category: .emotion),

    Proverb(id: 260, text: "克己復礼", reading: "こっきふくれい",
            meaning: "自分の欲望に打ち克ち、礼の道に立ち返ること。自己抑制の大切さ。",
            example: "克己復礼を心がけ、感情に流されず理性的に行動した。", category: .emotion),

    Proverb(id: 261, text: "百感交集", reading: "ひゃっかんこうしゅう",
            meaning: "さまざまな感情が一度に湧き起こること。",
            example: "卒業式を迎え、百感交集して言葉が出なかった。", category: .emotion),

    Proverb(id: 262, text: "雪辱", reading: "せつじょく",
            meaning: "以前の恥や敗北を晴らすこと。リベンジ。",
            example: "去年の敗戦の雪辱を果たすべく、今年は万全の準備で挑んだ。", category: .emotion),

    Proverb(id: 263, text: "羨望", reading: "せんぼう",
            meaning: "他人の境遇・能力などをうらやましく思うこと。",
            example: "彼の自由な生き方への羨望から、自分も変わろうと決意した。", category: .emotion),

    Proverb(id: 264, text: "感動", reading: "かんどう",
            meaning: "心を深く動かされること。",
            example: "その演奏には深い感動があり、終わった後もしばらく呆然としていた。", category: .emotion),

    Proverb(id: 265, text: "笑顔の力", reading: "えがおのちから",
            meaning: "笑顔には周囲の人を明るくし、自分自身の心も前向きにする力があること。",
            example: "笑顔の力は大きい、辛いときでも笑っていると気持ちが楽になる。", category: .emotion),

    Proverb(id: 266, text: "七色の感情", reading: "しちいろのかんじょう",
            meaning: "人間が持つ多様な感情のこと。喜怒哀楽をはじめとする豊かな内面世界。",
            example: "七色の感情を経験することで、人は豊かな心を育んでいく。", category: .emotion),

    Proverb(id: 267, text: "涙は心の雨", reading: "なみだはこころのあめ",
            meaning: "涙は感情があふれたときに流れるもので、心が豊かな証拠だということ。",
            example: "涙は心の雨、感動して泣けることは人間として大切な感受性だ。", category: .emotion),

    Proverb(id: 268, text: "希望は永遠に", reading: "きぼうはえいえんに",
            meaning: "どんな絶望的な状況でも、希望を失ってはいけないということ。",
            example: "希望は永遠に、暗いトンネルの先には必ず光がある。", category: .emotion),

    Proverb(id: 269, text: "幸せは心の中に", reading: "しあわせはこころのなかに",
            meaning: "本当の幸福は外から与えられるものではなく、自分の心の持ちようにあるということ。",
            example: "幸せは心の中に、物や地位ではなく、今あるものへの感謝が幸福につながる。", category: .emotion),

    Proverb(id: 270, text: "悲しみは分かち合えば半分に、喜びは分かち合えば二倍になる",
            reading: "かなしみはわかちあえばはんぶんに、よろこびはわかちあえばにばいになる",
            meaning: "悲しいことは誰かと共有すると楽になり、嬉しいことは誰かと共有するとさらに喜びが大きくなる。",
            example: "友達に打ち明けたら気持ちが楽になった。悲しみは分かち合えば半分になるとはこのことだ.",
            category: .emotion),

    // MARK: - 努力・根気 追加分 (ids 271-295)

    Proverb(id: 271, text: "商いは牛の涎", reading: "あきないはうしのよだれ",
            meaning: "商売は牛のよだれのように、細く長く着実に続けることが大切だということ。",
            example: "商いは牛の涎というように、派手に稼ごうとせず地道に顧客を増やしていった。", category: .effort),

    Proverb(id: 272, text: "足を棒にする", reading: "あしをぼうにする",
            meaning: "長時間歩き回って足が疲れ果てること。懸命に動き回ること。",
            example: "就職活動で足を棒にして企業を回り、ようやく内定を得た。", category: .effort),

    Proverb(id: 273, text: "骨を折る", reading: "ほねをおる",
            meaning: "苦労して力を尽くすこと。手間のかかる作業に精を出すこと。",
            example: "彼は後輩のために骨を折って、就職先を探してくれた。", category: .effort),

    Proverb(id: 274, text: "朝起き三文の徳", reading: "あさおきさんもんのとく",
            meaning: "早く起きて行動すれば、それだけ得るものが多いということ。",
            example: "朝起き三文の徳で、早朝に勉強すると頭が冴えて捗る。", category: .effort),

    Proverb(id: 275, text: "努力に勝る天才なし", reading: "どりょくにまさるてんさいなし",
            meaning: "天才的な素質があっても、努力する者には敵わないということ。",
            example: "努力に勝る天才なし、才能があっても練習を怠っては上達しない。", category: .effort),

    Proverb(id: 276, text: "人事を尽くして天命を待つ", reading: "じんじをつくしててんめいをまつ",
            meaning: "できる限りの努力をしたら、あとは結果を天に任せて静かに待つということ。",
            example: "試験勉強を精一杯やった。人事を尽くして天命を待つ気持ちで結果を待った。", category: .effort),

    Proverb(id: 277, text: "念には念を入れよ", reading: "ねんにはねんをいれよ",
            meaning: "用心の上にもさらに用心を重ねよということ。",
            example: "念には念を入れよ、提出前にもう一度確認してから送った。", category: .effort),

    Proverb(id: 278, text: "身を粉にして働く", reading: "みをこにしてはたらく",
            meaning: "身体をすり減らすほど一生懸命働くこと。",
            example: "家族のために身を粉にして働いた父の姿が忘れられない。", category: .effort),

    Proverb(id: 279, text: "歯を食いしばる", reading: "はをくいしばる",
            meaning: "苦しさや痛みをこらえて、懸命に耐え抜くこと。",
            example: "最後の一周は歯を食いしばって走り切った。", category: .effort),

    Proverb(id: 280, text: "腕を磨く", reading: "うでをみがく",
            meaning: "技術や実力を向上させるために鍛錬を積むこと。",
            example: "独立に向けて腕を磨く毎日を送っている。", category: .effort),

    Proverb(id: 281, text: "蛍の光窓の雪", reading: "ほたるのひかりまどのゆき",
            meaning: "蛍の光や雪明かりで勉強するほど、苦労して学んだということ。刻苦勉学のたとえ。",
            example: "蛍の光窓の雪の心意気で、どんな環境でも勉強を続けた。", category: .effort),

    Proverb(id: 282, text: "男子三日会わざれば刮目して見よ", reading: "だんしみっかあわざればかつもくしてみよ",
            meaning: "男子たるものは、三日も会わなければそれだけ成長しているから、改めて見直せということ。",
            example: "男子三日会わざれば刮目して見よ、久しぶりに会った彼は別人のように成長していた。", category: .effort),

    Proverb(id: 283, text: "下手の横好き", reading: "へたのよこずき",
            meaning: "下手なくせに、その物事を非常に好んでいること。",
            example: "下手の横好きで絵を描き続けているうちに、少しずつ上達してきた。", category: .effort),

    Proverb(id: 284, text: "木を曲げるは若木のうち", reading: "きをまげるはわかきのうち",
            meaning: "木を思うように形作るには若いうちしかないように、人も若いうちに教育・鍛錬すべきだということ。",
            example: "木を曲げるは若木のうち、子どもには早い時期から礼儀を教えた。", category: .effort),

    Proverb(id: 285, text: "寸暇を惜しむ", reading: "すんかをおしむ",
            meaning: "わずかな空き時間も無駄にせず、有効に活用すること。",
            example: "寸暇を惜しんで勉強した結果、資格試験に合格できた。", category: .effort),

    Proverb(id: 286, text: "汗は嘘をつかない", reading: "あせはうそをつかない",
            meaning: "誠実に努力した分だけ、必ず結果に表れるということ。",
            example: "汗は嘘をつかない、毎日の練習がいつか実を結ぶと信じている。", category: .effort),

    Proverb(id: 287, text: "志あるところに道あり", reading: "こころざしあるところにみちあり",
            meaning: "強い意志と目標があれば、必ずそこへ向かう道は開けるということ。",
            example: "志あるところに道あり、諦めずに挑戦し続けた結果、ついに道が開けた。", category: .effort),

    Proverb(id: 288, text: "七回倒れても八回起き上がれ", reading: "ななかいたおれてもはちかいおきあがれ",
            meaning: "何度失敗しても諦めずに立ち上がれという励ましの言葉。",
            example: "七回倒れても八回起き上がれという言葉を胸に、再挑戦した。", category: .effort),

    Proverb(id: 289, text: "水滴石を穿つ", reading: "すいてきいしをうがつ",
            meaning: "小さな水滴でも落ち続ければ石に穴をあけるように、たゆまぬ努力は大きな成果を生む。",
            example: "水滴石を穿つ、毎日の積み重ねが大きな変化を生み出した。", category: .effort),

    Proverb(id: 290, text: "一日千秋", reading: "いちじつせんしゅう",
            meaning: "待ち遠しくて、一日が千年のように長く感じられること。",
            example: "旅行を楽しみにしすぎて、出発まで一日千秋の思いで過ごした。", category: .effort),

    Proverb(id: 291, text: "臥薪嘗胆", reading: "がしんしょうたん",
            meaning: "目的を達成するために、長い間苦労・苦難に耐えること。薪の上に寝て苦い胆を嘗めた故事から。",
            example: "試験合格のために臥薪嘗胆の日々を送り、ついに夢を実現した。", category: .effort),

    Proverb(id: 292, text: "粉骨砕身", reading: "ふんこつさいしん",
            meaning: "骨身を惜しまず、力の限り努力すること。",
            example: "プロジェクトを成功させるために粉骨砕身の思いで取り組んだ。", category: .effort),

    Proverb(id: 293, text: "不撓不屈", reading: "ふとうふくつ",
            meaning: "どんな困難にも屈せず、くじけないこと。",
            example: "不撓不屈の精神で何度も挑戦し続け、ついに頂点に立った。", category: .effort),

    Proverb(id: 294, text: "一意専心", reading: "いちいせんしん",
            meaning: "一つのことに心を集中して、他のことは一切考えないこと。",
            example: "一意専心で研究に打ち込んだ結果、大きな発見につながった。", category: .effort),

    Proverb(id: 295, text: "勇往邁進", reading: "ゆうおうまいしん",
            meaning: "目標に向かって勇ましく突き進むこと。",
            example: "困難を乗り越えながら勇往邁進、ついに目標を達成した。", category: .effort),

    // MARK: - 知恵・学び 追加分 (ids 296-320)

    Proverb(id: 296, text: "一葉落ちて天下の秋を知る", reading: "いちようおちててんかのあきをしる",
            meaning: "わずかな兆候から大きな変化や出来事を予知すること。",
            example: "一葉落ちて天下の秋を知る、小さなデータの変化が市場の転換を示していた。", category: .wisdom),

    Proverb(id: 297, text: "嘘から出た誠", reading: "うそからでたまこと",
            meaning: "冗談や嘘のつもりで言ったことが、本当になってしまうこと。",
            example: "冗談で「社長になる」と言っていたら、嘘から出た誠で本当に会社を立ち上げた。", category: .wisdom),

    Proverb(id: 298, text: "紺屋の白袴", reading: "こうやのしろはかま",
            meaning: "他人のことにばかり忙しくて、自分のことが後回しになっていること。",
            example: "美容師なのに自分の髪はボサボサ。紺屋の白袴とはよく言ったものだ。", category: .wisdom),

    Proverb(id: 299, text: "医者の不養生", reading: "いしゃのふようじょう",
            meaning: "他人には正しいことを教えながら、自分ではそれを実行していないこと。",
            example: "健康の大切さを説く医者が不摂生をしている。医者の不養生だ。", category: .wisdom),

    Proverb(id: 300, text: "七度尋ねて人を疑え", reading: "ななたびたずねてひとをうたがえ",
            meaning: "物を失ったときはまず自分でよく探してから、人を疑うべきだということ。",
            example: "七度尋ねて人を疑えというから、人を疑う前に自分でもう一度探してみた。", category: .wisdom),

    Proverb(id: 301, text: "百里を行く者は九十里を半ばとす", reading: "ひゃくりをゆくものはくじゅうりをなかばとす",
            meaning: "最後の一踏ん張りが最も大切で、九割できても油断してはならないということ。",
            example: "百里を行く者は九十里を半ばとす、ゴール直前こそ気を引き締めた。", category: .wisdom),

    Proverb(id: 302, text: "下手の考え休むに似たり", reading: "へたのかんがえやすむににたり",
            meaning: "実力のない者が長時間考えても成果は出ず、休んでいるのと同じだということ。",
            example: "下手の考え休むに似たり、まず動いてみることで答えが見えてきた。", category: .wisdom),

    Proverb(id: 303, text: "月夜に提灯", reading: "つきよにちょうちん",
            meaning: "月の明るい夜に提灯をともすように、全く必要のない無駄なことをすること。",
            example: "月夜に提灯、すでに解決済みの問題にまた説明を求められた。", category: .wisdom),

    Proverb(id: 304, text: "過ちを改めるに憚ることなかれ", reading: "あやまちをあらためるにはばかることなかれ",
            meaning: "間違いに気づいたら、恥ずかしがらず躊躇せずに改めるべきだということ。",
            example: "過ちを改めるに憚ることなかれ、素直に謝って方向転換した。", category: .wisdom),

    Proverb(id: 305, text: "人の噂も七十五日", reading: "ひとのうわさもしちじゅうごにち",
            meaning: "どんな噂話も時間が経てば忘れられるということ。",
            example: "人の噂も七十五日、今は辛くても噂はいずれ消える。", category: .wisdom),

    Proverb(id: 306, text: "良薬は口に苦し", reading: "りょうやくはくちにくし",
            meaning: "体に効く薬は苦いように、ためになる忠告は聞きづらいものだということ。",
            example: "良薬は口に苦し、厳しい指摘ほど自分の成長につながることが多い。", category: .wisdom),

    Proverb(id: 307, text: "苦言は耳に逆らう", reading: "くげんはみにさからう",
            meaning: "正しい忠告や諫言は耳に痛く聞きにくいが、身のためになるものだということ。",
            example: "苦言は耳に逆らうというが、先輩の厳しい言葉が後の自分を救った。", category: .wisdom),

    Proverb(id: 308, text: "頭隠して尻隠さず", reading: "あたまかくしてしりかくさず",
            meaning: "悪いことや失敗を隠そうとして、肝心なところが隠しきれていないこと。",
            example: "言い訳を並べているが、頭隠して尻隠さず、ミスの原因はバレバレだ。", category: .wisdom),

    Proverb(id: 309, text: "見ざる聞かざる言わざる", reading: "みざるきかざるいわざる",
            meaning: "悪いことは見ず聞かず言わずに、関わらないのが賢明だということ。",
            example: "職場の派閥争いには見ざる聞かざる言わざるで、仕事に集中した。", category: .wisdom),

    Proverb(id: 310, text: "知らぬ仏より見知った鬼", reading: "しらぬほとけよりみしったおに",
            meaning: "知らない善人よりも、よく知っている悪人の方が付き合いやすい場合があるということ。",
            example: "知らぬ仏より見知った鬼、勝手がわかっている相手の方が交渉しやすい。", category: .wisdom),

    Proverb(id: 311, text: "鴨の水掻き", reading: "かものみずかき",
            meaning: "表面は穏やかに見えても、陰で懸命に努力していること。",
            example: "彼は鴨の水掻きで、涼しい顔をして水面下では必死に準備していた。", category: .wisdom),

    Proverb(id: 312, text: "臨機応変", reading: "りんきおうへん",
            meaning: "その場の状況に応じて、適切な判断や対応をすること。",
            example: "トラブル発生時には臨機応変に対処することが求められる。", category: .wisdom),

    Proverb(id: 313, text: "温故知新", reading: "おんこちしん",
            meaning: "古いことをきわめ、そこから新しい知識や道理を見つけ出すこと。",
            example: "温故知新で古典を読み返すと、現代に通じる教えが発見できた。", category: .wisdom),

    Proverb(id: 314, text: "博覧強記", reading: "はくらんきょうき",
            meaning: "広く書物を読んで、多くのことを記憶していること。",
            example: "博覧強記の教授の講義はいつも豊富な知識に満ちていた。", category: .wisdom),

    Proverb(id: 315, text: "知行合一", reading: "ちこうごういつ",
            meaning: "知識と行動は一体であり、真の知は行動を伴うものだということ。",
            example: "知行合一の精神で、学んだことはすぐに実践するようにしている。", category: .wisdom),

    // MARK: - 人間関係 追加分 (ids 316-345)

    Proverb(id: 316, text: "旅は道連れ世は情け", reading: "たびはみちづれよはなさけ",
            meaning: "旅には連れが必要なように、世の中では人情が大切だということ。",
            example: "旅は道連れ世は情け、困ったときに助け合える仲間の大切さを実感した。", category: .relationships),

    Proverb(id: 317, text: "渡る世間に鬼はない", reading: "わたるせけんにおにはない",
            meaning: "世の中には冷たい人ばかりではなく、困ったときに助けてくれる人も必ずいるということ。",
            example: "見知らぬ土地で困っていたら助けてもらえた。渡る世間に鬼はないとはこのことだ。", category: .relationships),

    Proverb(id: 318, text: "長いものには巻かれろ", reading: "ながいものにはまかれろ",
            meaning: "強い権力や勢力には、逆らわずに従っておいた方が得策だということ。",
            example: "長いものには巻かれろで、今は上司の方針に合わせて動いている。", category: .relationships),

    Proverb(id: 319, text: "三つ子の魂百まで", reading: "みつごのたましいひゃくまで",
            meaning: "三歳のころに形成された性格や習慣は、一生変わらないということ。",
            example: "三つ子の魂百まで、幼いころの経験が今の自分の根っこになっている。", category: .relationships),

    Proverb(id: 320, text: "坊主憎けりゃ袈裟まで憎い", reading: "ぼうずにくけりゃけさまでにくい",
            meaning: "ある人が嫌いになると、その人に関連するものすべてが嫌いになってしまうこと。",
            example: "坊主憎けりゃ袈裟まで憎いで、あの人の言うことは何もかも腹が立つ。", category: .relationships),

    Proverb(id: 321, text: "蓼食う虫も好き好き", reading: "たでくうむしもすきずき",
            meaning: "人の好みはそれぞれで、どんなものにも好む人がいるということ。",
            example: "蓼食う虫も好き好き、他人の趣味にとやかく言うものではない。", category: .relationships),

    Proverb(id: 322, text: "負うた子に教えられる", reading: "おうたこにおしえられる",
            meaning: "自分が世話をしている子どもや年下の者から教えられることがあること。",
            example: "負うた子に教えられるとはこのこと、新人から目から鱗のアイデアをもらった。", category: .relationships),

    Proverb(id: 323, text: "金の切れ目が縁の切れ目", reading: "かねのきれめがえんのきれめ",
            meaning: "お金がなくなると、それまでの人間関係も切れてしまうということ。",
            example: "金の切れ目が縁の切れ目というが、本当の友人はそうはならない。", category: .relationships),

    Proverb(id: 324, text: "可愛い子には旅をさせよ", reading: "かわいいこにはたびをさせよ",
            meaning: "子どもがかわいければ、甘やかさずにあえて苦労をさせたほうが成長するということ。",
            example: "可愛い子には旅をさせよ、息子を一人で海外留学させることにした。", category: .relationships),

    Proverb(id: 325, text: "恩は石に刻め恨みは水に流せ", reading: "おんはいしにきざめうらみはみずにながせ",
            meaning: "受けた恩はいつまでも忘れずに、受けた仕打ちへの恨みは水に流して忘れよということ。",
            example: "恩は石に刻め恨みは水に流せ、いつまでも根に持つことをやめた。", category: .relationships),

    Proverb(id: 326, text: "合縁奇縁", reading: "あいえんきえん",
            meaning: "人と人との不思議な縁のこと。なぜか引き合う不思議な巡り合わせ。",
            example: "こんな遠い場所で旧友に会うとは、合縁奇縁としか言いようがない。", category: .relationships),

    Proverb(id: 327, text: "相手のない喧嘩はできない", reading: "あいてのないけんかはできない",
            meaning: "喧嘩は一人ではできないもので、相手があって初めて成り立つということ。",
            example: "相手のない喧嘩はできないから、こちらが無視すれば争いにはならない。", category: .relationships),

    Proverb(id: 328, text: "愛は屋上の烏に及ぶ", reading: "あいはおくじょうのからすにおよぶ",
            meaning: "ある人を愛すると、その人に関係するものすべてに愛情が及ぶということ。",
            example: "愛は屋上の烏に及ぶ、彼女を好きになってから彼女の好きな音楽も好きになった。", category: .relationships),

    Proverb(id: 329, text: "親の背中を見て子は育つ", reading: "おやのせなかをみてこはそだつ",
            meaning: "子どもは親の行動を見てまねをしながら育つものだということ。",
            example: "親の背中を見て子は育つ、自分の姿が子どもの手本になると思うと身が引き締まる。", category: .relationships),

    Proverb(id: 330, text: "人の一生は重荷を負いて遠き道を行くがごとし", reading: "ひとのいっしょうはおもにをおいてとおきみちをゆくがごとし",
            meaning: "人生は重い荷を背負って長い道を歩み続けるようなもので、辛抱と忍耐が必要だということ。",
            example: "人の一生は重荷を負いて遠き道を行くがごとし、焦らず一歩一歩歩んでいこう。", category: .relationships),

    Proverb(id: 331, text: "水魚の交わり", reading: "すいぎょのまじわり",
            meaning: "魚と水のように、切り離せないほど深い親密な関係のこと。",
            example: "二人は水魚の交わりで、何十年経っても変わらぬ友情を保っている。", category: .relationships),

    Proverb(id: 332, text: "以心伝心", reading: "いしんでんしん",
            meaning: "言葉を使わなくても、心と心が通じ合うこと。",
            example: "長年の相棒とは以心伝心で、言わなくても気持ちが伝わる。", category: .relationships),

    Proverb(id: 333, text: "一期一会", reading: "いちごいちえ",
            meaning: "一生に一度きりの出会いだという気持ちを大切に、誠実に接すること。",
            example: "一期一会の精神で、初めて会う人にも全力で向き合うようにしている。", category: .relationships),

    Proverb(id: 334, text: "孟母三遷", reading: "もうぼさんせん",
            meaning: "子の教育のためには環境選びが重要だということ。孟子の母が三度引っ越した故事から。",
            example: "孟母三遷のように、子どもの教育環境を整えることに力を入れた。", category: .relationships),

    Proverb(id: 335, text: "縁の下の力持ち", reading: "えんのしたのちからもち",
            meaning: "表には出ないが、陰で支えている存在のこと。縁の下＝床下で支える柱のたとえ。",
            example: "プロジェクトを陰で支えるスタッフは縁の下の力持ちとして欠かせない。", category: .relationships),

    // MARK: - 自然・時間 追加分 (ids 336-360)

    Proverb(id: 336, text: "女心と秋の空", reading: "おんなごころとあきのそら",
            meaning: "女性の気持ちは秋の空のようにめまぐるしく変わるということ。",
            example: "女心と秋の空、昨日と今日で気持ちが変わっていた。", category: .nature),

    Proverb(id: 337, text: "水清ければ魚棲まず", reading: "みずきよければさかなすまず",
            meaning: "清廉すぎる人には誰も近づきにくく、人が集まらないということ。",
            example: "水清ければ魚棲まずというから、少し大目に見る寛容さも必要だ。", category: .nature),

    Proverb(id: 338, text: "日暮れて道遠し", reading: "ひぐれてみちとおし",
            meaning: "年を取ってしまったのに、まだやるべきことが多く残っていること。時間のなさを嘆く言葉。",
            example: "日暮れて道遠しと感じるが、まだやりたいことが山積みだ。", category: .nature),

    Proverb(id: 339, text: "月に叢雲花に風", reading: "つきにむらくもはなにかぜ",
            meaning: "月は雲に隠れ、花は風に散らされる。よいことには邪魔が入りやすいということ。",
            example: "月に叢雲花に風というように、うまくいきそうなときほどトラブルが起きる。", category: .nature),

    Proverb(id: 340, text: "冬来たりなば春遠からじ", reading: "ふゆきたりなばはるとおからじ",
            meaning: "冬が来たなら春はもうすぐそこまで来ている。辛い時期も必ず終わるという励ましの言葉。",
            example: "冬来たりなば春遠からじ、今の苦しい状況も必ず好転する日が来る。", category: .nature),

    Proverb(id: 341, text: "秋茄子は嫁に食わすな", reading: "あきなすびはよめにくわすな",
            meaning: "秋の茄子は美味しいので嫁には食べさせるなという、嫁いびりのたとえ。または体を冷やすから食べさせるなという説も。",
            example: "秋茄子は嫁に食わすなという言葉があるが、今時そんな考えは通用しない。", category: .nature),

    Proverb(id: 342, text: "朝の来ない夜はない", reading: "あさのこないよるはない",
            meaning: "どんなに暗い夜でも必ず夜明けは来る。苦しい状況も必ず終わるという希望の言葉。",
            example: "朝の来ない夜はない、今の苦境も必ずいつか明けると信じて乗り越えた。", category: .nature),

    Proverb(id: 343, text: "秋の夕焼け鎌を研げ", reading: "あきのゆうやけかまをとげ",
            meaning: "秋の夕焼けは翌日が晴れる前兆なので、農作業の準備をせよということ。",
            example: "秋の夕焼け鎌を研げというから、明日の好天に備えて準備した。", category: .nature),

    Proverb(id: 344, text: "青菜に塩", reading: "あおなにしお",
            meaning: "元気のなかった人が急にしょんぼりとなること。青菜に塩をかけるとしなびることから。",
            example: "叱られた後の彼は青菜に塩のようにうなだれていた。", category: .nature),

    Proverb(id: 345, text: "藍は藍より出でて藍より青し", reading: "あいはあいよりいでてあいよりあおし",
            meaning: "弟子が師匠の実力を超えること。青は藍から生まれ藍より青いことから。",
            example: "藍は藍より出でて藍より青し、弟子がついに師匠を超える演奏をした。", category: .nature),

    Proverb(id: 346, text: "枯れ木も山の賑わい", reading: "かれきもやまのにぎわい",
            meaning: "つまらないものでも、ないよりはあった方がましだということ。",
            example: "枯れ木も山の賑わいと参加したが、意外と場が盛り上がった。", category: .nature),

    Proverb(id: 347, text: "春の夜の夢のごとし", reading: "はるのよのゆめのごとし",
            meaning: "春の夜の夢のように、栄華は儚く短いものだということ。",
            example: "春の夜の夢のごとし、あの繁栄がこんなに早く終わるとは思わなかった。", category: .nature),

    Proverb(id: 348, text: "濡れ落ち葉", reading: "ぬれおちば",
            meaning: "退職した夫が妻にべったりくっついて離れない状態のたとえ。",
            example: "定年退職した父が濡れ落ち葉のように母にまとわりついている。", category: .nature),

    Proverb(id: 349, text: "花の命は短くて苦しきことのみ多かりき", reading: "はなのいのちはみじかくてくるしきことのみおおかりき",
            meaning: "花の命が短いように、人生の美しい時期は短く、苦しいことが多いということ。",
            example: "花の命は短くて苦しきことのみ多かりきと、詩人は人生の儚さを詠んだ。", category: .nature),

    Proverb(id: 350, text: "七転び八起き", reading: "ななころびやおき",
            meaning: "何度失敗してもくじけずに立ち上がること。七回倒れても八回起き上がること。",
            example: "七転び八起きの精神で、失敗を繰り返しながらも前進し続けた。", category: .nature),

    Proverb(id: 351, text: "日進月歩", reading: "にっしんげっぽ",
            meaning: "日に日に絶えず進歩すること。めざましい速度で発展すること。",
            example: "テクノロジーは日進月歩で、常に学び続けなければならない。", category: .nature),

    Proverb(id: 352, text: "花鳥風月", reading: "かちょうふうげつ",
            meaning: "自然の美しい景物。また、それを鑑賞する風流なこと。",
            example: "花鳥風月を楽しむ日本の文化は、心を豊かにしてくれる。", category: .nature),

    Proverb(id: 353, text: "山紫水明", reading: "さんしすいめい",
            meaning: "山は紫にかすみ、川は清く澄み渡る美しい景色のこと。",
            example: "この地方は山紫水明の地として、多くの観光客が訪れる。", category: .nature),

    Proverb(id: 354, text: "諸行無常", reading: "しょぎょうむじょう",
            meaning: "この世のすべての物事は常に変化し、同じ状態に留まることはないということ。",
            example: "諸行無常の理を知れば、変化を恐れず受け入れることができる。", category: .nature),

    Proverb(id: 355, text: "盛者必衰", reading: "じょうしゃひっすい",
            meaning: "栄えているものは必ず衰える時が来るということ。",
            example: "盛者必衰の理は歴史が証明している。かつての大企業も消えていった。", category: .nature),

    // MARK: - 行動・判断 追加分 (ids 356-390)

    Proverb(id: 356, text: "立つ鳥跡を濁さず", reading: "たつとりあとをにごさず",
            meaning: "立ち去るときは、あとが見苦しくないようにきちんとしておくべきだということ。",
            example: "立つ鳥跡を濁さず、退職前にしっかりと引き継ぎを済ませた。", category: .action),

    Proverb(id: 357, text: "骨折り損のくたびれ儲け", reading: "ほねおりぞんのくたびれもうけ",
            meaning: "苦労ばかりして、それに見合った成果が得られないこと。",
            example: "骨折り損のくたびれ儲けとならないよう、効率的に取り組む方法を考えた。", category: .action),

    Proverb(id: 358, text: "暖簾に腕押し", reading: "のれんにうでおし",
            meaning: "手ごたえがなく、いくら働きかけても効果がないこと。",
            example: "彼に何を言っても暖簾に腕押しで、全くこたえる様子がない。", category: .action),

    Proverb(id: 359, text: "糠に釘", reading: "ぬかにくぎ",
            meaning: "やわらかい糠に釘を打つように、手ごたえがなく効き目がないこと。",
            example: "いくら注意しても糠に釘で、全く改善されない。", category: .action),

    Proverb(id: 360, text: "蛙の面に水", reading: "かえるのつらにみず",
            meaning: "蛙の顔に水をかけても平気なように、何をされても少しも堪えないこと。",
            example: "蛙の面に水で、批判されても全く気にしない様子だった。", category: .action),

    Proverb(id: 361, text: "猫に小判", reading: "ねこにこばん",
            meaning: "価値のわからない者に、貴重なものを与えても意味がないこと。",
            example: "猫に小判というか、高性能な機材を持て余している。", category: .action),

    Proverb(id: 362, text: "豚に真珠", reading: "ぶたにしんじゅ",
            meaning: "価値のわからない者に高価なものを与えても意味がないこと。",
            example: "豚に真珠、せっかくの良い意見も聞く耳を持たない人には伝わらない。", category: .action),

    Proverb(id: 363, text: "三度目の正直", reading: "さんどめのしょうじく",
            meaning: "一度二度は当てにならなくても、三度目は確かだということ。",
            example: "三度目の正直、二度失敗した試験に今回こそ合格した。", category: .action),

    Proverb(id: 364, text: "二度あることは三度ある", reading: "にどあることはさんどある",
            meaning: "同じことが二度起きたら、もう一度起きる可能性が高いということ。",
            example: "二度あることは三度ある、同じミスを繰り返さないよう仕組みを変えた。", category: .action),

    Proverb(id: 365, text: "言わぬが花", reading: "いわぬがはな",
            meaning: "何でも言葉に出して言うより、言わないでいた方が美しい場合があること。",
            example: "言わぬが花というから、本当のことを言わずに黙っていた。", category: .action),

    Proverb(id: 366, text: "朝飯前", reading: "あさめしまえ",
            meaning: "朝ご飯を食べる前でもできるほど、非常に簡単なこと。",
            example: "この計算なら朝飯前、すぐに答えが出せる。", category: .action),

    Proverb(id: 367, text: "今日の一針明日の十針", reading: "きょうのひとはりあすのとうはり",
            meaning: "今日すべき縫い仕事を怠ると、明日は十倍も縫わなければならない。後回しにすることの戒め。",
            example: "今日の一針明日の十針、先延ばしにせずすぐに対処することにした。", category: .action),

    Proverb(id: 368, text: "鶏口となるも牛後となるなかれ", reading: "けいこうとなるもぎゅうごとなるなかれ",
            meaning: "大きな集団の末端にいるより、小さくても集団のリーダーになれということ。",
            example: "鶏口となるも牛後となるなかれ、大企業を辞めて小さな会社の社長になった。", category: .action),

    Proverb(id: 369, text: "壁に耳あり障子に目あり", reading: "かべにみみありしょうじにめあり",
            meaning: "どこで誰に聞かれているかわからないから、発言には常に注意せよということ。",
            example: "壁に耳あり障子に目あり、社外の場では機密情報の話はしないよう気をつけた。", category: .action),

    Proverb(id: 370, text: "悪事千里を走る", reading: "あくじせんりをはしる",
            meaning: "悪い評判や不祥事は遠くまであっという間に広まるということ。",
            example: "悪事千里を走るというから、不祥事はすぐに世間に知れ渡ってしまった。", category: .action),

    Proverb(id: 371, text: "帯に短し襷に長し", reading: "おびにみじかしたすきにながし",
            meaning: "帯にするには短く、たすきにするには長い。どちらの用途にも中途半端なこと。",
            example: "帯に短し襷に長し、この案はどの目的にもぴったりはまらない。", category: .action),

    Proverb(id: 372, text: "虻蜂捕らず", reading: "あぶはちとらず",
            meaning: "欲張って二つのものを一度に取ろうとして、どちらも得られないこと。",
            example: "虻蜂捕らずにならないよう、まず一つに集中することにした。", category: .action),

    Proverb(id: 373, text: "旅の恥はかき捨て", reading: "たびのはじはかきすて",
            meaning: "旅先では知り合いに会うこともなく、恥ずかしいことも自由にできるということ。",
            example: "旅の恥はかき捨てと、普段は頼めない料理にも挑戦した。", category: .action),

    Proverb(id: 374, text: "覆水盆に返らず", reading: "ふくすいぼんにかえらず",
            meaning: "一度こぼれた水は盆に戻せないように、取り返しのつかないことのたとえ。",
            example: "覆水盆に返らず、言ってしまった一言は取り消せないと気づいた。", category: .action),

    Proverb(id: 375, text: "石の上にも三年", reading: "いしのうえにもさんねん",
            meaning: "冷たい石の上でも三年座れば暖まるように、辛くても辛抱して続けることが大切だということ。",
            example: "石の上にも三年というから、もう少し続けてみようと決めた。", category: .action),

    Proverb(id: 376, text: "急がば回れ", reading: "いそがばまわれ",
            meaning: "急いでいるときほど、危険な近道より安全な遠回りを選ぶほうが結局早いということ。",
            example: "急がば回れ、慌てて進んで失敗するより確実な方法を選んだ。", category: .action),

    Proverb(id: 377, text: "本末転倒", reading: "ほんまつてんとう",
            meaning: "大切なことと、そうでないことの順序が逆になってしまうこと。",
            example: "節約のために時間を浪費するのは本末転倒だ。", category: .action),

    Proverb(id: 378, text: "一刀両断", reading: "いっとうりょうだん",
            meaning: "物事をためらわずに、思い切りよく決断・処理すること。",
            example: "長引く議論を一刀両断、リーダーが判断を下した。", category: .action),

    Proverb(id: 379, text: "朝令暮改", reading: "ちょうれいぼかい",
            meaning: "朝出した命令を夕方には改めるほど、方針や指示がころころ変わること。",
            example: "朝令暮改では部下が困る。一度決めたことは貫くべきだ。", category: .action),

    Proverb(id: 380, text: "百発百中", reading: "ひゃっぱつひゃくちゅう",
            meaning: "矢・弾が必ず的に当たること。転じて、計画や予測が全て当たること。",
            example: "彼の売上予測は百発百中で、チームから絶大な信頼を得ている。", category: .action),

    Proverb(id: 381, text: "一石二鳥", reading: "いっせきにちょう",
            meaning: "一つの行動で二つの利益を得ること。",
            example: "通勤中に読書するのは一石二鳥だ。", category: .action),

    Proverb(id: 382, text: "馬耳東風", reading: "ばじとうふう",
            meaning: "人の意見や批評を全く気にしないで聞き流すこと。",
            example: "何を注意してもあの人は馬耳東風で、全く聞く耳を持たない。", category: .action),

    Proverb(id: 383, text: "用意周到", reading: "よういしゅうとう",
            meaning: "準備が行き届いていて抜かりがないこと。",
            example: "彼女は用意周到な性格で、全てのシナリオを事前に想定していた。", category: .action),

    // MARK: - 運・運命 追加分 (ids 384-402)

    Proverb(id: 384, text: "身から出た錆", reading: "みからでたさび",
            meaning: "自分の行いのせいで、自分が苦しむ結果になること。自業自得のたとえ。",
            example: "身から出た錆というしかない、自分の怠慢が招いた結果だ。", category: .luck),

    Proverb(id: 385, text: "焼け木杭に火がつく", reading: "やけぼっくいにひがつく",
            meaning: "一度関係があった者同士は、再び縁が戻りやすいということ。",
            example: "焼け木杭に火がつくで、別れた二人がよりを戻した。", category: .luck),

    Proverb(id: 386, text: "鳶が鷹を生む", reading: "とびがたかをうむ",
            meaning: "平凡な親から優れた子が生まれること。",
            example: "鳶が鷹を生むというか、普通の家庭から世界的な音楽家が誕生した。", category: .luck),

    Proverb(id: 387, text: "好事魔多し", reading: "こうじまおおし",
            meaning: "良いことがあるときには、邪魔が入ったり障害が起きやすいということ。",
            example: "好事魔多し、順調に進んでいた計画に突然トラブルが発生した。", category: .luck),

    Proverb(id: 388, text: "鴨が葱を背負ってくる", reading: "かもがねぎをしょってくる",
            meaning: "都合よく獲物が自分から来ること。うまい話が向こうからやってくること。",
            example: "鴨が葱を背負ってくるとはこのこと、ちょうど欲しい人材が向こうから来てくれた。", category: .luck),

    Proverb(id: 389, text: "濡れ手で粟", reading: "ぬれてであわ",
            meaning: "濡れた手で粟をつかむと粟がくっついてくるように、苦労せずに利益を得ること。",
            example: "濡れ手で粟のような儲け話には裏があると疑うべきだ。", category: .luck),

    Proverb(id: 390, text: "飛んで火にいる夏の虫", reading: "とんでひにいるなつのむし",
            meaning: "自ら危険に飛び込んでいくことのたとえ。",
            example: "飛んで火にいる夏の虫のように、危険な状況へ自ら突き進んでいった。", category: .luck),

    Proverb(id: 391, text: "運がよければ牛の糞も味噌になる", reading: "うんがよければうしのふんもみそになる",
            meaning: "運が良ければ、どんなものでも価値あるものになるということ。",
            example: "運がよければ牛の糞も味噌になるというが、運を引き寄せる努力も大切だ。", category: .luck),

    Proverb(id: 392, text: "江戸の敵を長崎で討つ", reading: "えどのかたきをながさきでうつ",
            meaning: "全く別の場所や時期に、以前の仕返しをすること。",
            example: "江戸の敵を長崎で討つというが、意外なところで恨みを晴らされた。", category: .luck),

    Proverb(id: 393, text: "海老で鯛を釣る", reading: "えびでたいをつる",
            meaning: "小さな投資や労力で大きな利益・成果を得ること。",
            example: "海老で鯛を釣るとはこのこと、小さなプレゼントが大きな契約につながった。", category: .luck),

    Proverb(id: 394, text: "因果応報", reading: "いんがおうほう",
            meaning: "過去の善悪の行いに応じた報いが必ず返ってくるということ。",
            example: "因果応報、人に親切にしてきたおかげで困ったときに助けてもらえた。", category: .luck),

    Proverb(id: 395, text: "千載一遇", reading: "せんざいいちぐう",
            meaning: "千年に一度あるかないかの、またとない絶好の機会のこと。",
            example: "この案件は千載一遇のチャンス、絶対に逃したくない。", category: .luck),

    Proverb(id: 396, text: "九死一生", reading: "きゅうしいっしょう",
            meaning: "ほとんど助からないような危険な状況から、かろうじて生き延びること。",
            example: "登山中に遭難し、九死一生の思いで生還した。", category: .luck),

    // MARK: - 感情・心 追加分 (ids 397-430)

    Proverb(id: 397, text: "喉元過ぎれば熱さを忘れる", reading: "のどもとすぎればあつさをわすれる",
            meaning: "苦しいことも、過ぎ去ってしまえばすぐに忘れてしまうということ。",
            example: "喉元過ぎれば熱さを忘れるで、あれほど辛かった受験勉強も今は懐かしい。", category: .emotion),

    Proverb(id: 398, text: "目から鱗が落ちる", reading: "めからうろこがおちる",
            meaning: "今まで気づかなかったことが突然わかり、視界が開ける感覚のこと。",
            example: "先輩の一言で目から鱗が落ちる思いがし、問題の解決策が見えた。", category: .emotion),

    Proverb(id: 399, text: "寝耳に水", reading: "ねみにみず",
            meaning: "寝ていると耳に水が入るように、突然の驚くべき知らせに驚くこと。",
            example: "急な転勤命令は寝耳に水で、しばらく状況が飲み込めなかった。", category: .emotion),

    Proverb(id: 400, text: "青天の霹靂", reading: "せいてんのへきれき",
            meaning: "青空に突然雷が落ちるように、突然の予想外の出来事に驚くこと。",
            example: "突然の解雇通知は青天の霹靂で、言葉も出なかった。", category: .emotion),

    Proverb(id: 401, text: "顔から火が出る", reading: "かおからひがでる",
            meaning: "恥ずかしさのあまり、顔が真っ赤になること。非常に恥ずかしい思いをすること。",
            example: "人前で大きなミスをして顔から火が出るほど恥ずかしかった。", category: .emotion),

    Proverb(id: 402, text: "胸がつぶれる", reading: "むねがつぶれる",
            meaning: "非常に悲しく、つらい思いをすること。心が痛むこと。",
            example: "子どもが泣いている姿を見て胸がつぶれる思いだった。", category: .emotion),

    Proverb(id: 403, text: "心が躍る", reading: "こころがおどる",
            meaning: "期待や喜びで気持ちがわくわくと高まること。",
            example: "旅行の計画を立てていると心が躍る。", category: .emotion),

    Proverb(id: 404, text: "身の毛もよだつ", reading: "みのけもよだつ",
            meaning: "恐怖や嫌悪感で体の毛が逆立つほどぞっとすること。",
            example: "身の毛もよだつような怖い話を聞いて眠れなくなった。", category: .emotion),

    Proverb(id: 405, text: "肩の荷が下りる", reading: "かたのにがおりる",
            meaning: "重い責任や心配事から解放されてほっとすること。",
            example: "無事にプロジェクトが完了し、肩の荷が下りた。", category: .emotion),

    Proverb(id: 406, text: "涙をのむ", reading: "なみだをのむ",
            meaning: "悲しみや悔しさを堪えて、表に出さないこと。",
            example: "理不尽な決定に涙をのんだが、次のチャンスに向けて気持ちを切り替えた。", category: .emotion),

    Proverb(id: 407, text: "居ても立ってもいられない", reading: "いてもたってもいられない",
            meaning: "気になることがあって、じっとしていられない落ち着かない状態。",
            example: "試験結果の発表を待つ間、居ても立ってもいられない気持ちだった。", category: .emotion),

    Proverb(id: 408, text: "目を丸くする", reading: "めをまるくする",
            meaning: "驚いて目を大きく見開くこと。非常に驚くこと。",
            example: "予想外の結果に目を丸くして、しばらく言葉が出なかった。", category: .emotion),

    Proverb(id: 409, text: "耳を疑う", reading: "みみをうたがう",
            meaning: "聞いた内容が信じられず、本当に聞こえたのかどうかを疑うほど驚くこと。",
            example: "まさかの合格通知に耳を疑い、何度も読み返した。", category: .emotion),

    Proverb(id: 410, text: "鼻が高い", reading: "はながたかい",
            meaning: "得意になって誇らしい気持ちでいること。",
            example: "子どもが表彰されて鼻が高い思いだった。", category: .emotion),

    Proverb(id: 411, text: "血の気が引く", reading: "ちのけがひく",
            meaning: "恐怖や驚きで顔が青ざめること。",
            example: "財布がないことに気づいて血の気が引いた。", category: .emotion),

    Proverb(id: 412, text: "怒り心頭に発する", reading: "いかりしんとうにはっする",
            meaning: "非常に激しく怒ること。怒りが頂点に達すること。",
            example: "理不尽な扱いに怒り心頭に発したが、冷静を保つよう努めた。", category: .emotion),

    Proverb(id: 413, text: "胸を打たれる", reading: "むねをうたれる",
            meaning: "感動が胸に響き、強く心を動かされること。",
            example: "被災地でのボランティア活動の話に胸を打たれた。", category: .emotion),

    Proverb(id: 414, text: "歯がゆい", reading: "はがゆい",
            meaning: "思いどおりにならずじれったく、もどかしく感じること。",
            example: "助けたいのに何もできない歯がゆさを感じた。", category: .emotion),

    Proverb(id: 415, text: "身が引き締まる", reading: "みがひきしまる",
            meaning: "緊張感や責任感から、気持ちが引き締まること。",
            example: "大役を任されて身が引き締まる思いだった。", category: .emotion),

    Proverb(id: 416, text: "喜怒哀楽", reading: "きどあいらく",
            meaning: "喜び・怒り・悲しみ・楽しみの四つ。人間のあらゆる感情を表す言葉。",
            example: "あの映画は喜怒哀楽すべての感情を味わわせてくれる傑作だ。", category: .emotion),

    Proverb(id: 417, text: "一喜一憂", reading: "いっきいちゆう",
            meaning: "状況が変わるたびに、喜んだり心配したりすること。",
            example: "試合の流れに一喜一憂しながら応援した。", category: .emotion),

    Proverb(id: 418, text: "心機一転", reading: "しんきいってん",
            meaning: "気持ちをがらりと切り替えて、新たな気持ちで取り組むこと。",
            example: "心機一転、新しい環境で一からやり直そうと決意した。", category: .emotion),

    Proverb(id: 419, text: "無我夢中", reading: "むがむちゅう",
            meaning: "我を忘れて、一つのことに夢中になること。",
            example: "無我夢中で作業に集中していたら、気づいたら夜になっていた。", category: .emotion),

    Proverb(id: 420, text: "七転八倒", reading: "しちてんばっとう",
            meaning: "ひどい苦しみや痛みで転げまわること。または激しく苦悩すること。",
            example: "腹痛がひどく、七転八倒の苦しみだった。", category: .emotion),
]
// swiftlint:enable file_length line_length
