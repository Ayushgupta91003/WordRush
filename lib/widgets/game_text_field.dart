import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wordrush/providers/game_state_provider.dart';
import 'package:wordrush/utils/socket_client.dart';
import 'package:wordrush/utils/socket_methods.dart';
import 'package:wordrush/widgets/custom_button.dart';

class GameTextField extends StatefulWidget {
  const GameTextField({super.key});

  @override
  State<GameTextField> createState() => _GameTextFieldState();
}

class _GameTextFieldState extends State<GameTextField> {
  final SocketMethods _socketMethods = SocketMethods();
  var playerMe = null;
  late GameStateProvider? game;

  @override
  void initState() {
    super.initState();
    game = Provider.of<GameStateProvider>(context, listen: false);
    findPlayerMe(game!);
  }

  findPlayerMe(GameStateProvider game) {
    game.gameState['players'].forEach((player) {
      if (player['socketID'] == SocketClient.instance.socket!.id) {
        playerMe = player;
      }
    });
  }

  handleStart(GameStateProvider game) {
    _socketMethods.startTimer(playerMe['_id'], game.gameState['id']);
  }

  @override
  Widget build(BuildContext context) {
    final gameData = Provider.of<GameStateProvider>(context, listen: false);

    return CustomButton(
      text: 'START',
      onTap: () => handleStart(gameData),
    );
  }
}
