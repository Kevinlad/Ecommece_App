import 'package:ecommerce_app/Model/favourite_model.dart';
import 'package:flutter/material.dart';

class FavouriteProvider with ChangeNotifier {
  List<Favourite_Model> _selectedItems = [];
  List<Favourite_Model> get selectedItem => _selectedItems;

  void add(Favourite_Model value) {
    _selectedItems.add(value);
    notifyListeners();
  }

  void toggleFavorite(Favourite_Model item) {
    if (selectedItem.contains(item)) {
      selectedItem.remove(item);
    } else {
      _selectedItems.add(item);
    }
    notifyListeners();
  }

  bool isFavorite(String itemName) {
    return selectedItem.any((item) => item.name == itemName);
  }

  void removeFromFavorites(Favourite_Model item) {
    _selectedItems.remove(item);
    notifyListeners();
  }
}
