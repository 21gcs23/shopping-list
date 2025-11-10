import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/shopping_provider.dart';
import 'screens/home_screen.dart';
import 'screens/add_item_screen.dart';
import 'screens/item_detail_screen.dart';

void main() {
  runApp(const ShoppingListApp());
}

class ShoppingListApp extends StatelessWidget {
  const ShoppingListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ShoppingProvider(),
      child: MaterialApp(
        title: 'Shopping List',
        theme: ThemeData(primarySwatch: Colors.blue),
        debugShowCheckedModeBanner: false,
        initialRoute: HomeScreen.routeName,
        routes: {
          HomeScreen.routeName: (ctx) => const HomeScreen(),
          AddItemScreen.routeName: (ctx) => const AddItemScreen(),
          ItemDetailScreen.routeName: (ctx) => const ItemDetailScreen(),
        },
      ),
    );
  }
}
