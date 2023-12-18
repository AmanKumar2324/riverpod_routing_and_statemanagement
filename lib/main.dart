import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning_riverpod/family_modifiers/family_modifiers.dart';
import 'package:learning_riverpod/statenotifierprovider/counter_logic.dart';
import 'package:learning_riverpod/stream_provider/stream_provider.dart';

//creating a provider

final counterProvider = StateProvider<int>((ref) => 0);
final statenotifiercounterProvider =
    StateNotifierProvider<CounterLogic, int>((ref) => CounterLogic(0));
final nameProvider = Provider<String>((ref) {
  return 'Hello Aman';
});

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      home: const LearningFamilyModifiers(),
    );
  }
}
//calling the provider in the consumer class widget(the most simplest one)

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final name = ref.watch(nameProvider);
    return Scaffold(
      body: Center(child: Text(name)),
    );
  }
}
