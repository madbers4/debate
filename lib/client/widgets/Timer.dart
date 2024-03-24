import 'dart:async';

import 'package:flutter/material.dart';

class TopTimer extends StatefulWidget {
  @override
  _TopTimerState createState() => _TopTimerState();
}

class _TopTimerState extends State<TopTimer> {
  // Define the duration of the countdown timer
  Duration _duration = Duration(minutes: 3);
  // Define a Timer object
  Timer? _timer;
  // Define a variable to store the current countdown value

  @override
  void initState() {
    super.initState();
    // Start the countdown timer
    startTimer();
  }

  @override
  void dispose() {
    // Cancel the timer to avoid memory leaks
    _timer?.cancel();
    super.dispose();
  }

  // Method to start the countdown timer
  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_duration.inSeconds <= 0) {
        // Countdown is finished
        _timer?.cancel();
        // Perform any desired action when the countdown is completed
      } else {
        // Update the countdown value and decrement by 1 second
        setState(() {
          _duration = _duration - Duration(seconds: 1);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    String minutes = _duration.inMinutes.remainder(60).toString().padLeft(1, '0');
    String seconds = _duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    return Container(child: Text('$minutes:$seconds'), alignment: Alignment.center,);
  }
}