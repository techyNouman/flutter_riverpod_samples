import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_samples/providers/favourite_provider.dart';
import 'package:flutter_riverpod_samples/providers/future_provider.dart';

class FutureProviderScreen extends ConsumerWidget {
  const FutureProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(futureProvider);
    return Scaffold(
      appBar: AppBar(title: Text("Future provider")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.invalidate(futureProvider);
        },
        child: Icon(Icons.refresh),
      ),
      body: Center(
        child: provider.when(
          skipLoadingOnRefresh: false,
          data:
              (value) => ListView.builder(
                itemCount: value.length,
                itemBuilder: (context, index) {
                  return ListTile(title: Text(value[index]),);
                },
              ),
          error: (error, stack) => Text(error.toString()),
          loading: () => CircularProgressIndicator(),
        ),
      ),
    );
  }
}
