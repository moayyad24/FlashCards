import 'package:cardy/core/helper/routes.dart';
import 'package:cardy/core/models/folder_model.dart';
import 'package:cardy/core/theme/app_text_styles.dart';
import 'package:cardy/core/theme/colors.dart';
import 'package:cardy/core/widgets/app_dialog.dart';
import 'package:cardy/features/home/manager/home_cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FolderCard extends StatelessWidget {
  final FolderModel folder;
  const FolderCard({super.key, required this.folder});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _navigateToSetsListScreen(context);
      },
      onLongPress: () {
        showModalBottomSheet(
          context: context,
          backgroundColor: AppColors.black,
          isScrollControlled: true,
          builder: (_) {
            return SizedBox(
              child: ListTile(
                onTap: () {
                  Navigator.pop(context);
                  appDialog(
                    context: context,
                    title: 'Delete this set?',
                    onPressed: () {
                      BlocProvider.of<HomeCubit>(context)
                          .deleteFolder(folder.id);

                      Navigator.pop(context);
                    },
                  );
                },
                leading: const Icon(Icons.delete),
                title: const Text('Delete'),
              ), // Set height of Bottom Sheet
            );
          },
        );
      },
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.all(20).r,
        decoration: BoxDecoration(
          color: AppColors.grey282B36,
          borderRadius: BorderRadius.circular(20),
          border: Border(
              left: BorderSide(
            color: folder.color,
            width: 5,
          )),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- Header Row ---
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  folder.title,
                  style: AppTextStyles.bold20,
                ),
                const Icon(
                  Icons.more_vert,
                  color: AppColors.greyC2C6D6,
                ),
              ],
            ),

            8.verticalSpace,

            // --- Description Text ---
            Text(
              folder.description,
              style: AppTextStyles.regular16
                  .copyWith(color: AppColors.greyC2C6D6, height: 1.4),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),

            20.verticalSpace,

            // --- Footer Row ---
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // Badges
                Row(
                  children: [
                    _buildBadge("${folder.numOfSets} Sets"),
                    10.horizontalSpace,
                    _buildBadge("${folder.numOfCards} Cards"),
                  ],
                ),

                // Progress Circle
                _buildProgressCircle(percentage: 50),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Helper widget to build the rounded badge tags
  Widget _buildBadge(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6).r,
      decoration: BoxDecoration(
        color: AppColors.grey20232A,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: AppTextStyles.medium12,
      ),
    );
  }

  // Helper widget to build the circular progress indicator with text
  Widget _buildProgressCircle({required int percentage}) {
    return SizedBox(
      width: 52.w,
      height: 52.w,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // The Circular Progress Bar
          CircularProgressIndicator(
            value: percentage / 100,
            strokeWidth: 5,
            color: folder.color,
            backgroundColor: AppColors.darkblue10131A,
            strokeCap: StrokeCap.round,
            constraints: const BoxConstraints(minWidth: 52, minHeight: 52),
          ),
          // The Percentage Text
          Text(
            "$percentage%",
            style: AppTextStyles.bold12,
          ),
        ],
      ),
    );
  }

  void _navigateToSetsListScreen(BuildContext context) {
    Navigator.of(context).pushNamed(Routes.setsListScreen, arguments: folder);
  }
}
