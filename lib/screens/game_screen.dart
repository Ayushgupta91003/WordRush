import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wordrush/providers/client_state_provider.dart';
import 'package:wordrush/providers/game_state_provider.dart';
import 'package:wordrush/utils/socket_methods.dart';
import 'package:wordrush/widgets/game_text_field.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final SocketMethods _socketMethods = SocketMethods();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _socketMethods.updateTimer(context);
    _socketMethods.updateGame(context);
  }

  @override
  Widget build(BuildContext context) {
    final game = Provider.of<GameStateProvider>(context);
    final clientStateProvider = Provider.of<ClientStateProvider>(context);
    return Scaffold(
      // body: Text('Game Screen'),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Chip(
                label: Text(
                  clientStateProvider.clientState['timer']['msg'].toString(),
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Text(
                clientStateProvider.clientState['timer']['countDown']
                    .toString(),
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(bottom: 10),
        child: GameTextField(),
      ),
    );
  }
}
