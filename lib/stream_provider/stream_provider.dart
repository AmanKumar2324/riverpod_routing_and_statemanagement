import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final streamProvider = StreamProvider<int>((ref) {
  return Stream.periodic(
      Duration(seconds: 2), ((computationCount) => computationCount));
});

class LearningStreamProvider extends ConsumerStatefulWidget {
  const LearningStreamProvider({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _LearningStreamProviderState();
}

class _LearningStreamProviderState
    extends ConsumerState<LearningStreamProvider> {
  @override
  Widget build(BuildContext context) {
    final streamData = ref.watch(streamProvider);

    return Scaffold(
      body: streamData.when(
          data: (data) => Center(
                child: Text(data.toString()),
              ),
          error: ((error, stackTree) {
            return Text(
              error.toString(),
            );
          }),
          loading: () => Center(
                child: CircularProgressIndicator(),
              )),
    );
  }
}
