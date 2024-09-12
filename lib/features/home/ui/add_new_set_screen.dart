import 'package:flashcards/core/widgets/app_text_field.dart';
import 'package:flutter/material.dart';

class AddNewSetScreen extends StatelessWidget {
  const AddNewSetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create a new set'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            AppTextField(
              hintText: 'Title',
              onChanged: (v) {},
            ),
            const SizedBox(height: 20),
            AppTextField(
              hintText: 'Description',
              onChanged: (v) {},
            )
          ],
        ),
      ),
    );
  }
}
