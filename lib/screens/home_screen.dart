import 'package:flutter/material.dart';
import 'package:flutter_riverpod_samples/models/item.dart';
import 'package:flutter_riverpod_samples/screens/notifier_provider_screen.dart';
import 'package:flutter_riverpod_samples/screens/simple_provider_screen.dart';
import 'package:flutter_riverpod_samples/screens/state_provider_screen.dart';
import 'package:flutter_riverpod_samples/screens/todo_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Item> items = [
      Item(id: 1, name: "Simple provider"),
      Item(id: 2, name: "State provider (Counter App)"),
      Item(id: 3, name: "State notifier provider"),
      Item(id: 4, name: "Todo App"),
      Item(id: 5, name: "Streams provider"),
      Item(id: 6, name: "Auto dispose provider"),
      Item(id: 7, name: "Provider scope"),
    ];

    return Scaffold(
      appBar: AppBar(title: Text("Riverpod Samples")),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return ListTile(
            title: Text(item.name),
            onTap: () {
              switch (item.id) {
                case 1:
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SimpleProviderScreen(),
                    ),
                  );
                  break;
                case 2:
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => StateProviderScreen(),
                    ),
                  );
                  break;
                case 3:
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NotifierProviderScreen(),
                    ),
                  );
                  break;
                case 4:
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TodoScreen(),
                    ),
                  );
                  break;
                case 5:
                  break;
                case 6:
                  break;
                case 7:
                  break;
                default:
                  Navigator.pop(context);
                  break;
              }
            },
          );
        },
      ),
    );
  }
}
