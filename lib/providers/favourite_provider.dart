import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_samples/models/favourite_item.dart';
import 'package:flutter_riverpod_samples/providers/favourite_state.dart';

final favouriteProvider =
    StateNotifierProvider<FavouriteNotifier, FavouriteState>((ref) {
      return FavouriteNotifier();
    });

class FavouriteNotifier extends StateNotifier<FavouriteState> {
  FavouriteNotifier()
    : super(FavouriteState(allItems: [], filteredItems: [], search: ''));

  void addItem() {
    List<FavouriteItem> items = [
      FavouriteItem(id: 1, name: 'Motorola', fav: true),
      FavouriteItem(id: 2, name: 'iPhone', fav: false),
      FavouriteItem(id: 3, name: 'Samsung', fav: true),
      FavouriteItem(id: 4, name: 'Google Pixel', fav: true),
      FavouriteItem(id: 5, name: 'Oppo', fav: false),
      FavouriteItem(id: 6, name: 'Vivo', fav: false),
      FavouriteItem(id: 7, name: 'Mi', fav: true),
    ];
    state = state.copyWith(allItems: items.toList(), filteredItems: items.toList());
  }

  void filterList(String query) {
    state = state.copyWith(filteredItems: _filterItems(state.allItems, query));
  }

  void favourite(String option) {
    state = state.copyWith(filteredItems: _favouriteItems(state.allItems, option));
  }

  List<FavouriteItem> _filterItems(List<FavouriteItem> items, String query) {
    if (query.isEmpty) {
      return items;
    }
    return items
        .where((item) => item.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  List<FavouriteItem> _favouriteItems(List<FavouriteItem> items, String option) {
    if (option == 'All') {
      return items;
    }
    return items
        .where((item) => item.fav == true)
        .toList();
  }
}
