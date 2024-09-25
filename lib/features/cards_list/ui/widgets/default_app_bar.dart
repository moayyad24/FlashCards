import 'package:flashcards/core/helper/routes.dart';
import 'package:flashcards/core/models/collection_model.dart';
import 'package:flashcards/core/theme/colors.dart';
import 'package:flutter/material.dart';

class DefaultAppBar extends StatelessWidget {
  const DefaultAppBar({
    super.key,
    required CollectionModel collectionModel,
  }) : _collectionModel = collectionModel;

  final CollectionModel _collectionModel;

  @override
  Widget build(BuildContext context) { 
    return AppBar(
      title: Text(
        _collectionModel.title,
        style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w500),
      ),
      actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
        PopupMenuButton<String>(
          color: AppColors.grey,
          itemBuilder: (BuildContext context) {
            return [
              PopupMenuItem<String>(
                onTap: () {
                  Navigator.of(context).pushNamed(Routes.editSetScreen,
                      arguments: _collectionModel);
                },
                child: const Row(
                  children: [
                    Icon(Icons.edit),
                    SizedBox(width: 10),
                    Text(
                      'Edit abstract',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ];
          },
        ),
      ],
    );
  }
}
