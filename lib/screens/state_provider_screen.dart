import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final stateProvider = StateProvider<String>((ref) {
  return "State provider is used to hold and manage the simple, mutable state.";
});

final counterProvider = StateProvider<int>((ref) {
  return 0;
});

final switchProvider = StateProvider<bool>((ref){
  return false;
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
    final provider = ref.watch(stateProvider);
    return Scaffold(
      appBar: AppBar(title: Text("State provider (Counter App)")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              provider,
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24),
            Consumer(
              builder: (context, ref, child) {
                print("build2");
                final count = ref.watch(counterProvider);
                return Text(
                  "Counter - ${count.toString()}",
                  style: TextStyle(fontSize: 22),
                  textAlign: TextAlign.center,
                );
              },
            ),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    ref.read(counterProvider.notifier).state--;
                  },
                  child: Text("-"),
                ),
                SizedBox(width: 16,),
                ElevatedButton(
                  onPressed: () {
                    ref.read(counterProvider.notifier).state++;
                  },
                  child: Text("+"),
                ),
              ],
            ),
            SizedBox(height: 48),
            Text(
              "Switch",
              style: TextStyle(fontSize: 22),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 4),
            Consumer(
              builder: (context, ref, child) {
                print("build3");
                final bool = ref.watch(switchProvider);
                return Switch(value: bool, onChanged: (value){
                  ref.read(switchProvider.notifier).state = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

/// stateless widget
/*class StateProviderScreen extends ConsumerWidget {
  const StateProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(stateProvider);

    print("build1");
    return Scaffold(
      appBar: AppBar(title: Text("State provider (Counter App)")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              provider,
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24),
            Consumer(
              builder: (context, ref, child) {
                print("build2");
                final count = ref.watch(counterProvider);
                return Text(
                  "Counter - ${count.toString()}",
                  style: TextStyle(fontSize: 22),
                  textAlign: TextAlign.center,
                );
              },
            ),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    ref.read(counterProvider.notifier).state--;
                  },
                  child: Text("-"),
                ),
                SizedBox(width: 16,),
                ElevatedButton(
                  onPressed: () {
                    ref.read(counterProvider.notifier).state++;
                  },
                  child: Text("+"),
                ),
              ],
            ),
            SizedBox(height: 48),
            Text(
              "Switch",
              style: TextStyle(fontSize: 22),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 4),
            Consumer(
              builder: (context, ref, child) {
                print("build3");
                final bool = ref.watch(switchProvider);
                return Switch(value: bool, onChanged: (value){
                  ref.read(switchProvider.notifier).state = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}*/
