import 'package:cardy/core/theme/app_text_styles.dart' show AppTextStyles;
import 'package:cardy/core/theme/colors.dart';
import 'package:cardy/features/settings/manager/settings_cubit/settings_cubit.dart';
import 'package:cardy/features/settings/manager/settings_cubit/settings_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuestionAmountPerTest extends StatelessWidget {
  const QuestionAmountPerTest({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        final amount =
            context.read<SettingsCubit>().settingsModel.questionsAmount;
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 16).r,
              leading: Container(
                width: 44,
                height: 44,
                decoration: const BoxDecoration(
                  color: AppColors.grey1D2127,
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Icon(
                    Icons.radar_rounded,
                    color: AppColors.blueADC6FF,
                  ),
                ),
              ),
              title: Text(
                'Target Cards',
                style: AppTextStyles.bold16,
              ),
              subtitle: Text(
                'Number of cards per test',
                style: AppTextStyles.regular12,
              ),
              trailing: Text(
                amount.toString(),
                style:
                    AppTextStyles.bold22.copyWith(color: AppColors.blueADC6FF),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12).r,
              child: SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  activeTrackColor: AppColors.blueADC6FF,
                  inactiveTrackColor: const Color(0xFF32353C),
                  thumbColor: AppColors.blueADC6FF,
                  overlayColor: AppColors.blueADC6FF.withAlpha(80),
                  trackHeight: 8,
                ),
                child: Slider(
                  value: amount.toDouble().clamp(10.0, 100.0),
                  min: 10,
                  max: 100,
                  divisions: 9,
                  onChanged: (value) {
                    context
                        .read<SettingsCubit>()
                        .updateQuestionAmount(value.toInt());
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
