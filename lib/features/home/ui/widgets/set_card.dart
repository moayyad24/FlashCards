import 'package:cardy/core/theme/colors.dart';
import 'package:flutter/material.dart';

class SetCard extends StatelessWidget {
  final String title;
  final String cardCount;
  final String lastStudied;

  const SetCard({
    super.key,
    this.title = "Calculus Formulas",
    this.cardCount = "35 Cards",
    this.lastStudied = "Last studied 3d ago",
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  title,
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
                      cardCount,
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
                    Text(
                      lastStudied,
                      style: const TextStyle(
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
    );
  }
}
