import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_samples/providers/favourite_provider.dart';

class FavouriteScreen extends ConsumerWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favList = ref.watch(favouriteProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("Favourite - State notifier provider"),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              ref.read(favouriteProvider.notifier).favourite(value);
            },
            itemBuilder: (BuildContext context) {
              return const [
                PopupMenuItem(value: 'All', child: Text('All')),
                PopupMenuItem(value: 'Favourite', child: Text('Favourite')),
              ];
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(favouriteProvider.notifier).addItem();
        },
        child: Text('+'),
      ),
      body: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: 'Search',
              border: OutlineInputBorder(),
            ),
            onChanged: (value) {
              ref.read(favouriteProvider.notifier).filterList(value);
            },
          ),
          Expanded(
            child:
                favList.filteredItems.isEmpty
                    ? const Center(child: Text("No records found."))
                    : ListView.builder(
                      itemCount: favList.filteredItems.length,
                      itemBuilder: (ctx, i) {
                        final favItem = favList.filteredItems[i];
                        return ListTile(
                          title: Text(favItem.name),
                          trailing: Icon(
                            favItem.fav
                                ? Icons.favorite
                                : Icons.favorite_border,
                          ),
                        );
                      },
                    ),
          ),
        ],
      ),
    );
  }
}
