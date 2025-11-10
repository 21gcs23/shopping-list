import 'package:flutter/foundation.dart';
import '../models/item.dart';
import 'package:uuid/uuid.dart';

class ShoppingProvider extends ChangeNotifier {
  final List<ShoppingItem> _items = [];

  List<ShoppingItem> get items => List.unmodifiable(_items);

  final _uuid = Uuid();

  void addItem({required String name, required int quantity}) {
    final item = ShoppingItem(id: _uuid.v4(), name: name, quantity: quantity);
    _items.add(item);
    notifyListeners();
  }

  void removeItem(String id) {
    _items.removeWhere((it) => it.id == id);
    notifyListeners();
  }

  ShoppingItem? getById(String id) {
    try {
      return _items.firstWhere((it) => it.id == id);
    } catch (_) {
      return null;
    }
  }
}
