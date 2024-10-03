import 'package:flashcards/core/theme/colors.dart';
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
            color: AppColors.grey,
            thickness: 0.15,
          ),
          annotations: <GaugeAnnotation>[
            GaugeAnnotation(
              angle: 180,
              widget: Text(
                'Score: $numberOfCorrectAnswer/$numberOfQuestions',
                style: const TextStyle(
                  color: AppColors.greyLight,
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
          pointers: [
            RangePointer(
              value: numberOfCorrectAnswer.toDouble(),
              cornerStyle: CornerStyle.bothCurve,
              enableAnimation: true,
              animationDuration: 1200,
              sizeUnit: GaugeSizeUnit.factor,
              gradient: const SweepGradient(
                colors: <Color>[AppColors.cornflowerBlue, AppColors.pink],
                stops: <double>[0.25, 0.75],
              ),
              color: const Color(0xFF00A8B5),
              width: 0.15,
            ),
          ],
        ),
      ],
    );
  }
}
