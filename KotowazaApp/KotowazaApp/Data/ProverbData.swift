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

    // MARK: - か行 (ids 421-439)

    Proverb(id: 421, text: "飼犬に手を噛まれる", reading: "かいいぬにてをかまれる",
            meaning: "日頃から面倒を見て親しくしている者に裏切られること。恩を仇で返されること。",
            example: "飼犬に手を噛まれるとはまさにこのことで、長年かわいがった部下に裏切られた。", category: .relationships),

    Proverb(id: 422, text: "怪力乱神を語らず", reading: "かいりょくらんしんをかたらず",
            meaning: "超自然的なことや道理に反することは、むやみに口にすべきではないということ。",
            example: "怪力乱神を語らず、科学的に解明できないことは安易に断言しない姿勢が大切だ。", category: .wisdom),

    Proverb(id: 423, text: "香り松茸味しめじ", reading: "かおりまつたけあじしめじ",
            meaning: "松茸は香りが良く、しめじは味がよい。それぞれに優れた点があるということ。",
            example: "香り松茸味しめじというように、どちらも料理に欠かせないきのこだ。", category: .nature),

    Proverb(id: 424, text: "柿が赤くなると医者が青くなる", reading: "かきがあかくなるといしゃがあおくなる",
            meaning: "柿が熟す秋は気候が良く病人が減るため、医者の商売が上がったりになるということ。",
            example: "柿が赤くなると医者が青くなるというように、秋はなんとなく体の調子がよい。", category: .nature),

    Proverb(id: 425, text: "蝸牛の角の争い", reading: "かたつむりのつののあらそい",
            meaning: "取るに足りない些細なことで争うこと。小さな世界での無意味な争いのたとえ。",
            example: "蝸牛の角の争いのような小競り合いより、大きな目標に向かって協力すべきだ。", category: .action),

    Proverb(id: 426, text: "学者と大木にわかにできぬ", reading: "がくしゃとたいぼくにわかにできぬ",
            meaning: "立派な学者も大きな木も、どちらも長い時間と努力なしにはできないということ。",
            example: "学者と大木にわかにできぬ、学問は長い年月をかけて積み上げるものだ。", category: .wisdom),

    Proverb(id: 427, text: "駕籠に乗る人担ぐ人そのまた草鞋作る人", reading: "かごにのるひとかつぐひとそのまたわらじつくるひと",
            meaning: "社会にはさまざまな役割の人がいて、それぞれが支え合って成り立っているということ。",
            example: "駕籠に乗る人担ぐ人そのまた草鞋作る人、社会はさまざまな人の協力で成り立っている。", category: .relationships),

    Proverb(id: 428, text: "火事後の釘拾い", reading: "かじごのくぎひろい",
            meaning: "手遅れになってから後悔すること。事が終わってから慌てて細々としたことをやること。",
            example: "火事後の釘拾いにならないよう、事前にしっかりと準備をしておいた。", category: .action),

    Proverb(id: 429, text: "苛政は虎より猛し", reading: "かせいはとらよりたけし",
            meaning: "過酷な政治は、猛虎よりも恐ろしく人々を苦しめるということ。",
            example: "苛政は虎より猛し、重税に苦しむ民は猛獣より政府を恐れていた。", category: .action),

    Proverb(id: 430, text: "風が吹けば桶屋が儲かる", reading: "かぜがふけばおけやがもうかる",
            meaning: "ある出来事が巡り巡って、思いがけない結果をもたらすことのたとえ。",
            example: "風が吹けば桶屋が儲かるというように、一つの変化が意外なところに影響を及ぼした。", category: .action),

    Proverb(id: 431, text: "形は産めど心は産まぬ", reading: "かたちはうめどこころはうまぬ",
            meaning: "親は子どもを産むことはできても、その心まで思い通りにすることはできないということ。",
            example: "形は産めど心は産まぬ、子どもは親の思い通りには育たないものだ。", category: .relationships),

    Proverb(id: 432, text: "片手で錐はもまれぬ", reading: "かたてでぎりはもまれぬ",
            meaning: "何事も一人でできることには限界があり、人の助けが必要だということ。",
            example: "片手で錐はもまれぬ、この仕事は一人では無理なのでチームで取り組もう。", category: .action),

    Proverb(id: 433, text: "渇しても盗泉の水は飲まず", reading: "かっしてもとうせんのみずはのまず",
            meaning: "どんなに苦しい状況でも、不正なことや恥ずべきことはしないということ。",
            example: "渇しても盗泉の水は飲まず、苦しくても不正には手を染めないと誓った。", category: .action),

    Proverb(id: 434, text: "勝って兜の緒を締めよ", reading: "かってかぶとのおをしめよ",
            meaning: "勝利しても油断することなく、慎重に対処せよということ。",
            example: "試合に勝ったが、勝って兜の緒を締めよと次の試合に向けて気を引き締めた。", category: .action),

    Proverb(id: 435, text: "借りる時の恵比寿顔済す時の閻魔顔", reading: "かりるときのえびすがおすますときのえんまがお",
            meaning: "お金を借りるときはにこやかな顔でいながら、返すときは怖い顔になるということ。",
            example: "借りる時の恵比寿顔済す時の閻魔顔とはよく言ったもので、返済の催促をされて急に態度が変わった。", category: .relationships),

    Proverb(id: 436, text: "瓦も磨けば玉となる", reading: "かわらもみがけばたまとなる",
            meaning: "平凡な者でも、努力して磨けば優れた人物になれるということ。",
            example: "瓦も磨けば玉となる、継続的な努力で誰でも成長できる。", category: .effort),

    Proverb(id: 437, text: "勧学院の雀は蒙求を囀る", reading: "かんがくいんのすずめはもうぎゅうをさえずる",
            meaning: "よい環境にいると、意識せずとも自然にその場の雰囲気が身につくということ。",
            example: "勧学院の雀は蒙求を囀るというように、優れた人の周りにいると自然と高められる。", category: .wisdom),

    Proverb(id: 438, text: "看板に偽りなし", reading: "かんばんにいつわりなし",
            meaning: "広告や評判の通りで、嘘や誇張がないこと。名実相伴っていること。",
            example: "看板に偽りなし、評判通りの美味しいレストランで大満足だった。", category: .action),

    Proverb(id: 439, text: "棺を蓋いて事定まる", reading: "かんをおおいてことさだまる",
            meaning: "人の真の評価は、死後にその一生が終わってから初めて定まるということ。",
            example: "棺を蓋いて事定まる、その人の本当の価値は後世の人々が判断するものだ。", category: .action),

    // MARK: - き行 (ids 440-446)

    Proverb(id: 440, text: "聞いて極楽見て地獄", reading: "きいてごくらくみてじごく",
            meaning: "話を聞いたときは素晴らしいと思っても、実際に見るとがっかりすることがあるということ。",
            example: "聞いて極楽見て地獄で、評判の観光地も実際は期待外れだった。", category: .wisdom),

    Proverb(id: 441, text: "狐死して兎悲しむ", reading: "きつねししてうさぎかなしむ",
            meaning: "同じ仲間や境遇の者が不幸になると、他の者も我が身のこととして悲しむということ。",
            example: "狐死して兎悲しむ、同僚が解雇されると他の社員も不安を覚えた。", category: .relationships),

    Proverb(id: 442, text: "牛飲馬食", reading: "ぎゅういんばしょく",
            meaning: "牛や馬のように大量に飲み食いすること。",
            example: "久しぶりの食事会で牛飲馬食してしまい、翌日は胃が痛かった。", category: .action),

    Proverb(id: 443, text: "九牛の一毛", reading: "きゅうぎゅうのいちもう",
            meaning: "多数の中の極めてわずかなもの。取るに足りない小さなものの比喩。",
            example: "私の貢献など九牛の一毛に過ぎないが、少しでも役に立てて嬉しい。", category: .action),

    Proverb(id: 444, text: "器用貧乏", reading: "きようびんぼう",
            meaning: "何でもそつなくこなせるが、これといった専門技術がないために大成しないこと。",
            example: "器用貧乏にならないよう、一つの専門分野を深く磨くことにした。", category: .action),

    Proverb(id: 445, text: "義を見てせざるは勇無きなり", reading: "ぎをみてせざるはゆうなきなり",
            meaning: "正しいことと知りながらそれをしないのは、勇気がないからだということ。",
            example: "義を見てせざるは勇無きなり、困っている人を助けるのに躊躇しなかった。", category: .action),

    Proverb(id: 446, text: "今日は人の上明日は我が身の上", reading: "きょうはひとのうえあすはわがみのうえ",
            meaning: "今日は他人のことと思っていても、明日は自分にも同じことが起きるかもしれないということ。",
            example: "今日は人の上明日は我が身の上、他人の失敗を笑っていられない。", category: .wisdom),

    // MARK: - く行 (ids 447-453)

    Proverb(id: 447, text: "金言耳に逆らう", reading: "きんげんみにさからう",
            meaning: "道理にかなった正しい言葉は、聞く者の耳には耳障りに感じられることが多いということ。",
            example: "金言耳に逆らうとはいえ、その忠告は素直に受け入れるべきだった。", category: .wisdom),

    Proverb(id: 448, text: "錦上に花を添う", reading: "きんじょうにはなをそう",
            meaning: "美しいものの上にさらに美しいものを加えること。良いものがさらに良くなること。",
            example: "優勝の喜びに錦上花を添えるように、最優秀選手賞まで受賞した。", category: .nature),

    Proverb(id: 449, text: "草を打って蛇を驚かす", reading: "くさをうってへびをおどろかす",
            meaning: "一方を懲らしめることで、他の者への警告にすること。間接的に相手に気づかせること。",
            example: "草を打って蛇を驚かすように、一人を注意することで全員への戒めとした。", category: .action),

    Proverb(id: 450, text: "首振り三年ころ八年", reading: "くびふりさんねんころはちねん",
            meaning: "三味線の基本に三年、感覚をつかむのに八年かかるということ。何事も一人前になるには長い年月が必要だということ。",
            example: "首振り三年ころ八年というように、職人の技は長年の修練が必要だ。", category: .effort),

    Proverb(id: 451, text: "窪い所に水溜る", reading: "くぼいところにみずたまる",
            meaning: "物事は自然と集まりやすいところに集まるということ。低いところに水が溜まるように。",
            example: "窪い所に水溜るように、人も情報も自然と集まる場所がある。", category: .nature),

    Proverb(id: 452, text: "君子豹変す", reading: "くんしひょうへんす",
            meaning: "優れた人は誤りを認めると、すぐに行いや考えを改めるということ。",
            example: "君子豹変す、間違いに気づいたらすぐに方針を転換した。", category: .action),

    Proverb(id: 453, text: "群盲象を撫でる", reading: "ぐんもうぞうをなでる",
            meaning: "多くの人がそれぞれ一部分だけを見て、全体を理解したつもりになっているたとえ。",
            example: "群盲象を撫でるように、各部門がバラバラに動いて全体像を把握できていなかった。", category: .wisdom),

    // MARK: - け行 (ids 454-457)

    Proverb(id: 454, text: "群羊を駆って猛虎を攻める", reading: "ぐんようをかってもうこをせめる",
            meaning: "力の弱い者を集めて強大な敵に立ち向かうこと。無謀な戦いをするたとえ。",
            example: "群羊を駆って猛虎を攻めるような無謀な戦略では到底勝てない。", category: .action),

    Proverb(id: 455, text: "鯨飲馬食", reading: "げいんばしょく",
            meaning: "鯨のように飲み、馬のように食べること。大量に飲食すること。",
            example: "宴会で鯨飲馬食してしまい、翌朝は体が重かった。", category: .action),

    Proverb(id: 456, text: "下戸の肴荒らし", reading: "げこのさかなあらし",
            meaning: "酒を飲まない人が、肴ばかりたくさん食べること。",
            example: "下戸の肴荒らしで、お酒は飲まないのに料理だけたくさんいただいてしまった。", category: .action),

    Proverb(id: 457, text: "蜥蜴腹立てれば鶴喜ぶ", reading: "けらはらたてればつるよろこぶ",
            meaning: "小さい者が怒れば、それを見て大きい者が喜ぶということ。弱者の怒りは強者に利するということ。",
            example: "蜥蜴腹立てれば鶴喜ぶ、小さな組織が感情的になっても大企業の思うつぼだ。", category: .action),

    // MARK: - こ行 (ids 458-469)

    Proverb(id: 458, text: "恋に上下の隔てなし", reading: "こいにじょうげのへだてなし",
            meaning: "恋愛には身分や地位の差は関係なく、誰もが平等に恋をするということ。",
            example: "恋に上下の隔てなし、身分の差を超えた恋愛が実を結んだ。", category: .relationships),

    Proverb(id: 459, text: "鯉の滝登り", reading: "こいのたきのぼり",
            meaning: "立身出世することのたとえ。困難を乗り越えて出世していくこと。",
            example: "彼はまさに鯉の滝登り、無名から一気に業界トップに上り詰めた。", category: .effort),

    Proverb(id: 460, text: "孔子も時に遇わず", reading: "こうしもときにあわず",
            meaning: "孔子のような偉大な人物でも時代や機会に恵まれないことがあったということ。実力があっても時運に左右されることがあるということ。",
            example: "孔子も時に遇わず、実力があっても時代に合わなければ認められないこともある。", category: .luck),

    Proverb(id: 461, text: "後家の踏ん張り", reading: "ごけのふんばり",
            meaning: "苦しい状況にある者が、必死にふんばって耐えること。",
            example: "後家の踏ん張りというべき根性で、困難な状況を乗り越えた。", category: .effort),

    Proverb(id: 462, text: "碁で負けたら将棋で勝て", reading: "ごでまけたらしょうぎでかて",
            meaning: "一つのことで負けても、別のことで取り返せばよいということ。",
            example: "碁で負けたら将棋で勝て、一度の失敗に落ち込まず別の方法で挽回しよう。", category: .action),

    Proverb(id: 463, text: "言葉多きは品少なし", reading: "ことばおおきはしなすくなし",
            meaning: "口数が多い人は品格に欠けるということ。多言は軽薄さの表れ。",
            example: "言葉多きは品少なしというから、大切な場面では言葉を選んで少なくまとめた。", category: .wisdom),

    Proverb(id: 464, text: "言葉は身の文", reading: "ことばはみのあや",
            meaning: "言葉はその人の教養や品格を表すものだということ。",
            example: "言葉は身の文というように、話し方でその人の人柄がよくわかる。", category: .wisdom),

    Proverb(id: 465, text: "子を見ること親にしかず", reading: "こをみることおやにしかず",
            meaning: "自分の子どものことをよく理解しているのは、親が一番だということ。",
            example: "子を見ること親にしかず、担任の先生より母親の方がよく息子のことを知っていた。", category: .relationships),

    Proverb(id: 466, text: "子を持って知る親の恩", reading: "こをもってしるおやのおん",
            meaning: "自分が親になって初めて、自分の親がしてくれたことの有難さがわかるということ。",
            example: "子を持って知る親の恩、自分が子どもを育てて初めて親の苦労と愛情が理解できた。", category: .relationships),

    Proverb(id: 467, text: "小坊主一人に天狗八人", reading: "こぼうずいちにんにてんぐはちにん",
            meaning: "わずかな者を大勢で取り囲んでいじめること。強者が弱者をいじめること。",
            example: "小坊主一人に天狗八人のような状況で、多勢に無勢の新入りが集中攻撃を受けていた。", category: .relationships),

    Proverb(id: 468, text: "五風十雨", reading: "ごふうじゅうう",
            meaning: "五日に一度風が吹き十日に一度雨が降るという穏やかな気候のこと。また世の中が平和で豊かであることのたとえ。",
            example: "五風十雨の年は農作物が豊かに実り、農家の人々は安堵した。", category: .nature),

    Proverb(id: 469, text: "災害は忘れた頃にやってくる", reading: "さいがいはわすれたころにやってくる",
            meaning: "天災は警戒が薄れた頃に突然やってくるので、常に備えておくことが大切だということ。",
            example: "災害は忘れた頃にやってくる、平和な時期こそ防災の備えを見直そう。", category: .nature),

    // MARK: - さ行追加 (ids 470-476)

    Proverb(id: 470, text: "細工は流々仕上げを御覧じろ", reading: "さいくはりゅうりゅうしあげをごらんじろ",
            meaning: "仕事の仕方はさまざまあるが、大事なのは結果だから、仕上がりを見てから評価せよということ。",
            example: "細工は流々仕上げを御覧じろ、途中で口を出さず完成まで待ってもらった。", category: .action),

    Proverb(id: 471, text: "歳月人を待たず", reading: "さいげつひとをまたず",
            meaning: "月日が経つのは早く、人が準備できるのを待ってはくれないということ。",
            example: "歳月人を待たず、気づけば定年まであと数年になっていた。", category: .nature),

    Proverb(id: 472, text: "先んずれば人を制す", reading: "さきんずればひとをせいす",
            meaning: "他より先に行動することで、相手より有利な立場に立てるということ。",
            example: "先んずれば人を制すで、ライバルより早く特許を申請した。", category: .action),

    Proverb(id: 473, text: "策士策に溺れる", reading: "さくしさくにおぼれる",
            meaning: "策略を多く用いる者は、自分の策を弄しすぎて失敗するということ。",
            example: "策士策に溺れるとはよく言ったもので、複雑な計略が裏目に出た。", category: .action),

    Proverb(id: 474, text: "酒は百薬の長", reading: "さけはひゃくやくのちょう",
            meaning: "適量の酒は、どんな薬よりも体に良いということ。",
            example: "酒は百薬の長というが、飲みすぎは逆効果なので適量を心がけている。", category: .action),

    Proverb(id: 475, text: "去る者は日々に疎し", reading: "さるものはひびにうとし",
            meaning: "死者や遠方に去った者は、時間とともに忘れられ疎遠になっていくということ。",
            example: "去る者は日々に疎し、転勤した同僚とも最近は連絡を取らなくなった。", category: .relationships),

    Proverb(id: 476, text: "山椒は小粒でもぴりりと辛い", reading: "さんしょはこつぶでもぴりりとからい",
            meaning: "体は小さくても、気性が強く侮れない人のたとえ。",
            example: "山椒は小粒でもぴりりと辛い、小柄な彼女の発言はいつも核心をつく。", category: .wisdom),

    // MARK: - し行追加 (ids 477-487)

    Proverb(id: 477, text: "地獄で仏", reading: "じごくでほとけ",
            meaning: "非常に苦しい状況の中で、思いがけず助けを得ることのたとえ。",
            example: "地獄で仏とはこのことで、困り果てた時に旧友が救いの手を差し伸べてくれた。", category: .luck),

    Proverb(id: 478, text: "地獄の沙汰も金次第", reading: "じごくのさたもかねしだい",
            meaning: "この世はすべてお金の力次第で左右されるということ。",
            example: "地獄の沙汰も金次第というが、弁護士費用が払えず不利な状況になった。", category: .action),

    Proverb(id: 479, text: "事実は小説より奇なり", reading: "じじつはしょうせつよりきなり",
            meaning: "現実に起こる出来事は、フィクションよりも奇妙で不思議なことがあるということ。",
            example: "事実は小説より奇なり、あの偶然の出会いは誰も信じてくれない。", category: .wisdom),

    Proverb(id: 480, text: "地震雷火事親父", reading: "じしんかみなりかじおやじ",
            meaning: "この世で恐ろしいものを順に挙げた言葉。",
            example: "地震雷火事親父というが、現代では親父の権威もずいぶん薄れた。", category: .nature),

    Proverb(id: 481, text: "子孫に美田を残さず", reading: "しそんにびでんをのこさず",
            meaning: "子孫に財産を残してやると、子どもが依存して自立心を失うから残さない方がよいということ。",
            example: "子孫に美田を残さず、子どもには財産より知恵と精神を残したい。", category: .wisdom),

    Proverb(id: 482, text: "弱肉強食", reading: "じゃくにくきょうしょく",
            meaning: "弱いものが強いものの餌食になり、強者だけが栄えること。",
            example: "ビジネスの世界は弱肉強食、実力なければ淘汰されるのは世の常だ。", category: .action),

    Proverb(id: 483, text: "蛇の道は蛇", reading: "じゃのみちはへび",
            meaning: "同類のことは同じ仲間がよく知っているということ。",
            example: "蛇の道は蛇というように、業界のことは業界人に聞くのが一番だ。", category: .wisdom),

    Proverb(id: 484, text: "十人十色", reading: "じゅうにんといろ",
            meaning: "人はそれぞれ好みや考えが違い、みな同じではないということ。",
            example: "十人十色、同じ映画を見ても感想はみんなバラバラだった。", category: .wisdom),

    Proverb(id: 485, text: "柔よく剛を制す", reading: "じゅうよくごうをせいす",
            meaning: "しなやかで柔軟なものは、かたくて強いものを制することができるということ。",
            example: "柔よく剛を制す、相手の力を利用する柔道の技法はまさにこれだ。", category: .action),

    Proverb(id: 486, text: "正直の頭に神宿る", reading: "しょうじきのこうべにかみやどる",
            meaning: "正直に生きる人には、神様の加護があるということ。",
            example: "正直の頭に神宿るというから、嘘をつかず誠実に行動してきた。", category: .action),

    Proverb(id: 487, text: "小人閑居して不善をなす", reading: "しょうじんかんきょしてふぜんをなす",
            meaning: "品性の低い者が暇になると、ろくでもないことをするということ。",
            example: "小人閑居して不善をなすというから、いつでも何かに打ち込んでいるようにした。", category: .action),

    Proverb(id: 488, text: "上手の手から水が漏る", reading: "じょうずのてからみずがもる",
            meaning: "名人や達人でも時には失敗することがあるということ。",
            example: "上手の手から水が漏る、ベテランの料理人でも時々失敗することがある。", category: .wisdom),

    Proverb(id: 489, text: "少年よ大志を抱け", reading: "しょうねんよたいしをいだけ",
            meaning: "若者は大きな志をもって生きるべきだということ。",
            example: "少年よ大志を抱け、夢を持って努力することが若さの特権だ。", category: .effort),

    Proverb(id: 490, text: "勝敗は時の運", reading: "しょうはいはときのうん",
            meaning: "勝ち負けは実力だけでなく、その時の運に左右されることもあるということ。",
            example: "勝敗は時の運とはいえ、実力を磨いておくことが大切だ。", category: .luck),

    // MARK: - す行追加 (ids 491-494)

    Proverb(id: 491, text: "好きこそものの上手なれ", reading: "すきこそもののじょうずなれ",
            meaning: "好きなことこそが物事の上達の近道だということ。",
            example: "好きこそものの上手なれ、絵が好きで描き続けていたら自然と上達した。", category: .effort),

    Proverb(id: 492, text: "雀百まで踊り忘れず", reading: "すずめひゃくまでおどりわすれず",
            meaning: "幼い頃に身についた習慣や癖は、年老いても変わらないということ。",
            example: "雀百まで踊り忘れず、長年の悪習慣はなかなか直せない。", category: .action),

    Proverb(id: 493, text: "すべての道はローマに通ず", reading: "すべてのみちはろーまにつうず",
            meaning: "どんな方法や手段をとっても、目的は同じところに行き着くということ。",
            example: "すべての道はローマに通ずというように、やり方は違っても目標は同じだ。", category: .wisdom),

    Proverb(id: 494, text: "住めば都", reading: "すめばみやこ",
            meaning: "どんな不便な場所でも、住み慣れれば居心地がよくなるということ。",
            example: "住めば都というが、最初は不便だった田舎暮らしにもすっかり慣れた。", category: .action),

    // MARK: - せ行追加 (ids 495-497)

    Proverb(id: 495, text: "栴檀は双葉より芳し", reading: "せんだんはふたばよりかんばし",
            meaning: "大成する人物は幼い頃から常人とは違う優れた片鱗を見せるということ。",
            example: "栴檀は双葉より芳し、幼少期から才能を発揮していた。", category: .effort),

    Proverb(id: 496, text: "前門の虎後門の狼", reading: "ぜんもんのとらこうもんのおおかみ",
            meaning: "一つの災難を逃れても、すぐに別の災難に遭遇すること。",
            example: "前門の虎後門の狼で、ひとつのトラブルが解決したら別の問題が起きた。", category: .action),

    Proverb(id: 497, text: "背に腹はかえられぬ", reading: "せにはらはかえられぬ",
            meaning: "大切なことのためには、他のことを犠牲にしなければならないということ。",
            example: "背に腹はかえられぬ、生活のために苦手な仕事も引き受けた。", category: .action),

    // MARK: - そ行追加 (ids 498-500)

    Proverb(id: 498, text: "惣領の甚六", reading: "そうりょうのじんろく",
            meaning: "長子はお人好しで愚鈍なところがあるということ。",
            example: "惣領の甚六というが、長男の彼はたしかにおっとりとした性格だ。", category: .relationships),

    Proverb(id: 499, text: "底もあれば蓋もある", reading: "そこもあればふたもある",
            meaning: "いろいろと込み入った事情があり、物事が簡単にはゆかないということ。",
            example: "底もあれば蓋もあるというように、あの問題には複雑な背景がある。", category: .wisdom),

    Proverb(id: 500, text: "損して得取れ", reading: "そんしてとくとれ",
            meaning: "目先の少しの損をしても、のちにより大きな利益を得るようにするということ。",
            example: "損して得取れ、今回は赤字でも長期的な関係を築くことを優先した。", category: .action),

    // MARK: - た行 (ids 501-565)

    Proverb(id: 501, text: "大海は芥を択ばず", reading: "たいかいはあくたをえらばず",
            meaning: "広大な心を持つ人は、細かいことにこだわらず、何でも受け入れるということ。",
            example: "大海は芥を択ばずというように、器の大きいリーダーはどんな意見も受け入れる。", category: .action),

    Proverb(id: 502, text: "大海を手で塞ぐ", reading: "たいかいをてでふさぐ",
            meaning: "とてもできそうもないことをしようとすること。",
            example: "大海を手で塞ぐような無謀な計画だと言われたが、彼は諦めなかった。", category: .action),

    Proverb(id: 503, text: "対岸の火事", reading: "たいがんのかじ",
            meaning: "自分とは関係のない出来事として、のんきに傍観していること。",
            example: "業界全体の問題を対岸の火事と思っていたら、ついに自社にも影響が出た。", category: .action),

    Proverb(id: 504, text: "大魚は支流に泳がず", reading: "たいぎょはしりゅうにおよがず",
            meaning: "優れた人物は小さな組織に留まらず、大きな場所で活躍するということ。",
            example: "大魚は支流に泳がずというから、彼は地方を離れて大都市で活躍している。", category: .action),

    Proverb(id: 505, text: "大軍に関所なし", reading: "たいぐんにせきしょなし",
            meaning: "大きな勢力の前には、どんな障害も役に立たないということ。",
            example: "大軍に関所なしで、大企業の参入を前に中小の競合は次々と撤退した。", category: .action),

    Proverb(id: 506, text: "大黒柱を蟻がせせる", reading: "だいこくばしらをありがせせる",
            meaning: "小さな者が大きく強い者に立ち向かおうとする無謀さのたとえ。",
            example: "大黒柱を蟻がせせるようなものだと笑われたが、彼らは改革を諦めなかった。", category: .action),

    Proverb(id: 507, text: "大根おろしに医者いらず", reading: "だいこんおろしにいしゃいらず",
            meaning: "大根おろしは消化を助けるなど健康によく、食べれば医者が不要なほど体によいということ。",
            example: "大根おろしに医者いらずというし、毎食大根を食べて健康を維持している。", category: .nature),

    Proverb(id: 508, text: "大根を正宗で切る", reading: "だいこんをまさむねできる",
            meaning: "価値のないものに高価なものを使うことの無駄のたとえ。",
            example: "大根を正宗で切るようなもので、そんな簡単な仕事に専門家を呼ぶ必要はない。", category: .action),

    Proverb(id: 509, text: "大山は土壌を譲らず", reading: "たいざんはどじょうをゆずらず",
            meaning: "大人物は細かいことにこだわらず、何でも受け入れる広い心を持つということ。",
            example: "大山は土壌を譲らずというから、器の大きな人間はどんな批判も受け止める。", category: .nature),

    Proverb(id: 510, text: "泰山鳴動して鼠一匹", reading: "たいざんめいどうしてねずみいっぴき",
            meaning: "大げさな騒ぎの割には、結果がひどく小さいことのたとえ。",
            example: "泰山鳴動して鼠一匹、大々的な発表の割には新製品の内容が期待外れだった。", category: .action),

    Proverb(id: 511, text: "大事の前の小事", reading: "だいじのまえのしょうじ",
            meaning: "大きな目的を達成するためには、小さなことも大切にしなければならないということ。",
            example: "大事の前の小事、大切な試合の前に用具の点検を怠らなかった。", category: .action),

    Proverb(id: 512, text: "大事は小事より起る", reading: "だいじはしょうじよりおこる",
            meaning: "大きな問題や事故は、小さなことの積み重ねや些細なことから生じるということ。",
            example: "大事は小事より起るというから、細かいことも軽視せずに対処することが大切だ。", category: .action),

    Proverb(id: 513, text: "大豆は畑の肉", reading: "だいずははたけのにく",
            meaning: "大豆は肉に劣らない栄養を含む優れた食品であるということ。",
            example: "大豆は畑の肉というから、菜食でも豆類を中心にすれば十分な栄養が取れる。", category: .nature),

    Proverb(id: 514, text: "大道廃れて仁義あり", reading: "だいどうすたれてじんぎあり",
            meaning: "社会の秩序が乱れたとき、初めて道徳や仁義の必要性が言われるようになるということ。",
            example: "大道廃れて仁義ありというか、世の中が乱れてきてようやく礼節が見直された。", category: .wisdom),

    Proverb(id: 515, text: "鯛なくば狗母魚", reading: "たいなくばえそ",
            meaning: "最上のものがなければ、それに近いものでもよいとすること。",
            example: "鯛なくば狗母魚というように、一流の選手がいなければ次の候補を育てるしかない。", category: .action),

    Proverb(id: 516, text: "鯛の尾より鰯の頭", reading: "たいのおよりいわしのあたま",
            meaning: "大きな組織の末端にいるより、小さな組織のトップにいる方がよいということ。",
            example: "鯛の尾より鰯の頭というから、大企業の平社員より小さな会社の幹部を選んだ。", category: .action),

    Proverb(id: 517, text: "大は小を兼ねる", reading: "だいはしょうをかねる",
            meaning: "大きいものは小さいものの代わりにも使えるので、大きい方を選んでおけば便利だということ。",
            example: "大は小を兼ねるから、バッグはひとまわり大きいものを買った。", category: .action),

    Proverb(id: 518, text: "大木は風に折られる", reading: "たいぼくはかぜにおられる",
            meaning: "大きな力や地位を持つ者は、かえって攻撃の目標になりやすいということ。",
            example: "大木は風に折られるというから、目立ちすぎることは危険でもある。", category: .action),

    Proverb(id: 519, text: "高嶺の花", reading: "たかねのはな",
            meaning: "高いところに咲く花のように、眺めることはできても、手の届かないものや人のたとえ。",
            example: "あの有名女優は自分にとって高嶺の花だと思っていたが、思い切って話しかけてみた。", category: .nature),

    Proverb(id: 520, text: "鷹は飢えても穂は摘まず", reading: "たかはうえてもほはつまず",
            meaning: "品格のある人は、いかに困窮していても誇りを捨てて卑しいことはしないということ。",
            example: "鷹は飢えても穂は摘まずというように、彼はどんなに苦しくても不正に手を染めなかった。", category: .action),

    Proverb(id: 521, text: "宝の持ち腐れ", reading: "たからのもちぐされ",
            meaning: "優れた才能や道具を持ちながら、それを活用しないでいることのたとえ。",
            example: "語学力があるのに使わないのは宝の持ち腐れだと、海外プロジェクトに参加した。", category: .action),

    Proverb(id: 522, text: "宝の山へ入りながら手を空しくする", reading: "たからのやまへいりながらてをむなしくする",
            meaning: "せっかくよい機会や環境にいながら、何の成果も得られないで帰ること。",
            example: "宝の山へ入りながら手を空しくするとはこのことで、絶好のチャンスを生かせなかった。", category: .action),

    Proverb(id: 523, text: "薪を抱きて火を救う", reading: "たきをいだきてひをすくう",
            meaning: "害を除こうとして、かえってその害を大きくしてしまうこと。",
            example: "薪を抱きて火を救うようなもので、問題解決のつもりが事態を悪化させた。", category: .action),

    Proverb(id: 524, text: "筍親まさり", reading: "たけのこおやまさり",
            meaning: "子が親より優れていること。",
            example: "筍親まさりというように、息子はすでに父親の実力を超えた演奏家になった。", category: .wisdom),

    Proverb(id: 525, text: "竹を二つに割ったよう", reading: "たけをふたつにわったよう",
            meaning: "物事がはっきりしていて、清廉で裏表のないことのたとえ。",
            example: "彼女は竹を二つに割ったような性格で、常に正直に意見を言う。", category: .action),

    Proverb(id: 526, text: "出すものは舌を出すのもいや", reading: "だすものはしたをだすのもいや",
            meaning: "非常にけちで、何でも出し惜しみすること。",
            example: "あの会社は出すものは舌を出すのもいやというほどの経費削減で、社員が辟易している。", category: .action),

    Proverb(id: 527, text: "多勢に無勢", reading: "たぜいにぶぜい",
            meaning: "多い方に対して少ない方では、どうしても勝ち目がないということ。",
            example: "多勢に無勢で、少人数のチームが大企業相手に交渉しても太刀打ちできなかった。", category: .action),

    Proverb(id: 528, text: "叩かれた夜は寝やすい", reading: "たたかれたよるはねやすい",
            meaning: "叩かれた方が気持ちが楽になるという逆説的な意味。また、打たれ強い人は報復を恐れず安眠できるということ。",
            example: "叩かれた夜は寝やすいというか、批判されることで気持ちをすっきりさせることができた。", category: .wisdom),

    Proverb(id: 529, text: "ただより安いものはない", reading: "ただよりやすいものはない",
            meaning: "無料のものは後から何らかの代償を求められることが多く、かえって高くつくということ。",
            example: "ただより安いものはないと知っていたのに、無料サービスの罠にはまってしまった。", category: .wisdom),

    Proverb(id: 530, text: "立っている者は親でも使え", reading: "たっているものはおやでもつかえ",
            meaning: "急ぎの仕事には、そこにいる人を誰でも使うべきだということ。",
            example: "立っている者は親でも使えというから、通りかかった部長にも手伝ってもらった。", category: .action),

    Proverb(id: 531, text: "立ち寄らば大木の陰", reading: "たちよらばたいぼくのかげ",
            meaning: "どうせ頼るなら、力のある人や大きな組織を頼るべきだということ。",
            example: "立ち寄らば大木の陰というから、業界最大手の企業と提携することにした。", category: .action),

    Proverb(id: 532, text: "尊い寺は門から知れる", reading: "たっといてらはもんからしれる",
            meaning: "優れたものや人は、外見からその内容の素晴らしさが分かるということ。",
            example: "尊い寺は門から知れるで、受付での丁寧な対応を見てその会社の質の高さが分かった。", category: .wisdom),

    Proverb(id: 533, text: "立板に水", reading: "たていたにみず",
            meaning: "なめらかに話すこと。言葉が澱みなく流れるように話すさま。",
            example: "立板に水のごとく説明する彼女のプレゼンは、聴衆を引き込んだ。", category: .wisdom),

    Proverb(id: 534, text: "伊達の薄着", reading: "だてのうすぎ",
            meaning: "寒い中でも薄着をして平気を装うこと。見栄を張ることのたとえ。",
            example: "伊達の薄着をしているのか、真冬でも薄手のジャケット一枚で出かけた。", category: .action),

    Proverb(id: 535, text: "立てば芍薬座れば牡丹", reading: "たてばしゃくやくすわればぼたん",
            meaning: "美人の姿をいろいろな場面に例えて賞賛する言葉。",
            example: "立てば芍薬座れば牡丹というような美しさで、どんな場所でも注目を集めた。", category: .nature),

    Proverb(id: 536, text: "立てば歩めの親心", reading: "たてばあゆめのおやごころ",
            meaning: "親はわが子の成長を絶えず願うものだということ。",
            example: "立てば歩めの親心というように、子供の一歩一歩の成長が親には何より嬉しい。", category: .relationships),

    Proverb(id: 537, text: "縦のものを横にもしない", reading: "たてのものをよこにもしない",
            meaning: "非常に怠惰で、ほんの少しの動作さえ面倒がること。",
            example: "縦のものを横にもしない怠け者と言われていたが、好きなことには猛然と取り組む。", category: .action),

    Proverb(id: 538, text: "譬えに嘘なし坊主に毛なし", reading: "たとえにうそなしぼうずにけなし",
            meaning: "ことわざに嘘はない、坊主に毛がないのと同じくらい確かなことだということ。",
            example: "譬えに嘘なし坊主に毛なしというから、ことわざの教えに従って行動した。", category: .wisdom),

    Proverb(id: 539, text: "棚から落ちた達磨", reading: "たなからおちただるま",
            meaning: "思いがけなく物事がうまくいったり、幸運が舞い込んでくること。",
            example: "棚から落ちた達磨というか、応募もしていない会社からスカウトの電話が来た。", category: .luck),

    Proverb(id: 540, text: "他人の疝気を頭痛に病む", reading: "たにんのせんきをずつうにやむ",
            meaning: "自分と関係のない他人のことを、必要以上に心配すること。",
            example: "他人の疝気を頭痛に病んでいても仕方ない、まず自分のことを解決しよう。", category: .action),

    Proverb(id: 541, text: "他人の空似", reading: "たにんのそらに",
            meaning: "血縁関係がまったくないのに、顔がよく似ていること。",
            example: "他人の空似というべきか、全く知らない外国人が親友にそっくりで驚いた。", category: .nature),

    Proverb(id: 542, text: "他人の念仏で極楽参り", reading: "たにんのねんぶつでごくらくまいり",
            meaning: "他人の力や努力に乗っかって、自分は何もせずに利益を得ること。",
            example: "他人の念仏で極楽参りのようなことばかりしていると、いつか信頼を失う。", category: .wisdom),

    Proverb(id: 543, text: "他人の飯には刺がある", reading: "たにんのめしにはとげがある",
            meaning: "他人の世話になって食べる飯は、心が落ち着かず辛いものだということ。",
            example: "他人の飯には刺があるから、早く独立して自分の力で生活したい。", category: .emotion),

    Proverb(id: 544, text: "狸から上前", reading: "たぬきからうわまえ",
            meaning: "まだ手に入っていないものから利益を取ろうとする、見込みが外れること。",
            example: "狸から上前を取ろうとするようなもので、まだ成功もしていないのに報酬の話をしている。", category: .action),

    Proverb(id: 545, text: "頼む木の下に雨漏る", reading: "たのむきのしたにあまもる",
            meaning: "頼りにしていたものが当てにならず、かえって災いを受けること。",
            example: "頼む木の下に雨漏るというか、信頼していた上司に裏切られてしまった。", category: .luck),

    Proverb(id: 546, text: "旅は憂いもの辛いもの", reading: "たびはうれいものつらいもの",
            meaning: "旅は楽しいばかりでなく、苦労も多いということ。",
            example: "旅は憂いもの辛いものというが、それも含めて旅の醍醐味だと感じた。", category: .emotion),

    Proverb(id: 547, text: "食べてすぐ寝ると牛になる", reading: "たべてすぐねるとうしになる",
            meaning: "食後すぐ横になることを戒める言葉。消化に悪いとされている。",
            example: "食べてすぐ寝ると牛になると言われながらも、昼食後のうたた寝が習慣になった。", category: .wisdom),

    Proverb(id: 548, text: "食べ物の恨みは恐ろしい", reading: "たべもののうらみはおそろしい",
            meaning: "食べ物に関係する恨みは根が深く、後々まで怖いということ。",
            example: "食べ物の恨みは恐ろしいというから、お弁当を盗み食いしたのがバレてひどく責められた。", category: .emotion),

    Proverb(id: 549, text: "卵に目鼻", reading: "たまごにめはな",
            meaning: "卵のように丸くて色白い顔に目鼻が整っていること。清楚で可愛い顔立ちのたとえ。",
            example: "卵に目鼻のような可愛らしい顔立ちで、周りの注目を集めた。", category: .nature),

    Proverb(id: 550, text: "卵を盗む者は牛も盗む", reading: "たまごをぬすむものはうしもぬすむ",
            meaning: "小さな悪事を働く者は、やがて大きな悪事も働くようになるということ。",
            example: "卵を盗む者は牛も盗むというから、小さな不正も見逃してはいけない。", category: .action),

    Proverb(id: 551, text: "騙すに手なし", reading: "だますにてなし",
            meaning: "相手が騙そうとしてかかってきたとき、どんなに警戒しても防ぎようがないということ。",
            example: "騙すに手なしというが、詐欺の手口は巧妙で防ぐのは難しい。", category: .action),

    Proverb(id: 552, text: "玉に瑕", reading: "たまにきず",
            meaning: "ほぼ完全に優れているが、ほんのわずかな欠点や欠陥があること。",
            example: "彼は実力も人柄も申し分ないが、玉に瑕、時間にルーズなところがある。", category: .action),

    Proverb(id: 553, text: "玉磨かざれば光なし", reading: "たまみがかざればひかりなし",
            meaning: "どんな素晴らしい才能も、努力して磨かなければ輝くことはできないということ。",
            example: "玉磨かざれば光なし、天才と言われる人も日々の鍛錬を怠らない。", category: .effort),

    Proverb(id: 554, text: "黙り虫壁を通す", reading: "だまりむしかべをとおす",
            meaning: "黙ってこつこつと努力を続ける者は、最終的に大きなことを成し遂げるということ。",
            example: "黙り虫壁を通すというように、地道に続けた研究がついに成果を上げた。", category: .action),

    Proverb(id: 555, text: "矯めるなら若木のうち", reading: "ためるならわかぎのうち",
            meaning: "人の性格や癖を矯正するなら、若いうちに行わなければならないということ。",
            example: "矯めるなら若木のうちというから、子供のうちに礼儀をきちんと教えることが大切だ。", category: .action),

    Proverb(id: 556, text: "便りのないのはよい便り", reading: "たよりのないのはよいたより",
            meaning: "何も連絡がないのは、無事でいる証拠だということ。",
            example: "便りのないのはよい便りというから、心配せずに旅行を楽しんでくればいい。", category: .action),

    Proverb(id: 557, text: "足らず余らず三人", reading: "たらずあまらずさんにん",
            meaning: "子供が三人いれば、多すぎず少なすぎず、家族として理想的だということ。",
            example: "足らず余らず三人というから、三人きょうだいで育った彼女は豊かな人間関係を築いている。", category: .wisdom),

    Proverb(id: 558, text: "断じて行えば鬼神もこれを避く", reading: "だんじておこなえばきしんもこれをさく",
            meaning: "強固な決意をもって実行すれば、いかなる困難も乗り越えられるということ。",
            example: "断じて行えば鬼神もこれを避くというように、強い意志で難局を乗り越えた。", category: .action),

    // MARK: - ち行 (ids 559-578)

    Proverb(id: 559, text: "小さくても針は呑まれぬ", reading: "ちいさくてもはりはのまれぬ",
            meaning: "小さくても油断できないもの、危険なものがあるということ。",
            example: "小さくても針は呑まれぬというから、小さな会社でも侮れない技術を持っている。", category: .wisdom),

    Proverb(id: 560, text: "地位は人を作る", reading: "ちいはひとをつくる",
            meaning: "ある地位や役職につくことで、その人の人格や能力が育まれるということ。",
            example: "地位は人を作るというように、部長に昇進してから彼は責任感が増した。", category: .wisdom),

    Proverb(id: 561, text: "父父たり子子たり", reading: "ちちちたりここたり",
            meaning: "父は父としての役割をきちんと果たし、子は子としての役割を果たすこと。",
            example: "父父たり子子たりとあるように、各自が自分の役割をしっかり果たすことで家族は安定する。", category: .relationships),

    Proverb(id: 562, text: "治にいて乱を忘れず", reading: "ちにいてらんをわすれず",
            meaning: "平和で安定した時代にも、乱世に備えを怠ってはいけないということ。",
            example: "治にいて乱を忘れずというから、好況のうちに不況への備えを怠らなかった。", category: .action),

    Proverb(id: 563, text: "血で血を洗う", reading: "ちでちをあらう",
            meaning: "血縁関係にある者同士が争ったり、悪事を悪事で報いること。",
            example: "血で血を洗う争いが続き、ついに一族の間に修復できない亀裂が生じた。", category: .action),

    Proverb(id: 564, text: "血は水より濃し", reading: "ちはみずよりこし",
            meaning: "血縁の親族は、他のどんな縁よりも深いつながりがあるということ。",
            example: "血は水より濃しというが、どんな時でも家族は助け合うものだと実感した。", category: .relationships),

    Proverb(id: 565, text: "茶碗を投げば綿で抱えよ", reading: "ちゃわんをなげばわたでかかえよ",
            meaning: "相手が怒って激しく出てきたら、柔らかく受けとめて和らげるのがよいということ。",
            example: "茶碗を投げば綿で抱えよというように、クレームには穏やかに対応して収めた。", category: .wisdom),

    Proverb(id: 566, text: "中原に鹿を逐う", reading: "ちゅうげんにしかをおう",
            meaning: "天下を制するために争うこと。最高の地位や権力を得るために競争すること。",
            example: "中原に鹿を逐うが如く、各社が市場シェアの首位を争っている。", category: .action),

    Proverb(id: 567, text: "忠臣は二君に仕えず", reading: "ちゅうしんはにくんにつかえず",
            meaning: "忠実な臣下は一人の主君だけに仕えるものであるということ。",
            example: "忠臣は二君に仕えずというから、転職の多い彼を快く思わない人もいた。", category: .action),

    Proverb(id: 568, text: "忠言耳に逆らう", reading: "ちゅうげんみにさからう",
            meaning: "正しい忠告は、聞く者には耳が痛く、なかなか素直に受け入れられないということ。",
            example: "忠言耳に逆らうというが、厳しいアドバイスこそが成長につながると気づいた。", category: .wisdom),

    Proverb(id: 569, text: "中流に船を失えば一瓢も千金", reading: "ちゅうりゅうにふねをうしなえばいっぴょうもせんきん",
            meaning: "緊急の場合には、普段は価値のないものでも大変役に立つということ。",
            example: "中流に船を失えば一瓢も千金というように、非常時には普通の道具が命綱になる。", category: .action),

    Proverb(id: 570, text: "寵愛高じて尼になる", reading: "ちょうあいこうじてあまになる",
            meaning: "過度に溺愛した結果、かえって相手のためにならない結果を招くこと。",
            example: "寵愛高じて尼になるというから、子供への愛情も過剰になれば毒になる。", category: .action),

    Proverb(id: 571, text: "朝三暮四", reading: "ちょうさんぼし",
            meaning: "目先の違いにこだわって、結果が同じであることに気づかないこと。また、人を甘い言葉で巧みに操ること。",
            example: "朝三暮四の提案をされたが、よく考えると結局同じ総額だと気づいた。", category: .wisdom),

    Proverb(id: 572, text: "長者の万灯より貧者の一灯", reading: "ちょうじゃのまんとうよりひんじゃのいっとう",
            meaning: "豊かな者の形式的な施しより、貧しい者の真心のこもった小さな施しの方が価値があるということ。",
            example: "長者の万灯より貧者の一灯というから、誠意のある小さな贈り物の方が心に響く。", category: .wisdom),

    Proverb(id: 573, text: "提灯に釣鐘", reading: "ちょうちんにつりがね",
            meaning: "つり合いがとれていないこと。大きさや重さが不釣り合いなもののたとえ。",
            example: "提灯に釣鐘というような組み合わせで、あの二人の体格差には驚いた。", category: .action),

    Proverb(id: 574, text: "提灯持川へはまる", reading: "ちょうちんもちかわへはまる",
            meaning: "人の先導をする役が、かえって失敗して周りに迷惑をかけること。",
            example: "提灯持川へはまるとはこのことで、案内役の彼がまず迷子になってしまった。", category: .luck),

    Proverb(id: 575, text: "頂門の一針", reading: "ちょうもんのいっしん",
            meaning: "急所をつく鋭い戒め。急所を突くような厳しいが的確な忠告のこと。",
            example: "頂門の一針とも言える指摘を受け、自分の甘さを痛感した。", category: .wisdom),

    Proverb(id: 576, text: "蝶よ花よ", reading: "ちょうよはなよ",
            meaning: "子供、特に娘を大切にかわいがって育てること。",
            example: "蝶よ花よと育てられた彼女は、初めて苦労に直面して戸惑っていた。", category: .relationships),

    Proverb(id: 577, text: "ちょっと誉めたが身のつまり", reading: "ちょっとほめたがみのつまり",
            meaning: "ちょっと誉めてやったために、その後ずっと頼まれてしまうような羽目になること。",
            example: "ちょっと誉めたが身のつまりというように、料理を褒めたら毎回持ってくるようになった。", category: .emotion),

    Proverb(id: 578, text: "珍談も再び語れば味わいなし", reading: "ちんだんもふたびかたればあじわいなし",
            meaning: "面白い話も繰り返し聞かされると、もう面白くないということ。",
            example: "珍談も再び語れば味わいなしというように、同じ武勇伝を何度も聞かされて飽きてきた。", category: .wisdom),

    // MARK: - つ行 (ids 579-594)

    Proverb(id: 579, text: "追従も世渡り", reading: "ついしょうもよわたり",
            meaning: "おべっかを使うことも、世の中をうまく渡っていくための知恵だということ。",
            example: "追従も世渡りというから、時には上手に上司を立てることも仕事のうちだ。", category: .wisdom),

    Proverb(id: 580, text: "使う者は使われる", reading: "つかうものはつかわれる",
            meaning: "人を使う立場にある者も、また別の誰かに使われているということ。",
            example: "使う者は使われるというが、部下を持つ彼も上からの指示に従わなければならない。", category: .wisdom),

    Proverb(id: 581, text: "月と鼈", reading: "つきとすっぽん",
            meaning: "似ているように見えても、実際にはまったく違うこと。天と地ほどの差があること。",
            example: "本物と偽物では月と鼈ほどの差があり、素人目にも一目瞭然だった。", category: .action),

    Proverb(id: 582, text: "月夜に釜を抜かれる", reading: "つきよにかまをぬかれる",
            meaning: "油断して大切なものを盗まれること。",
            example: "月夜に釜を抜かれるような油断をしていると、いつか大切なものを失う。", category: .action),

    Proverb(id: 583, text: "月夜に米の飯", reading: "つきよにこめのめし",
            meaning: "うまい具合にできて、都合がいいこと。",
            example: "月夜に米の飯というような好条件が重なり、計画は順調に進んだ。", category: .action),

    Proverb(id: 584, text: "土一升金一升", reading: "つちいっしょうきんいっしょう",
            meaning: "土地がいかに貴重で高価なものかということ。特に都市部の土地の高さを言う。",
            example: "土一升金一升というが、都心のマンションの値段には驚かされる。", category: .action),

    Proverb(id: 585, text: "槌で庭掃く", reading: "つちでにわはく",
            meaning: "大げさな準備や手段を使って、たいしたことのない仕事をすること。",
            example: "槌で庭掃くようなもので、ちょっとした問題に大げさな対策を取ってしまった。", category: .action),

    Proverb(id: 586, text: "土仏の水遊び", reading: "つちぼとけのみずあそび",
            meaning: "自分で自分を危険にさらすようなことをすること。",
            example: "土仏の水遊びのようなもので、危険を顧みずに無謀な挑戦を続けた。", category: .action),

    Proverb(id: 587, text: "釣った魚に餌はやらぬ", reading: "つったさかなにえさはやらぬ",
            meaning: "目的を達成した後は、それまで気を使っていた相手をぞんざいに扱うようになること。",
            example: "釣った魚に餌はやらぬというか、結婚後は記念日すら気にしなくなった。", category: .relationships),

    Proverb(id: 588, text: "角を矯めて牛を殺す", reading: "つのをためてうしをころす",
            meaning: "小さな欠点を直そうとして、かえって全体をダメにしてしまうこと。",
            example: "角を矯めて牛を殺すことのないよう、細部にこだわりすぎず全体のバランスを見た。", category: .action),

    Proverb(id: 589, text: "罪を憎んで人を憎まず", reading: "つみをにくんでひとをにくまず",
            meaning: "人が犯した罪は憎むべきだが、罪を犯した人そのものは憎むべきではないということ。",
            example: "罪を憎んで人を憎まずという精神で、被告人を更生させることに力を注いだ。", category: .wisdom),

    Proverb(id: 590, text: "爪で拾って箕でこぼす", reading: "つめでひろってみでこぼす",
            meaning: "苦労して少しずつ貯めたものを、一度に大量に無駄遣いしてしまうこと。",
            example: "爪で拾って箕でこぼすようなもので、長年の貯金を一度の投資で失った。", category: .action),

    Proverb(id: 591, text: "爪に火を灯す", reading: "つめにひをともす",
            meaning: "非常に倹約して生活すること。灯火代を節約するため爪に火を灯すほど贅沢しないこと。",
            example: "爪に火を灯すような倹約生活を続けて、ついにマイホームの頭金を貯めた。", category: .action),

    Proverb(id: 592, text: "釣り合わぬは不縁の元", reading: "つりあわぬはふえんのもと",
            meaning: "身分や財産、境遇などが釣り合わない縁組は、うまくいかないもとになるということ。",
            example: "釣り合わぬは不縁の元というが、二人の価値観の違いが離婚の原因になった。", category: .relationships),

    Proverb(id: 593, text: "釣り落とした魚は大きい", reading: "つりおとしたさかなはおおきい",
            meaning: "逃してしまったものは、実際より大きく、よいものに思えるということ。",
            example: "釣り落とした魚は大きいというか、断った仕事が後で大成功したと聞いて悔しくなった。", category: .action),

    Proverb(id: 594, text: "鶴の一声", reading: "つるのひとこえ",
            meaning: "多くの人が議論している場で、権威ある人が一言発することで、その場がまとまること。",
            example: "会議が紛糾していたが、社長の鶴の一声で全員が納得した。", category: .action),

    Proverb(id: 595, text: "鶴は千年亀は万年", reading: "つるはせんねんかめはまんねん",
            meaning: "鶴と亀はともに長寿の象徴であり、長生きを祝うときに使う言葉。",
            example: "鶴は千年亀は万年と、百歳のお祝いの席で長寿を祝った。", category: .luck),

    // MARK: - て行 (ids 596-616)

    Proverb(id: 596, text: "亭主の好きな赤烏帽子", reading: "ていしゅのすきなあかえぼし",
            meaning: "主人や夫の好みには、どんなにおかしなことでも従わなければならないということ。",
            example: "亭主の好きな赤烏帽子というから、夫の趣味のインテリアに合わせることにした。", category: .relationships),

    Proverb(id: 597, text: "亭主は元気で留守がいい", reading: "ていしゅはげんきでるすがいい",
            meaning: "夫は健康であることが一番で、家にいない方が妻にとっては好都合だということ。",
            example: "亭主は元気で留守がいいと笑いながら、夫の長期出張を喜ぶ妻の姿があった。", category: .relationships),

    Proverb(id: 598, text: "泥中の蓮", reading: "でいちゅうのはす",
            meaning: "汚れた環境の中にいても、清らかさや気高さを保つことができること。",
            example: "泥中の蓮のように、劣悪な環境の中でも誠実さを失わずに働き続けた。", category: .nature),

    Proverb(id: 599, text: "敵に味方あり味方に敵あり", reading: "てきにみかたありみかたにてきあり",
            meaning: "敵の中にも味方になってくれる者がいるし、味方の中にも裏切り者がいるということ。",
            example: "敵に味方あり味方に敵ありというから、人間関係は油断できない。", category: .action),

    Proverb(id: 600, text: "敵は本能寺にあり", reading: "てきはほんのうじにあり",
            meaning: "真の目的は別のところにあること。表向きの行動の真意が別にあること。",
            example: "敵は本能寺にありで、彼の本当の狙いは別の案件にあったと後で分かった。", category: .action),

    Proverb(id: 601, text: "敵もさるもの引っかくもの", reading: "てきもさるものひっかくもの",
            meaning: "相手も侮れない、なかなかしっかりした相手だということ。",
            example: "敵もさるもの引っかくもので、簡単に勝てると思っていた相手に苦戦した。", category: .action),

    Proverb(id: 602, text: "手ぐすね引く", reading: "てぐすねひく",
            meaning: "弦に松脂を塗って弓の準備をするように、十分に準備して待ち構えること。",
            example: "手ぐすね引いて待ち構えていたのに、肝心の相手が現れなかった。", category: .action),

    Proverb(id: 603, text: "手功より目功", reading: "てこうよりめこう",
            meaning: "手先の技術より、物を広く見渡す眼力の方が大切だということ。",
            example: "手功より目功というから、細かい作業より全体を俯瞰する視点を磨いた。", category: .wisdom),

    Proverb(id: 604, text: "手品するにも種がいる", reading: "てじなするにもたねがいる",
            meaning: "何事も、それを成し遂げるためには材料や準備が必要だということ。",
            example: "手品するにも種がいるというから、まず必要な道具や知識を揃えることが大切だ。", category: .action),

    Proverb(id: 605, text: "手出し十層倍", reading: "てだしじゅうそうばい",
            meaning: "喧嘩などで先に手を出した方が、後から十倍の損害を受けるということ。",
            example: "手出し十層倍というから、挑発されても先に手を出さないように我慢した。", category: .action),

    Proverb(id: 606, text: "手の平を返す", reading: "てのひらをかえす",
            meaning: "態度が急に変わること。前と正反対の態度を取ること。",
            example: "手の平を返すような態度の変わりように、周囲が驚いた。", category: .action),

    Proverb(id: 607, text: "出船あれば入船あり", reading: "でふねあればいりふねあり",
            meaning: "悲しいことがあれば喜ばしいこともあるというように、世の中にはいろいろなことがあるということ。",
            example: "出船あれば入船ありというように、別れがある一方で新しい出会いもある。", category: .luck),

    Proverb(id: 608, text: "出物腫物ところ嫌わず", reading: "でものはれものところきらわず",
            meaning: "おならや腫れ物は、場所を選ばずに出てくるということ。どんな場所でも起きることがあること。",
            example: "出物腫物ところ嫌わずというから、大事な会議中に体調が悪くなることもある。", category: .action),

    Proverb(id: 609, text: "寺から里", reading: "てらからさと",
            meaning: "物事の筋道が普通と逆になること。順序が逆になること。",
            example: "寺から里というような本末転倒で、報告書より実務が後回しになっていた。", category: .wisdom),

    Proverb(id: 610, text: "天災は忘れた頃にやってくる", reading: "てんさいはわすれたころにやってくる",
            meaning: "天災や大きな災害は、人々がその怖さを忘れた頃に再びやってくるということ。",
            example: "天災は忘れた頃にやってくるというから、日頃から防災の備えを欠かさないようにしている。", category: .wisdom),

    Proverb(id: 611, text: "天井三日底三年", reading: "てんじょうみっかそこさんねん",
            meaning: "相場が高値を維持するのは短く、底値が続くのは長いということ。物事の上昇は短く、低迷は長いたとえ。",
            example: "天井三日底三年というから、株価が上昇しているうちに利益を確定した。", category: .action),

    Proverb(id: 612, text: "天知る地知る我知る人知る", reading: "てんしるちしるわれしるひとしる",
            meaning: "悪事は必ず露見するものだということ。誰も知らないと思っても、天も地も知っているということ。",
            example: "天知る地知る我知る人知るというから、不正は必ずバレると肝に銘じた。", category: .wisdom),

    Proverb(id: 613, text: "転石苔を生ぜず", reading: "てんせきこけをしょうぜず",
            meaning: "頻繁に転職や転居を繰り返す者は、財産も信用も積み重ならないということ。",
            example: "転石苔を生ぜずというから、仕事を頻繁に変える前によく考えるべきだ。", category: .action),

    Proverb(id: 614, text: "天に口なし人をもって言わしむ", reading: "てんにくちなしひとをもっていわしむ",
            meaning: "天は口を持たないが、人の口を通してその意志を伝えるということ。",
            example: "天に口なし人をもって言わしむというように、周囲の批判は天の声かもしれない。", category: .wisdom),

    Proverb(id: 615, text: "天は二物を与えず", reading: "てんはにぶつをあたえず",
            meaning: "一人の人間が二つの才能や美点を兼ね備えることは少ないということ。",
            example: "天は二物を与えずというが、彼は頭脳明晰でスポーツも万能だった。", category: .wisdom),

    Proverb(id: 616, text: "天網恢恢疎にして漏らさず", reading: "てんもうかいかいそにしてもらさず",
            meaning: "天の網は大きく目が粗いようでいて、悪人を一人も漏らさず捕まえるということ。",
            example: "天網恢恢疎にして漏らさず、長年の脱税がついに発覚した。", category: .luck),

    // MARK: - と行 (ids 617-652)

    Proverb(id: 617, text: "同気相求む", reading: "どうきあいもとむ",
            meaning: "気質や考えが似た者同士は自然と引き合い、集まるということ。",
            example: "同気相求むというように、趣味の合う者同士は自然と仲よくなるものだ。", category: .relationships),

    Proverb(id: 618, text: "同舟相救う", reading: "どうしゅうあいすくう",
            meaning: "同じ場所や立場にいる者は、助け合うものだということ。",
            example: "同舟相救うというから、困難に直面したときはチーム全員で協力し合った。", category: .relationships),

    Proverb(id: 619, text: "灯心で竹の根を掘る", reading: "とうしんでたけのねをほる",
            meaning: "非常に時間のかかる、気の遠くなるような作業のたとえ。",
            example: "灯心で竹の根を掘るような根気のいる作業だったが、ついに完成させた。", category: .action),

    Proverb(id: 620, text: "同床異夢", reading: "どうしょういむ",
            meaning: "同じ立場や場所にいながら、それぞれが異なる考えや目的を持っていること。",
            example: "同床異夢というべき状況で、チームメンバーの目標がバラバラだと気づいた。", category: .relationships),

    Proverb(id: 621, text: "灯台下暗し", reading: "とうだいもとくらし",
            meaning: "身近なことほど、かえって気づきにくいということ。",
            example: "灯台下暗しというか、ずっと探していた書類が自分の机の引き出しの中にあった。", category: .wisdom),

    Proverb(id: 622, text: "問うに落ちず語るに落ちる", reading: "とうにおちずかたるにおちる",
            meaning: "直接聞かれると答えないが、雑談の中でうっかり本当のことを話してしまうこと。",
            example: "問うに落ちず語るに落ちるというように、普段の会話の中で秘密を漏らしてしまった。", category: .wisdom),

    Proverb(id: 623, text: "同病相憐れむ", reading: "どうびょうあいあわれむ",
            meaning: "同じ苦しみや悩みを持つ者同士は、お互いに同情し助け合うということ。",
            example: "同病相憐れむというか、同じ悩みを持つ者同士で集まり、励まし合った。", category: .emotion),

    Proverb(id: 624, text: "豆腐に鎹", reading: "とうふにかすがい",
            meaning: "まったく手ごたえがなく、効き目がないこと。",
            example: "豆腐に鎹というような手ごたえのなさで、いくら注意しても変わらない。", category: .action),

    Proverb(id: 625, text: "桃李もの言わざれども下自から蹊を成す", reading: "とうりものいわざれどもしたおのずからこみちをなす",
            meaning: "徳のある人は、宣伝しなくても自然と人が集まり、道ができるということ。",
            example: "桃李もの言わざれども下自から蹊を成すというように、実力者の周りには自然と人が集まる。", category: .wisdom),

    Proverb(id: 626, text: "蟷螂が斧", reading: "とうろうのおの",
            meaning: "弱い者が強い者に立ち向かう無謀さのたとえ。",
            example: "蟷螂が斧というような無謀な挑戦だったが、彼らの勇気に感動した。", category: .action),

    Proverb(id: 627, text: "とかく浮世は色と酒", reading: "とかくうきよはいろとさけ",
            meaning: "この世の中では、男女の色恋と酒に楽しみがあるということ。",
            example: "とかく浮世は色と酒というが、それだけに溺れると身を滅ぼす。", category: .wisdom),

    Proverb(id: 628, text: "時に遇えば鼠も虎になる", reading: "ときにあえばねずみもとらになる",
            meaning: "よい時機に恵まれれば、弱い者でも強くなれるということ。",
            example: "時に遇えば鼠も虎になるというように、チャンスをつかんで普通の人が大活躍した。", category: .luck),

    Proverb(id: 629, text: "時の用には鼻を削げ", reading: "ときのようにははなをそげ",
            meaning: "いざというときは、どんな犠牲を払っても役に立てということ。",
            example: "時の用には鼻を削げというから、緊急時には自分の都合を後回しにして助けた。", category: .action),

    Proverb(id: 630, text: "毒食わば皿まで", reading: "どくくわばさらまで",
            meaning: "悪いことに一度手を染めたなら、どうせなら徹底的にやってしまえということ。",
            example: "毒食わば皿まで、ここまで来たら最後までやり遂げようと決意した。", category: .action),

    Proverb(id: 631, text: "毒にも薬にもならぬ", reading: "どくにもくすりにもならぬ",
            meaning: "害もないが役にも立たない、なんの影響も与えない存在のこと。",
            example: "毒にも薬にもならぬような中途半端な提案では、会議で存在感が示せない。", category: .action),

    Proverb(id: 632, text: "毒を以て毒を制す", reading: "どくをもってどくをせいす",
            meaning: "悪を抑えるために別の悪を利用すること。",
            example: "毒を以て毒を制すという考えで、反社会的勢力を別の勢力で牽制した。", category: .wisdom),

    Proverb(id: 633, text: "どこの烏も黒い", reading: "どこのからすもくろい",
            meaning: "どこへ行っても同じようなことであるということ。",
            example: "どこの烏も黒いというか、転職先でも同じような問題が起きていた。", category: .wisdom),

    Proverb(id: 634, text: "所変れば品変る", reading: "ところかわればしなかわる",
            meaning: "土地が変われば、風俗や習慣なども変わるということ。",
            example: "所変れば品変るというから、海外では日本の常識が通じないことも多い。", category: .wisdom),

    Proverb(id: 635, text: "所の神はありがたくない", reading: "ところのかみはありがたくない",
            meaning: "身近なものは、かえって有り難みが感じられないということ。",
            example: "所の神はありがたくないというか、地元の名所の価値に気づいたのは旅先でのことだった。", category: .wisdom),

    Proverb(id: 636, text: "年寄りの冷水", reading: "としよりのひやみず",
            meaning: "老人が年齢にふさわしくない無茶なことをすること。",
            example: "年寄りの冷水というような無謀な挑戦だと言われたが、七十歳でマラソンを完走した。", category: .action),

    Proverb(id: 637, text: "年が薬", reading: "としがくすり",
            meaning: "年をとることで思慮分別が増し、賢くなるということ。",
            example: "年が薬というように、若い頃に無駄だと思っていた経験が今になって役立っている。", category: .wisdom),

    Proverb(id: 638, text: "年寄れば愚に返る", reading: "としよればぐにかえる",
            meaning: "年をとると、子供のように判断力が衰えてくることがあるということ。",
            example: "年寄れば愚に返るというが、それを防ぐために毎日頭を使う習慣を続けている。", category: .nature),

    Proverb(id: 639, text: "隣の貧乏は鴨の味がある", reading: "となりのびんぼうはかものあじがある",
            meaning: "他人の不幸や貧乏は、自分には気持ちよく感じられてしまうということ。",
            example: "隣の貧乏は鴨の味があるというのは、人間の嫌な部分かもしれない。", category: .emotion),

    Proverb(id: 640, text: "虎狼より人の口恐ろし", reading: "とろうよりひとのくちおそろし",
            meaning: "猛獣よりも人の噂や悪口の方が恐ろしいということ。",
            example: "虎狼より人の口恐ろしというから、悪い噂が広まらないよう言動に気をつけた。", category: .wisdom),

    Proverb(id: 641, text: "鳥なき里の蝙蝠", reading: "とりなきさとのこうもり",
            meaning: "優れた人物がいないところで、つまらない者が威張り散らすこと。",
            example: "鳥なき里の蝙蝠というか、優秀なスタッフが去った後にレベルの低い者が幅を利かせている。", category: .action),

    Proverb(id: 642, text: "泥縄", reading: "どろなわ",
            meaning: "事が起きてから慌てて対処しようとする、準備のなさのたとえ。",
            example: "泥縄の対策では間に合わない、日頃から備えておくことが重要だ。", category: .action),

    Proverb(id: 643, text: "泥棒が縄を恨む", reading: "どろぼうがなわをうらむ",
            meaning: "自分の悪事が原因で制裁を受けながら、逆に相手を恨むこと。",
            example: "泥棒が縄を恨むような逆恨みで、自業自得なのに周りを責めていた。", category: .action),

    Proverb(id: 644, text: "団栗の背競べ", reading: "どんぐりのせいくらべ",
            meaning: "どれも似たり寄ったりで、大した差がないこと。",
            example: "団栗の背競べというような横並びの提案ばかりで、革新的なアイデアが見つからなかった。", category: .action),

    Proverb(id: 645, text: "鳶に油揚さらわれる", reading: "とびにあぶらあげさらわれる",
            meaning: "思いがけないことで、大切なものを横取りされること。",
            example: "鳶に油揚さらわれるようなもので、交渉中に他社に契約を奪われてしまった。", category: .luck),

    Proverb(id: 646, text: "ないが意見の総仕舞", reading: "ないがいけんのそうじまい",
            meaning: "本音を言わずにいることで、その沈黙が最終的な意見とみなされてしまうこと。",
            example: "ないが意見の総仕舞で、会議で何も発言しなかった彼の沈黙が賛成と受け取られた。", category: .wisdom),

    Proverb(id: 647, text: "ない子では泣かれぬ", reading: "ないこではなかれぬ",
            meaning: "問題の元となるものがなければ、問題も起きないということ。",
            example: "ない子では泣かれぬで、そもそも原因を作らなければよかったのだ。", category: .action),

    Proverb(id: 648, text: "泣いて馬謖を斬る", reading: "ないてばしょくをきる",
            meaning: "規律を守るために、愛着のある人物でも涙を飲んで処罰しなければならないこと。",
            example: "泣いて馬謖を斬る思いで、長年の部下を規則違反で解雇せざるを得なかった。", category: .action),

    Proverb(id: 649, text: "長生きすれば恥多し", reading: "ながいきすればはじおおし",
            meaning: "長く生きれば、それだけ恥ずかしい経験や失敗も増えるということ。",
            example: "長生きすれば恥多しというが、年を重ねるほど若い頃の失敗が恥ずかしく思い出される。", category: .wisdom),

    Proverb(id: 650, text: "長い物には巻かれよ", reading: "ながいものにはまかれよ",
            meaning: "権力や勢力の強い者には逆らわず、それに従う方が得策だということ。",
            example: "長い物には巻かれよで、上司の方針が納得いかなくても従うしかない場面もある。", category: .action),

    Proverb(id: 651, text: "鳴かずば雉も射たれまい", reading: "なかずばきじもいたれまい",
            meaning: "余計なことを言わなければ、災いを招かずにすむということ。",
            example: "鳴かずば雉も射たれまいで、あそこで発言しなければ問題にならなかったのに。", category: .action),

    Proverb(id: 652, text: "長持枕にならず", reading: "ながもちまくらにならず",
            meaning: "ものにはそれぞれ用途があり、適さないことには使えないということ。",
            example: "長持枕にならずで、大きなものが何でも役に立つわけではない。", category: .wisdom),

    Proverb(id: 653, text: "流れに棹さす", reading: "ながれにさおさす",
            meaning: "物事の勢いや流れに乗って、さらに進める手助けをすること。",
            example: "流れに棹さすように、チームの勢いに乗って成果を最大化した。", category: .action),

    Proverb(id: 654, text: "流れる水は腐らず", reading: "ながれるみずはくさらず",
            meaning: "常に活動し動き続けていれば、停滞して腐ることはないということ。",
            example: "流れる水は腐らずで、常に新しいことに挑戦し続けることが大切だ。", category: .action),

    Proverb(id: 655, text: "流れを汲みて源を知る", reading: "ながれをくみてみなもとをしる",
            meaning: "結果や現象を見れば、その原因や出所がわかるということ。",
            example: "流れを汲みて源を知るように、現状を分析すれば問題の根本がわかってくる。", category: .wisdom),

    Proverb(id: 656, text: "泣き面に蜂", reading: "なきつらにはち",
            meaning: "悪いことや不幸なことの上に、さらに不幸が重なること。",
            example: "試験に落ちた上に財布まで落としてしまい、泣き面に蜂とはこのことだ。", category: .luck),

    Proverb(id: 657, text: "泣く子と地頭には勝てぬ", reading: "なくことじとうにはかてぬ",
            meaning: "道理の通じない相手や権力のある者には、逆らっても無駄だということ。",
            example: "泣く子と地頭には勝てぬで、上層部の決定には従うしかなかった。", category: .action),

    Proverb(id: 658, text: "泣く子も黙る", reading: "なくこともだまる",
            meaning: "非常に恐ろしく、威厳や威力があって誰もが恐れること。",
            example: "泣く子も黙るような厳格な上司が赴任してきた。", category: .action),

    Proverb(id: 659, text: "なくて七癖", reading: "なくてしちくせ",
            meaning: "癖がないと思っている人でも、必ず何らかの癖を持っているものだということ。",
            example: "なくて七癖というように、自分では気づかないだけで誰でも独特の癖がある。", category: .wisdom),

    Proverb(id: 660, text: "泣く泣くよい方を取る形見分け", reading: "なくなくよいほうをとるかたみわけ",
            meaning: "悲しみながらも、遺品の中から良いものを選び取ってしまうということから、悲しい場面でも利を優先する人の性を表す。",
            example: "泣く泣くよい方を取る形見分けというように、感情的な場でも人は自分の利益を考えてしまうものだ。", category: .action),

    Proverb(id: 661, text: "鳴く猫は鼠捕らず", reading: "なくねこはねずみとらず",
            meaning: "口だけが達者な者は、実際には仕事をしないということ。",
            example: "鳴く猫は鼠捕らずで、いつも声高に提案するばかりで実行しない人がいる。", category: .action),

    Proverb(id: 662, text: "嘆きの中の喜び", reading: "なげきのなかのよろこび",
            meaning: "悲しみや苦しみの中にも、喜びや希望があるということ。",
            example: "嘆きの中の喜びで、困難な状況でも小さな幸せを見つけることが大切だ。", category: .emotion),

    Proverb(id: 663, text: "仲人は宵のうち", reading: "なこうどはよいのうち",
            meaning: "仲介や交渉事は、機が熟したうちに早めに進めた方がよいということ。",
            example: "仲人は宵のうちというように、縁談は早めに話を進めた方がうまくいく。", category: .action),

    Proverb(id: 664, text: "夏座敷と鰈は縁側がよい", reading: "なつざしきとかれいはえんがわがよい",
            meaning: "夏の部屋とカレイは縁側（端の部分）が一番よいということ。物事にはそれぞれ最もよい面がある。",
            example: "夏座敷と鰈は縁側がよいというように、その状況に最も合った場所や方法がある。", category: .nature),

    Proverb(id: 665, text: "夏の虫氷を笑う", reading: "なつのむしこおりをわらう",
            meaning: "自分の知らないことを知らないと気づかずに、軽々しく批判することのたとえ。",
            example: "夏の虫氷を笑うように、経験が浅いのに専門家を批判するのは見苦しい。", category: .wisdom),

    Proverb(id: 666, text: "七重の膝を八重に折る", reading: "ななえのひざをやえにおる",
            meaning: "何度も繰り返して丁寧に謝り、深くお辞儀をすること。",
            example: "七重の膝を八重に折るようにして詫びたが、相手の怒りは収まらなかった。", category: .action),

    Proverb(id: 667, text: "七歳までは神のうち", reading: "ななさいまではかみのうち",
            meaning: "七歳未満の子どもは神の守護のもとにあり、いつ亡くなっても神の世界に戻るという考え方。",
            example: "七歳までは神のうちといわれ、幼い子どもが尊いものとして扱われていた時代があった。", category: .wisdom),

    Proverb(id: 668, text: "七皿食うて鮫臭い", reading: "ななさらくうてさめくさい",
            meaning: "散々恩恵を受けておきながら、まだ文句や不満を言うこと。",
            example: "七皿食うて鮫臭いとはこのことで、これだけサポートしたのにまだ文句を言っている。", category: .action),

    Proverb(id: 669, text: "七度探して人を疑え", reading: "ななたびさがしてひとをうたがえ",
            meaning: "物がなくなっても、まず七度よく探してみてから、他人を疑うべきだということ。",
            example: "七度探して人を疑えというように、まず自分で十分確認してから人を責めるべきだ。", category: .action),

    Proverb(id: 670, text: "難波の葦は伊勢の浜荻", reading: "なにわのあしはいせのはまおぎ",
            meaning: "同じものでも、場所が違えば呼び名が異なること。同じことも見方や立場によって違って見える。",
            example: "難波の葦は伊勢の浜荻というように、同じ植物でも地方によって呼び方が異なる。", category: .wisdom),

    Proverb(id: 671, text: "名のない星は宵から出る", reading: "なのないほしはよいからでる",
            meaning: "名も知れぬつまらない者ほど、目立つ場所に出しゃばるものだということ。",
            example: "名のない星は宵から出るとでもいうように、実力のない人ほど早くから目立とうとする。", category: .wisdom),

    Proverb(id: 672, text: "なぶれば兎も食いつく", reading: "なぶればうさぎもくいつく",
            meaning: "おとなしい者でも、しつこくいじめると怒って反撃するということ。",
            example: "なぶれば兎も食いつくで、いつも温厚な彼もついに反論した。", category: .action),

    Proverb(id: 673, text: "怠け者の節句働き", reading: "なまけもののせっくばたらき",
            meaning: "怠け者が休日に限って働くように、普段しないことをするときに限って頑張ること。",
            example: "怠け者の節句働きで、普段は怠慢なのに検査の日だけ一生懸命働いていた。", category: .action),

    Proverb(id: 674, text: "生酔本性違わず", reading: "なまよいほんしょうたがわず",
            meaning: "ほろ酔い加減の人は、素の性格が正直に出るものだということ。",
            example: "生酔本性違わずで、酔いが回ってきたころに彼の本音が見えてきた。", category: .action),

    Proverb(id: 675, text: "生兵法は大怪我の基", reading: "なまびょうほうはおおけがのもと",
            meaning: "中途半端な知識や技術で事に当たると、大きな失敗につながるということ。",
            example: "生兵法は大怪我の基で、少し知っているからといって素人が手術をするのは危険だ。", category: .action),

    Proverb(id: 676, text: "蛞蝓に塩", reading: "なめくじにしお",
            meaning: "苦手なものや弱点に触れると、たちまちしぼんでしまうことのたとえ。",
            example: "蛞蝓に塩というか、数字の話になると途端に元気がなくなる。", category: .action),

    Proverb(id: 677, text: "習い性となる", reading: "ならいせいとなる",
            meaning: "繰り返し行っていることが習慣となり、ついには性格や本性のようになってしまうこと。",
            example: "習い性となるで、毎朝の読書が今では欠かせない習慣になった。", category: .action),

    Proverb(id: 678, text: "ならぬ堪忍するが堪忍", reading: "ならぬかんにんするがかんにん",
            meaning: "我慢できないような状況でも耐えることこそ、本当の辛抱や忍耐だということ。",
            example: "ならぬ堪忍するが堪忍で、理不尽な状況でも平静を保つことが大人の対応だ。", category: .action),

    Proverb(id: 679, text: "習わぬ経は読めぬ", reading: "ならわぬきょうはよめぬ",
            meaning: "習っていないことはできない。どんなことでも学ばずしてできるようにはならないということ。",
            example: "習わぬ経は読めぬで、練習もせずにできると思うのは甘い考えだ。", category: .wisdom),

    Proverb(id: 680, text: "鳴神も桑原に恐る", reading: "なるかみもくわばらにおそる",
            meaning: "どんなに強い者でも、苦手なものや怖いものがあるということ。",
            example: "鳴神も桑原に恐るというように、あの厳しい上司にも頭の上がらない相手がいる。", category: .action),

    Proverb(id: 681, text: "なれて後は薄塩", reading: "なれてのちはうすしお",
            meaning: "初めは丁寧に扱われていても、慣れてくると粗略に扱われるようになること。",
            example: "なれて後は薄塩で、入社当初の丁寧な対応も時間が経つにつれて変わっていった。", category: .relationships),

    Proverb(id: 682, text: "名を取るより得を取る", reading: "なをとるよりとくをとる",
            meaning: "名誉や評判よりも、実際の利益を得る方が賢いということ。",
            example: "名を取るより得を取るで、賞を狙うより実益になる仕事を優先することにした。", category: .action),

    Proverb(id: 683, text: "汝の敵を愛せよ", reading: "なんじのてきをあいせよ",
            meaning: "自分を憎む者にも愛情を持って接せよという教え。",
            example: "汝の敵を愛せよという精神で、批判者の意見も真摯に受け止めるよう努めた。", category: .wisdom),

    Proverb(id: 684, text: "似合い似合いの鍋の蓋", reading: "にあいにあいのなべのふた",
            meaning: "どんな夫婦でも、お互いにふさわしい相手と結びつくものだということ。",
            example: "似合い似合いの鍋の蓋というように、個性的な二人も互いにぴったりの相手だった。", category: .relationships),

    Proverb(id: 685, text: "二階から目薬", reading: "にかいからめぐすり",
            meaning: "遠回りで効果が少なく、もどかしいことのたとえ。",
            example: "メールだけで交渉を進めようとするのは二階から目薬で、直接会って話すべきだ。", category: .action),

    Proverb(id: 686, text: "苦瓢にも取柄", reading: "にがふくべにもとりえ",
            meaning: "苦くて役に立たなそうなものにも、何らかの長所や役割があるということ。",
            example: "苦瓢にも取柄というから、あの偏屈な人にも得意なことがあるはずだ。", category: .wisdom),

    Proverb(id: 687, text: "憎い鷹には餌を飼え", reading: "にくいたかにはえさをかえ",
            meaning: "憎い相手でも、うまく扱うために手なずける工夫をすべきだということ。",
            example: "憎い鷹には餌を飼えというように、難しい取引先にも誠実に対応することが大事だ。", category: .wisdom),

    Proverb(id: 688, text: "憎まれっ子世に憚る", reading: "にくまれっこよにはばかる",
            meaning: "嫌われ者ほど、なぜかうまく世渡りして幅を利かせるものだということ。",
            example: "憎まれっ子世に憚るというか、あの口うるさい人がなぜか出世していった。", category: .luck),

    Proverb(id: 689, text: "肉を斬らせて骨を斬る", reading: "にくをきらせてほねをきる",
            meaning: "自分も多少の痛手を受けながら、相手に致命的な打撃を与えること。",
            example: "肉を斬らせて骨を斬る戦略で、コストをかけてでも競合を市場から排除した。", category: .action),

    Proverb(id: 690, text: "逃げるが勝ち", reading: "にげるがかち",
            meaning: "勝ち目のない戦いから引くことが、かえって賢明な判断となることがあること。",
            example: "この交渉は逃げるが勝ちと判断し、今回は撤退を選んだ。", category: .action),

    Proverb(id: 691, text: "西風と夫婦喧嘩は夕限り", reading: "にしかぜとふうふげんかはゆうかぎり",
            meaning: "西風は夕方になると止まり、夫婦喧嘩も時間が経てばおさまるということ。",
            example: "西風と夫婦喧嘩は夕限りというように、深刻に見えた二人の喧嘩もすぐ仲直りした。", category: .nature),

    Proverb(id: 692, text: "逃げる者は道を選ばず", reading: "にげるものはみちをえらばず",
            meaning: "必死に逃げる時には、道や手段を選んでいる余裕はないということ。",
            example: "逃げる者は道を選ばずで、緊急事態では手段を選ばず行動することも必要だ。", category: .action),

    Proverb(id: 693, text: "二足の草鞋", reading: "にそくのわらじ",
            meaning: "本来は相反する二つの職業や立場を同時に兼ねること。",
            example: "昼は会社員、夜はミュージシャンという二足の草鞋を履いて活動している。", category: .action),

    Proverb(id: 694, text: "にっちもさっちもいかぬ", reading: "にっちもさっちもいかぬ",
            meaning: "どうにもならない状態で、進むも引くもできない状況のこと。",
            example: "資金も尽き、にっちもさっちもいかぬ状況に追い込まれた。", category: .action),

    Proverb(id: 695, text: "煮ても焼いても食えぬ", reading: "にてもやいてもくえぬ",
            meaning: "どのように扱っても言いくるめられず、手に負えない人物のこと。",
            example: "煮ても焼いても食えぬ交渉相手で、どんな提案をしても返ってくる答えは「ノー」だった。", category: .action),

    Proverb(id: 696, text: "二の足を踏む", reading: "にのあしをふむ",
            meaning: "思い切って行動できず、ためらうこと。",
            example: "転職のチャンスがあったが、二の足を踏んで結局見送ってしまった。", category: .action),

    Proverb(id: 697, text: "二枚舌を使う", reading: "にまいしたをつかう",
            meaning: "一方にはこう言い、他方には違うことを言うなど、嘘をついたり矛盾したことを言うこと。",
            example: "二枚舌を使うような政治家は信用できないと有権者は感じていた。", category: .action),

    Proverb(id: 698, text: "女房と味噌は古いほどよい", reading: "にょうぼうとみそはふるいほどよい",
            meaning: "妻は年月を経るほど気心が知れてよくなり、味噌も熟成するほど美味しくなるということ。",
            example: "女房と味噌は古いほどよいというように、長年連れ添った夫婦には独特の安心感がある。", category: .relationships),

    Proverb(id: 699, text: "女房は台所から貰え", reading: "にょうぼうはだいどころからもらえ",
            meaning: "結婚相手は実家の暮らしや生活力を見て選べということ。",
            example: "女房は台所から貰えというように、家庭的な環境で育った人は生活力があることが多い。", category: .action),

    Proverb(id: 700, text: "二卵を以て千城の将を棄つ", reading: "にらんをもってせんじょうのしょうをすつ",
            meaning: "わずかな損得にこだわって、大事な人材や機会を失うこと。",
            example: "二卵を以て千城の将を棄つとはこのことで、小さな意見の相違から優秀な人材を手放した。", category: .action),

    Proverb(id: 701, text: "鶏は三歩歩くと忘れる", reading: "にわとりはさんぽあるくとわすれる",
            meaning: "鶏のように記憶力がなく、すぐ忘れてしまうことのたとえ。",
            example: "鶏は三歩歩くと忘れるというが、同じミスを何度も繰り返しているのはその典型だ。", category: .wisdom),

    Proverb(id: 702, text: "鶏を割くに牛刀を用いるべけんや", reading: "にわとりをさくにぎゅうとうをもちいるべけんや",
            meaning: "小さなことに大げさな手段を使うことのたとえ。",
            example: "鶏を割くに牛刀を用いるようなもので、こんな小さな問題に大規模な会議を開くのは大げさだ。", category: .action),

    Proverb(id: 703, text: "人参呑んで首縊る", reading: "にんじんのんでくびくくる",
            meaning: "健康に気をつけながら、一方で命取りになるようなことをするという矛盾したことのたとえ。",
            example: "人参呑んで首縊るというように、健康食品を摂りながら深夜まで飲み続けていた。", category: .action),

    Proverb(id: 704, text: "盗人猛々しい", reading: "ぬすっとたけだけしい",
            meaning: "悪いことをしておきながら、全く反省せず図々しく振る舞うこと。",
            example: "盗人猛々しいとはこのことで、ミスを指摘されても逆に開き直った。", category: .action),

    Proverb(id: 705, text: "盗人にも三分の理", reading: "ぬすっとにもさんぶのり",
            meaning: "どんな悪人でも、自分なりの理屈や言い分があるものだということ。",
            example: "盗人にも三分の理というから、相手の言い分も一応は聞いてみた。", category: .wisdom),

    Proverb(id: 706, text: "盗人に追銭", reading: "ぬすっとにおいせん",
            meaning: "損害を受けた上に、さらに追い討ちをかけるような損失を重ねること。",
            example: "盗人に追銭で、詐欺にあった上に慰謝料まで請求されてしまった。", category: .action),

    Proverb(id: 707, text: "盗人に蔵の番", reading: "ぬすっとにくらのばん",
            meaning: "不適切な人物に大事なものを任せること。危険なことのたとえ。",
            example: "盗人に蔵の番を任せるようなもので、問題のある人物に機密情報を預けるのは危険だ。", category: .action),

    Proverb(id: 708, text: "盗人の上前をとる", reading: "ぬすっとのうわまえをとる",
            meaning: "悪いことをしている者から、さらにうまい汁を吸うこと。",
            example: "盗人の上前をとるような行為は、二重の意味で不正だ。", category: .action),

    Proverb(id: 709, text: "盗みする子は憎からで縄懸くる人が恨めしい", reading: "ぬすみするこはにくからでなわかくるひとがうらめしい",
            meaning: "悪いことをした本人を許しながら、それを裁く人を恨むという、筋違いな恨みのたとえ。",
            example: "盗みする子は憎からで縄懸くる人が恨めしいとはこのことで、親が子の罪を棚上げして警察を責めていた。", category: .action),

    Proverb(id: 710, text: "濡れぬ先こそ露をも厭え", reading: "ぬれぬさきこそつゆをもいとえ",
            meaning: "災いに遭わないうちから、小さな危険の芽も摘んでおくべきだということ。",
            example: "濡れぬ先こそ露をも厭えで、問題が小さいうちに対策を打っておくことが重要だ。", category: .action),

    Proverb(id: 711, text: "猫に鰹節", reading: "ねこにかつおぶし",
            meaning: "大切なものを、危険なものの側に置くこと。誘惑をそばに置くことのたとえ。",
            example: "あの彼氏に大金を管理させるのは猫に鰹節で、危険すぎる。", category: .action),

    Proverb(id: 712, text: "猫に木天蓼", reading: "ねこにまたたび",
            meaning: "ある人が特に好きなものや、強く惹かれるものを与えること。",
            example: "猫に木天蓼というように、スイーツ好きな彼女にケーキを渡したら目を輝かせた。", category: .action),

    Proverb(id: 713, text: "猫の魚辞退", reading: "ねこのうおじたい",
            meaning: "本当は欲しいのに、見せかけだけ遠慮すること。本心とは異なる態度をとること。",
            example: "猫の魚辞退とはこのことで、「いりません」と言いながら目が輝いていた。", category: .action),

    Proverb(id: 714, text: "猫の首に鈴", reading: "ねこのくびにすず",
            meaning: "実行すれば効果的だが、誰もやろうとしない危険な計画のたとえ。",
            example: "会長に直言するのは猫の首に鈴で、みんながそう思いながら誰も動かない。", category: .action),

    Proverb(id: 715, text: "猫の手も借りたい", reading: "ねこのてもかりたい",
            meaning: "非常に忙しくて、猫の手さえも借りたいほど余裕がない状況のこと。",
            example: "年度末は猫の手も借りたいほど忙しく、休む暇もない。", category: .action),

    Proverb(id: 716, text: "猫も杓子も", reading: "ねこもしゃくしも",
            meaning: "どんな人でも、誰もかれも全員のこと。",
            example: "猫も杓子もスマートフォンを持つ時代になった。", category: .action),

    Proverb(id: 717, text: "ねじれた薪も真直ぐな炎を立てる", reading: "ねじれたまきもまっすぐなほのおをたてる",
            meaning: "形や素性がいびつであっても、その人なりの良い結果をもたらすことができるということ。",
            example: "ねじれた薪も真直ぐな炎を立てるというように、不器用な人でも懸命に取り組めばよい仕事ができる。", category: .wisdom),

    Proverb(id: 718, text: "鼠壁を忘る、壁鼠を忘れず", reading: "ねずみかべをわする、かべねずみをわすれず",
            meaning: "害を与えた側は忘れても、被害を受けた側は覚えているということ。",
            example: "鼠壁を忘る、壁鼠を忘れずで、軽い一言でも言われた側には長く残るものだ。", category: .relationships),

    Proverb(id: 719, text: "鼠ごっこ鼬ごっこ", reading: "ねずみごっこいたちごっこ",
            meaning: "いくら手を打っても、状況がちっとも改善されず同じことが繰り返されること。",
            example: "対策を講じては抜け穴を作られ、鼠ごっこ鼬ごっこの状態が続いている。", category: .action),

    Proverb(id: 720, text: "鼠捕る猫は爪隠す", reading: "ねずみとるねこはつめかくす",
            meaning: "本当に有能な者は、普段は能力をひけらかさないということ。",
            example: "鼠捕る猫は爪隠すで、あの人は普段おとなしいが、いざという時に驚くほどの実力を発揮する。", category: .wisdom),

    Proverb(id: 721, text: "鼠の子算用", reading: "ねずみのこさんよう",
            meaning: "ねずみの子のように急速に増えること。物事が急激に数を増すことのたとえ。",
            example: "鼠の子算用というように、口コミがどんどん広がって利用者が爆発的に増えた。", category: .action),

    Proverb(id: 722, text: "鼠は大黒天の使い", reading: "ねずみはだいこくてんのつかい",
            meaning: "一見役に立たないものや困ったものでも、実は大切な意味を持つことがあるということ。",
            example: "鼠は大黒天の使いというように、厄介に思える問題が実は重要なサインだったりする。", category: .wisdom),

    Proverb(id: 723, text: "寝た牛に芥かける", reading: "ねたうしにあくたかける",
            meaning: "困っている人や弱い立場の者をさらに傷つけること。弱り目に祟り目のこと。",
            example: "寝た牛に芥かけるように、落ち込んでいる時にさらに追い打ちをかけてくる人がいる。", category: .action),

    Proverb(id: 724, text: "寝た子を起す", reading: "ねたこをおこす",
            meaning: "おさまっていた問題を蒸し返したり、無用に刺激して騒ぎを起こすこと。",
            example: "寝た子を起すようなことはしたくないが、放置すれば後で大きな問題になる。", category: .action),

    Proverb(id: 725, text: "子に臥し寅に起きる", reading: "ねにふしとらにおきる",
            meaning: "真夜中に就寝し、夜明け前には起きるという、非常に短い睡眠で働くこと。",
            example: "子に臥し寅に起きるような生活で、繁忙期は睡眠時間が三時間しか取れなかった。", category: .effort),

    Proverb(id: 726, text: "根もない嘘から芽が生える", reading: "ねもないうそからめがはえる",
            meaning: "根拠のないでたらめな噂でも、広まるうちに本当らしく膨らんでしまうこと。",
            example: "根もない嘘から芽が生えるというように、些細な噂が大きな話になっていた。", category: .action),

    Proverb(id: 727, text: "寝る間が極楽", reading: "ねるまがごくらく",
            meaning: "睡眠中は悩みや苦労を忘れられ、この上ない幸せだということ。",
            example: "忙しい毎日の中で、寝る間が極楽とばかりに床に就く瞬間が一番の楽しみだ。", category: .emotion),

    Proverb(id: 728, text: "根を断って葉を枯らす", reading: "ねをたってはをからす",
            meaning: "問題の根本原因を断てば、全体が自然に解決するということ。",
            example: "根を断って葉を枯らす考え方で、表面的な問題ではなく根本原因の解決に取り組んだ。", category: .action),

    Proverb(id: 729, text: "念力岩をも通す", reading: "ねんりきいわをもとおす",
            meaning: "強い意志と集中力があれば、どんな困難も乗り越えられるということ。",
            example: "念力岩をも通すというように、諦めずに取り組めば不可能と思えた目標も達成できる。", category: .effort),

    Proverb(id: 730, text: "軒を貸して母屋取られる", reading: "のきをかしておもやとられる",
            meaning: "少し便宜を図ったために、全体を乗っ取られてしまうことのたとえ。",
            example: "軒を貸して母屋取られるとはこのことで、一部の権限を与えたら次第に主導権を奪われた。", category: .action),

    Proverb(id: 731, text: "残り物に福がある", reading: "のこりものにふくがある",
            meaning: "人が取り残したものに、意外とよいものが残っていること。後回しにされた者に幸運があること。",
            example: "残り物に福があるというように、最後まで残っていた選択肢が一番よかった。", category: .luck),

    Proverb(id: 732, text: "喉から手が出る", reading: "のどからてがでる",
            meaning: "非常に欲しくて、どうしても手に入れたいと思うこと。",
            example: "喉から手が出るほど欲しかったアイテムが、今日ついに手に入った。", category: .action),

    Proverb(id: 733, text: "上り一日下り一時", reading: "のぼりいちにちくだりいっとき",
            meaning: "積み上げるには長い時間がかかるが、崩れるのは一瞬だということ。",
            example: "上り一日下り一時というように、信頼を築くには年月がかかるが、失うのはあっという間だ。", category: .action),

    Proverb(id: 734, text: "鑿と言えば槌", reading: "のみといえばつち",
            meaning: "こちらの意図を言わなくても、すぐに察して必要なものを用意してくれること。",
            example: "鑿と言えば槌というように、あの秘書は先読みして必要な資料を揃えてくれる。", category: .relationships),

    Proverb(id: 735, text: "蚤の夫婦", reading: "のみのふうふ",
            meaning: "体の大きい妻と小さい夫の夫婦のたとえ。",
            example: "蚤の夫婦というように、小柄な夫と大柄な妻のカップルがほほえましい。", category: .relationships),

    Proverb(id: 736, text: "野良猫の隣歩き", reading: "のらねこのとなりあるき",
            meaning: "飼い主のいない猫がうろうろするように、どこにも定着せずぶらぶらしていること。",
            example: "野良猫の隣歩きのように、特定の組織に縛られずフリーランスで活動している。", category: .action),

    Proverb(id: 737, text: "乗りかかった舟", reading: "のりかかったふね",
            meaning: "一度始めてしまったことは、途中でやめられないということ。",
            example: "乗りかかった舟だから、今更引き返すわけにはいかない。", category: .action),

    Proverb(id: 738, text: "糊ついでに帽子", reading: "のりついでにぼうし",
            meaning: "ある作業をするついでに、別のことも一緒に済ませること。",
            example: "糊ついでに帽子で、洗濯のついでにクリーニングも出しておいた。", category: .action),

    Proverb(id: 739, text: "のろまの一寸馬鹿の三寸", reading: "のろまのいっすんばかのさんずん",
            meaning: "間抜けな者ほど、やたら度を過ごしてしまうこと。",
            example: "のろまの一寸馬鹿の三寸というように、余計なことをしようとして逆に事態を悪化させた。", category: .wisdom),

    Proverb(id: 740, text: "掃溜めに鶴", reading: "はきだめにつる",
            meaning: "汚い場所や平凡な環境の中に、際立って優れた人物や美しいものがあること。",
            example: "あの会社は掃溜めに鶴で、一人だけ突出して優秀な社員がいる。", category: .luck),

    Proverb(id: 741, text: "破鏡再び照らさず", reading: "はきょうふたたびてらさず",
            meaning: "一度壊れた夫婦の縁や人間関係は、元には戻らないということ。",
            example: "破鏡再び照らさずというように、離婚した二人が元に戻ることはなかった。", category: .relationships),

    Proverb(id: 742, text: "薄氷を踏む", reading: "はくひょうをふむ",
            meaning: "非常に危険な状況に身を置くこと。また、非常に慎重に事を進めるたとえ。",
            example: "薄氷を踏む思いで交渉を進め、ようやく契約にこぎつけた。", category: .action),

    Proverb(id: 743, text: "箸が転んでも可笑しい", reading: "はしがころんでもおかしい",
            meaning: "何でもないことにまで笑う、特に若い女性がよく笑うことのたとえ。",
            example: "箸が転んでも可笑しい年頃で、彼女はなにかにつけてくすくす笑っている。", category: .emotion),

    Proverb(id: 744, text: "箸にも棒にもかからぬ", reading: "はしにもぼうにもかからぬ",
            meaning: "どうにも手の施しようがない。どうにもならないほどひどい状態のたとえ。",
            example: "あの案件は箸にも棒にもかからぬ状態で、誰も手がつけられなかった。", category: .action),

    Proverb(id: 745, text: "恥の上塗り", reading: "はじのうわぬり",
            meaning: "恥の上にさらに恥を重ねること。失敗を取り繕おうとして、かえって恥を重ねること。",
            example: "謝ればよいのに言い訳を続けて、恥の上塗りになってしまった。", category: .action),

    Proverb(id: 746, text: "始めあるものは終りあり", reading: "はじめあるものはおわりあり",
            meaning: "始まりがあれば必ず終わりがある。何事も永遠に続くものはないということ。",
            example: "始めあるものは終りありというが、長く続いたその会社もついに幕を閉じた。", category: .wisdom),

    Proverb(id: 747, text: "始めの勝は糞勝ち", reading: "はじめのかちはくそかち",
            meaning: "最初の勝利はまだ実力とはいえず、本当の実力が出るのはこれからだということ。",
            example: "始めの勝は糞勝ちというから、一度勝ったからといって油断してはいけない。", category: .action),

    Proverb(id: 748, text: "走り馬にも鞭", reading: "はしりうまにもむち",
            meaning: "勢いよく走っている馬にもさらに鞭を当てるように、調子のよいときこそさらに努力せよということ。",
            example: "走り馬にも鞭で、好調なときこそ油断せずに努力を続けるべきだ。", category: .effort),

    Proverb(id: 749, text: "恥を言わば理が聞こえぬ", reading: "はじをいわばりがきこえぬ",
            meaning: "自分の恥を言い訳にしていると、筋道の通った話もできなくなるということ。",
            example: "恥を言わば理が聞こえぬで、失敗を認めずに言い訳ばかりしていた。", category: .action),

    Proverb(id: 750, text: "畑あっての芋種", reading: "はたけあってのいもだね",
            meaning: "土台や基盤があってこそ、物事が成り立つということ。",
            example: "畑あっての芋種というように、資金がなければ事業を始められない。", category: .action),

    Proverb(id: 751, text: "畑水練", reading: "はたけすいれん",
            meaning: "実地に即さない無意味な練習や努力のたとえ。畑で水泳の練習をしても意味がないことから。",
            example: "実際に乗らずに本だけで運転を覚えようとするのは畑水練に過ぎない。", category: .action),

    Proverb(id: 752, text: "二十後家は立つが三十後家は立たぬ", reading: "にじゅうごけはたつがさんじゅうごけはたたぬ",
            meaning: "二十歳で夫を亡くした女性は再婚できるが、三十歳になるとなかなか難しいということ。",
            example: "二十後家は立つが三十後家は立たぬといわれた時代とは変わり、今は年齢に関係なく再婚できる。", category: .wisdom),

    Proverb(id: 753, text: "八十の手習い", reading: "はちじゅうのてならい",
            meaning: "年齢に関係なく、学ぼうとする意欲が大切だということ。何歳になっても新しいことを始めてよい。",
            example: "八十の手習いというが、祖父は八十歳を過ぎてからスマートフォンを使い始めた。", category: .effort),

    Proverb(id: 754, text: "八十の三つ子", reading: "はちじゅうのみつご",
            meaning: "人間の本性はなかなか変わらないということ。幼い頃の性質は老いても変わらない。",
            example: "八十の三つ子というように、あの頑固な性格は年をとっても変わらない。", category: .wisdom),

    Proverb(id: 755, text: "蜂の巣をつつく", reading: "はちのすをつつく",
            meaning: "余計なことをして大きな騒動を引き起こすこと。触らぬほうがよいことに手を出すたとえ。",
            example: "余計な発言が蜂の巣をつつくことになり、会議が大混乱した。", category: .action),

    Proverb(id: 756, text: "這っても黒豆", reading: "はってもくろまめ",
            meaning: "どう見ても明らかに違うのに、自分の言い張ることを曲げないこと。強情なたとえ。",
            example: "這っても黒豆というように、彼は間違いを認めようとしない。", category: .action),

    Proverb(id: 757, text: "八方美人", reading: "はっぽうびじん",
            meaning: "誰に対しても如才なく振る舞い、どこから見ても欠点がないように見せる人。八方に愛想よくする人。",
            example: "八方美人と言われる彼は、誰にでも愛想よく接するが本音がわからない。", category: .relationships),

    Proverb(id: 758, text: "初物七十五日", reading: "はつものしちじゅうごにち",
            meaning: "その季節に初めて出た食べ物を食べると、七十五日長生きするといわれること。初物には縁起がよいとされる。",
            example: "初物七十五日というから、今年初めての筍を食べて長生きを願った。", category: .wisdom),

    Proverb(id: 759, text: "鳩が豆鉄砲を食う", reading: "はとがまめでっぽうをくう",
            meaning: "突然のことに驚いて、目を丸くしてきょとんとしている様子のたとえ。",
            example: "突然のサプライズパーティーに彼女は鳩が豆鉄砲を食ったような顔をした。", category: .action),

    Proverb(id: 760, text: "鳩も豆腐かぬ", reading: "はともとうふかぬ",
            meaning: "どんな生き物にも、無理なことや不得意なことがあるということ。",
            example: "鳩も豆腐かぬというように、得意不得意は誰にでもある。", category: .wisdom),

    Proverb(id: 761, text: "話し上手に聞き下手", reading: "はなしじょうずにききへた",
            meaning: "話すのが上手な人は、相手の話を聞くのが下手なことが多いということ。",
            example: "話し上手に聞き下手で、彼はよく喋るが人の話を最後まで聞かない。", category: .relationships),

    Proverb(id: 762, text: "離れ小僧も次第送り", reading: "はなれこぞうもじだいおくり",
            meaning: "どんなに離れていた人でも、時代の流れには逆らえないということ。",
            example: "離れ小僧も次第送りで、山奥に住む彼もスマートフォンを使うようになった。", category: .action),

    Proverb(id: 763, text: "花の傍らの深山木", reading: "はなのそばらのみやまぎ",
            meaning: "美しい花の隣にある深山の木のように、優れたものの傍にいる平凡なものが引き立て役になること。",
            example: "花の傍らの深山木というように、優秀な同僚のそばにいると自分の凡庸さが際立つ。", category: .nature),

    Proverb(id: 764, text: "花は折りたし梢は高し", reading: "はなはおりたしこずえはたかし",
            meaning: "欲しいものがあっても、手が届かないことのたとえ。",
            example: "花は折りたし梢は高しで、あの物件は気に入ったが値段が高すぎて買えない。", category: .action),

    Proverb(id: 765, text: "花も実もある", reading: "はなもみもある",
            meaning: "外見も内容も兼ね備えていること。形式と実質の両方が備わっていること。",
            example: "花も実もある人柄で、彼は容姿端麗なうえに能力も高い。", category: .wisdom),

    Proverb(id: 766, text: "花は根に鳥は古巣に帰る", reading: "はなはねにとりはふるすにかえる",
            meaning: "すべてのものは元の場所に戻るということ。人もいつかは故郷に帰るたとえ。",
            example: "花は根に鳥は古巣に帰るというように、長年の海外生活を終えて故郷に戻った。", category: .nature),

    Proverb(id: 767, text: "花よりも団子", reading: "はなよりだんご",
            meaning: "風流よりも実益を好むこと。見た目より実質を重んじること。",
            example: "花よりも団子で、お花見よりも食べることが目的だという人が多い。", category: .action),

    Proverb(id: 768, text: "鼻をかめと言えば血の出るほどかむ", reading: "はなをかめといえばちのでるほどかむ",
            meaning: "少しやればよいことを、言われると度を過ぎてやりすぎてしまうこと。",
            example: "鼻をかめと言えば血の出るほどかむというように、彼は少し注意するとやりすぎてしまう。", category: .action),

    Proverb(id: 769, text: "歯に衣着せぬ", reading: "はにきぬきせぬ",
            meaning: "思っていることをはっきりと遠慮なく言うこと。言葉を飾らずに率直に言うたとえ。",
            example: "歯に衣着せぬ物言いで、彼女はいつも率直に意見を述べる。", category: .action),

    Proverb(id: 770, text: "婆育ちは三百安い", reading: "ばばそだちはさんびゃくやすい",
            meaning: "祖母に育てられた子は甘やかされて、しつけが行き届かないことが多いということ。",
            example: "婆育ちは三百安いというが、祖父母に育てられた彼は少しわがままなところがある。", category: .wisdom),

    Proverb(id: 771, text: "鰻も一期、海老も一期", reading: "うなぎもいちご、えびもいちご",
            meaning: "長生きするものも短命なものも、命の長さは関係なく、人はみな一生を生きるということ。",
            example: "鰻も一期、海老も一期というように、長生きしても短命でも、精いっぱい生きることが大切だ。", category: .wisdom),

    Proverb(id: 772, text: "早い者に手なし", reading: "はやいものにてなし",
            meaning: "動作が素早い人は、余計なことをして失敗することが少ないということ。",
            example: "早い者に手なしというように、彼はてきぱきと仕事をこなして失敗がない。", category: .action),

    Proverb(id: 773, text: "早牛も淀、遅牛も淀", reading: "はやうしもよど、おそうしもよど",
            meaning: "急いでも遅くても、結局同じ結果になることのたとえ。",
            example: "早牛も淀、遅牛も淀というように、急いで出発しても渋滞で結局同じ時間に着いた。", category: .wisdom),

    Proverb(id: 774, text: "早合点の早忘れ", reading: "はやがてんのはやわすれ",
            meaning: "早とちりする人は物忘れも早いということ。せっかちな人は記憶も定着しにくいたとえ。",
            example: "早合点の早忘れで、彼はすぐに理解したと思っても翌日には忘れている。", category: .action),

    Proverb(id: 775, text: "早飯も芸のうち", reading: "はやめしもげいのうち",
            meaning: "素早く食事を済ませることも一つの能力・技術だということ。",
            example: "早飯も芸のうちというように、限られた休憩時間で素早く食事を取るのも仕事のうちだ。", category: .action),

    Proverb(id: 776, text: "流行る芝居は外題から", reading: "はやるしばいはだいだいから",
            meaning: "流行るものは最初の印象や題名から人を引きつけるということ。第一印象が大切なたとえ。",
            example: "流行る芝居は外題からというように、商品名やタイトルが売れ行きを左右することがある。", category: .action),

    Proverb(id: 777, text: "腹が減っては戦ができぬ", reading: "はらがへってはいくさができぬ",
            meaning: "空腹では何もできない。まず食事をとってから仕事に取り掛かれということ。",
            example: "腹が減っては戦ができぬというから、会議の前にしっかり昼食をとった。", category: .action),

    Proverb(id: 778, text: "腸の煮え返る", reading: "はらわたのにえかえる",
            meaning: "腹の底から強い怒りを感じること。激しく憤ること。",
            example: "その不正の話を聞いて、腸の煮え返る思いがした。", category: .emotion),

    Proverb(id: 779, text: "腹八分に医者いらず", reading: "はらはちぶにいしゃいらず",
            meaning: "食事は腹八分目にしておけば、病気にならずに医者に行かなくて済むということ。",
            example: "腹八分に医者いらずというから、食べすぎないように気をつけている。", category: .action),

    Proverb(id: 780, text: "針とる者は虫をとる", reading: "はりとるものはむしをとる",
            meaning: "小さなことに気を取られていると、大切なことを見失うということ。",
            example: "針とる者は虫をとるというように、細かいことにこだわりすぎて全体を見失わないようにしよう。", category: .wisdom),

    Proverb(id: 781, text: "針の筵に座る", reading: "はりのむしろにすわる",
            meaning: "非常に居心地が悪く、苦痛な状況に置かれること。",
            example: "全員から批判される会議は、まさに針の筵に座るような思いだった。", category: .action),

    Proverb(id: 782, text: "針を蔵に積む", reading: "はりをくらにつむ",
            meaning: "少しずつ積み重ねることで、いつかは大きな成果になるということ。",
            example: "針を蔵に積むように、毎日少しずつ貯蓄を続けた結果、大きな資産になった。", category: .effort),

    Proverb(id: 783, text: "春に三日の晴れなし", reading: "はるにさんにちのはれなし",
            meaning: "春の天気は変わりやすく、三日続けて晴れることはないということ。",
            example: "春に三日の晴れなしというように、昨日まで晴れていたのに今日は雨だ。", category: .nature),

    Proverb(id: 784, text: "春植えれば秋実らず", reading: "はるうえればあきみのらず",
            meaning: "準備や努力が足りなければ、よい結果は得られないということ。",
            example: "春植えれば秋実らずというように、準備不足のまま臨んだプロジェクトは失敗した。", category: .action),

    Proverb(id: 785, text: "春の日と継母はくれそうでくれない", reading: "はるのひとままははくれそうでくれない",
            meaning: "春の日は暮れそうでなかなか暮れないように、継母の情けはありそうでなかなか与えてもらえないということ。",
            example: "春の日と継母はくれそうでくれないというように、約束の返事がなかなかこない。", category: .nature),

    Proverb(id: 786, text: "春の雪と叔母の杖は怖くない", reading: "はるのゆきとおばのつえはこわくない",
            meaning: "春の雪はすぐ溶けて害がなく、叔母の折檻もそれほど厳しくないことから、大したことはないというたとえ。",
            example: "春の雪と叔母の杖は怖くないというように、たいした脅しにはならなかった。", category: .nature),

    Proverb(id: 787, text: "犯罪の陰に女あり", reading: "はんざいのかげにおんなあり",
            meaning: "犯罪事件の背後には女性が関わっていることが多いということ。",
            example: "犯罪の陰に女ありというが、今回の横領事件にも女性の影があった。", category: .wisdom),

    Proverb(id: 788, text: "万卒は得易く一将は得難し", reading: "ばんそつはえやすくいっしょうはえがたし",
            meaning: "多くの兵士を集めるのは容易だが、優れた将軍を見つけるのは難しいということ。優秀なリーダーは貴重。",
            example: "万卒は得易く一将は得難しというように、優秀なリーダーを育てることが会社の課題だ。", category: .wisdom),

    Proverb(id: 789, text: "びいどろの引き倒し", reading: "びいどろのひきたおし",
            meaning: "脆いものを無理に引っ張って壊してしまうこと。無理な扱いで大切なものを台無しにするたとえ。",
            example: "びいどろの引き倒しになると困るので、繊細な問題には慎重に対処した。", category: .action),

    Proverb(id: 790, text: "非学者論に負けず", reading: "ひがくしゃろんにまけず",
            meaning: "学問のない人は、議論で負けても恥ずかしくないので平気でいられるということ。",
            example: "非学者論に負けずというように、彼は知識がないのに堂々と自説を主張する。", category: .wisdom),

    Proverb(id: 791, text: "日量雨傘月量日傘", reading: "ひかざりかさつきかざりひがさ",
            meaning: "日が光り輝く日は雨傘を持て、月が輝く夜は翌日が晴れるから日傘を用意せよという天気占いのことわざ。",
            example: "日量雨傘月量日傘という言葉通り、昨夜は月が明るかったので日傘を持って出かけた。", category: .wisdom),

    Proverb(id: 792, text: "引かれ者の小唄", reading: "ひかれもののこうた",
            meaning: "不利な立場や苦しい状況にある者が、強がって平気なふりをすること。",
            example: "引かれ者の小唄とばかりに、負けたのに笑顔で「いい試合だった」と言っていた。", category: .action),

    Proverb(id: 793, text: "東に近ければ西に遠い", reading: "ひがしにちかければにしにとおい",
            meaning: "一方に利益があれば他方には不利益があるということ。一長一短があること。",
            example: "東に近ければ西に遠いというように、この家は駅に近いが学校からは遠い。", category: .wisdom),

    Proverb(id: 794, text: "彼岸が来れば団子を思う", reading: "ひがんがくればだんごをおもう",
            meaning: "何かの時期や機会が来ると、それに関連することを連想するということ。",
            example: "彼岸が来れば団子を思うというように、秋になると祖母の手作りのおはぎを思い出す。", category: .action),

    Proverb(id: 795, text: "彼岸過ぎての麦の肥、三十過ぎての男に意見", reading: "ひがんすぎてのむぎのこえ、さんじゅうすぎてのおとこにいけん",
            meaning: "彼岸を過ぎてからの麦への肥料は遅すぎるように、三十歳を過ぎた男に今さら意見しても遅いということ。",
            example: "彼岸過ぎての麦の肥と同じで、今更アドバイスしても手遅れだった。", category: .wisdom),

    Proverb(id: 796, text: "膝頭で江戸へ行く", reading: "ひざがしらでえどへいく",
            meaning: "徒歩で遠くまで行くこと。苦労して目的地に向かうたとえ。",
            example: "膝頭で江戸へ行くように、資金も機材もなく手作業でプロジェクトを進めた。", category: .action),

    Proverb(id: 797, text: "膝とも談合", reading: "ひざともだんごう",
            meaning: "自分の膝とでも相談するほど、一人でじっくり考えること。誰に相談できなくても自分で熟考すること。",
            example: "膝とも談合して一晩考えた結果、転職することを決意した。", category: .wisdom),

    Proverb(id: 798, text: "秘事は睫毛の如し", reading: "ひじはまつげのごとし",
            meaning: "秘密というものは、まつ毛が自分の目に見えないように、本人には気づきにくいものだということ。",
            example: "秘事は睫毛の如しで、本人だけが自分の秘密に気づいていないことがある。", category: .wisdom),

    Proverb(id: 799, text: "美人薄命", reading: "びじんはくめい",
            meaning: "美しい人は短命であることが多いということ。優れた才能や美貌を持つ人は不運なことが多いたとえ。",
            example: "美人薄命というように、若くして亡くなった彼女は誰もが認める美しさだった。", category: .luck),

    Proverb(id: 800, text: "引越貧乏", reading: "ひっこしびんぼう",
            meaning: "引越しをするたびに費用がかかり、なかなか裕福になれないということ。",
            example: "引越貧乏とはよく言ったもので、転勤のたびに引越し費用で貯金が減っていく。", category: .action),

    Proverb(id: 801, text: "必要は発明の母", reading: "ひつようははつめいのはは",
            meaning: "必要に迫られることで、新しい発明や工夫が生まれるということ。",
            example: "必要は発明の母というように、不便さを感じたことで画期的なアプリを開発した。", category: .wisdom),

    Proverb(id: 802, text: "羊に虎の皮を着せる", reading: "ひつじにとらのかわをきせる",
            meaning: "臆病な人や無能な人を、恐ろしく見せかけること。見かけだけ強そうに見せるたとえ。",
            example: "羊に虎の皮を着せるように、実力のない彼に肩書きだけを与えて担当にした。", category: .action),

    Proverb(id: 803, text: "一口物に頬を焼く", reading: "ひとくちものにほおをやく",
            meaning: "少しのものを急いで食べようとして火傷するように、欲張って急ぐと失敗するというたとえ。",
            example: "一口物に頬を焼くというように、急いで結論を出そうとして失敗した。", category: .action),

    Proverb(id: 804, text: "人食い馬にも合口", reading: "ひとくいうまにもあいくち",
            meaning: "どんなに凶暴な者にも、相性のよい人や理解者がいるということ。",
            example: "人食い馬にも合口というように、あの気難しい上司とうまくやれる部下がいる。", category: .wisdom),

    Proverb(id: 805, text: "人酒を飲む、酒酒を飲む、酒人を飲む", reading: "ひとさけをのむ、さけさけをのむ、さけひとをのむ",
            meaning: "最初は人が酒を飲むが、やがて酒が酒を呼び、最終的には酒が人を飲む（支配する）ということ。飲みすぎへの戒め。",
            example: "人酒を飲む、酒酒を飲む、酒人を飲むというように、飲みすぎには気をつけなければならない。", category: .action),

    Proverb(id: 806, text: "一筋ではいかぬ", reading: "ひとすじではいかぬ",
            meaning: "物事は一つのやり方だけではうまくいかない。臨機応変に対処する必要があるということ。",
            example: "一筋ではいかぬというように、この問題には複数のアプローチが必要だ。", category: .wisdom),

    Proverb(id: 807, text: "一筋の矢は折れるべし、十筋の矢は折り難し", reading: "ひとすじのやはおれるべし、じっきんのやはおりがたし",
            meaning: "一本の矢は簡単に折れるが、十本束ねると折れにくい。団結の大切さを説くたとえ。",
            example: "一筋の矢は折れるべし、十筋の矢は折り難しというように、みんなで力を合わせれば困難も乗り越えられる。", category: .relationships),

    Proverb(id: 808, text: "一つ釜の飯を食う", reading: "ひとつかまのめしをくう",
            meaning: "同じ釜の飯を食べた仲間のように、生活をともにした親しい間柄のこと。",
            example: "一つ釜の飯を食った仲間だから、何かあれば助け合える。", category: .relationships),

    Proverb(id: 809, text: "一つのわらじの女房は一つ増して持て", reading: "ひとつのわらじのにょうぼうはひとつましでもて",
            meaning: "同じ仕事をする妻は、ひとつ余分に大切にしなさいということ。仕事仲間としての妻を尊重せよという意味。",
            example: "一つのわらじの女房は一つ増して持てというように、一緒に商売をする妻への感謝を忘れてはならない。", category: .relationships),

    Proverb(id: 810, text: "人と煙草の善し悪しは世に出る", reading: "ひととたばこのよしあしはよにでる",
            meaning: "人の本当の良し悪しは、世の中に出て経験を積まないとわからないということ。",
            example: "人と煙草の善し悪しは世に出るというように、社会に出てみて初めてその人の真価がわかる。", category: .wisdom),

    Proverb(id: 811, text: "人の頭の蝿を追う", reading: "ひとのあたまのはえをおう",
            meaning: "自分のことを棚に上げて、他人の欠点や問題に口出しすること。",
            example: "人の頭の蝿を追うように、自分の仕事を放って他人の問題に介入している。", category: .action),

    Proverb(id: 812, text: "人の痛みは三年耐える", reading: "ひとのいたみはさんねんたえる",
            meaning: "他人の苦しみや痛みは、自分のことではないので長い間気にせずにいられるということ。",
            example: "人の痛みは三年耐えるというように、他人事だと思って真剣に考えない人が多い。", category: .wisdom),

    Proverb(id: 813, text: "人の踊る時は踊れ", reading: "ひとのおどるときはおどれ",
            meaning: "周りの人が何かをしているときは、自分も一緒に参加せよということ。機会を逃すなというたとえ。",
            example: "人の踊る時は踊れというように、みんなが投資しているときに乗り遅れないようにした。", category: .action),

    Proverb(id: 814, text: "人の口には戸は立てられぬ", reading: "ひとのくちにはとはたてられぬ",
            meaning: "人の口から出る噂や言葉は止められない。秘密にしたくても、うわさは広まってしまうということ。",
            example: "人の口には戸は立てられぬというから、秘密にしたくても知れ渡ってしまうだろう。", category: .relationships),

    Proverb(id: 815, text: "人の心は九分が十分", reading: "ひとのこころはきゅうぶがじゅうぶ",
            meaning: "人の気持ちというのは、少し余裕を持たせる方がちょうどよいということ。",
            example: "人の心は九分が十分というように、相手の気持ちに余裕を持たせることが長続きの秘訣だ。", category: .wisdom),

    Proverb(id: 816, text: "人の頼まぬ経を読む", reading: "ひとのたのまぬきょうをよむ",
            meaning: "頼まれてもいないのに、余計なお世話をすること。おせっかいのたとえ。",
            example: "人の頼まぬ経を読むように、誰も求めていないアドバイスをしてしまった。", category: .action),

    Proverb(id: 817, text: "人の情けも世にある時", reading: "ひとのなさけもよにあるとき",
            meaning: "人の親切も、自分が世間にいる（生きている）からこそ受けられるということ。今の境遇に感謝せよという意味。",
            example: "人の情けも世にある時というように、今の自分があるのは周りの支えのおかげだ。", category: .relationships),

    Proverb(id: 818, text: "人の振りみて我が振り直す", reading: "ひとのふりみてわがふりなおす",
            meaning: "他人の言動を見て、自分の行動を反省し正すこと。他人の失敗から学ぶこと。",
            example: "人の振りみて我が振り直すというように、同僚の失敗を見て自分の仕事を見直した。", category: .wisdom),

    Proverb(id: 819, text: "人の行く方と水の流れ", reading: "ひとのゆくほうとみずのながれ",
            meaning: "人の行く先と水の流れは、予測できないということ。将来は誰にもわからないたとえ。",
            example: "人の行く方と水の流れというように、あの時転職するとは誰も予想しなかった。", category: .wisdom),

    Proverb(id: 820, text: "人の悪口は鴨の味", reading: "ひとのわるぐちはかものあじ",
            meaning: "他人の悪口は言ってはいけないとわかっていても、鴨肉のようについついやめられないということ。",
            example: "人の悪口は鴨の味というように、悪いとわかっていても噂話が止まらなかった。", category: .action),

    Proverb(id: 821, text: "人は石垣、人は城", reading: "ひとはいしがき、ひとはしろ",
            meaning: "城を守るのは石垣や建物ではなく、人の心と絆であるということ。武田信玄の言葉とされる。",
            example: "人は石垣、人は城という精神で、社員を大切にすることが会社の強さになる。", category: .relationships),

    Proverb(id: 822, text: "人は落ち目が大事", reading: "ひとはおちめがだいじ",
            meaning: "人は苦しい時や運が落ちた時こそ、真価が問われるということ。逆境での振る舞いが大切。",
            example: "人は落ち目が大事というように、不況のときの対応でその会社の本質がわかる。", category: .wisdom),

    Proverb(id: 823, text: "人は善悪の友による", reading: "ひとはぜんあくのともによる",
            meaning: "人はどんな友人と付き合うかによって、善にも悪にもなるということ。交友関係が人格を形成する。",
            example: "人は善悪の友によるというように、良い仲間と付き合うことが大切だ。", category: .relationships),

    Proverb(id: 824, text: "人は情けの下に立つ", reading: "ひとはなさけのしたにたつ",
            meaning: "人は他人の情けや思いやりによって助けられ、生きていけるということ。",
            example: "人は情けの下に立つというように、周りの支えがあってこそ今の自分がある。", category: .relationships),

    Proverb(id: 825, text: "人はパンのみにて生くるにあらず", reading: "ひとはぱんのみにていくるにあらず",
            meaning: "人間は食べ物だけで生きているのではなく、精神的なものも必要だということ。",
            example: "人はパンのみにて生くるにあらずというように、物質的豊かさだけでは満足できない。", category: .wisdom),

    Proverb(id: 826, text: "人は見かけによらぬもの", reading: "ひとはみかけによらぬもの",
            meaning: "人の外見や第一印象だけでは、その人の本当の性格や能力はわからないということ。",
            example: "人は見かけによらぬもので、物静かな彼が大胆な提案をして皆を驚かせた。", category: .wisdom),

    Proverb(id: 827, text: "人は百病の器物", reading: "ひとはひゃくびょうのうつわもの",
            meaning: "人間の体はさまざまな病気の入れ物であり、常に病気になる可能性があるということ。健康に注意せよという戒め。",
            example: "人は百病の器物というように、普段から健康管理を怠らないことが大切だ。", category: .wisdom),

    Proverb(id: 828, text: "人は目より只心", reading: "ひとはめよりただこころ",
            meaning: "人を見るときは外見よりも心が大切だということ。",
            example: "人は目より只心というように、外見より内面の美しさを大切にしたい。", category: .wisdom),

    Proverb(id: 829, text: "一人相撲", reading: "ひとりずもう",
            meaning: "相手もいないのに一人で空回りすること。勝手に張り切って、的外れな努力をすること。",
            example: "一人相撲を取ってしまい、誰も賛成していないのに一人で突き進んでしまった。", category: .action),

    Proverb(id: 830, text: "一人の文殊より三人のたくらだ", reading: "ひとりのもんじゅよりさんにんのたくらだ",
            meaning: "一人の賢者より、三人の凡人が相談した方が良い考えが生まれることがあるということ。",
            example: "一人の文殊より三人のたくらだというように、みんなで議論した方がよい案が出た。", category: .wisdom),

    Proverb(id: 831, text: "一人娘に婿八人", reading: "ひとりむすめにむこはちにん",
            meaning: "一人の娘に大勢の求婚者が集まること。人気者に多くの希望者が集まるたとえ。",
            example: "一人娘に婿八人というように、優秀な彼女には多くの会社からオファーが来た。", category: .relationships),

    Proverb(id: 832, text: "人を呪わば穴二つ", reading: "ひとをのろわばあなふたつ",
            meaning: "他人を呪い殺そうとすれば、相手の墓穴だけでなく自分の墓穴も掘ることになる。他人を陥れようとすれば自分も身を滅ぼすということ。",
            example: "人を呪わば穴二つというから、復讐しようとして自分も傷つく結果になった。", category: .action),

    Proverb(id: 833, text: "人を射んとすれば先ず馬を射よ", reading: "ひとをいんとすればまずうまをいよ",
            meaning: "敵の大将を倒そうとすれば、まず馬を射て動けなくせよ。目的を達するには、まず相手の支えとなるものを取り除けということ。",
            example: "人を射んとすれば先ず馬を射よで、交渉相手の支持者を先に説得した。", category: .action),

    Proverb(id: 834, text: "人を見たら泥棒と思え", reading: "ひとをみたらどろぼうとおもえ",
            meaning: "知らない人を安易に信用してはいけないという戒め。用心せよということ。",
            example: "人を見たら泥棒と思えというほどではないが、見知らぬ人への警戒は必要だ。", category: .action),

    Proverb(id: 835, text: "火のない所に煙は立たぬ", reading: "ひのないところにけむりはたたぬ",
            meaning: "噂が立つからには、何か根拠となる事実があるはずだということ。",
            example: "火のない所に煙は立たぬというから、あの噂にも何か事実があるのかもしれない。", category: .action),

    Proverb(id: 836, text: "火吹竹の根は藪にあり", reading: "ひふきだけのねはやぶにあり",
            meaning: "物事には必ず根本・根拠があるということ。また、原因があって結果があるということ。",
            example: "火吹竹の根は藪にありというように、この問題の根本原因を探る必要がある。", category: .wisdom),

    Proverb(id: 837, text: "百尺竿頭一歩を進む", reading: "ひゃくしゃくかんとういっぽをすすむ",
            meaning: "百尺の竿の先端という極限まで達しても、さらに一歩進む努力をすること。限界を超えた努力のたとえ。",
            example: "百尺竿頭一歩を進むの精神で、記録を達成した後もさらなる高みを目指した。", category: .effort),

    Proverb(id: 838, text: "百日の説法屁一つ", reading: "ひゃくにちのせっぽうへひとつ",
            meaning: "百日間の説法も、最後に一つ失敗すれば台無しになること。長年の努力も一度の失敗で水の泡になること。",
            example: "百日の説法屁一つとならないよう、最後まで気を抜かずに仕事を完成させた。", category: .action),

    Proverb(id: 839, text: "百人を殺されば良医になれぬ", reading: "ひゃくにんをころされればりょういになれぬ",
            meaning: "百人の患者を死なせた医者は良医にはなれないように、失敗から学んでも限度があるということ。",
            example: "百人を殺されば良医になれぬというように、大きすぎる失敗は取り返しがつかない。", category: .wisdom),

    Proverb(id: 840, text: "百年河清を俟つ", reading: "ひゃくねんかせいをまつ",
            meaning: "黄河の水が澄むのを百年待つように、いつまでも実現しそうもないことを待ち続けること。",
            example: "百年河清を俟つように、彼の改心を待ち続けるのは時間の無駄だ。", category: .action),

    Proverb(id: 841, text: "百里の道は九十九里を半ばとす", reading: "ひゃくりのみちはきゅうじゅうくりをなかばとす",
            meaning: "百里の道のりでは、九十九里まで来ても半分と思え。終わりに近づいても油断せず最後まで気を抜くなということ。",
            example: "百里の道は九十九里を半ばとすというように、もう少しで完成というときこそ気を引き締めた。", category: .effort),

    Proverb(id: 842, text: "百貫のかたに編笠一蓋", reading: "ひゃっかんのかたにあみがさいちがい",
            meaning: "大きな借金（百貫）のかたに、わずか一枚の編み笠を担保にするような、不釣り合いな取引のたとえ。",
            example: "百貫のかたに編笠一蓋というように、大きなリスクに対して保証が全く不足している。", category: .action),

    Proverb(id: 843, text: "百貫の鷹も放されねば知れぬ", reading: "ひゃっかんのたかもはなされねばしれぬ",
            meaning: "どんなに優れた能力があっても、発揮する機会を与えられなければ誰にも知られないということ。",
            example: "百貫の鷹も放されねば知れぬというように、才能があっても機会がなければ埋もれてしまう。", category: .wisdom),

    Proverb(id: 844, text: "飄筆で鯰を押さえる", reading: "ひょうひつでなまずをおさえる",
            meaning: "つるつるした瓢箪でぬるぬるしたナマズを押さえようとするように、どうにも手のつけられない状態のたとえ。",
            example: "飄筆で鯰を押さえるように、この複雑な問題はなかなか解決できない。", category: .action),

    Proverb(id: 845, text: "豹は死して皮を留め、人は死して名を残す", reading: "ひょうはしにしてかわをとどめ、ひとはしにしてなをのこす",
            meaning: "豹は死後に美しい皮を残すように、人は死後に名声や業績を残すべきだということ。",
            example: "豹は死して皮を留め、人は死して名を残すというように、後世に語り継がれる仕事をしたい。", category: .wisdom),

    Proverb(id: 846, text: "ピンからキリまで", reading: "ぴんからきりまで",
            meaning: "最高のものから最低のものまで、すべての段階や種類があること。",
            example: "ピンからキリまで揃っているお店なので、どんな予算の人でも買い物ができる。", category: .wisdom),

    Proverb(id: 847, text: "牝鶏晨す", reading: "ひんけいあしたす",
            meaning: "女性が家庭や国を牛耳ることは良くないという意味。女が権力を持つと家や国が傾くという古い考えから。",
            example: "牝鶏晨すという言葉があるが、現代では女性リーダーが活躍する時代になった。", category: .action),

    Proverb(id: 848, text: "貧すれば鈍す", reading: "ひんすればどんす",
            meaning: "貧しくなると心も荒んで、知恵も働かなくなること。経済的困窮が精神や判断力に影響を与えること。",
            example: "貧すれば鈍すというように、生活が苦しくなってから判断力が落ちた気がする。", category: .action),

    Proverb(id: 849, text: "貧乏の子沢山", reading: "びんぼうのこだくさん",
            meaning: "貧しい家庭ほど子どもが多いということ。",
            example: "貧乏の子沢山という言葉があるように、かつては貧しい家庭ほど兄弟が多かった。", category: .luck),

    Proverb(id: 850, text: "貧乏暇なし", reading: "びんぼうひまなし",
            meaning: "貧しい人は生活のために働き続けなければならず、暇がないということ。",
            example: "貧乏暇なしというように、副業を掛け持ちして休む暇もない毎日を送っている。", category: .action),

    Proverb(id: 851, text: "風前の灯火", reading: "ふうぜんのともしび",
            meaning: "風の前の灯のように、今にも消えそうな危うい状態のたとえ。",
            example: "その会社の経営は風前の灯火で、いつ倒産してもおかしくない状況だ。", category: .action),

    Proverb(id: 852, text: "夫婦喧嘩は犬も食わぬ", reading: "ふうふげんかはいぬもくわぬ",
            meaning: "夫婦喧嘩は犬でも見向きもしないほど、くだらないことが多く、すぐ仲直りするものだということ。",
            example: "夫婦喧嘩は犬も食わぬというから、他人が口を出さない方がいい。", category: .relationships),

    Proverb(id: 853, text: "不義はお家の御法度", reading: "ふぎはおいえのごはっと",
            meaning: "道義に外れた行為は、どんな組織や家庭でも許されないということ。",
            example: "不義はお家の御法度で、不正行為は絶対に見逃さないという方針を徹底している。", category: .action),

    Proverb(id: 854, text: "河豚は食いたし命は惜しし", reading: "ふぐはくいたしいのちはおしし",
            meaning: "河豚を食べたいが毒が怖い。危険と知りながら欲望に負けそうになる気持ちのたとえ。",
            example: "河豚は食いたし命は惜ししというように、魅力的だが危険なことに手を出すか迷っている。", category: .action),

    Proverb(id: 855, text: "富士の山と擂鉢ほど違う", reading: "ふじのやまとすりばちほどちがう",
            meaning: "富士山と擂り鉢のように、形が正反対なほど大きく異なること。全く違うことのたとえ。",
            example: "二人の意見は富士の山と擂鉢ほど違い、どう話し合っても折り合いがつかなかった。", category: .wisdom),

    Proverb(id: 856, text: "武士は食わねど高楊枝", reading: "ぶしはくわねどたかようじ",
            meaning: "武士は貧しくても、気位が高く体裁を保つということ。プライドを守るために貧しさを隠すたとえ。",
            example: "武士は食わねど高楊枝というように、苦しい状況でも平然としたふりをしていた。", category: .action),

    Proverb(id: 857, text: "布施なし経で身が入らず", reading: "ふせなしきょうでみがはいらず",
            meaning: "お布施なしでは経を読む僧も身が入らないように、報酬や見返りがないと人は本気で取り組まないこと。",
            example: "布施なし経で身が入らずというように、インセンティブがなければ社員のモチベーションが上がらない。", category: .action),

    Proverb(id: 858, text: "二つよいことはない", reading: "ふたつよいことはなし",
            meaning: "二つのことが同時に都合よくはいかないということ。一方が良ければ他方が悪い。",
            example: "二つよいことはないというように、給料が上がれば仕事も増えた。", category: .wisdom),

    Proverb(id: 859, text: "二股膏薬", reading: "ふたまたこうやく",
            meaning: "二つの立場の間を行ったり来たりして、どちらにも付く節操のない人のたとえ。",
            example: "二股膏薬のように、彼はAチームにもBチームにも同調して、誰からも信用されていない。", category: .action),

    Proverb(id: 860, text: "二人口は過せぬが一人口は過せぬ", reading: "ふたりぐちはすごせるがひとりぐちはすごせぬ",
            meaning: "二人分の食費は何とかなるが、一人分の生活費を稼ぐのはかえって難しいということ。",
            example: "二人口は過せぬが一人口は過せぬというように、一人暮らしの方が何かと出費がかさむ。", category: .wisdom),

    Proverb(id: 861, text: "豚を盗んで骨を施す", reading: "ぶたをぬすんでほねをほどこす",
            meaning: "豚を盗んでおいて骨だけ施すような、ずる賢いことをして恩を着せること。",
            example: "豚を盗んで骨を施すような経営者は、社員から信頼されない。", category: .action),

    Proverb(id: 862, text: "仏法あれば世法あり", reading: "ぶっぽうあればせほうあり",
            meaning: "宗教の法があるように、世間にも守るべき道理や法があるということ。",
            example: "仏法あれば世法ありというように、組織には組織のルールがある。", category: .wisdom),

    Proverb(id: 863, text: "船形三里帆形九里", reading: "ふながたさんりほがたくり",
            meaning: "船の形は三里先から見え、帆の形は九里先から見える。目立つものは遠くからでもわかるということ。",
            example: "船形三里帆形九里というように、その建物は遠くからでもひときわ目立っている。", category: .wisdom),

    Proverb(id: 864, text: "舟盗人を徒歩で追う", reading: "ふなぬすびとをかちでおう",
            meaning: "舟で逃げる盗人を徒歩で追うような、見当はずれで効果のない方法で対処すること。",
            example: "舟盗人を徒歩で追うような対策では、問題は解決できない。", category: .action),

    Proverb(id: 865, text: "舟に刻みて剣を求む", reading: "ふねにきざみてけんをもとむ",
            meaning: "舟から川に剣を落として、舟べりに刻み目をつけて後で探そうとするように、状況の変化に気づかず古い方法にこだわること。",
            example: "舟に刻みて剣を求むようなやり方では、時代の変化に対応できない。", category: .action),

    Proverb(id: 866, text: "船は水より火を恐る", reading: "ふねはみずよりひをおそる",
            meaning: "水上を走る船も、水よりも火事の方が怖い。自分の得意な分野での思わぬ弱点に気をつけよということ。",
            example: "船は水より火を恐るというように、強みの裏に潜む弱点に注意が必要だ。", category: .wisdom),

    Proverb(id: 867, text: "踏まれた草にも花が咲く", reading: "ふまれたくさにもはながさく",
            meaning: "踏みにじられた草でも花を咲かせるように、苦労や逆境を乗り越えた先に必ず成果がある。",
            example: "踏まれた草にも花が咲くというように、失敗続きの彼も諦めずに挑戦し続けて成功した。", category: .effort),

    Proverb(id: 868, text: "文は遺りたし書く手は持たず", reading: "ふみはのこりたしかくてはもたず",
            meaning: "手紙を書いて気持ちを伝えたいが、書く力がないということ。やりたいことはあるが、能力が伴わないたとえ。",
            example: "文は遺りたし書く手は持たずで、感謝の気持ちを伝えたくても言葉がうまく出てこない。", category: .action),

    Proverb(id: 869, text: "踏めば蹴る", reading: "ふめばける",
            meaning: "こちらが攻撃すれば相手も反撃してくる。売り言葉に買い言葉のたとえ。",
            example: "踏めば蹴るというように、無用な刺激を与えれば相手も黙っていない。", category: .action),

    Proverb(id: 870, text: "冬来りなば春遠からじ", reading: "ふゆきたりなばはるとおからじ",
            meaning: "冬が来れば春も遠くない。苦しい時期が続いても、やがて良い時が来るということ。",
            example: "冬来りなば春遠からじというように、辛い時期も必ず終わりが来ると信じて頑張った。", category: .nature),

    Proverb(id: 871, text: "古川に水絶えず", reading: "ふるかわにみずたえず",
            meaning: "古くから流れる川は水が絶えないように、古い物や伝統には絶えない力があるということ。",
            example: "古川に水絶えずというように、老舗の店には長年変わらない魅力がある。", category: .nature),

    Proverb(id: 872, text: "古傷は痛みやすい", reading: "ふるきずはいたみやすい",
            meaning: "昔の傷は天気が変わると痛むように、古い傷や過去の失敗はふとした折に思い出されて辛くなること。",
            example: "古傷は痛みやすいというように、昔の失敗が思い出されて辛い気持ちになった。", category: .emotion),

    Proverb(id: 873, text: "故きを温ねて新しきを知る", reading: "ふるきをたずねてあたらしきをしる",
            meaning: "昔のことをよく学んで考えることで、新しいことへの理解や知恵が得られるということ。",
            example: "故きを温ねて新しきを知るというように、歴史を学ぶことが現代の問題解決につながる。", category: .wisdom),

    Proverb(id: 874, text: "降れば土砂降り", reading: "ふればどしゃぶり",
            meaning: "悪いことが重なるとき、さらに悪いことが加わること。不運が重なるたとえ。",
            example: "降れば土砂降りというように、車が故障した上に財布まで落としてしまった。", category: .luck),

    Proverb(id: 875, text: "刎頸の交わり", reading: "ふんけいのまじわり",
            meaning: "首をはねられても悔いないほどの深い友情。命がけの深い友情のたとえ。",
            example: "刎頸の交わりというべき二人の友情は、何十年経っても変わらない。", category: .relationships),

    Proverb(id: 876, text: "分別過ぎれば愚に返る", reading: "ふんべつすぎればぐにかえる",
            meaning: "考えすぎると却って判断が鈍くなり、愚かな行動をとってしまうことがあるということ。",
            example: "分別過ぎれば愚に返るというように、考えすぎて決断できずに機会を逃した。", category: .wisdom),

    Proverb(id: 877, text: "分相応に風が吹く", reading: "ぶんそうおうにかぜがふく",
            meaning: "自分の身分や実力に見合った境遇が与えられるということ。身のほどを知ることの大切さ。",
            example: "分相応に風が吹くというように、実力に見合った仕事をすることで安定した成果が出た。", category: .wisdom),

    Proverb(id: 878, text: "臍が茶を沸かす", reading: "へそがちゃをわかす",
            meaning: "おかしくてたまらないこと。笑いをこらえきれないほどおかしいことのたとえ。",
            example: "臍が茶を沸かすほど可笑しい話で、みんな笑いをこらえるのに必死だった。", category: .emotion),

    Proverb(id: 879, text: "下手こそ上手の御飾り", reading: "へたこそじょうずのおかざり",
            meaning: "下手な人がいるからこそ、上手な人が引き立って見えるということ。",
            example: "下手こそ上手の御飾りというように、彼のミスのおかげで自分の腕前が際立った。", category: .wisdom),

    Proverb(id: 880, text: "下手な大工でのみ潰し", reading: "へたなだいくでのみつぶし",
            meaning: "腕の悪い大工は道具のせいにするように、技術のない者は道具や環境のせいにすること。",
            example: "下手な大工でのみ潰しというように、失敗するたびに道具や環境のせいにしている。", category: .action),

    Proverb(id: 881, text: "下手な鉄砲数打ちゃ当たる", reading: "へたなてっぽうかずうちゃあたる",
            meaning: "下手でも数多く試みれば、いつかは成功することがあるということ。",
            example: "下手な鉄砲数打ちゃ当たるで、何度も応募した結果ようやく採用された。", category: .action),

    Proverb(id: 882, text: "下手の道具選び", reading: "へたのどうぐえらび",
            meaning: "腕の悪い職人ほど道具にこだわるということ。実力のない者が道具や条件ばかり気にするたとえ。",
            example: "下手の道具選びというように、まず腕を磨くことが先で道具に頼るのは後回しにすべきだ。", category: .action),

    Proverb(id: 883, text: "下手の長談義", reading: "へたのながだんぎ",
            meaning: "話し下手な人ほど、くどくどと長話をすること。",
            example: "下手の長談義で、彼の説明はいつも長くてわかりにくい。", category: .action),

    Proverb(id: 884, text: "糸瓜の皮とも思わず", reading: "へちまのかわともおもわず",
            meaning: "全く気にも留めないこと。まったく相手にしないこと。",
            example: "糸瓜の皮とも思わず、彼は批判を意に介さず自分のやり方を貫いた。", category: .action),

    Proverb(id: 885, text: "屁と火は元から騒ぐ", reading: "へとひはもとからさわぐ",
            meaning: "屁も火も最初から騒ぎ立てるように、問題は初めからはっきりしていることのたとえ。",
            example: "屁と火は元から騒ぐというように、最初から問題が見えていたのに見過ごしてしまった。", category: .action),

    Proverb(id: 886, text: "屁の河童", reading: "へのかっぱ",
            meaning: "河童にとって屁は何でもないように、非常にたやすいこと。造作もないことのたとえ。",
            example: "この程度の計算は屁の河童で、瞬時に解いてしまった。", category: .action),

    Proverb(id: 887, text: "蛇に足を添える", reading: "へびにあしをそえる",
            meaning: "余計なことをして、かえって物事をだめにすること。蛇足のたとえ。",
            example: "蛇に足を添えるように、余計な説明を加えたせいで相手が混乱してしまった。", category: .action),

    Proverb(id: 888, text: "蛇に噛まれて朽縄に怖じる", reading: "へびにかまれてくちなわにおじる",
            meaning: "一度怖い目にあった人は、それに似たものにも過敏に反応するということ。トラウマのたとえ。",
            example: "蛇に噛まれて朽縄に怖じるというように、一度失敗してからは些細なことにも慎重になった。", category: .action),

    Proverb(id: 889, text: "蛇に呑まれた蛙", reading: "へびにのまれたかえる",
            meaning: "恐怖で身がすくんで動けない状態のこと。強者の前に完全に圧倒されてしまうたとえ。",
            example: "面接官に睨まれて蛇に呑まれた蛙のように固まってしまった。", category: .action),

    Proverb(id: 890, text: "蛇の生殺し", reading: "へびのなまごろし",
            meaning: "中途半端な状態で放置すること。はっきりした決着をつけずにうやむやにすること。",
            example: "蛇の生殺しのような状態が続いて、仕事の方向性が決まらない。", category: .action),

    Proverb(id: 891, text: "屁をひって尻すぼめる", reading: "へをひってしりすぼめる",
            meaning: "失敗や悪いことをしてから慌てて取り繕おうとすること。後から恥ずかしくなって誤魔化そうとするたとえ。",
            example: "屁をひって尻すぼめるように、失言をした後で言い訳を並べていた。", category: .action),

    Proverb(id: 892, text: "弁当忘れても傘忘れるな", reading: "べんとうわすれてもかさわすれるな",
            meaning: "食事は抜かしても仕方ないが、雨の備えは欠かせないということ。大切な準備は忘れるなという教え。",
            example: "弁当忘れても傘忘れるなというように、出掛ける前に天気予報を確認するようにしている。", category: .wisdom),

    Proverb(id: 893, text: "弁当持ちに食わす", reading: "べんとうもちにくわす",
            meaning: "弁当を持っている人にさらに食事を与えるような、余計なお世話や不必要なことをするたとえ。",
            example: "弁当持ちに食わすようなことをしてしまい、先方には迷惑だったかもしれない。", category: .action),

    Proverb(id: 894, text: "ペンは剣より強し", reading: "ぺんはけんよりつよし",
            meaning: "武力より言論・文章の力の方が強いということ。知識や情報の力が武力を上回るたとえ。",
            example: "ペンは剣より強しというように、一本の記事が社会を大きく動かすこともある。", category: .wisdom),

    Proverb(id: 895, text: "判官贔屓", reading: "ほうがんびいき",
            meaning: "弱い立場の人や負けそうな人に同情して味方すること。源義経（判官）への人々の同情から生まれた言葉。",
            example: "判官贔屓で、格下のチームを応援する観客が多かった。", category: .emotion),

    Proverb(id: 896, text: "暴虎馮河の勇", reading: "ぼうこひょうがのゆう",
            meaning: "虎に素手で向かい、大河を徒歩で渡るような無謀な勇気。無鉄砲な勇気のたとえ。",
            example: "暴虎馮河の勇といえる行動で、準備もなく強敵に挑んだ。", category: .action),

    Proverb(id: 897, text: "坊主の花簪", reading: "ぼうずのはなかんざし",
            meaning: "坊主頭に花の簪をさすような、場違いで不釣り合いなことのたとえ。",
            example: "坊主の花簪というように、場の雰囲気に合わない発言をして白けてしまった。", category: .wisdom),

    Proverb(id: 898, text: "坊主丸儲け", reading: "ぼうずまるもうけ",
            meaning: "経費をかけずに利益を得ること。元手なしに儲けること。僧侶は生活費が寺で賄われるため、布施がそのまま収入になることから。",
            example: "坊主丸儲けというように、初期費用なしで始められるビジネスモデルは魅力的だ。", category: .luck),

    Proverb(id: 899, text: "吠える犬は噛みつかぬ", reading: "ほえるいぬはかみつかぬ",
            meaning: "大声で吠える犬は実際には噛まないように、声が大きく威張る人ほど実際には行動しないことが多いということ。",
            example: "吠える犬は噛みつかぬというから、あんなに脅していても実際は何もしてこないだろう。", category: .wisdom),

    Proverb(id: 900, text: "仏千人神千人", reading: "ほとけせんにんかみせんにん",
            meaning: "世の中には様々な人がいて、仏のように善い人もいれば神のように厳しい人もいるということ。",
            example: "仏千人神千人というように、同じ職場にも様々な性格の人がいる。", category: .wisdom),

    Proverb(id: 901, text: "仏頼んで地獄へ落ちる", reading: "ほとけたのんでじごくへおちる",
            meaning: "仏を頼みにしていたのに地獄へ落ちるような、当てにしていたものに裏切られること。",
            example: "仏頼んで地獄へ落ちるとはこのことで、信頼していた人に裏切られた。", category: .action),

    Proverb(id: 902, text: "仏造って魂入れず", reading: "ほとけつくってたましいいれず",
            meaning: "仏像を作っても魂を入れなければ意味がないように、形だけ整えて肝心の中身が伴わないこと。",
            example: "仏造って魂入れずで、立派な制度を作っても運用する人の意識が変わらなければ意味がない。", category: .action),

    Proverb(id: 903, text: "仏の顔も三度", reading: "ほとけのかおもさんど",
            meaning: "どんなに温厚な人でも、何度も無礼なことをされると怒り出すということ。",
            example: "仏の顔も三度というように、いくら温厚な彼も三度目の失礼には怒った。", category: .action),

    Proverb(id: 904, text: "仏のない堂へ参る", reading: "ほとけのないどうへまいる",
            meaning: "肝心なものがない場所に行っても意味がないこと。当てが外れることのたとえ。",
            example: "仏のない堂へ参るような状況で、担当者が不在で用事が済まなかった。", category: .action),

    Proverb(id: 905, text: "仏も下駄も同じ木の切れ", reading: "ほとけもげたもおなじきのきれ",
            meaning: "仏像も下駄も同じ木から作られるように、もとは同じでも使い道によって価値が変わるということ。",
            example: "仏も下駄も同じ木の切れというように、同じ素材でも使い方次第で価値が大きく変わる。", category: .wisdom),

    Proverb(id: 906, text: "骨なしの腕ずんばい", reading: "ほねなしのうでずんばい",
            meaning: "骨のない腕相撲のように、実力も根拠もないのに威張ること。からいばりのたとえ。",
            example: "骨なしの腕ずんばいというように、中身のない脅しは誰も恐れない。", category: .action),

    Proverb(id: 907, text: "誉れは誇りの基", reading: "ほまれはほこりのもと",
            meaning: "名誉や評判は誇りの源となるが、誇り高くなりすぎると傲慢になることへの戒め。",
            example: "誉れは誇りの基というように、過去の実績を誇りに思うことは大切だが、驕ってはいけない。", category: .wisdom),

    Proverb(id: 908, text: "洞ヶ峠を決め込む", reading: "ほらがとうをきめこむ",
            meaning: "形勢を見極めようとして、どちらの味方もせず日和見主義を決め込むこと。",
            example: "洞ヶ峠を決め込んで、どちらの派閥にも加担せず様子を見ることにした。", category: .action),

    Proverb(id: 909, text: "惚れた腫れたも御座のうち", reading: "ほれたはれたもございのうち",
            meaning: "恋愛の熱情も、結局は現実の生活の中に収まるものだということ。",
            example: "惚れた腫れたも御座のうちというように、熱烈な恋愛も落ち着けば日常の一部になる。", category: .emotion),

    Proverb(id: 910, text: "惚れた病に薬なし", reading: "ほれたやまいにくすりなし",
            meaning: "恋に落ちた気持ちは、どんな薬でも治せないということ。恋愛の力は理性では制御できないたとえ。",
            example: "惚れた病に薬なしというように、一度好きになったら止められなかった。", category: .emotion),

    Proverb(id: 911, text: "惚れて通えば千里も一里", reading: "ほれてかよえばせんりもいちり",
            meaning: "好きな人のもとへ通うときは、どんなに遠くても苦にならないということ。恋の力のたとえ。",
            example: "惚れて通えば千里も一里というように、彼女に会いに毎週遠方まで通い続けた。", category: .emotion),

    Proverb(id: 912, text: "襤褸は着ても心は錦", reading: "ぼろはきてもこころはにしき",
            meaning: "外見は粗末でも、心の中は美しく高潔であること。外見より内面の豊かさが大切だというたとえ。",
            example: "襤褸は着ても心は錦というように、貧しくても誰よりも誠実な人柄だった。", category: .wisdom),

    Proverb(id: 913, text: "煩悩の犬は追えども去らず", reading: "ぼんのうのいぬはおえどもさらず",
            meaning: "欲望や煩悩は、払い除けようとしてもなかなか去らないということ。",
            example: "煩悩の犬は追えども去らずというように、ダイエット中でも甘いものへの欲求が消えない。", category: .wisdom),

    Proverb(id: 914, text: "凡夫盛んにして神なし", reading: "ぼんぷさかんにしてかみなし",
            meaning: "普通の人間が勢いに乗っているときは、神の加護がなくても何でもできると思いがちだということ。調子に乗ることへの戒め。",
            example: "凡夫盛んにして神なしというように、好調のときこそ驕らずに謙虚でいることが大切だ。", category: .wisdom),

    Proverb(id: 915, text: "鳴かぬ蛍が身を焦がす", reading: "なかぬほたるがみをこがす",
            meaning: "声に出して言わなくても、内心では深く苦しんでいること。特に、胸の中に秘めた恋の苦しみについていう。声を出して鳴く蛍ではなく、黙って光だけで輝く蛍のように、表に出さずに内心で深く悩み燃えるさまにたとえる。",
            example: "鳴かぬ蛍が身を焦がすというように、彼女への想いを胸に秘めたまま、彼は静かに苦しみ続けていた。", category: .emotion),

    Proverb(id: 916, text: "泣く子も目を見る", reading: "なくこもめをみる",
            meaning: "泣いている子供でも、親や周囲の人の顔色を見て状況を判断しているということ。人は感情的になっているときでも、相手の様子をうかがって損得を考えているたとえ。",
            example: "泣く子も目を見るというように、ぐずっている子供でも親の表情をしっかり確認して甘えどきを心得ている。", category: .wisdom),

    Proverb(id: 917, text: "情は人の為ならず", reading: "なさけはひとのためならず",
            meaning: "人に情けをかけることは、その人のためだけでなく、めぐりめぐって自分のためになるということ。善いことをすれば必ず自分に返ってくるという教え。",
            example: "情は人の為ならずというから、困っている人を助ければ、巡り巡って自分にも必ず良いことが返ってくる。", category: .wisdom),

    Proverb(id: 918, text: "難産色に靡りず", reading: "なんさんいろになびかず",
            meaning: "苦難を経験した者は誘惑や感情に流されにくいということ。難産を経た女性が色恋に惑わされないという意から、苦労を重ねた人は甘い誘惑にも動じないたとえ。",
            example: "難産色に靡りずというように、苦労を積み重ねてきた彼女は甘い言葉にも動じなかった。", category: .wisdom),

    Proverb(id: 919, text: "盗人の昼寝", reading: "ぬすっとのひるね",
            meaning: "何事をするにも理由があるということ。また、ぼんやりしているように見えても、実は何か考えがあってのこと。夜に活動する盗人が昼間に寝るのも、夜のための備えであることから。",
            example: "盗人の昼寝というように、あの人が静かにしているのにも、きっと何か深い考えがあるはずだ。", category: .wisdom),

    Proverb(id: 920, text: "盗人を捕まえてみれば我が子なり", reading: "ぬすっとをとらえてみればわがこなり",
            meaning: "思いがけない人が悪事に関わっており、驚き困惑すること。身近な人でも予想外のことをするものだという戒め。",
            example: "盗人を捕まえてみれば我が子なりで、不正を働いた社員を調べたら長年信頼してきた部下だったと知り愕然とした。", category: .wisdom),

    Proverb(id: 921, text: "濡れ手で栗", reading: "ぬれてでくり",
            meaning: "何の苦労もせずに利益を得ること。濡れた手で栗をつかむと粒が手にたくさんついてくることから。「濡れ手に粟」とも。",
            example: "濡れ手で栗のように棚ぼたで大金が転がり込み、あっという間に資産を築いた。", category: .luck),

    Proverb(id: 922, text: "のけば他人", reading: "のけばたにん",
            meaning: "夫婦は離婚してしまえば、まったくの他人になるということ。「のく」は退くの意で、夫婦の縁が切れれば、長年連れ添った相手でも他人同然になってしまうことへの戒め。",
            example: "のけば他人というように、何十年も連れ添った夫婦も離婚すれば赤の他人になってしまう。", category: .relationships),

    Proverb(id: 923, text: "負け惜しみの減らず口", reading: "まけおしみのへらずぐち",
            meaning: "負けた者が悔しさを隠して、勝手な理屈を並べること。",
            example: "彼は試合に負けても負け惜しみの減らず口ばかり叩いている。", category: .emotion),

    Proverb(id: 924, text: "馬子にも衣装", reading: "まごにもいしょう",
            meaning: "どんな人でも立派な衣装を身につければ、立派に見えるということ。",
            example: "普段はぼさぼさの彼も、スーツを着たら馬子にも衣装で見違えた。", category: .wisdom),

    Proverb(id: 925, text: "孫は子より可愛い", reading: "まごはこよりかわいい",
            meaning: "祖父母にとって孫は子供よりもなお可愛いということ。",
            example: "祖母は孫の話になると目を細めた。孫は子より可愛いとはよく言ったものだ。", category: .relationships),

    Proverb(id: 926, text: "孫を飼うより犬ころ飼え", reading: "まごをかうよりいぬころかえ",
            meaning: "孫を可愛がって費用をかけるよりも、忠実な犬を飼う方がよいという皮肉。",
            example: "孫を飼うより犬ころ飼えとも言うが、それほど孫に費用がかかるものだ。", category: .relationships),

    Proverb(id: 927, text: "待たせる身となるも待つ身となるな", reading: "またせるみとなるもまつみとなるな",
            meaning: "人を待たせることはあっても、自分が待つ立場にはなるなという教え。",
            example: "待たせる身となるも待つ身となるなと言う。約束の時間には余裕を持って出よう。", category: .wisdom),

    Proverb(id: 928, text: "待つうちが花", reading: "まつうちがはな",
            meaning: "結果が明らかになる前の、期待している間が最も楽しいということ。",
            example: "合格発表を前にして、待つうちが花だと友人が言った。", category: .emotion),

    Proverb(id: 929, text: "松かさより年かさ", reading: "まつかさよりとしかさ",
            meaning: "松ぼっくりの容積より、年長者の経験の方がはるかに貴重だということ。",
            example: "何か迷ったときは先輩に相談しよう。松かさより年かさというものだ。", category: .wisdom),

    Proverb(id: 930, text: "待てば海路の日和あり", reading: "まてばかいろのひよりあり",
            meaning: "辛抱強く待っていれば、いずれよい機会が訪れるということ。",
            example: "今は不況でも、待てば海路の日和ありという言葉を信じて頑張った。", category: .luck),

    Proverb(id: 931, text: "俎板の鯉", reading: "まないたのこい",
            meaning: "相手の思いのままに従わなければならない絶体絶命の状態のたとえ。",
            example: "交渉の席では完全に相手ペースで、まさに俎板の鯉の状態だった。", category: .wisdom),

    Proverb(id: 932, text: "学びて思わざれば罔し", reading: "まなびておもわざればくらし",
            meaning: "教えを受けるだけで自分で考えなければ、真の知識は身につかないということ。",
            example: "本を読んでも考えなければ身につかない。学びて思わざれば罔しとはそのことだ。", category: .wisdom),

    Proverb(id: 933, text: "眉唾", reading: "まゆつば",
            meaning: "信用できない話や怪しいことに対して用心すること。",
            example: "彼の話はどうも眉唾物で、そのまま信じるわけにはいかない。", category: .wisdom),

    Proverb(id: 934, text: "丸い卵も切りようで四角", reading: "まるいたまごもきりようでしかく",
            meaning: "言い方ややり方次第でどのようにでもなるということ。",
            example: "丸い卵も切りようで四角というように、伝え方一つで印象は大きく変わる。", category: .wisdom),

    Proverb(id: 935, text: "真綿で首締める", reading: "まわたでくびしめる",
            meaning: "じわじわと時間をかけて責めたり苦しめたりすること。",
            example: "彼は真綿で首を締めるように、少しずつ相手を追い詰めていった。", category: .emotion),

    Proverb(id: 936, text: "真綿に針を包む", reading: "まわたにはりをつつむ",
            meaning: "柔らかそうに見えて内に鋭さや悪意を秘めていること。",
            example: "彼女の言葉は真綿に針を包んだようで、一見優しいが実は辛辣だった。", category: .wisdom),

    Proverb(id: 937, text: "ミイラ取りがミイラになる", reading: "みいらとりがみいらになる",
            meaning: "人を連れ戻しに行った者が、かえって自分もそちらに引き込まれてしまうこと。",
            example: "彼女を説得しに行ったら、ミイラ取りがミイラになるように自分も引き込まれてしまった。", category: .action),

    Proverb(id: 938, text: "身過ぎは草の種", reading: "みすぎはくさのたね",
            meaning: "生活の手段は何でもよく、どこにでも転がっているということ。",
            example: "身過ぎは草の種というように、働く気さえあれば仕事はいくらでもある。", category: .wisdom),

    Proverb(id: 939, text: "水清ければ月宿る", reading: "みずきよければつきやどる",
            meaning: "心が清らかであれば、良いものや美しいものが自然に集まるということ。",
            example: "水清ければ月宿るというように、誠実な人のもとには信頼が集まる。", category: .wisdom),

    Proverb(id: 940, text: "水に絵を描く", reading: "みずにえをかく",
            meaning: "何の痕跡も残らない、無駄なことのたとえ。",
            example: "砂上の楼閣に投資するのは水に絵を描くようなものだ。", category: .wisdom),

    Proverb(id: 941, text: "水は逆さに流れず", reading: "みずはさかさにながれず",
            meaning: "物事は自然の道理に逆らうことはできないということ。",
            example: "水は逆さに流れずというように、時間を巻き戻すことはできない。", category: .nature),

    Proverb(id: 942, text: "水広ければ魚大なり", reading: "みずひろければうおおおなり",
            meaning: "環境が大きく豊かであれば、そこで育つ人物も大きくなるということ。",
            example: "水広ければ魚大なりという。大きな組織で経験を積むことが大切だ。", category: .wisdom),

    Proverb(id: 943, text: "水をもって石に投ず", reading: "みずをもっていしにとうず",
            meaning: "石に水をかけても割ることはできないように、何の効果もないことのたとえ。",
            example: "彼への説得は水をもって石に投ずるようなもので、全く効果がなかった。", category: .wisdom),

    Proverb(id: 944, text: "味噌も糞も一緒", reading: "みそもくそもいっしょ",
            meaning: "良いものも悪いものも区別せず一緒にしてしまうこと。",
            example: "味噌も糞も一緒にして評価するのでは、公平な判断とは言えない。", category: .wisdom),

    Proverb(id: 945, text: "三たび肘を折って良医となる", reading: "みたびひじをおってりょういとなる",
            meaning: "幾度も苦労を重ねた経験があってこそ、本物の専門家になれるということ。",
            example: "三たび肘を折って良医となるというように、失敗を重ねて初めて一人前になれる。", category: .effort),

    Proverb(id: 946, text: "三日坊主", reading: "みっかぼうず",
            meaning: "何を始めても長続きせず、すぐにやめてしまうこと。またそのような人。",
            example: "日記を書こうと決めたのに、またすぐやめてしまった。いつも三日坊主で困る。", category: .effort),

    Proverb(id: 947, text: "三つ叱って五つ褒め七つ教えて子は育つ", reading: "みつしかってごつほめななつおしえてこはそだつ",
            meaning: "子供を育てるには、叱るより褒め、たくさん教えることが大切だということ。",
            example: "三つ叱って五つ褒め七つ教えて子は育つというように、褒めることを大切にしている。", category: .wisdom),

    Proverb(id: 948, text: "満つれば欠ける", reading: "みつればかける",
            meaning: "物事は満ち足りた状態になると、やがて衰えていくという自然の道理。",
            example: "満つれば欠けるというように、繁栄が続いた会社も油断すれば傾く。", category: .nature),

    Proverb(id: 949, text: "見ぬ商いはできぬ", reading: "みぬあきないはできぬ",
            meaning: "実際に品物を目で確認せずには取引はできないということ。",
            example: "見ぬ商いはできぬというから、現物を確認してから契約することにした。", category: .wisdom),

    Proverb(id: 950, text: "見ぬうちが花", reading: "みぬうちがはな",
            meaning: "実際に見る前の方が想像の中では美しく、見てしまうと失望することがあるということ。",
            example: "憧れの場所も見ぬうちが花で、実際に行ってみたら思ったほどではなかった。", category: .wisdom),

    Proverb(id: 951, text: "実のなる木は花から知れ", reading: "みのなるきははなからしれ",
            meaning: "将来実りをもたらす木は花の段階からわかるように、才能は幼い頃から現れるということ。",
            example: "実のなる木は花から知れというように、彼の子供の頃からの才能は際立っていた。", category: .wisdom),

    Proverb(id: 952, text: "身は習わし", reading: "みはならわし",
            meaning: "習慣や環境によって人は変わるものだということ。",
            example: "身は習わしというように、毎日続けることで自然と身についていく。", category: .wisdom),

    Proverb(id: 953, text: "蚯蚓の木登り", reading: "みみずのきのぼり",
            meaning: "地中に生きるミミズが木に登ろうとするように、不可能なことのたとえ。",
            example: "準備もせずにエベレストに登ろうとするのは蚯蚓の木登りと同じだ。", category: .wisdom),

    Proverb(id: 954, text: "耳取って鼻をかむ", reading: "みみとってはなをかむ",
            meaning: "突拍子もなく無理な要求をすること。",
            example: "一度も会ったことのない相手に多額の援助を求めるとは、耳取って鼻をかむとはこのことだ。", category: .wisdom),

    Proverb(id: 955, text: "耳に胼胝", reading: "みみにたこ",
            meaning: "同じことを繰り返し聞かされて、うんざりすること。",
            example: "「早く結婚しなさい」という言葉は耳に胼胝ができるほど聞かされた。", category: .emotion),

    Proverb(id: 956, text: "耳を傾けて鐘を盗む", reading: "みみをかたむけてかねをぬすむ",
            meaning: "自分だけは気づかれないと思って悪事を働くが、実はとっくにばれているということ。",
            example: "耳を傾けて鐘を盗むというように、こっそり不正をしても必ず発覚する。", category: .wisdom),

    Proverb(id: 957, text: "見目は果報の基", reading: "みめはかほうのもとい",
            meaning: "容姿が美しいことは、幸運を呼び込む基になるということ。",
            example: "見目は果報の基というから、身だしなみを整えることも大切だ。", category: .luck),

    Proverb(id: 958, text: "見ると聞くとは大違い", reading: "みるときくとはおおちがい",
            meaning: "実際に自分の目で見るのと、人から聞いて知るのとでは大きな違いがあるということ。",
            example: "見ると聞くとは大違いで、現地に行って初めてその深刻さを理解した。", category: .wisdom),

    Proverb(id: 959, text: "見るに目の毒", reading: "みるにめのどく",
            meaning: "見ると欲しくなったり悪影響を受けたりするので、見ない方がよいこと。",
            example: "あの店のショーウィンドウは見るに目の毒で、つい財布のひもが緩んでしまう。", category: .emotion),

    Proverb(id: 960, text: "身を捨ててこそ浮かぶ瀬もあれ", reading: "みをすててこそうかぶせもあれ",
            meaning: "一身を投げ出す覚悟で事に当たってこそ、初めて活路が開けるということ。",
            example: "身を捨ててこそ浮かぶ瀬もあれという言葉を胸に、困難な交渉に挑んだ。", category: .action),

    Proverb(id: 961, text: "六日の菖蒲十日の菊", reading: "むいかのあやめとおかのきく",
            meaning: "時機を逸してしまうと、役に立たなくなることのたとえ。",
            example: "六日の菖蒲十日の菊というように、手遅れになってから謝っても意味がない。", category: .wisdom),

    Proverb(id: 962, text: "向かうしに矢立たず", reading: "むかうしにやたたず",
            meaning: "正面から向き合っている相手には、直接攻撃することができないということ。",
            example: "向かうしに矢立たずというように、時には迂回して交渉する方がよい場合もある。", category: .wisdom),

    Proverb(id: 963, text: "昔取った杵柄", reading: "むかしとったきねづか",
            meaning: "若い頃に習得した技量は、年をとっても十分に発揮できるということ。",
            example: "昔取った杵柄で、長年のブランクがあっても彼の料理の腕は衰えていなかった。", category: .effort),

    Proverb(id: 964, text: "昔のことを言うと鬼が笑う", reading: "むかしのことをいうとおにがわらう",
            meaning: "遠い過去のことをとやかく言っても、今更どうにもならないということ。",
            example: "昔のことを言うと鬼が笑うというから、過去の失敗を蒸し返すのはやめよう。", category: .wisdom),

    Proverb(id: 965, text: "昔の某今の金貨", reading: "むかしのなにがしいまのきんか",
            meaning: "昔は立派な人物が今では卑しい立場になっていること。時代が変われば評価も変わるということ。",
            example: "昔の某今の金貨というように、かつての英雄が今では忘れられた存在になっていた。", category: .emotion),

    Proverb(id: 966, text: "昔は今の鏡", reading: "むかしはいまのかがみ",
            meaning: "歴史を学ぶことが、現在を生きる上での参考になるということ。",
            example: "昔は今の鏡というように、歴史から学ぶことで同じ過ちを繰り返さずにすむ。", category: .wisdom),

    Proverb(id: 967, text: "百足は死んでも倒れず", reading: "むかではしんでもたおれず",
            meaning: "勢力の基盤が強固で、衰えても余力があることのたとえ。",
            example: "百足は死んでも倒れずというように、老舗の企業はなかなか潰れないものだ。", category: .action),

    Proverb(id: 968, text: "麦と姑は踏むほどよい", reading: "むぎとしゅうとめはふむほどよい",
            meaning: "麦も姑も、厳しく扱うほどよい結果が出るということ。",
            example: "麦と姑は踏むほどよいとも言うが、適度な厳しさが人を育てることもある。", category: .relationships),

    Proverb(id: 969, text: "無芸大食", reading: "むげいたいしょく",
            meaning: "取り立てて芸や能力もないのに、食べることばかり旺盛なこと。",
            example: "何も取り柄がないのに食欲だけは旺盛な弟は、無芸大食の典型だ。", category: .wisdom),

    Proverb(id: 970, text: "娘の子は強盗八人", reading: "むすめのこはごうとうはちにん",
            meaning: "娘を育てて嫁に出すまでには莫大な費用がかかるということ。",
            example: "娘の子は強盗八人というように、三人の娘を嫁がせるまでは大変な出費だった。", category: .relationships),

    Proverb(id: 971, text: "娘を見るより母を見よ", reading: "むすめをみるよりははをみよ",
            meaning: "結婚相手を選ぶときは、娘より母親の人柄や性格を見よということ。",
            example: "娘を見るより母を見よというように、彼女の母親の礼儀正しさに感心した。", category: .wisdom),

    Proverb(id: 972, text: "胸に一物", reading: "むねにいちもつ",
            meaning: "心の中に何か企みや考えを隠し持っていること。",
            example: "彼の親切な申し出には胸に一物あるようで、素直に受け取れなかった。", category: .emotion),

    Proverb(id: 973, text: "紫の朱を奪う", reading: "むらさきのしゅをうばう",
            meaning: "似たような偽物が本物の地位を奪ってしまうこと。",
            example: "紫の朱を奪うというように、質の低いコピー商品が市場を席巻してしまった。", category: .wisdom),

    Proverb(id: 974, text: "無理が通れば道理引っ込む", reading: "むりがとおればどうりひっこむ",
            meaning: "道理に合わないことが罷り通るようになると、正しい道理が通らなくなるということ。",
            example: "無理が通れば道理引っ込むというが、権力者のわがままがまかり通る社会は健全ではない。", category: .wisdom),

    Proverb(id: 975, text: "名人は人を誘らず", reading: "めいじんはひとをいざなわず",
            meaning: "本当の名人は自分から人を誘ったり、他人の欠点を指摘したりしないということ。",
            example: "名人は人を誘らずというように、本物の達人は静かに自分の道を歩むものだ。", category: .wisdom),

    Proverb(id: 976, text: "命は義によって軽し", reading: "めいはぎによってかるし",
            meaning: "命は大切なものだが、義のためには命も惜しまないということ。",
            example: "命は義によって軽しと言った武将のように、信念のために命をかけた人は少なくない。", category: .action),

    Proverb(id: 977, text: "雌牛に腹突かれる", reading: "めうしにはらつかれる",
            meaning: "温和で油断のならない相手から、思わぬ打撃を受けること。",
            example: "おとなしそうな彼女から猛烈に反論されて、雌牛に腹突かれた気分だった。", category: .action),

    Proverb(id: 978, text: "目から鼻へ抜ける", reading: "めからはなへぬける",
            meaning: "非常に賢くて、機転が利くこと。",
            example: "彼女は目から鼻へ抜けるような人で、状況を素早く把握して対応した。", category: .wisdom),

    Proverb(id: 979, text: "目から火が出る", reading: "めからひがでる",
            meaning: "頭や顔などに強い衝撃を受けた時の状態を表す言葉。",
            example: "転んで頭を打ち、目から火が出るような衝撃を感じた。", category: .emotion),

    Proverb(id: 980, text: "目くじらを立てる", reading: "めくじらをたてる",
            meaning: "些細なことにも目を吊り上げて怒ること。",
            example: "目くじらを立てるほどのことでもないのに、彼はひどく怒った。", category: .emotion),

    Proverb(id: 981, text: "目糞鼻糞を笑う", reading: "めくそはなくそをわらう",
            meaning: "自分にも欠点があるのに、他人の欠点を笑うこと。",
            example: "目糞鼻糞を笑うとはこのことで、彼は自分の失敗を棚に上げて人の批判をする。", category: .wisdom),

    Proverb(id: 982, text: "盲蛇に怖じず", reading: "めくらへびにおじず",
            meaning: "知識がないために、本来恐ろしいものでも恐れを知らないこと。",
            example: "盲蛇に怖じずというように、危険を知らないまま突き進んでしまった。", category: .wisdom),

    Proverb(id: 983, text: "飯の上の蠅", reading: "めしのうえのはえ",
            meaning: "食事の上にとまる蠅のように、邪魔で迷惑な存在のたとえ。",
            example: "あの人は会議の場でいつも揚げ足ばかり取る、飯の上の蠅のような存在だ。", category: .emotion),

    Proverb(id: 984, text: "目には青葉山ほとぎす初鰹", reading: "めにはあおばやまほとぎすはつがつお",
            meaning: "初夏の目・耳・口を楽しませる代表的な風物を詠んだ言葉。",
            example: "目には青葉山ほとぎす初鰹という句のように、五月は感覚を楽しませる季節だ。", category: .nature),

    Proverb(id: 985, text: "目には目歯には歯", reading: "めにはめはにはは",
            meaning: "受けた害に対しては、同じ程度の報復をしてよいという考え方。",
            example: "目には目歯には歯というように、やられたらやり返すという姿勢で交渉に臨んだ。", category: .action),

    Proverb(id: 986, text: "目の上の瘤", reading: "めのうえのこぶ",
            meaning: "自分の地位より少し上にあって、邪魔で目障りな存在のたとえ。",
            example: "彼はライバル会社の敏腕営業マンを目の上の瘤だと思っていた。", category: .emotion),

    Proverb(id: 987, text: "目の正月", reading: "めのしょうがつ",
            meaning: "美しいものや珍しいものを見て楽しむこと。",
            example: "美術館で名画を鑑賞して、目の正月をした気分だった。", category: .emotion),

    Proverb(id: 988, text: "目を皿", reading: "めをさら",
            meaning: "目を大きく開いて熱心に探したり見たりする様子。",
            example: "落とした指輪を探して、目を皿にして床を見回した。", category: .action),

    Proverb(id: 989, text: "面壁九年", reading: "めんびきゅうねん",
            meaning: "長年、わき目もふらずに一つのことに没頭して努力すること。",
            example: "面壁九年の末に完成した彼の作品は、多くの人を感動させた。", category: .effort),

    Proverb(id: 990, text: "面々の楊貴妃", reading: "めんめんのようきひ",
            meaning: "誰もが自分の恋人や妻を最高の美人だと思っているということ。",
            example: "面々の楊貴妃というように、それぞれが自分の妻を世界一だと思っているものだ。", category: .relationships),

    Proverb(id: 991, text: "盲亀の浮木", reading: "もうきのふぼく",
            meaning: "めったにあり得ない幸運なめぐり合わせのたとえ。",
            example: "こんな偶然の出会いは盲亀の浮木のようなもので、二度とないだろう。", category: .luck),

    Proverb(id: 992, text: "持ちつ持たれつ", reading: "もちつもたれつ",
            meaning: "お互いに助け合い、頼り合うこと。",
            example: "持ちつ持たれつの関係で、二つの会社はうまく協力して事業を進めた。", category: .relationships),

    Proverb(id: 993, text: "餅に砂糖", reading: "もちにさとう",
            meaning: "良いものにさらに良いものを加えることのたとえ。",
            example: "実力のある彼がさらに経験を積んだのは、餅に砂糖のようなものだ。", category: .wisdom),

    Proverb(id: 994, text: "餅は乞食に焼かせろ魚は殿様に焼かせろ", reading: "もちはこじきにやかせろさかなはとのさまにやかせろ",
            meaning: "餅はじっくりと、魚はさっと焼くのがよいということ。物には適した扱い方があるということ。",
            example: "餅は乞食に焼かせろ魚は殿様に焼かせろというように、物には適した調理法がある。", category: .wisdom),

    Proverb(id: 995, text: "持ったが病", reading: "もったがやまい",
            meaning: "物を持つと手放せなくなり、かえって不便になること。",
            example: "余分な荷物は持ったが病で、持ち過ぎて動きが取れなくなった。", category: .wisdom),

    Proverb(id: 996, text: "持つべきものは子", reading: "もつべきものはこ",
            meaning: "困った時に助けてくれる子供こそ、最も大切な宝であるということ。",
            example: "怪我をして入院した時、子供たちが毎日見舞いに来てくれた。持つべきものは子だと感じた。", category: .relationships),

    Proverb(id: 997, text: "元の鞘へ収める", reading: "もとのさやへおさめる",
            meaning: "仲違いした者同士が仲直りして、元の関係に戻ること。",
            example: "けんかをしていた二人も、共通の友人の仲介で元の鞘へ収まった。", category: .relationships),

    Proverb(id: 998, text: "元の女房に仲人なし", reading: "もとのにょうぼうになこうどなし",
            meaning: "別れた夫婦が再び一緒になる時は仲人が不要なほど、簡単だということ。",
            example: "元の女房に仲人なしというように、別れた二人はあっさりと再婚した。", category: .relationships),

    Proverb(id: 999, text: "元のもくあみ", reading: "もとのもくあみ",
            meaning: "苦労して手に入れたものも、結局は元の状態に戻ってしまうこと。",
            example: "せっかく痩せたのに、また太ってしまって元のもくあみになった。", category: .effort),

    Proverb(id: 1000, text: "元も子も失う", reading: "もともこもうしなう",
            meaning: "元金だけでなく利益も合わせて、すべてを失ってしまうこと。",
            example: "欲をかいて大きな賭けに出た結果、元も子も失ってしまった。", category: .wisdom),

    Proverb(id: 1001, text: "物言えば唇寒し", reading: "ものいえばくちびるさむし",
            meaning: "余計なことを口にすると、後で何かと面倒なことが起こるということ。",
            example: "物言えば唇寒しというから、会議では余計な発言を控えるようにしている。", category: .wisdom),

    Proverb(id: 1002, text: "物種は盗まれず人種は盗まれず", reading: "ものだねはぬすまれずひとだねはぬすまれず",
            meaning: "植物の種は誰にも盗めないように、人の才能や品性は誰にも奪えないということ。",
            example: "物種は盗まれず人種は盗まれずというように、真の才能は誰にも奪えない。", category: .wisdom),

    Proverb(id: 1003, text: "物には時節", reading: "ものにはじせつ",
            meaning: "何事もそれに適した時期があるということ。",
            example: "物には時節というように、今は動く時ではないとじっと待つことにした。", category: .wisdom),

    Proverb(id: 1004, text: "物は相談", reading: "ものはそうだん",
            meaning: "何事も一人で抱え込まず、誰かに相談することが大切だということ。",
            example: "物は相談というから、困った時は遠慮なく話しかけてください。", category: .wisdom),

    Proverb(id: 1005, text: "物は試し", reading: "ものはためし",
            meaning: "まずやってみること。試してみなければわからないということ。",
            example: "物は試しというから、苦手な料理にも挑戦してみることにした。", category: .action),

    Proverb(id: 1006, text: "貰う物は夏でも小袖", reading: "もらうものはなつでもこそで",
            meaning: "もらえるものは何でも有り難く受け取るべきだということ。",
            example: "貰う物は夏でも小袖というように、せっかくの厚意は素直に受け取るべきだ。", category: .wisdom),

    Proverb(id: 1007, text: "門前に市をなす", reading: "もんぜんにいちをなす",
            meaning: "名声や地位のある人の門前に多くの人が集まること。",
            example: "有名な政治家の事務所は門前に市をなすほど、陳情者が押しかけていた。", category: .relationships),

    Proverb(id: 1008, text: "門に入らば笠を脱げ", reading: "もんにいらばかさをぬげ",
            meaning: "他人の家や組織に入る時は、礼儀をわきまえて行動せよということ。",
            example: "門に入らば笠を脱げというように、よその会社を訪問する際は礼儀を尽くした。", category: .wisdom),

    // MARK: - や行

    Proverb(id: 1009, text: "薬缶で茹でた蛸", reading: "やかんでゆでたこ",
            meaning: "閉じた空間に閉じ込められて身動きが取れない状態。また、逃げ場のない状況でどうにもならないことのたとえ。",
            example: "締め切りと上司の板挟みで、まさに薬缶で茹でた蛸の状態だった。", category: .action),

    Proverb(id: 1010, text: "焼餅は膨れながら熱くなる", reading: "やきもちはふくれながらあつくなる",
            meaning: "嫉妬は抑えようとしても内側でどんどん激しくなるということ。焼き餅が膨れながら焼けるように、妬みの感情は表に出すまいとするほど燃え上がるたとえ。",
            example: "焼餅は膨れながら熱くなるというように、彼女の嫉妬心は隠そうとするほどに募っていった。", category: .emotion),

    Proverb(id: 1011, text: "疫病神で敵を取る", reading: "やくびょうがみでかたきをとる",
            meaning: "害をもたらすはずの疫病神が逆に敵を退治してくれることから、思わぬものが意外な助けになること。",
            example: "疫病神で敵を取るような皮肉な展開で、妨害者のおかげで問題が解決した。", category: .luck),

    Proverb(id: 1012, text: "焼石に水", reading: "やけいしにみず",
            meaning: "少しの援助や努力では全く効果がないこと。焼けた石に水をかけても冷やすことができないことから。",
            example: "少額の援助では焼石に水で、根本的な対策が急務だった。", category: .wisdom),

    Proverb(id: 1013, text: "焼野の雉子", reading: "やけののきぎす",
            meaning: "子を思う親の愛情の深さのたとえ。野火に焼かれても我が子を守ろうとする雉子（きじ）の母のように、親は身の危険を顧みず子を守るということ。",
            example: "焼野の雉子のように、母は危険も顧みず子供を守ろうと身を投じた。", category: .relationships),

    Proverb(id: 1014, text: "焼面火に懲りず", reading: "やけつらひにこりず",
            meaning: "一度痛い目に遭っても同じ過ちを繰り返すこと。懲りない者のたとえ。",
            example: "焼面火に懲りずというように、同じ失敗を何度も繰り返している。", category: .action),

    Proverb(id: 1015, text: "安かろう悪かろう", reading: "やすかろうわるかろう",
            meaning: "値段が安いものは品質も低いということ。安さには相応の理由があるという教え。",
            example: "安かろう悪かろうというから、格安品を買って後悔することになった。", category: .wisdom),

    Proverb(id: 1016, text: "安物買いの銭失い", reading: "やすものがいのぜにうしない",
            meaning: "安い物を買うと壊れやすく、結果的に高くつくということ。節約のつもりが損になることへの戒め。",
            example: "安物買いの銭失いとはよく言ったもので、安い靴を買ったらすぐに壊れて買い直すことになった。", category: .wisdom),

    Proverb(id: 1017, text: "鑢と薬の飲み違い", reading: "やすりとくすりののみちがい",
            meaning: "似て非なるものを取り違えてしまうこと。名前や外見が似ているものを間違えると大変なことになるというたとえ。",
            example: "鑢と薬の飲み違いのように、よく似たものを混同してしまうと取り返しのつかないことになる。", category: .wisdom),

    Proverb(id: 1018, text: "痩せ馬鞭を恐れず", reading: "やせうまむちをおそれず",
            meaning: "極限まで追い詰められると、もはや何も恐れなくなること。また、弱った者が逆に開き直って向かってくるたとえ。",
            example: "痩せ馬鞭を恐れずとばかりに、追い詰められた彼は強引な手に出てきた。", category: .action),

    Proverb(id: 1019, text: "柳は風に従う", reading: "やなぎはかぜにしたがう",
            meaning: "柳が風になびいて折れないように、相手に逆らわず柔軟に従うことで難を逃れることができるということ。",
            example: "柳は風に従うように、批判にも柔軟に対応して彼女は危機を乗り越えた。", category: .wisdom),

    Proverb(id: 1020, text: "柳は緑花は紅", reading: "やなぎはみどりはなはくれない",
            meaning: "柳は緑で花は赤いと、自然のままの姿が最も美しいということ。物事をあるがままに見ることの大切さを説く言葉。",
            example: "柳は緑花は紅というように、人もそれぞれの個性をありのままに発揮することが美しい。", category: .nature),

    Proverb(id: 1021, text: "やはり野に置け蓮華草", reading: "やはりのにおけれんげそう",
            meaning: "蓮華草は野に咲いてこそ美しいように、物はそれぞれ本来あるべき場所に置かれてこそ映えるということ。",
            example: "やはり野に置け蓮華草というように、その人の才能が最も活きる場所に配置することが大切だ。", category: .wisdom),

    Proverb(id: 1022, text: "藪から棒", reading: "やぶからぼう",
            meaning: "前触れなく突然物事が起こること。唐突に何かを言ったり行動したりすること。",
            example: "藪から棒にそんな話を持ち出されても困る。もっと事前に相談してほしかった。", category: .action),

    Proverb(id: 1023, text: "藪に功の者", reading: "やぶにこうのもの",
            meaning: "藪の中にも優れた人物が潜んでいるように、意外な場所に有能な人材がいること。また、外見では分からない優秀さがある人のたとえ。",
            example: "藪に功の者というように、無名の新人が本番で驚くほどの実力を発揮した。", category: .wisdom),

    Proverb(id: 1024, text: "藪蛇", reading: "やぶへび",
            meaning: "余計なことをして、かえって自分が不利な状況を招くこと。藪をつついて蛇を出すことから。",
            example: "余計な発言が藪蛇になって、問題がさらに大きくなってしまった。", category: .action),

    Proverb(id: 1025, text: "病膏肓に入る", reading: "やまいこうこうにいる",
            meaning: "病気が治療の及ばない深部まで侵されること。転じて、悪い趣味や習慣が度を超えて手のつけられない状態になること。",
            example: "ゲームへの依存が病膏肓に入り、日常生活にも支障が出るほどになってしまった。", category: .action),

    Proverb(id: 1026, text: "病治りて薬忘れる", reading: "やまいなおりてくすりわすれる",
            meaning: "苦しい状況が過ぎ去ると、その時の教訓をすぐに忘れてしまうこと。苦労が終わると油断しがちであることへの戒め。",
            example: "病治りて薬忘れるとはよく言ったもので、健康が戻ったとたんに生活習慣が元通りになってしまった。", category: .wisdom),

    Proverb(id: 1027, text: "病は気から", reading: "やまいはきから",
            meaning: "病気は多くの場合、気持ちの持ち方から起こるということ。精神状態が身体の健康に大きく影響するというたとえ。",
            example: "病は気から、前向きな気持ちで療養に臨んだら回復が早かった。", category: .wisdom),

    Proverb(id: 1028, text: "病は口から入り禍は口から出る", reading: "やまいはくちからはいりわざわいはくちからでる",
            meaning: "病気は飲食物から口を通して入り、災いは軽率な言葉によって招くということ。食事と言葉の両方に気をつけよという戒め。",
            example: "病は口から入り禍は口から出るというから、食事にも発言にも十分気をつけている。", category: .wisdom),

    Proverb(id: 1029, text: "山から里", reading: "やまからさと",
            meaning: "山奥から賑やかな里に出てきた者が世間のことに不慣れで驚くこと。世間知らずのたとえ。",
            example: "山から里に出てきたように、都会の生活に戸惑っている様子だった。", category: .wisdom),

    Proverb(id: 1030, text: "山高けれど谷深し", reading: "やまたかけれどたにふかし",
            meaning: "山が高ければ谷も深いように、優れたものには必ず深い面がある。また、栄えているものの裏に潜む困難があるということ。",
            example: "山高けれど谷深し、繁栄する企業の裏には深刻な課題が潜んでいた。", category: .wisdom),

    Proverb(id: 1031, text: "山の芋が鰻となる", reading: "やまのいもがうなぎとなる",
            meaning: "ありえないような変化が起こること。全く異なるものが別のものに変わるような、意外な変化のたとえ。",
            example: "山の芋が鰻となるような驚きの変貌で、その新人は一躍スターになった。", category: .luck),

    Proverb(id: 1032, text: "山のことは樵に聞け", reading: "やまのことはきこりにきけ",
            meaning: "物事はその道の専門家や熟練者に尋ねるのが最善であるということ。",
            example: "山のことは樵に聞けというから、法律の問題は専門の弁護士に相談した。", category: .wisdom),

    Proverb(id: 1033, text: "山桃の選り食い", reading: "やまもものよりぐい",
            meaning: "山の桃を選り好みして食べるように、良いものだけを取ろうとする贅沢な選り好みのたとえ。",
            example: "山桃の選り食いをしているうちに、良い機会をみすみす逃してしまった。", category: .action),

    Proverb(id: 1034, text: "山より大きな獣は出ない", reading: "やまよりおおきなけものはでない",
            meaning: "物事にはそれぞれの限度があり、その範囲を超えたものは生まれないということ。分相応であることの大切さを表す。",
            example: "山より大きな獣は出ないというように、分を超えた無理な期待は禁物だ。", category: .wisdom),

    Proverb(id: 1035, text: "闇夜に烏", reading: "やみよにからす",
            meaning: "暗闇に黒いものが紛れて見えないことから、区別のつかないもの、または何も見通せない状況のたとえ。",
            example: "闇夜に烏で、どちらが本物か全く判断がつかない状況に陥った。", category: .wisdom),

    Proverb(id: 1036, text: "槍玉に挙げる", reading: "やりだまにあげる",
            meaning: "多くの中から特定の人や事柄を選び出して批判や攻撃の的にすること。",
            example: "会議で彼の提案だけが槍玉に挙げられ、集中砲火を浴びた。", category: .action),

    // MARK: - ゆ行

    Proverb(id: 1037, text: "勇将の下に弱卒なし", reading: "ゆうしょうのもとにじゃくそつなし",
            meaning: "優れた将の下には弱い兵はいないということ。上に立つ者の器量が部下の力量を決めるというたとえ。",
            example: "勇将の下に弱卒なしというように、名監督のもとで選手たちは見違えるほど成長した。", category: .relationships),

    Proverb(id: 1038, text: "夕立は馬の背を分ける", reading: "ゆうだちはうまのせをわける",
            meaning: "夕立の降る範囲は非常に局地的で、馬の背の片側だけ濡れて反対側は乾いているほど狭いことがあるということ。",
            example: "夕立は馬の背を分けるというが、通り一本違うだけで雨が降っていなかった。", category: .nature),

    Proverb(id: 1039, text: "幽霊の浜風に逢う", reading: "ゆうれいのはまかぜにあう",
            meaning: "実体のない幽霊のような、はっきりしない状態や曖昧な状況に遭遇すること。",
            example: "返事があるのかないのかわからず、幽霊の浜風に逢うような落ち着かない毎日だった。", category: .emotion),

    Proverb(id: 1040, text: "行き大名帰り乞食", reading: "ゆきだいみょうかえりこじき",
            meaning: "行きには豪勢に費用を使い、帰りには金が尽きて乞食同然になること。先を考えずに浪費することへの戒め。",
            example: "旅行で行き大名帰り乞食になってしまい、帰りは財布を気にしながら戻ってきた。", category: .wisdom),

    Proverb(id: 1041, text: "雪と墨", reading: "ゆきとすみ",
            meaning: "全く正反対のものの対比。雪の白と墨の黒のように、対照的なもののたとえ。",
            example: "二人の性格は雪と墨のように対照的だが、なぜか息が合っていた。", category: .wisdom),

    Proverb(id: 1042, text: "雪の上に霜", reading: "ゆきのうえにしも",
            meaning: "悪い状況の上にさらに不幸が重なること。苦難の上にまた苦難が加わることのたとえ。",
            example: "怪我をしたうえに職まで失い、雪の上に霜のような状況になってしまった。", category: .luck),

    Proverb(id: 1043, text: "雪の中に筍を掘る", reading: "ゆきのなかにたけのこをほる",
            meaning: "真冬に筍を掘るという不可能に近いことを孝行のために行うこと。誠意や孝行の心があれば奇跡も起きるというたとえ。",
            example: "雪の中に筍を掘るような苦労をいとわず、遠方の親のために尽力した。", category: .relationships),

    Proverb(id: 1044, text: "雪は豊年の貢物", reading: "ゆきはほうねんのみつぎもの",
            meaning: "雪が多い年は翌年の農作物が豊かに実るということ。雪が田畑に恵みをもたらす贈り物であるたとえ。",
            example: "雪は豊年の貢物というから、今年の大雪で来年の農業への期待が高まっている。", category: .nature),

    Proverb(id: 1045, text: "油断大敵", reading: "ゆだんたいてき",
            meaning: "気を緩めることが最大の敵であるということ。油断することが失敗や危険を招く最大の原因になるという戒め。",
            example: "油断大敵というから、試合に勝ち続けても最後まで気を引き締めて臨んだ。", category: .action),

    Proverb(id: 1046, text: "指汚しとて切られもせず", reading: "ゆびよごしとてきられもせず",
            meaning: "担っている役割が多少汚れを伴うものでも、その責任を途中で放棄することはできないということ。",
            example: "指汚しとて切られもせずというように、どんな面倒な仕事でも途中で投げ出すわけにはいかない。", category: .effort),

    Proverb(id: 1047, text: "夢に饅頭を食う", reading: "ゆめにまんじゅうをくう",
            meaning: "夢の中で食べても腹は満たされないように、空想や皮算用はいくらしても実際には何の役にも立たないこと。",
            example: "宝くじの使い道を考えるのは夢に饅頭を食うようなものだと笑われた。", category: .wisdom),

    Proverb(id: 1048, text: "夢は五臓の煩い", reading: "ゆめはごぞうのわずらい",
            meaning: "夢は五臓（内臓）の疲れや心の悩みが反映されたものだということ。夢に特別な意味を求めても仕方がないという考え方。",
            example: "夢は五臓の煩いというから、変な夢を見ても気にしないようにしている。", category: .wisdom),

    Proverb(id: 1049, text: "揺籠から墓場まで", reading: "ゆりかごからはかばまで",
            meaning: "生まれてから死ぬまでの一生涯を指す言葉。特に社会保障制度が生涯にわたって人々を支えることを表すスローガン。",
            example: "揺籠から墓場まで国民を守る社会保障制度の充実を政策として掲げた。", category: .wisdom),

    Proverb(id: 1050, text: "湯を沸かして水にする", reading: "ゆをわかしてみずにする",
            meaning: "せっかく積み上げた努力や成果を台無しにしてしまうこと。苦労して得たものを無駄にするたとえ。",
            example: "一度の失言で長年築いた信頼を湯を沸かして水にしてしまった。", category: .action),

    // MARK: - よ行

    Proverb(id: 1051, text: "夜明け前が一番暗い", reading: "よあけまえがいちばんくらい",
            meaning: "夜明けの直前が最も暗いように、希望が見えない最も苦しい時期こそが、事態が好転する直前であるということ。",
            example: "夜明け前が一番暗いというから、今が最も辛い時期だとしても、必ず光が見えてくると信じて耐えた。", category: .luck),

    Proverb(id: 1052, text: "良い鷹は爪を隠す", reading: "よいたかはつめをかくす",
            meaning: "本当に優れた者は、その実力や才能をむやみに見せびらかさないということ。",
            example: "良い鷹は爪を隠すというように、その道の達人ほど謙虚に振る舞うものだ。", category: .wisdom),

    Proverb(id: 1053, text: "宵っ張りの朝寝坊", reading: "よいっぱりのあさねぼう",
            meaning: "夜遅くまで起きていて、朝はなかなか起きられない人のこと。夜更かしして朝寝坊する生活習慣への批判。",
            example: "宵っ張りの朝寝坊では仕事にも支障が出る。規則正しい生活を心がけるべきだ。", category: .wisdom),

    Proverb(id: 1054, text: "酔いどれ我をせず", reading: "よいどれがをせず",
            meaning: "酔った者は理性を失い、自制が利かなくなること。または酔った勢いで本音が出るともいう。",
            example: "酔いどれ我をせずというから、お酒の席での言動には特に気をつけなければならない。", category: .wisdom),

    Proverb(id: 1055, text: "よい分別は雪隠で出る", reading: "よいふんべつはせっちんでる",
            meaning: "よいアイデアや判断は、一人で静かに落ち着いて考えた時に生まれるということ。日本の便所は間仕切りがあって個室になっており、一人で落ち着いて考えられる場所だから。",
            example: "よい分別は雪隠で出るというように、じっくり一人で考えたら良い解決策が浮かんだ。", category: .wisdom),

    Proverb(id: 1056, text: "用心は臆病となし", reading: "ようじんはおくびょうとなし",
            meaning: "慎重に用心深く行動することを臆病とは言わない。細心の注意を払うことは賢明な行為であるということ。",
            example: "用心は臆病となしというから、危険な場面では慎重すぎるくらいの対応が正しい。", category: .wisdom),

    Proverb(id: 1057, text: "羊頭狗肉", reading: "ようとうくにく",
            meaning: "外見や看板は立派でも、実際の内容や品質が伴っていないこと。見せかけと実質が一致しないことのたとえ。",
            example: "あの商品は羊頭狗肉で、宣伝の内容とは全く異なる粗悪品だった。", category: .wisdom),

    Proverb(id: 1058, text: "養由に弓を言う", reading: "ようゆうにゆみをいう",
            meaning: "弓の名人・養由（ようゆう）に弓を教えるように、その道の達人に素人が知ったかぶりをして教えようとすること。",
            example: "養由に弓を言うようなもので、一流の料理人に料理法を指摘するとは無礼だと言われた。", category: .wisdom),

    Proverb(id: 1059, text: "よく泳ぐ者は溺れよく騎る者は堕つ", reading: "よくおよぐものはおぼれよくのるものはおちる",
            meaning: "自分が得意とする分野で過信して油断した結果、失敗しやすいということ。得意なことほど慎重にするべきという戒め。",
            example: "よく泳ぐ者は溺れというから、得意な仕事こそ油断せずに丁寧に取り組むようにしている。", category: .wisdom),

    Proverb(id: 1060, text: "欲に頂なし", reading: "よくにいただきなし",
            meaning: "欲望には限りがなく、一つが満たされるとまた次の欲が湧いてくること。",
            example: "欲に頂なしというように、次々と新しいものを求め続けて、いつまでも満足できない。", category: .wisdom),

    Proverb(id: 1061, text: "欲の熊鷹股裂ける", reading: "よくのくまたかまたさける",
            meaning: "熊鷹が獲物を両方の足で掴もうとして股が裂けるように、欲を張りすぎると何も得られなくなること。",
            example: "欲の熊鷹股裂けるというように、二兎を追って両方の仕事を失ってしまった。", category: .action),

    Proverb(id: 1062, text: "よく学びよく遊べ", reading: "よくまなびよくあそべ",
            meaning: "学ぶ時はしっかり学び、遊ぶ時は思い切り遊ぶことが大切であること。勉強と遊びのメリハリをつけることの重要さを説く。",
            example: "よく学びよく遊べというように、勉強と遊びのバランスを取りながら充実した学生生活を送った。", category: .effort),

    Proverb(id: 1063, text: "預言者郷里に容れられず", reading: "よげんしゃきょうりにいれられず",
            meaning: "有能な人物ほど、生まれ故郷や身近な人には正当に評価されないこと。イエス・キリストの言葉に由来する西洋の言葉。",
            example: "預言者郷里に容れられずというように、地元では評価されなかった彼が海外で高く評価された。", category: .wisdom),

    Proverb(id: 1064, text: "横車を押す", reading: "よこぐるまをおす",
            meaning: "車は縦（前後）に動かすものなのに横に押して動かそうとすることから、道理に合わないことを無理やり強引に行うこと。",
            example: "彼は横車を押すように、全員の反対を押し切って自分の計画を強行した。", category: .action),

    Proverb(id: 1065, text: "横のものを縦にもしない", reading: "よこのものをたてにもしない",
            meaning: "横に置いてあるものを縦にすることさえしないほど、非常に面倒くさがりで怠惰なこと。",
            example: "横のものを縦にもしないような怠け者では、仕事を任せることができない。", category: .action),

    Proverb(id: 1066, text: "葦の髄から天井覗く", reading: "よしのずいからてんじょうのぞく",
            meaning: "葦の細い管を通して天井を見ても全体は見えないように、狭い視野で物事全体を判断しようとすること。",
            example: "葦の髄から天井覗くような狭い見方では、問題の全体像は見えてこない。", category: .wisdom),

    Proverb(id: 1067, text: "世は元値", reading: "よはもとね",
            meaning: "世の中の物事は結局のところ本来の価値や状態に収まるものだということ。",
            example: "世は元値というように、一時的に過大評価されたものも、やがて本来の価値に落ち着いてしまう。", category: .wisdom),

    Proverb(id: 1068, text: "予防は治療に勝る", reading: "よぼうはちりょうにまさる",
            meaning: "病気や問題が起きてから対処するよりも、事前に予防する方が効果的で重要だということ。",
            example: "予防は治療に勝るというから、日頃から健康管理に気をつけて定期検診を欠かさない。", category: .wisdom),

    Proverb(id: 1069, text: "夜道に日は暮れず", reading: "よみちにひはくれず",
            meaning: "夜道を歩いている時はすでに夜なのだから、さらに日が暮れることはない。今の状況がすでに最悪なら、これ以上悪くなることはないというたとえ。",
            example: "夜道に日は暮れずというように、最悪の状況になったのだからもう怖いものはないと開き直った。", category: .luck),

    Proverb(id: 1070, text: "嫁が姑になる", reading: "よめがしゅうとめになる",
            meaning: "以前は苦労させられた立場だった者が、今度は同じように後に来た者を扱う立場になること。時間とともに立場が逆転することのたとえ。",
            example: "嫁が姑になるというように、かつて厳しく仕込まれた彼女が今度は後輩を厳しく指導するようになった。", category: .relationships),

    Proverb(id: 1071, text: "夜目遠目笠の内", reading: "よめとおめかさのうち",
            meaning: "夜見るもの、遠くから見るもの、笠の陰から見るものは、実際より美しく見えるということ。条件が整った場合にだけ良く見えるものがあることのたとえ。",
            example: "夜目遠目笠の内というように、初めて会った時はとても素敵に見えたが、近くで改めて見ると印象が変わった。", category: .wisdom),

    Proverb(id: 1072, text: "嫁の三日褒め", reading: "よめのみっかぼめ",
            meaning: "嫁いできた最初の三日間だけ褒めてくれるが、すぐに厳しくなること。最初だけの一時的な厚遇への戒め。",
            example: "嫁の三日褒めというように、新入社員も最初こそ大切に扱われるが、すぐに厳しく接されるようになる。", category: .relationships),

    Proverb(id: 1073, text: "寄る年波には勝てぬ", reading: "よるとしなみにはかてぬ",
            meaning: "年齢を重ねるにつれて訪れる老化には、誰も逆らうことができないということ。",
            example: "寄る年波には勝てぬというように、若い頃は難なくできていたことが、体力的に辛くなってきた。", category: .nature),

    Proverb(id: 1074, text: "弱り目に祟り目", reading: "よわりめにたたりめ",
            meaning: "弱っている時や困っている時に、さらに別の不幸や苦難が重なること。",
            example: "弱り目に祟り目というように、体調が悪い時に限って仕事でもトラブルが重なった。", category: .luck),

    // MARK: - ら行

    Proverb(id: 1075, text: "来年のことを言えば鬼が笑う", reading: "らいねんのことをいえばおにがわらう",
            meaning: "来年のことなど誰にも分からないのに、さも分かったように話すのは愚かだということ。未来のことを決めつけて話すことへの戒め。",
            example: "来年のことを言えば鬼が笑うというが、将来の計画を細かく立てても状況は変わるものだ。", category: .wisdom),

    Proverb(id: 1076, text: "楽あれば苦あり", reading: "らくあればくあり",
            meaning: "楽しいことがあれば苦しいこともある。喜びと苦労は表裏一体で、交互に訪れるということ。",
            example: "楽あれば苦ありというように、順調だった仕事も、やがて困難な局面を迎えた。", category: .wisdom),

    // MARK: - り行

    Proverb(id: 1077, text: "李下に冠を正さず", reading: "りかにかんむりをたださず",
            meaning: "李（すもも）の木の下で冠を被り直すと、実を盗もうとしているように見える。疑いを招くような行為は慎むべきだという教え。",
            example: "李下に冠を正さずというから、誤解を招く場面では行動に細心の注意を払った。", category: .wisdom),

    Proverb(id: 1078, text: "理屈と膏薬はどこにでも付く", reading: "りくつとこうやくはどこにでもつく",
            meaning: "膏薬がどこにでも貼れるように、理屈もこじつければどんな場合にも通用させることができるということ。",
            example: "理屈と膏薬はどこにでも付くと言うが、彼の言い訳は毎回もっともらしく聞こえた。", category: .wisdom),

    Proverb(id: 1079, text: "立錐の余地もなし", reading: "りっすいのよちもなし",
            meaning: "錐（きり）を立てるわずかな空間もないほど、非常に込み合っていること。",
            example: "会場は立錐の余地もないほど満員で、入口まで人があふれていた。", category: .action),

    Proverb(id: 1080, text: "理の高ければ非の一倍", reading: "りのたかければひのいちばい",
            meaning: "正論を振りかざす人ほど、実際には過ちが多いということ。正義を主張しすぎる者は、かえって非難を受けやすいという戒め。",
            example: "理の高ければ非の一倍というように、完璧主義者の彼ほど、些細な失敗を強く責められた。", category: .wisdom),

    Proverb(id: 1081, text: "竜吟ずれば雲起こる", reading: "りゅうぎんずればくもおこる",
            meaning: "竜が鳴けば雲が湧き起こるように、英雄や偉大な人物が現れると、それに感化された人々が自然と集まってくること。",
            example: "竜吟ずれば雲起こるというように、名将が赴任すると優秀な人材が次々と集まってきた。", category: .relationships),

    Proverb(id: 1082, text: "竜頭蛇尾", reading: "りゅうとうだび",
            meaning: "始めは竜の頭のように勢いがよく立派だが、終わりは蛇の尾のように勢いがなくなること。物事が尻すぼみになることのたとえ。",
            example: "竜頭蛇尾にならないように、最後まで気を抜かずにプロジェクトを完遂した。", category: .effort),

    Proverb(id: 1083, text: "竜の髭を撫でて虎の尾を踏む", reading: "りゅうのひげをなでてとらのおをふむ",
            meaning: "竜の髭を撫でながら虎の尾を踏むような、非常に危険な行為をすること。極めて危ういことをするたとえ。",
            example: "竜の髭を撫でて虎の尾を踏むような危険な交渉を、彼は涼しい顔でこなした。", category: .action),

    Proverb(id: 1084, text: "良禽は木を択んで棲む", reading: "りょうきんはきをえらんですむ",
            meaning: "賢い鳥は棲む木を選ぶように、有能な人物は仕えるべき主君や職場を慎重に選ぶということ。",
            example: "良禽は木を択んで棲むというから、転職先は慎重に見極めるべきだ。", category: .wisdom),

    Proverb(id: 1085, text: "両手に花", reading: "りょうてにはな",
            meaning: "両方の手に花を持つことから、二つの良いものを同時に得ること。また、一人の男性が二人の女性を独占する場合にも使う。",
            example: "美人の姉妹に挟まれて、まさに両手に花の状態だった。", category: .luck),

    Proverb(id: 1086, text: "両方いいのは頬被り", reading: "りょうほういいのはほおかぶり",
            meaning: "どちらにとっても都合よくしたいというのは虫が良すぎることで、現実には難しいという皮肉。",
            example: "両方いいのは頬被りというように、会社と個人の両方を満足させる解決策などないのだ。", category: .wisdom),

    Proverb(id: 1087, text: "両方聞いて下知をなせ", reading: "りょうほうきいてげちをなせ",
            meaning: "物事を裁断する時には、両方の言い分をよく聞いてから判断を下せということ。",
            example: "両方聞いて下知をなせというから、一方の話だけで決断を下すのは危険だ。", category: .wisdom),

    Proverb(id: 1088, text: "良薬口に苦し", reading: "りょうやくくちににがし",
            meaning: "効き目のある薬ほど苦くて飲みにくいように、自分のためになる忠言や諫言ほど耳に痛いということ。",
            example: "良薬口に苦しというように、彼の厳しいアドバイスこそが後々役に立った。", category: .wisdom),

    Proverb(id: 1089, text: "両雄並び立たず", reading: "りょうゆうならびたたず",
            meaning: "二人の英雄が同じ場所に並び立つことはできないということ。実力が伯仲した者同士は共存できないたとえ。",
            example: "両雄並び立たずというように、二人の天才が同じチームにいれば必ず衝突が起きる。", category: .action),

    Proverb(id: 1090, text: "輪言汗の如し", reading: "りんげんあせのごとし",
            meaning: "一度口から出した言葉は、汗のように取り消すことができないということ。発言の責任を問う言葉。",
            example: "輪言汗の如しというから、軽率な発言で後で後悔しないよう、言葉を選んで話した。", category: .wisdom),

    // MARK: - る行

    Proverb(id: 1091, text: "累卵の危うき", reading: "るいらんのあやうき",
            meaning: "卵を積み重ねたような、いつ崩れてもおかしくない非常に危険な状態のたとえ。",
            example: "累卵の危うきに等しい経営状況にもかかわらず、社長は楽観的だった。", category: .action),

    Proverb(id: 1092, text: "類をもって集まる", reading: "るいをもってあつまる",
            meaning: "同じ種類や性質のものは自然と集まるということ。類は友を呼ぶに同じ。",
            example: "類をもって集まるというように、あの集団は似たような性格の人ばかりが集まっていた。", category: .relationships),

    Proverb(id: 1093, text: "ルビコン川を渡る", reading: "るびこんがわをわたる",
            meaning: "もはや後戻りのできない重大な決断をすること。カエサルがルビコン川を渡って内戦に踏み切ったことに由来する。",
            example: "独立という大きな決断は、ルビコン川を渡るようなものだと覚悟して踏み出した。", category: .action),

    // MARK: - れ行

    Proverb(id: 1094, text: "礼も過ぎれば無礼になる", reading: "れいもすぎればぶれいになる",
            meaning: "礼儀も度が過ぎると、かえって相手に対して失礼になるということ。礼儀は程度が大切だという教え。",
            example: "礼も過ぎれば無礼になるというように、過剰なへりくだりは相手を困らせることもある。", category: .wisdom),

    Proverb(id: 1095, text: "歴史は繰り返す", reading: "れきしはくりかえす",
            meaning: "過去に起きた出来事と同じようなことが、時代が変わっても再び起こるということ。人間の本質は変わらないというたとえ。",
            example: "歴史は繰り返すというように、過去の失敗を学ばなければ同じ過ちを犯してしまう。", category: .wisdom),

    Proverb(id: 1096, text: "連木で腹を切る", reading: "れんぎでははらをきる",
            meaning: "擂粉木（れんぎ）という木の棒で腹を切ろうとしても切れないように、不可能なことをしようとすること。また、できないことをできるふりをすること。",
            example: "連木で腹を切るようなことを言っても誰も信じない。実力もないのに大口をたたいてはいけない。", category: .action),

    // MARK: - ろ行

    Proverb(id: 1097, text: "廊下とんび", reading: "ろうかとんび",
            meaning: "廊下に出てきた客などをうろつきながら待つこと。また、遊郭などで客が来るのを廊下で待ちわびる人のこと。転じて、職場などでうろうろしている暇な人のたとえ。",
            example: "廊下とんびのように会議の外でうろうろしていたら、たまたま社長と出会い、直接話す機会を得た。", category: .action),

    Proverb(id: 1098, text: "老化は足から", reading: "ろうかはあしから",
            meaning: "老いの衰えは足から始まるということ。足腰の衰えが老化の始まりであり、歩くことが健康維持の基本だという教え。",
            example: "老化は足からというから、毎日の散歩を欠かさないようにしている。", category: .wisdom),

    Proverb(id: 1099, text: "老少不定の習い", reading: "ろうしょうふじょうのならい",
            meaning: "老人も若者も、命の長さは定まっていないということ。死は年齢に関係なく訪れるという無常の教え。",
            example: "老少不定の習いというように、若くして命を落とすこともあり、毎日を大切に生きなければならない。", category: .wisdom),

    Proverb(id: 1100, text: "老兵は死なず消え去るのみ", reading: "ろうへいはしなずきえさるのみ",
            meaning: "役目を終えた老兵は死ぬのではなく、静かに舞台から退くだけだということ。マッカーサーが日本の敗戦後に述べた言葉として知られる。",
            example: "老兵は死なず消え去るのみという言葉を胸に、長年務めた職場を静かに去った。", category: .wisdom),

    Proverb(id: 1101, text: "籠を得て蜀を望む", reading: "ろうをえてしょくをのぞむ",
            meaning: "隴（ろう）の地を得るとさらに蜀（しょく）の地も欲しくなるという意味から、一つを得ると次の欲が出てくること。貪欲さへの戒め。",
            example: "籠を得て蜀を望むとはよく言ったもので、一つ目の目標を達成したとたん、さらに高い目標を求めるようになった。", category: .wisdom),

    Proverb(id: 1102, text: "六十の手習い", reading: "ろくじゅうのてならい",
            meaning: "六十歳になって書道を習い始めること。転じて、年を取ってから新しいことを始めることのたとえ。何事も遅すぎることはないという励ましの言葉。",
            example: "六十の手習いというが、定年後に始めた絵画の勉強で個展を開くまでになった。", category: .effort),

    Proverb(id: 1103, text: "六十の錠破り", reading: "ろくじゅうのじょうやぶり",
            meaning: "六十歳にもなって異性に入れ込むような、年齢にそぐわない振る舞いをすること。老年になって枯れるどころか、若々しい情熱を見せることへの揶揄。",
            example: "六十の錠破りと周囲に笑われながらも、彼は年齢を感じさせない情熱で新しい恋に踏み出した。", category: .emotion),

    // MARK: - わ行

    Proverb(id: 1104, text: "若木の下で笠を脱げ", reading: "わかきのしたでかさをぬげ",
            meaning: "将来大きく育つ若木の下では笠を脱いで敬意を示せということ。今は小さくても将来大きくなる者を敬い、礼を尽くせという教え。",
            example: "若木の下で笠を脱げというように、若い才能を侮らず丁重に接することが大切だ。", category: .wisdom),

    Proverb(id: 1105, text: "我がことと下り坂に走らぬ者はない", reading: "わがこととくだりざかにはしらぬものはない",
            meaning: "自分のことになると誰でも積極的に動くものだということ。人は自分の利益に関しては素早く行動するというたとえ。",
            example: "我がことと下り坂に走らぬ者はないというように、報酬の話になった途端みな目の色が変わった。", category: .wisdom),

    Proverb(id: 1106, text: "我が亡き後に洪水よ来れ", reading: "わがなきのちにこうずいよこれ",
            meaning: "自分が死んだ後にどんな災難が来てもかまわないという、自己中心的で無責任な考え方のたとえ。",
            example: "我が亡き後に洪水よ来れという態度では、次の世代に深刻な問題を残すことになる。", category: .wisdom),

    Proverb(id: 1107, text: "和歌に師匠なし", reading: "わかにししょうなし",
            meaning: "和歌の詠み方には決まった師匠や流派はなく、誰でも自由に詠めるということ。芸道の中でも和歌は特に自由で、規則に縛られないという考え方。",
            example: "和歌に師匠なしというように、感じたままを素直に詠めばよいのだと教えられた。", category: .wisdom),

    Proverb(id: 1108, text: "我が仏尊し", reading: "わがほとけとうとし",
            meaning: "自分の信仰する仏こそが最も尊いと思い込むように、自分のものが一番だと思い込む偏った見方のこと。",
            example: "我が仏尊しで、自社の製品が最高だと思い込んでいると、競合他社の動向を見誤る。", category: .wisdom),

    Proverb(id: 1109, text: "我が身をつねって人の痛さを知れ", reading: "わがみをつねってひとのいたさをしれ",
            meaning: "自分をつねって痛みを感じることで、他人の痛みも理解できるということ。相手の立場に立って物事を考えるべきという教え。",
            example: "我が身をつねって人の痛さを知れというように、相手の苦しみを自分のこととして考えることが思いやりの第一歩だ。", category: .wisdom),

    Proverb(id: 1110, text: "禍を転じて福となす", reading: "わざわいをてんじてふくとなす",
            meaning: "災難や不幸をうまく利用して、逆に幸福に変えること。苦境をバネにして好転させることのたとえ。",
            example: "禍を転じて福となすというように、会社の危機をきっかけに体制を刷新し、飛躍のチャンスにした。", category: .luck),

    Proverb(id: 1111, text: "禍も三年経てば福となる", reading: "わざわいもさんねんたてばふくとなる",
            meaning: "どんな不幸な出来事も、時間が経てば役に立つことがあるということ。今は辛くても、いつかは良い方向に転じるという励ましの言葉。",
            example: "禍も三年経てば福となるというように、あの失敗がなければ今の成功はなかった。", category: .luck),

    Proverb(id: 1112, text: "綿に針を包む", reading: "わたにはりをつつむ",
            meaning: "柔らかい綿の中に鋭い針を包み隠すように、表面は穏やかで優しそうに見えながら、内心は鋭く危険なものを持っていること。",
            example: "綿に針を包むような彼女の言葉は、一見優しいが実際には相手を深く傷つけるものだった。", category: .wisdom),

    Proverb(id: 1113, text: "渡りに舟", reading: "わたりにふね",
            meaning: "川を渡ろうとしている時にちょうど舟が来たように、必要な時に都合よく助けが現れること。絶好のタイミングで好機が訪れること。",
            example: "渡りに舟とはこのことで、困っていた時に友人からの助け舟が来た。", category: .luck),

    Proverb(id: 1114, text: "割った茶碗を繋ぐ", reading: "わったちゃわんをつなぐ",
            meaning: "割れた茶碗を継いでも元通りにはならないように、一度壊れた関係や物事を修復しようとすること。完全には元に戻らないことへの諦観も含む。",
            example: "割った茶碗を繋ぐようなものと分かっていても、彼は関係修復に努めることを諦めなかった。", category: .action),

    Proverb(id: 1115, text: "破鍋に綴蓋", reading: "われなべにとじぶた",
            meaning: "割れた鍋にもそれに合った綴じた蓋があるように、どんな人にもふさわしい相手がいること。釣り合いの取れた縁があるということ。",
            example: "破鍋に綴蓋というように、個性的な二人だがなぜかとてもお似合いのカップルだ。", category: .relationships),

    Proverb(id: 1116, text: "我もよかれ人もよかれ", reading: "われもよかれひともよかれ",
            meaning: "自分だけでなく他人のことも良くなるように願う、思いやりの心を表す言葉。自利利他の精神。",
            example: "我もよかれ人もよかれの精神で行動すれば、社会全体が豊かになるものだ。", category: .wisdom),

    Proverb(id: 1117, text: "和を以て貴しとす", reading: "わをもってとうとしとす",
            meaning: "人々が仲良く協調することが最も大切だということ。聖徳太子の十七条憲法の第一条に由来する言葉。",
            example: "和を以て貴しとすという言葉を胸に、チーム全員が協力して困難なプロジェクトを乗り越えた。", category: .relationships),
]
// swiftlint:enable file_length line_length
