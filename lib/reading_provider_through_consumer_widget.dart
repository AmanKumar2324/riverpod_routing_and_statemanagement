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
