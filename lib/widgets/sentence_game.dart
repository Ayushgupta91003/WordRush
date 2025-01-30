import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wordrush/providers/game_state_provider.dart';
import 'package:wordrush/utils/socket_client.dart';
import 'package:wordrush/utils/socket_methods.dart';

class SentenceGame extends StatefulWidget {
  const SentenceGame({super.key});

  @override
  State<SentenceGame> createState() => _SentenceGameState();
}

class _SentenceGameState extends State<SentenceGame> {
  var playerMe = null;
  final SocketMethods _socketMethods = SocketMethods();

  @override
  void initState() {
    super.initState();
    _socketMethods.updateGame(context);
  }

  findPlayerMe(GameStateProvider game) {
    game.gameState['players'].forEach((player) {
      if (player['socketID'] == SocketClient.instance.socket!.id) {
        playerMe = player;
      }
    });
  }

  Widget getTypedWords(words, player) {
    var tempWords = words.sublist(0, player['currentWordIndex']);
    String typedWord = tempWords.join(' ');
    return Text(
      typedWord,
      style: const TextStyle(
        color: Color.fromRGBO(52, 235, 119, 1),
        fontSize: 30,
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    final game = Provider.of<GameStateProvider>(context);
    findPlayerMe(game);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Wrap(
        textDirection: TextDirection.ltr,
        children: [
          getTypedWords(game.gameState['words'], playerMe),
          
        ],
      ),
    );

    // typed words
    // current word
    // words to be typed
  }
}
