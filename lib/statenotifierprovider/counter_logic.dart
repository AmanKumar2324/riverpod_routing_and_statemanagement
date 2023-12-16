import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CounterLogic extends StateNotifier<int> {
  CounterLogic(int state) : super(state);
  void increment() {
    state++;
  }

  void resettozero() {
    state = 0;
  }

  void showsnackbar(BuildContext context) {
    if (state == 5)
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('the counter value is $state')));
  }
}
