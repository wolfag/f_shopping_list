import 'package:f_shopping_list/schemas/item.dart';
import 'package:flutter/material.dart';

class ItemListView extends StatelessWidget {
  const ItemListView({
    super.key,
    required this.items,
    required this.onToggle,
    required this.onDelete,
  });

  final List<Item> items;
  final Function(Item) onToggle;
  final Function(Item) onDelete;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(10),
      shrinkWrap: true,
      itemBuilder: getItemBuilder,
      physics: const BouncingScrollPhysics(),
      separatorBuilder: getSeparatorBuilder,
      itemCount: items.length,
    );
  }

  TextDecoration getTextDecoration(bool isDone) {
    return isDone ? TextDecoration.lineThrough : TextDecoration.none;
  }

  Widget getSeparatorBuilder(BuildContext context, int index) {
    return const Divider(
      thickness: 1,
      color: Colors.indigo,
    );
  }

  Widget getItemBuilder(BuildContext context, int index) {
    Item item = items[index];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Checkbox(
              value: item.done,
              onChanged: (bool? value) {
                onToggle(item);
              },
            ),
            Text(
              item.text,
              style: TextStyle(
                decorationColor: Colors.indigo,
                decorationThickness: 2,
                fontSize: 20,
                decoration: getTextDecoration(item.done),
              ),
            ),
          ],
        ),
        IconButton(
          onPressed: () {
            onDelete(item);
          },
          icon: Icon(
            Icons.delete,
            color: Colors.indigo,
            size: 25,
            semanticLabel: 'Delete ${item.text}',
          ),
        ),
      ],
    );
  }
}
