import 'package:flutter/material.dart';
import 'package:pomodoro/provider/timer_service.dart';
import 'package:pomodoro/screens/pomodoro_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider<TimerService>(
      create: (context) => TimerService(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PomodoroScreen(),
      title: "Pomodoro",
    );
  }
}
