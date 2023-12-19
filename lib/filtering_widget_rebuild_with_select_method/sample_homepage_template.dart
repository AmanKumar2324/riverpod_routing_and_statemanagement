import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning_riverpod/filtering_widget_rebuild_with_select_method/user.dart';
import 'package:learning_riverpod/filtering_widget_rebuild_with_select_method/user_notifier.dart';

final userProvider = StateNotifierProvider<UserNotifier, User>((ref) {
  return UserNotifier(User('Aman singh', 'Bhagalpur'));
});

class SampleHomePageTemplate extends ConsumerStatefulWidget {
  const SampleHomePageTemplate({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SampleHomePageTemplateState();
}

class _SampleHomePageTemplateState
    extends ConsumerState<SampleHomePageTemplate> {
  @override
  Widget build(BuildContext context) {
    print('Build method is called');
    final user = ref.watch(userProvider.select((value) => value.name));
    return Scaffold(
      appBar: AppBar(
        title: Text('Learning filter rebuild with select method'),
      ),
      body: Column(children: [
        TextField(
          onSubmitted: (value) {
            return ref.read(userProvider.notifier).updateName(value);
          },
        ),
        SizedBox(
          height: 10,
        ),
        TextField(
          onSubmitted: (value) =>
              ref.read(userProvider.notifier).updateAddress(value),
        ),
        SizedBox(
          height: 10,
        ),
        Text(user)
      ]),
    );
  }
}
