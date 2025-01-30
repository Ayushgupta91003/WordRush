import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wordrush/providers/game_state_provider.dart';
import 'package:wordrush/screens/create_room_screen.dart';
import 'package:wordrush/screens/game_screen.dart';
import 'package:wordrush/screens/home_screen.dart';
import 'package:wordrush/screens/join_room_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => GameStateProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Word Rush',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        // home: const HomeScreen(),
        initialRoute: '/',
        routes: {
          '/': (context) => const HomeScreen(),
          '/create-room': (context) => const CreateRoomScreen(),
          '/join-room': (context) => const JoinRoomScreen(),
          '/game-screen': (context) => const GameScreen(),
        },
      ),
    );
  }
}
