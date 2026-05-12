import 'package:cardy/core/theme/colors.dart';
import 'package:flutter/material.dart';

class BundleCard extends StatelessWidget {
  const BundleCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.grey282B36,
        borderRadius: BorderRadius.circular(20),
        // Adding a subtle border/shadow to match the card depth
        border: const Border(
            left: BorderSide(
          color: AppColors.cornflowerBlue,
          width: 5,
        )),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // --- Header Row ---
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Med School Prep",
                style: TextStyle(
                  color: AppColors.greyLightE1E2EC,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Icon(
                Icons.more_vert,
                color: AppColors.greyC2C6D6,
              ),
            ],
          ),

          const SizedBox(height: 8),

          // --- Description Text ---
          const Text(
            "Comprehensive anatomy, pharmacology, and pathology set...",
            style: TextStyle(
              color: AppColors.greyC2C6D6,
              fontSize: 18,
              height: 1.4,
            ),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),

          const SizedBox(height: 24),

          // --- Footer Row ---
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // Badges
              Row(
                children: [
                  _buildBadge("8 Sets"),
                  const SizedBox(width: 10),
                  _buildBadge("1200 Cards"),
                ],
              ),

              // Progress Circle
              _buildProgressCircle(percentage: 50),
            ],
          ),
        ],
      ),
    );
  }

  // Helper widget to build the rounded badge tags
  Widget _buildBadge(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.grey20232A,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: AppColors.greyLightE1E2EC,
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  // Helper widget to build the circular progress indicator with text
  Widget _buildProgressCircle({required int percentage}) {
    return SizedBox(
      width: 52,
      height: 52,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // The Circular Progress Bar
          SizedBox(
            width: 52,
            height: 52,
            child: CircularProgressIndicator(
              value: percentage / 100,
              strokeWidth: 5,
              color: AppColors.blueADC6FF,
              backgroundColor: AppColors.darkblue10131A,
              strokeCap: StrokeCap.round,
            ),
          ),
          // The Percentage Text
          Text(
            "$percentage%",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
