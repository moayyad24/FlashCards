import 'package:cardy/core/theme/app_text_styles.dart';
import 'package:cardy/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class MyRangePointer extends StatelessWidget {
  final int numberOfCorrectAnswer;
  final int numberOfQuestions;
  const MyRangePointer({
    super.key,
    required this.numberOfCorrectAnswer,
    required this.numberOfQuestions,
  });

  @override
  Widget build(BuildContext context) {
    return SfRadialGauge(
      enableLoadingAnimation: true,
      axes: <RadialAxis>[
        RadialAxis(
          minimum: 0,
          maximum: numberOfQuestions.toDouble(),
          showLabels: false,
          showTicks: false,
          startAngle: 270,
          endAngle: 270,
          radiusFactor: 0.8,
          axisLineStyle: const AxisLineStyle(
            thicknessUnit: GaugeSizeUnit.factor,
            color: AppColors.border1C1F26,
            thickness: 0.15,
          ),
          annotations: <GaugeAnnotation>[
            GaugeAnnotation(
              angle: 180,
              widget: Text(
                'Score\n$numberOfCorrectAnswer/$numberOfQuestions',
                style: AppTextStyles.bold20,
                textAlign: TextAlign.center,
              ),
            ),
          ],
          pointers: [
            RangePointer(
              value: numberOfCorrectAnswer.toDouble(),
              cornerStyle: CornerStyle.bothFlat,
              enableAnimation: true,
              animationDuration: 1200,
              sizeUnit: GaugeSizeUnit.factor,
              gradient: const SweepGradient(
                colors: <Color>[
                  AppColors.cornflowerBlue,
                  AppColors.orangeFFB786
                ],
                stops: <double>[0.25, 0.75],
              ),
              color: AppColors.blueADC6FF,
              width: 0.15,
            ),
          ],
        ),
      ],
    );
  }
}
