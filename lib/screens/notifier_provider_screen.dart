import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_samples/providers/search_provider.dart';

final provider = StateProvider<String>((ref) {
  return "State notifier provider is used to manage complex or structured state using a custom class.";
});

class NotifierProviderScreen extends ConsumerWidget {
  const NotifierProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifierProvider = ref.watch(provider);
    return Scaffold(
      appBar: AppBar(title: Text("State notifier provider")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              notifierProvider,
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24),
            TextField(
              onChanged: (value){
                ref.read(searchProvider.notifier).search(value);
              },
            ),
            SizedBox(height: 8),
            Consumer(builder: (context, ref, child){
              // final search = ref.watch(searchProvider); // get all
              final search = ref.watch((searchProvider).select((selector) => selector.search)); // get only what you need
              return  Text(
                search,
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              );
            }),
            SizedBox(height: 24),
            Consumer(builder: (context, ref, child){
              final isChanged = ref.watch((searchProvider).select((selector) => selector.isChanged));
              return  Switch(value: isChanged, onChanged: (value){
                ref.read(searchProvider.notifier).onChanged(value);
              });
            }),
          ],
        ),
      ),
    );
  }
}
