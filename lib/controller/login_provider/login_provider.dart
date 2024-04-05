import 'dart:async';

import 'package:flutter/material.dart';

class LoginController extends ChangeNotifier {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  GlobalKey<FormState> otpFormkey = GlobalKey<FormState>();

  late Timer _timer;
  int secondsRemaining = 59;

  //fun to coutdown the timer in otp screen
  countdownTimer(seconds) {
    // Start the timer
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      // Decrement the seconds remaining
      if (seconds > 0) {
        seconds--;
        secondsRemaining = seconds;
      } else {
        // If the timer reaches 0, cancel the timer
        _timer.cancel();
      }
      notifyListeners();
    });
  }

  // Method to cancel the timer
  void cancelTimer() {
    _timer.cancel();
  }
}
