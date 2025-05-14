import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final simpleProvider = Provider<String>((ref){
  return "Simple provider is used to expose read only values.";
});

/// stateful widget
class StateProviderScreen extends ConsumerStatefulWidget {
  const StateProviderScreen({super.key});

  @override
  ConsumerState<StateProviderScreen> createState() => _SimpleProviderScreenState();
}

class _SimpleProviderScreenState extends ConsumerState<StateProviderScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = ref.watch(simpleProvider);
    return Scaffold(
      appBar: AppBar(title: Text("State provider")),
      body: Center(
        child: Text(
          provider,
          style: TextStyle(fontSize: 22),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

/// stateless widget
/*class SimpleProviderScreen extends ConsumerWidget {
  const SimpleProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(simpleProvider);
    return Scaffold(
      appBar: AppBar(title: Text("Simple provider")),
      body: Center(
        child: Text(
          provider,
          style: TextStyle(fontSize: 22),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}*/
