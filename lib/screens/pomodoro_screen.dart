import 'package:flutter/material.dart';
import 'package:pomodoro/provider/timer_service.dart';
import 'package:pomodoro/utils/utils.dart';
import 'package:pomodoro/widgets/progress_widget.dart';
import 'package:pomodoro/widgets/time_controller.dart';
import 'package:pomodoro/widgets/time_options.dart';
import 'package:pomodoro/widgets/timer_card.dart';
import 'package:provider/provider.dart';

class PomodoroScreen extends StatelessWidget {
  const PomodoroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TimerService>(context);
    return Scaffold(
      backgroundColor: renderColor(provider.currentState),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: renderColor(provider.currentState),
        title: Text(
          "Pomodoro",
          style: textStyle(25, Colors.white, FontWeight.w700),
        ),
        actions: [
          IconButton(
            onPressed: () =>
                Provider.of<TimerService>(context, listen: false).reset(),
            icon: Icon(Icons.refresh),
            iconSize: 40,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            child: Column(
              children: [
                SizedBox(
                  height: 15,
                ),
                TimerCard(),
                SizedBox(
                  height: 40,
                ),
                TimeOptions(),
                SizedBox(
                  height: 30,
                ),
                TimeController(),
                SizedBox(
                  height: 30,
                ),
                ProgressWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
