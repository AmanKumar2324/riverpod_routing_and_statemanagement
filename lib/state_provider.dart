import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning_riverpod/main.dart';

class LearningStateProvider extends ConsumerStatefulWidget {
  const LearningStateProvider({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _LearningStateProviderState();
}

class _LearningStateProviderState extends ConsumerState<LearningStateProvider> {
  @override
  Widget build(BuildContext context) {
    ref.listen(counterProvider, (previous, next) {
      if (next == 5)
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
                'The current value of counter is $next\n The previous calue of the counter is $previous')));
    });
    final count = ref.watch(counterProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('State Provider'),
        actions: [
          IconButton(
              onPressed: () {
                ref.invalidate(counterProvider);
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
          // ref.read(counterProvider.notifier).state++;
          ref.read(counterProvider.notifier).update((state) => state + 1);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
