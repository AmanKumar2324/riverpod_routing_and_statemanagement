// In this we can call the created provider in the consumer stateless widget with the help of the consumer widget as shown below.
//first we will create an provider 
//we will make the consumer stateless widget
//The place where we want to use the provider, there we will call consumer widget
//in the consumer widget we will declare variable to store the provider 
//then we can use them as shown below

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final nameProvider1 = Provider<String>((ref) {
  return 'Aman Singh';
});

class ReadingProviderThroughConsumerWidget extends StatelessWidget {
  const ReadingProviderThroughConsumerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Consumer(
        builder: (context, ref, child) {
          final name = ref.watch(nameProvider1);
          return Text(name);
        },
      )),
    );
  }
}
