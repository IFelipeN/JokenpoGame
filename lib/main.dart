import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jokenpô',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: JokenpoHomePage(),
    );
  }
}

class JokenpoHomePage extends StatefulWidget {
  @override
  _JokenpoHomePageState createState() => _JokenpoHomePageState();
}

class _JokenpoHomePageState extends State<JokenpoHomePage> {
  String playerChoice = '';
  String computerChoice = '';
  String result = '';

  // Lista de opções
  final List<String> choices = ['Pedra', 'Papel', 'Tesoura'];

  // Função para o jogador fazer sua escolha
  void playGame(String playerSelection) {
    playerChoice = playerSelection;
    computerChoice = choices[Random().nextInt(3)]; // Escolha aleatória para o computador

    // Chama a função que determina o vencedor
    result = determineWinner(playerChoice, computerChoice);

    setState(() {});
  }

  // Função que determina o vencedor
  String determineWinner(String player, String computer) {
    if (player == computer) {
      return 'Empate!';
    } else if (
      (player == 'Pedra' && computer == 'Tesoura') ||
      (player == 'Papel' && computer == 'Pedra') ||
      (player == 'Tesoura' && computer == 'Papel')
    ) {
      return 'Você venceu!';
    } else {
      return 'Você perdeu!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jokenpô'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Escolha uma opção:',
              style: TextStyle(fontSize: 24),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: choices.map((choice) {
                return GestureDetector(
                  onTap: () => playGame(choice),
                  child: Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      choice,
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 40),
            Text(
              'Sua escolha: $playerChoice',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              'Escolha do computador: $computerChoice',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            Text(
              result,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}