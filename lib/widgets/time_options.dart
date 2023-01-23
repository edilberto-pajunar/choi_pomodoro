import 'package:flutter/material.dart';
import 'package:pomodoro/provider/timer_service.dart';
import 'package:pomodoro/utils/utils.dart';
import 'package:provider/provider.dart';

class TimeOptions extends StatelessWidget {
  TimeOptions({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TimerService>(context);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      controller: ScrollController(initialScrollOffset: 240),
      child: Row(
        children: selectableTimes
            .map(
              (time) => InkWell(
                onTap: () => provider.selectTime(double.parse(time)),
                child: Container(
                  margin: EdgeInsets.only(left: 10),
                  width: 70,
                  height: 50,
                  decoration: int.parse(time) == provider.selectedTime
                      ? BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                        )
                      : BoxDecoration(
                          border: Border.all(
                            width: 3,
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                  child: Center(
                    child: Text(
                      (int.parse(time) ~/ 60).toString(),
                      style: textStyle(
                        25,
                        int.parse(time) == provider.selectedTime
                            ? renderColor(provider.currentState)
                            : Colors.white,
                        FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
