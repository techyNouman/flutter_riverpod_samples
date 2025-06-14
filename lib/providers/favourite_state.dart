import 'package:flutter_riverpod_samples/models/favourite_item.dart';

class FavouriteState {
  final List<FavouriteItem> allItems;
  final List<FavouriteItem> filteredItems;
  final String search;

  FavouriteState({
    required this.allItems,
    required this.filteredItems,
    required this.search,
  });

  FavouriteState copyWith({
    List<FavouriteItem>? allItems,
    List<FavouriteItem>? filteredItems,
    String? search,
  }) {
    return FavouriteState(
      allItems: allItems ?? this.allItems,
      filteredItems: filteredItems ?? this.filteredItems,
      search: search ?? this.search,
    );
  }
}
