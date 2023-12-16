import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning_riverpod/main.dart';

import '../consumer_stateless_widget/reading_provider_through_consumer_statelesswidget.dart';

final nameProvider2 = Provider<String>((ref) {
  return 'Hello world';
});

class ReadingProviderConsumerStatefulWidget extends ConsumerStatefulWidget {
  const ReadingProviderConsumerStatefulWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ReadingProviderConsumerStatefulWidgetState();
}

class _ReadingProviderConsumerStatefulWidgetState
    extends ConsumerState<ReadingProviderConsumerStatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Consumer(
        builder: (context, ref, child) {
          final statement2 = ref.watch(nameProvider2);
          // final statement = ref.watch(nameProvider);
          final statement1 = ref.watch(nameProvider1);
          final statement = ref.read(nameProvider);
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [Text(statement), Text(statement1), Text(statement2)],
          );
        },
      )),
    );
  }
}
