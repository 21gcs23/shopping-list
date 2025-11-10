class ShoppingItem {
  final String id;
  final String name;
  final int quantity;
  final String details;

  ShoppingItem({
    required this.id,
    required this.name,
    required this.quantity,
    this.details = '',
  });
}
