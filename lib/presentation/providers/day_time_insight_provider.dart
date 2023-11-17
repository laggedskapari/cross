import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dayTimeInsight = StateProvider.autoDispose<String>((ref) {
  // Function to calculate the remaining time till midnight
  String calculateRemainingTime() {
    DateTime now = DateTime.now();
    DateTime endOfDay = DateTime(now.year, now.month, now.day + 1);
    Duration remainingDuration = endOfDay.difference(now);
    return '${remainingDuration.inHours.remainder(24).toString().padLeft(2, '0')}h ${remainingDuration.inMinutes.remainder(60).toString().padLeft(2, '0')}m ${remainingDuration.inSeconds.remainder(60).toString().padLeft(2, '0')}s';
  }

  // Initial value
  String remainingTime = calculateRemainingTime();

  // Update the remaining time every second
  Timer.periodic(const Duration(seconds: 1), (_) {
    remainingTime = calculateRemainingTime();
    ref.keepAlive();
  });

  return remainingTime;
});
