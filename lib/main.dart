import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flip_card/flip_card.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // Remove the debug banner
        debugShowCheckedModeBanner: false,
        title: 'Mitologia Nordica',
        theme: ThemeData(
          primarySwatch: Colors.amber,
        ),
        home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;
  AnimationStatus _status = AnimationStatus.dismissed;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _animation = Tween(end: 1.0, begin: 0.0).animate(_controller)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        _status = status;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Mitologia Nórdica',
            style: TextStyle(color: Colors.white, fontFamily: 'RobotoMono')),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                ClipPath(
                  clipper: MyCustomClipper(),
                  child: SizedBox(
                    child: Image.asset(
                      'assets/mitoa.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  if (_status == AnimationStatus.dismissed) {
                    _controller.forward();
                  } else {
                    _controller.reverse();
                  }
                },
                child: Text('Mundos')),
            SizedBox(
              height: 30,
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                        width: 10, color: Colors.black), // red as border color
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
                child: FlipCard(
              direction: FlipDirection.VERTICAL,
              front: Container(
                width: 400,
                height: 300,
                child: Image.asset('assets/asgard.jpg'),
              ),
              back: Container(
                alignment: Alignment(0.00, 0.00),
                width: 400,
                height: 200,
                color: Color.fromRGBO(113, 203, 245, 100),
                child: Text(
                  'Asgard é o reino dos deuses, os Æsir, '
                  'na mitologia nórdica, mundo separado do reino dos mortais, Midgard.'
                  'Asgard era, originalmente, conhecido como Godheim (o repouso dos deuses), '
                  'pois os primeiros investigadores da mitologia confundiram o nome do mundo dos '
                  'deuses com o seu castelo mais importante e, neste caso, Godheim se tornou Asgard '
                  'em muitas fontes históricas.',
                  style: TextStyle(fontSize: 15),
                  textAlign: TextAlign.center,
                ),
              ),
            )),
            // Horizontal Flipping
            Transform(
              alignment: FractionalOffset.center,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.0015)
                ..rotateY(pi * _animation.value),
            ),
            Center(
                child: FlipCard(
              direction: FlipDirection.VERTICAL,
              front: Container(
                width: 400,
                height: 300,
                child: Image.asset('assets/jotunheim.jpg'),
              ),
              back: Container(
                alignment: Alignment(0.00, 0.00),
                width: 400,
                height: 200,
                color: Color.fromRGBO(44, 91, 148, 100),
                child: Text(
                  'Jotunheim ou Jötunheimr é o mundo dos gigantes (de dois tipos: '
                  'rocha e neve, chamados coletivamente de Jotuns). A partir deste mundo, '
                  'os gigantes ameaçavam os seres humanos em Midgard e os deuses em Asgard.',
                  style: TextStyle(fontSize: 15),
                  textAlign: TextAlign.center,
                ),
              ),
            )),
            Center(
                child: FlipCard(
              direction: FlipDirection.VERTICAL,
              front: Container(
                width: 400,
                height: 225,
                child: Image.asset('assets/Midgard.jpg'),
              ),
              back: Container(
                alignment: Alignment(0.00, 0.00),
                width: 400,
                height: 200,
                color: Color.fromRGBO(42, 110, 52, 100),
                child: Text(
                  'Midgard (em nórdico antigo Miðgarðr; em islandês: '
                  'Miðgarður; em norueguês: Midgard; em dinamarquês: Midgård;'
                  'em sueco: Midgård; em gótico: Midjungards; em inglês antigo: '
                  'Middangeard) é o reino dos humanos na mitologia nórdica, '
                  'correspondendo à Terra como então era conhecida.',
                  style: TextStyle(fontSize: 15),
                  textAlign: TextAlign.center,
                ),
              ),
            )),
            SizedBox(
              height: 30,
            ),
            Center(
                child: FlipCard(
              direction: FlipDirection.VERTICAL,
              front: Container(
                width: 400,
                height: 300,
                child: Image.asset('assets/Muspelheim.jpg'),
              ),
              back: Container(
                alignment: Alignment(0.00, 0.00),
                width: 400,
                height: 200,
                color: Color.fromRGBO(171, 89, 22, 100),
                child: Text(
                  'Muspelheim '
                  'é o reino do fogo, onde habitam os gigantes de fogo e seu mestre, Surtr. '
                  'Niflheim (ao norte), é formado de gelo, e Muspelheim (ao sul), é formado de fogo.'
                  ' As duas juntas e que criaram a água do derretimento do gelo em Ginnungagap.',
                  style: TextStyle(fontSize: 15),
                  textAlign: TextAlign.center,
                ),
              ),
            )),
            Center(
                child: FlipCard(
              direction: FlipDirection.VERTICAL,
              front: Container(
                width: 400,
                height: 300,
                child: Image.asset('assets/nidavellir.jpg', width: 300),
              ),
              back: Container(
                alignment: Alignment(0.00, 0.00),
                width: 400,
                height: 200,
                color: Color.fromRGBO(218, 228, 233, 100),
                child: Text(
                  'Nidavellir "os campos escuros", segundo o Völuspá, '
                  'é a terra dos anões na mitologia nórdica. É frequentemente '
                  'confundido com Svartalfheim, no entanto, este trata-se do mundo dos '
                  'svartálfar. Nidavellir fica nos subterrâneos de Midgard mas separado de '
                  'Niflheim e de Svartalfheim. ',
                  style: TextStyle(fontSize: 15),
                  textAlign: TextAlign.center,
                ),
              ),
            )),
            Center(
                child: FlipCard(
              direction: FlipDirection.VERTICAL,
              front: Container(
                width: 400,
                height: 230,
                child: Image.asset('assets/niflheim.png'),
              ),
              back: Container(
                alignment: Alignment(0.00, 0.00),
                width: 400,
                height: 200,
                color: Color.fromRGBO(173, 216, 230, 100),
                child: Text(
                  'Niflheim o mundo do frio, da névoa e da neve, '
                  'situado acima da fonte Hvergelmir, no nível inferior de Yggdrasil '
                  'e ao lado de Hel e Muspelheim. Participou juntamente com Muspelheim, '
                  'o reino de fogo, da criação de Midgard, do vazio primordial de Ginungagap.',
                  style: TextStyle(fontSize: 15),
                  textAlign: TextAlign.center,
                ),
              ),
            )),
            Center(
                child: FlipCard(
              direction: FlipDirection.VERTICAL,
              front: Container(
                width: 400,
                height: 200,
                child: Image.asset('assets/Svartalfheim.png'),
              ),
              back: Container(
                alignment: Alignment(0.00, 0.00),
                width: 400,
                height: 150,
                color: Color.fromRGBO(217, 191, 0, 100),
                child: Text(
                  'Svartalfheim, '
                  'é a casa principalmente subterrânea dos elfos sombrios, '
                  'raça mais conhecida como Kaldorei. ... É governado por Malekith, '
                  'um poderoso Elfo Noturno, Mago Supremo de seu próprio mundo, que tem '
                  'rixa com Odin por conta de guerras passadas entre Svartalfheim e Asgard.',
                  style: TextStyle(fontSize: 15),
                  textAlign: TextAlign.center,
                ),
              ),
            )),
            Container(
                child: FlipCard(
              direction: FlipDirection.VERTICAL,
              front: Container(
                width: 400,
                height: 250,
                child: Image.asset('assets/Vanaheim.jpg'),
              ),
              back: Container(
                alignment: Alignment(0.00, 0.00),
                width: 400,
                height: 200,
                color: Color.fromRGBO(214, 237, 130, 100),
                child: Text(
                  'Vanaheim é o repouso dos Vanir. Este mundo estaria situado '
                  'em Asgard, no nível mais elevado do universo. Os Vanir eram, geralmente, '
                  'os deuses mais benevolentes, relacionados à agricultura e à natureza, '
                  'ao contrário dos Æsir, que eram considerados deuses da guerra e extremamente '
                  'passionais.',
                  style: TextStyle(fontSize: 15),
                  textAlign: TextAlign.center,
                ),
              ),
            )),
            SizedBox(
              child: Text(
                'CURIOSIDADES',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 300,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      Color.fromRGBO(168, 168, 168, 100),
                      Color.fromRGBO(13, 29, 255, 100),
                      Color.fromRGBO(13, 29, 255, 20),
                      Color.fromRGBO(13, 29, 255, 10),
                      Color.fromRGBO(13, 29, 255, 3),
                      Color.fromRGBO(13, 29, 255, 1),
                      Color.fromRGBO(207, 207, 209, 1),
                      Color.fromRGBO(13, 29, 255, 1),
                      Color.fromRGBO(13, 29, 255, 3),
                      Color.fromRGBO(13, 29, 255, 10),
                      Color.fromRGBO(13, 29, 255, 20),
                      Color.fromRGBO(13, 29, 255, 100),
                      Color.fromRGBO(168, 168, 168, 100)
                    ],
                    begin: FractionalOffset.centerLeft,
                    end: FractionalOffset.centerRight,
                    tileMode: TileMode.repeated),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(4, 4), // changes position of shadow
                  ),
                ],
              ),
              alignment: Alignment.topCenter,
              child: Column(children: [
                Container(
                    alignment: Alignment(0.00, 0.00),
                    width: 300,
                    height: 1800,
                    color: Color.fromRGBO(227, 227, 227, 100),
                    child: Column(
                      children: [
                        Image.asset('assets/partes-corpo.jpg', width: 120),
                        Text(
                          'O MUNDO DOS DEUSES NÓRDICOS FOI CRIADO COM "PARTES DO CORPO" \n',
                          style: TextStyle(fontSize: 15),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                            'O mundo dos deuses nórdicos foi criado com “partes do corpo” '
                            'Na mitologia nórdica, existem nove “mundos”, todos conectados pela árvore gigante Yggdrasil, citada em vários poemas antigos e considerada o “eixo do mundo”. Entre os nove estão Midgard, o mundo material dos humanos — localizado no tronco — e Asgard, habitado pelos deuses do clã Aesir e posicionado na parte mais alta da árvore.'
                            'Antes de tudo isso existir, não havia nada além de um abismo vazio chamado Ginnungagap. O espaço era ocupado por Niflheim e Muspelheim, reinos do gelo e do fogo, que colidiram um com o outro e formaram Ymir, um ser hermafrodita e a primeira criatura viva do universo. Ymir foi o ancestral de todos os Jotun, raça dos gigantes, e deu origem aos demais seres da mitologia.'
                            'Dentro das geleiras do abismo também surgiu Buri, o primeiro deus do grupo dos Aesir. '
                            'Gerações mais tarde, o deus Odin, que era meio Aesir e meio gigante, nasceu ao lado dos '
                            'irmãos Vili e Vé, que juntos decidiram criar o “novo mundo”. Após matarem Ymir, eles'
                            ' transformaram cada parte de seu corpo: a pele passou a ser a Terra, seu crânio o céu, '
                            'os cérebros viraram nuvens e o sangue passou a ser o mar. Ossos e dentes, por sua vez, '
                            'formaram as rochas de todo o universo.',
                            style: TextStyle(fontSize: 12)),
                        SizedBox(height: 20),
                        Image.asset('assets/origin.jpeg', width: 120),
                        Text(
                          'A ORIGEM DO MARTELO DE THOR FOI "CULPA" DE LOKI \n',
                          style: TextStyle(fontSize: 15),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                            'Em mais uma de suas aventuras, Loki pensou que seria cômico raspar a cabeça '
                            'de Sif, esposa de Thor, enquanto ela dormia. Após Thor ter expressado sua fúria pela '
                            'brincadeira, Loki prometeu conseguir novos cabelos com os anões, que deveriam '
                            'fabricá-los usando apenas ouro.'
                            'Para agradar aos deuses, os anões decidiram entregar mais alguns presentes e Loki apostou'
                            ' que eles não seriam capazes de produzir qualquer coisa mais impressionante do que os'
                            ' objetos que já haviam criado — o vencedor da aposta teria a cabeça do perdedor. Para'
                            ' a surpresa de Loki, os novos itens incluíam um navio que poderia ser dobrado até caber '
                            'no bolso, uma lança que nunca errava o alvo e Mjölnir, o martelo de Thor.'
                            'Ao argumentar que os anões poderiam arrancar sua cabeça, mas não o pescoço, ninguém '
                            'soube decidir onde realmente “terminava” o pescoço e começava a cabeça. Para resolver '
                            'o impasse, os anões deixaram Loki inconsciente com a ajuda de Thor e costuraram sua boca '
                            'com um pedaço de couro.',
                            style: TextStyle(fontSize: 12)),
                        SizedBox(height: 20),
                        Image.asset('assets/olho-odin.jpg', width: 120),
                        Text(
                          'ODIN ARRANCOU O PRÓPRIO OLHO \n',
                          style: TextStyle(fontSize: 15),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                            'Em sua busca por conhecimento sobre todas as coisas, Odin acreditava que a inteligência '
                            'valia qualquer preço e às vezes era preciso fazer sacrifícios. Para desvendar as runas '
                            'nórdicas, em uma ocasião, ele chegou a se enforcar, se esfaquear e passar mais de uma '
                            'semana sem comer.'
                            'Outro exemplo foi sua jornada à fonte de Mímir, o mais sábio dos deuses nórdicos, que '
                            'obteve seu conhecimento absoluto após beber da fonte da grande sabedoria, nas raízes '
                            'da árvore Yggdrasil. Em troca de um bom gole, Odin teria que pagar com um de seus olhos,'
                            ' que ele próprio decidiu arrancar.\n',
                            style: TextStyle(fontSize: 12)),
                        Image.asset('assets/gigantes-deuses.jpg', width: 120),
                        Text(
                          'GIGANTES X DEUSES \n',
                          style: TextStyle(fontSize: 15),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                            'O ódio mútuo entre deuses e gigantes tornou-se claro desde o início dos tempos. Logo '
                            'após os nove mundos terem sido criados, um mestre de obras estranho surgiu em Asgard e '
                            'sugeriu construir uma parede à prova de gigantes em até três anos. Como pagamento, exigia'
                            ' casar-se com Freia, deusa do amor, fertilidade e beleza. Convencidos de que seria '
                            'impossível completar a tarefa, os deuses concordaram em dar-lhe um ano para o serviço,'
                            ' apenas com a assistência de seu cavalo, o Svaðilfari.'
                            'Determinado, o homem trabalhou quase sem parar e o deus Loki decidiu interferir:'
                            ' com seu poder de mudar de forma, ele assumiu a imagem de uma égua e atraiu o cavalo '
                            'para longe da obra. Ao perceber o truque, o homem ficou enfurecido e xingou os deuses, '
                            'que então descobriram a verdadeira identidade do construtor, um gigante disfarçado. Thor,'
                            ' deus do trovão, quebrou seu crânio com um golpe de martelo, enviando-o ao ponto mais'
                            ' profundo de Helgardh, o lar dos mortos.'
                            'Depois de atrair o cavalo do gigante, Loki passou vários meses sem ser visto. Em sua '
                            'forma animal, ele deu à luz um cavalo de oito pernas chamado Sleipnir, com quem retornou '
                            'em seguida.',
                            style: TextStyle(fontSize: 12)),
                      ],
                    )),
              ]),
            ),
            SizedBox(
              child: ElevatedButton(
                  onPressed: () {
                    if (_status == AnimationStatus.dismissed) {
                      _controller.forward();
                    } else {
                      _controller.reverse();
                    }
                  },
                  child: Text('Principais Deuses')),
            ),
            SizedBox(
              height: 40,
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                        width: 10, color: Colors.black), // red as border color
                  ),
                ),
              ),
            ),
            Container(
              width: 300,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(4, 4), // changes position of shadow
                  ),
                ],
              ),
              alignment: Alignment.topCenter,
              child: Column(children: [
                FlipCard(
                  direction: FlipDirection.HORIZONTAL,
                  front: Container(
                    width: 350,
                    height: 300,
                    child: Image.asset(
                      'assets/odin.jpg',
                    ),
                  ),
                  back: Container(
                    alignment: Alignment(0.00, 0.00),
                    width: 300,
                    height: 300,
                    color: Color.fromRGBO(227, 227, 227, 100),
                    child: Text(
                      'é considerado o deus principal do clã dos deuses Æsir, o clã mais '
                      'importante de deuses da mitologia nórdica e nas crenças das religiões'
                      ' neopagãs germânicas. Também é conhecido como "Pai de Todos" e "O enviado '
                      'do Senhor da Guerra".',
                      style: TextStyle(fontSize: 15),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Container(
                  width: 300,
                  child: Text(
                    'Odin\n\n Pai de todos, Wotan, Woden\n\n Asgard\n\n Æsir(Asgardiano)\n\n Deus da sabedoria e da cura',
                    style: TextStyle(fontSize: 15, fontFamily: 'RobotoMono'),
                    textAlign: TextAlign.center,
                  ),
                ),
              ]),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: 300,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(4, 4), // changes position of shadow
                  ),
                ],
              ),
              alignment: Alignment.topCenter,
              child: Column(children: [
                FlipCard(
                  direction: FlipDirection.HORIZONTAL,
                  front: Container(
                    width: 350,
                    height: 200,
                    child: Image.asset(
                      'assets/freya.jpg',
                    ),
                  ),
                  back: Container(
                    alignment: Alignment(0.00, 0.00),
                    width: 300,
                    height: 200,
                    color: Color.fromRGBO(227, 227, 227, 100),
                    child: Text(
                      'é uma das deusas mais antigas na antiga religião germânica, '
                      'da qual se preservaram numerosos relatos que a envolvem ou a descrevem, '
                      'devido ao fato de que as fontes mais bem documentadas desta tradição religiosa '
                      'foram transmitidas ou alteradas por historiadores cristãos medievais e em '
                      'muitos casos escritas mais de um século e meio mais tarde. Ela é associada ao amor,'
                      ' fertilidade, beleza, riqueza, magia, guerra e morte.',
                      style: TextStyle(fontSize: 15),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Container(
                  width: 300,
                  child: Text(
                    'Freyja\n\n A Bruxa da Floresta\n\n Asgard\n\n Æsir(Asgardiano)\n\n Deus do amor e fertilidade',
                    style: TextStyle(fontSize: 15, fontFamily: 'RobotoMono'),
                    textAlign: TextAlign.center,
                  ),
                ),
              ]),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: 300,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(4, 4), // changes position of shadow
                  ),
                ],
              ),
              alignment: Alignment.topCenter,
              child: Column(children: [
                FlipCard(
                  direction: FlipDirection.HORIZONTAL,
                  front: Container(
                    width: 350,
                    height: 300,
                    child: Image.asset(
                      'assets/thor.jpg',
                    ),
                  ),
                  back: Container(
                    alignment: Alignment(0.00, 0.00),
                    width: 300,
                    height: 300,
                    color: Color.fromRGBO(227, 227, 227, 100),
                    child: Text(
                      'é o deus nórdico, dos trovões e das batalhas. Pertence '
                      'ao clã dos deuses Æsir, e é filho do deus Odin. Thor '
                      'usa como arma o martelo Mjolnir, e tem o cinto Megingjord, '
                      'que lhe dobra a força. Está associado aos trovões, relâmpagos, '
                      'tempestades, árvores de carvalho, força, proteção da humanidade e '
                      'também a santificação, cura e fertilidade e a guerra.',
                      style: TextStyle(fontSize: 15),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Container(
                  width: 300,
                  child: Text(
                    'Thor Odinson\n\n Filho de Odin\n\n Asgard\n\n Æsir(Asgardiano)\n\n Deus do trovão, das tempestades e da agricultura',
                    style: TextStyle(fontSize: 15, fontFamily: 'RobotoMono'),
                    textAlign: TextAlign.center,
                  ),
                ),
              ]),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: 300,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(4, 4), // changes position of shadow
                  ),
                ],
              ),
              alignment: Alignment.topCenter,
              child: Column(children: [
                FlipCard(
                  direction: FlipDirection.HORIZONTAL,
                  front: Container(
                    width: 350,
                    height: 200,
                    child: Image.asset(
                      'assets/loki.jpg',
                    ),
                  ),
                  back: Container(
                    alignment: Alignment(0.00, 0.00),
                    width: 300,
                    height: 200,
                    color: Color.fromRGBO(227, 227, 227, 100),
                    child: Text(
                      ' é um deus da mitologia nórdica. É um deus da trapaça e da travessura e do fogo, '
                      'também está ligado à magia e pode assumir a forma que quiser. Ele não pertence '
                      'aos Aesir, embora viva com eles. É frequentemente considerado um símbolo da maldade, '
                      'traiçoeiro, de pouca confiança; e, embora suas artimanhas geralmente causem problemas '
                      'a curto prazo aos deuses, estes frequentemente se beneficiam, no fim, das travessuras '
                      'de Loki. Ele está entre as figuras mais complexas da mitologia nórdica.',
                      style: TextStyle(fontSize: 15),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Container(
                  width: 300,
                  child: Text(
                    'Loki Laufeyson\n\n Dono da trapaça\n\n Jotun\n\n Jotunn(que pertence)\n\n Deusa do fogo, da trapaça, magia e da travessura',
                    style: TextStyle(fontSize: 15, fontFamily: 'RobotoMono'),
                    textAlign: TextAlign.center,
                  ),
                ),
              ]),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: 300,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(4, 4), // changes position of shadow
                  ),
                ],
              ),
              alignment: Alignment.topCenter,
              child: Column(children: [
                FlipCard(
                  direction: FlipDirection.HORIZONTAL,
                  front: Container(
                    width: 350,
                    height: 300,
                    child: Image.asset(
                      'assets/frigga.jpg',
                    ),
                  ),
                  back: Container(
                    alignment: Alignment(0.00, 0.00),
                    width: 300,
                    height: 300,
                    color: Color.fromRGBO(227, 227, 227, 100),
                    child: Text(
                      ' é a deusa-mãe da dinastia de Aesir na mitologia nórdica. Esposa de Odin, '
                      'madrasta de Thor, Meili, Bragi, Heimdall, Váli e Vidar e mãe de Baldur, '
                      'Hoder, Hermod e em algumas versões também é mãe de Týr. é a deusa da fertilidade, '
                      'do amor e da união. É também a protetora da família, das mães e das donas-de-casa, e '
                      'símbolo da doçura. Além disso, é a única deusa além de Odin que pode sentar-se no trono '
                      '"Hlidskjalf" e observar o universo.',
                      style: TextStyle(fontSize: 15),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Container(
                  width: 300,
                  child: Text(
                    'Frigg, Frija, Frea ou Frige\n\n Mulher de Odin\n\n Asgard\n\n Asynjor\n\n Deusa da fertilidade',
                    style: TextStyle(fontSize: 15, fontFamily: 'RobotoMono'),
                    textAlign: TextAlign.center,
                  ),
                ),
              ]),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: 300,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(4, 4), // changes position of shadow
                  ),
                ],
              ),
              alignment: Alignment.topCenter,
              child: Column(children: [
                FlipCard(
                  direction: FlipDirection.HORIZONTAL,
                  front: Container(
                    width: 300,
                    height: 180,
                    child: Image.asset(
                      'assets/hel.jpg',
                    ),
                  ),
                  back: Container(
                    alignment: Alignment(0.00, 0.00),
                    width: 300,
                    height: 180,
                    color: Color.fromRGBO(227, 227, 227, 100),
                    child: Text(
                      ' é a deusa-mãe da dinastia de Aesir na mitologia nórdica. Esposa de Odin, '
                          'madrasta de Thor, Meili, Bragi, Heimdall, Váli e Vidar e mãe de Baldur, '
                          'Hoder, Hermod e em algumas versões também é mãe de Týr. é a deusa da fertilidade, '
                          'do amor e da união. É também a protetora da família, das mães e das donas-de-casa, e '
                          'símbolo da doçura. Além disso, é a única deusa além de Odin que pode sentar-se no trono '
                          '"Hlidskjalf" e observar o universo.',
                      style: TextStyle(fontSize: 15),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Container(
                  width: 300,
                  child: Text(
                    'Hela (Hel ou Hell)\n\n Filha de Loki\n\n Helgardh\n\n Força, Velocidade, resistência e imortalidade e cura\n\n Deusa do reino dos mortos',
                    style: TextStyle(fontSize: 15, fontFamily: 'RobotoMono'),
                    textAlign: TextAlign.center,
                  ),
                ),
              ]),
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height * 0.80);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
}
