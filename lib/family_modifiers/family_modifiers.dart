import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import './user.dart';

final userInfoProvider = Provider.family<String, Users>((ref, user) {
  return "Name: ${user.name} and Address: ${user.address}";
});

class LearningFamilyModifiers extends ConsumerStatefulWidget {
  const LearningFamilyModifiers({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      LearningFamilyModifiersState();
}

class LearningFamilyModifiersState
    extends ConsumerState<LearningFamilyModifiers> {
  @override
  Widget build(BuildContext context) {
    final userInfo = ref.watch(userInfoProvider(Users('Aman', 'bhagalpur')));
    return Scaffold(
      body: Center(child: Text(userInfo)),
    );
  }
}
