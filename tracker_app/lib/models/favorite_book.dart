import 'package:flutter/material.dart';
import 'book.dart';

class FavoritePageModel extends ChangeNotifier {
  List<Book> _favoritelist = [];

  List<Book> get favoritelist => _favoritelist;

  set favoritelist(List<Book> newList) {
    _favoritelist = newList;
    notifyListeners();
  }
}
