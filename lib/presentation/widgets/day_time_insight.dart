import 'dart:async';
import 'package:flutter/material.dart';

class DayTimeInsight extends  StatefulWidget {
  const DayTimeInsight({super.key});

  @override
  State<DayTimeInsight> createState() => _DayTimeInsightState();
}

class _DayTimeInsightState extends State<DayTimeInsight> {
  late Timer timer;
  late DateTime _endTime;

  @override
  void initState(){
    super.initState();
    _resetTimer();
  }

  void _startTimer() {
    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(oneSec, (timer) {
      DateTime now = DateTime.now();
      if (now.isAfter(_endTime)) {
        _resetTimer();
      } else {
        Duration remaining = _endTime.difference(now);
        setState(() {});
      }
    });
  }

  void _resetTimer() {
    DateTime now = DateTime.now();
    DateTime tomorrow = DateTime(now.year, now.month, now.day + 1);
    _endTime = DateTime(tomorrow.year, tomorrow.month, tomorrow.day);
    _startTimer();
  }

  String _formatDuration(Duration duration) {
    String hours = (duration.inHours % 24).toString().padLeft(2, '0');
    String minutes = (duration.inMinutes % 60).toString().padLeft(2, '0');
    String seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');
    return '${hours}h ${minutes}m ${seconds}s';
  }



  @override
  Widget build(BuildContext context){

    DateTime now = DateTime.now();
    Duration timerDuration = _endTime.difference(now);
    String formattedTime = _formatDuration(timerDuration);

    return Container(
      padding: const EdgeInsets.fromLTRB(30, 20, 0, 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '//NOV 3 2023',
            style: Theme.of(context).textTheme.labelLarge,
          ),
          Text(
            formattedTime,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Text(
            '//56.99898 completed',
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ],
      ),
    );
  }
}