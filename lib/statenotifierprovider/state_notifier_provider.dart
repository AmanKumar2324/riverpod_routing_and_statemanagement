import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning_riverpod/main.dart';

class LearningStateNotifierProvider extends ConsumerStatefulWidget {
  const LearningStateNotifierProvider({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      LearningStateNotifierProviderState();
}

class LearningStateNotifierProviderState
    extends ConsumerState<LearningStateNotifierProvider> {
  @override
  Widget build(BuildContext context) {
    final count = ref.watch(statenotifiercounterProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('StateNotifier Provider'),
        actions: [
          IconButton(
              onPressed: () {
                ref.watch(statenotifiercounterProvider.notifier).resettozero();
              },
              icon: Icon(
                Icons.refresh_outlined,
              ))
        ],
      ),
      body: Center(
          child: Text(
        count.toString(),
        style: TextStyle(fontSize: 25),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(statenotifiercounterProvider.notifier).increment();
          ref
              .watch(statenotifiercounterProvider.notifier)
              .showsnackbar(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
