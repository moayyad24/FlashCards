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
        onPressed: () {
          print('***********Saved***********');
        },
        child: const Icon(Icons.add),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            AppTextField(
              hintText: 'Title',
            ),
            SizedBox(height: 20),
            AppTextField(
              hintText: 'Description',
            )
          ],
        ),
      ),
    );
  }
}
