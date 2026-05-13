import 'package:cardy/core/models/folder_model.dart';
import 'package:cardy/features/home/ui/widgets/folder_card.dart';
import 'package:flutter/material.dart';

class FolderCardList extends StatelessWidget {
  final List<FolderModel> folders;
  const FolderCardList({super.key, required this.folders});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: folders.length,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return FolderCard(
          folder: folders[index],
        );
      },
      separatorBuilder: (context, index) => const SizedBox(
        height: 15,
      ),
    );
  }
}
