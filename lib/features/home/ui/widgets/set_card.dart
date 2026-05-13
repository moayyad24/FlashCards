import 'package:cardy/core/helper/routes.dart';
import 'package:cardy/core/models/set_model.dart';
import 'package:cardy/core/theme/colors.dart';
import 'package:cardy/features/settings/manager/settings_cubit/settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SetCard extends StatelessWidget {
  final SetModel setModel;

  const SetCard({super.key, required this.setModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _navigateToCardListScreen(context);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
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
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: AppColors.orangeFFB786.withAlpha(150),
                shape: BoxShape.circle,
              ),
              child: const Center(
                child: Text(
                  "Σ",
                  style: TextStyle(
                    color: AppColors.greyLightE1E2EC,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(width: 16),

            // 2. Text Information Column
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    setModel.title,
                    style: const TextStyle(
                      color: AppColors.greyLightE1E2EC,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Text(
                        setModel.numOfCards.toString(),
                        style: const TextStyle(
                          color: AppColors.greyC2C6D6,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(width: 8),
                      // The Little Round Bullet
                      Container(
                        width: 4,
                        height: 4,
                        decoration: const BoxDecoration(
                          color: Color(0xFF44484F),
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        'Last studied 3d ago',
                        style: TextStyle(
                          color: AppColors.greyC2C6D6,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // 3. Play Arrow Icon
            const Icon(
              Icons.play_arrow_rounded,
              color: AppColors.greyLightE1E2EC,
              size: 28,
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
}
