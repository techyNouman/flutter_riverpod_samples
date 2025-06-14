
class FavouriteItem {
  final int id;
  final String name;
  final bool fav;

  FavouriteItem({required this.id, required this.name, required this.fav});

  FavouriteItem copyWith({int? id, String? name, bool? fav}) {
    return FavouriteItem(
      id: id ?? this.id,
      name: name ?? this.name,
      fav: fav ?? this.fav,
    );
  }
}
