import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/shopping_provider.dart';

class ItemDetailScreen extends StatelessWidget {
  static const routeName = '/detail';
  const ItemDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final itemId = ModalRoute.of(context)!.settings.arguments as String;
    final provider = Provider.of<ShoppingProvider>(context);
    final item = provider.getById(itemId);

    if (item == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Item not found')),
        body: const Center(child: Text('Item not found')),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Item Detail'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(item.name, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            Text('Quantity: ${item.quantity}', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 16),
            if (item.details.isNotEmpty) ...[
              const Text('Product Details:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
              const SizedBox(height: 8),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey[300]!),
                ),
                child: Text(
                  item.details,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ],
            const Spacer(),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      provider.removeItem(item.id);
                      Navigator.popUntil(context, ModalRoute.withName('/'));
                    },
                    icon: const Icon(Icons.delete),
                    label: const Text('Delete'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Back'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
