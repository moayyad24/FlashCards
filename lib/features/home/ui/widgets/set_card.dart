import 'package:cardy/core/helper/routes.dart';
import 'package:cardy/core/models/set_model.dart';
import 'package:cardy/core/theme/app_text_styles.dart';
import 'package:cardy/core/theme/colors.dart';
import 'package:cardy/core/widgets/app_dialog.dart';
import 'package:cardy/features/home/manager/home_cubit/home_cubit.dart';
import 'package:cardy/features/settings/manager/settings_cubit/settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SetCard extends StatelessWidget {
  final SetModel setModel;

  const SetCard({super.key, required this.setModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _navigateToCardListScreen(context);
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
                          .deleteSet(setModel.id);

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
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14).r,
        decoration: BoxDecoration(
          color: AppColors.grey282B36,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: AppColors.border8C909F.withAlpha(90),
          ),
        ),
        child: Row(
          children: [
            // 1. Icon Circle
            Container(
              width: 44.w,
              height: 44.w,
              decoration: BoxDecoration(
                color: setModel.color.withAlpha(150),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: _buildSetIcon(),
              ),
            ),

            16.horizontalSpace,

            // 2. Text Information Column
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    setModel.title,
                    style: AppTextStyles.bold18,
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Text(
                        setModel.numOfCards.toString(),
                        style: AppTextStyles.regular14.copyWith(
                          color: AppColors.greyC2C6D6,
                        ),
                      ),
                      const SizedBox(width: 8),
                      // The Little Round Bullet
                      Container(
                        width: 6,
                        height: 6,
                        decoration: const BoxDecoration(
                          color: Color(0xFF44484F),
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Flexible(
                        child: Text(
                          setModel.description,
                          style: AppTextStyles.regular14.copyWith(
                            color: AppColors.greyC2C6D6,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // 3. Play Arrow Icon
            Icon(
              Icons.play_arrow_rounded,
              color: AppColors.greyLightE1E2EC,
              size: 28.w,
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToCardListScreen(BuildContext context) {
    Navigator.of(context).pushNamed(Routes.cardsListScreen, arguments: {
      'setModel': setModel,
      'settingsModel': context.read<SettingsCubit>().settingsModel,
    });
  }

  Widget _buildSetIcon() {
    final int? codePoint = int.tryParse(setModel.icon);

    return Icon(
      IconData(codePoint ?? 0xe2a3, fontFamily: 'MaterialIcons'),
      color: AppColors.greyLightE1E2EC,
      size: 22.w,
    );
  }
}
