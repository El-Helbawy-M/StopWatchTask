import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TimeCounter extends ChangeNotifier {
  //========================================== variables
  int _seconed = 0, _minute = 0, _hour = 0;
  Watch _controller = Watch.Play;
  IconData icon = Icons.play_arrow;
  Timer time;
  //========================================== End

  //========================================== Functions
  changeTime() {
    _seconed++;
    if (_seconed == 60) {
      _minute++;
      _seconed = 0;
    }
    if (_minute == 60) {
      _hour++;
      _minute = 0;
    }
    notifyListeners();
  }

  set play(Timer val) {
    time = val;
    icon = Icons.pause;
    notifyListeners();
  }

  stop() {
    icon = Icons.play_arrow;
    time.cancel();
    notifyListeners();
  }

  rest() {
    _seconed = 0;
    _minute = 0;
    _hour = 0;
  }

  set changeController(Watch val) {
    _controller = val;
    notifyListeners();
  }
  //========================================== End

  //========================================== Getters
  get controller => _controller;
  get seconed => _seconed;
  get minute => _minute;
  get hour => _hour;
  //========================================== End
}

enum Watch { Play, Stop, Rest }
