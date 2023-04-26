import 'package:f_shopping_list/components/add_item_view.dart';
import 'package:f_shopping_list/components/item_list_view.dart';
import 'package:f_shopping_list/schemas/item.dart';
import 'package:flutter/material.dart';

class ShoppingListView extends StatelessWidget {
  const ShoppingListView({
    super.key,
    required this.onAdd,
    required this.onToggle,
    required this.onDelete,
    required this.items,
  });

  final Function(String) onAdd;
  final Function(Item) onToggle;
  final Function(Item) onDelete;
  final List<Item> items;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.white, Colors.indigoAccent],
        ),
      ),
      child: Column(
        children: [
          AddItemView(onAdd: onAdd),
          Expanded(
            child: ItemListView(
              items: items,
              onToggle: onToggle,
              onDelete: onDelete,
            ),
          ),
        ],
      ),
    );
  }
}
