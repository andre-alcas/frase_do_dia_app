import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: const MyHomePage(title: 'Frases do dia'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _numeroAleatorio = 0;
  int _numeroAleatorio_img = 0;

  List _frases_bom_humor = [
    "O tolo dá vazão à sua ira, mas o sábio domina-se. Pv 29:11",
    "Em paz me deito e logo pego no sono, porque só tu, Senhor, me fazes dormir em paz e em segurança. Sl 4:8",
    "O SENHOR é o meu pastor, nada me faltará. Sl 23:1",
    "Eu sou o caminho, a verdade e a vida. Ninguém vem ao Pai, a não ser por mim. Jo 14:6",
    "Aquele que habita no abrigo do Altíssimo e descansa à sombra do Todo-poderoso Sl 91:1",
    "Senhor, tu és o nosso refúgio, sempre, de geração em geração. Sl 90:1"
        "Os céus declaram a glória de Deus e o firmamento anuncia a obra das suas mãos. Sl 19:1"
  ];

  List _frases_mal_humor = [
    "Tudo posso naquele que me fortalece. Filip. 4:13",
    "Sejam fortes e corajosos. Não tenham medo nem fiquem apavorados por causa delas, pois o Senhor, o seu Deus, vai com vocês; nunca os deixará, nunca os abandonará. Dt 31:6",
    "Pois o Senhor, o seu Deus, os acompanhará e lutará por vocês contra os seus inimigos, para dar a vitória a vocês. Dt 20:4",
    "Venham a mim, todos os que estão cansados e sobrecarregados, e eu darei descanso a vocês. Mt 11:28",
    "Portanto, eu me gloriarei ainda mais alegremente em minhas fraquezas, para que o poder de Cristo repouse em mim. 2 Co 12:9",
    "Mas aqueles que esperam no Senhor renovam as suas forças. Voam alto como águias; correm e não ficam exaustos, andam e não se cansam. Is 40:31",
    "Sejam fortes e corajosos, todos vocês que esperam no Senhor! Slm 31:24"
  ];

  List _frases_mais_ou_menos_humor = [
    "Ele o livrará do laço do caçador e do veneno mortal. Sl 91:3",
    "Sejam fortes e corajosos. Não tenham medo nem fiquem apavorados por causa delas, pois o Senhor, o seu Deus, vai com vocês; nunca os deixará, nunca os abandonará. Dt 31:6",
    "Pois o Senhor, o seu Deus, os acompanhará e lutará por vocês contra os seus inimigos, para dar a vitória a vocês. Dt 20:4",
    "Venham a mim, todos os que estão cansados e sobrecarregados, e eu darei descanso a vocês. Mt 11:28",
    "Portanto, eu me gloriarei ainda mais alegremente em minhas fraquezas, para que o poder de Cristo repouse em mim. 2 Co 12:9",
    "Mas aqueles que esperam no Senhor renovam as suas forças. Voam alto como águias; correm e não ficam exaustos, andam e não se cansam. Is 40:31",
    "Sejam fortes e corajosos, todos vocês que esperam no Senhor! Slm 31:24"
  ];

  String _frase_escolhida = 'Como você está se sentido hoje ?';

  String image = "logo.png";

  List images_name = ["paisagem1.png","paisagem2.jpg","paisagem3.png"];

  void _incrementCounter(int humor) {
    setState(() {
      //_counter++;
      _numeroAleatorio = new Random().nextInt(_frases_bom_humor.length);
      _numeroAleatorio_img = new Random().nextInt(images_name.length);
    });
    image = images_name[_numeroAleatorio_img];
    if(humor==1){
      _frase_escolhida = _frases_bom_humor[_numeroAleatorio];
    }
    else if(humor==2){
      _frase_escolhida = _frases_mais_ou_menos_humor[_numeroAleatorio];
    }
    else if(humor==3){
      _frase_escolhida = _frases_mal_humor[_numeroAleatorio];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),

        body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset("images/$image"),
              Padding(padding: EdgeInsets.all(6)),
              // const Text(
              //   'Pressione um botão para gerar uma frase: ',
              // ),
              Text(
                _frase_escolhida,
                style: TextStyle(
                    fontSize: 18,
                    fontStyle: FontStyle.italic,
                    color: Colors.black
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        floatingActionButton: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                child: Icon(FluentIcons.emoji_sparkle_16_regular),
                tooltip: 'Estou bem',
                onPressed: ()  => _incrementCounter(1),
                backgroundColor: Colors.lightBlueAccent.shade400,
              ),
              Padding(padding: EdgeInsets.all(3)),
              FloatingActionButton(
                child: Icon(FluentIcons.emoji_meh_16_regular),
                tooltip: 'Estou mais ou menos',
                onPressed: () => _incrementCounter(2),
                backgroundColor: Colors.lightBlueAccent.shade200,
              ),
              Padding(padding: EdgeInsets.all(3)),
              FloatingActionButton(
                child: Icon(FluentIcons.emoji_sad_16_regular),
                tooltip: 'Estou mal',
                onPressed: () => _incrementCounter(3),
                backgroundColor: Colors.lightBlueAccent.shade100,
              ),
              Padding(padding: EdgeInsets.all(3)),
            ]
        ),
    );
  }
}
