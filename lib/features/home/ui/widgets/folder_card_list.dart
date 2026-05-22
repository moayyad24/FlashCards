import 'package:cardy/core/models/folder_model.dart';
import 'package:cardy/features/home/ui/widgets/folder_card.dart';
import 'package:cardy/features/home/ui/widgets/list_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FolderCardList extends StatelessWidget {
  final List<FolderModel> folders;
  const FolderCardList({super.key, required this.folders});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTitle(
          title: 'Folders',
          icon: Icons.folder_open_rounded,
          onViewAllPressed: () {},
        ),
        ListView.separated(
          itemCount: folders.length,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return FolderCard(
              folder: folders[index],
            );
          },
          separatorBuilder: (context, index) => SizedBox(
            height: 15.h,
          ),
        ),
      ],
    );
  }
}
