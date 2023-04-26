import 'package:flutter/material.dart';

class AddItemView extends StatelessWidget {
  AddItemView({super.key, required this.onAdd});

  final Function(String) onAdd;
  final TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextField(
            controller: textController,
            style: const TextStyle(fontSize: 20),
            decoration: const InputDecoration(hintText: 'Enter item'),
          ),
          ElevatedButton(
            onPressed: (() {
              if (textController.text.isNotEmpty) {
                onAdd(textController.text);
              }
            }),
            child: const Text('Add Item'),
          ),
        ],
      ),
    );
  }
}
