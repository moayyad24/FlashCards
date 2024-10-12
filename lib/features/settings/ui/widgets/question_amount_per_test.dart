import 'package:flashcards/core/theme/colors.dart';
import 'package:flashcards/features/settings/manager/settings_cubit/settings_cubit.dart';
import 'package:flashcards/features/settings/manager/settings_cubit/settings_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuestionAmountPerTest extends StatelessWidget {
  const QuestionAmountPerTest({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        showDialog(
          context: context,
          builder: (_) {
            return const QuestionsCountDialog();
          },
        );
      },
      title: const Text('Question amount per test'),
      subtitle: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, state) {
          return Text(
              '${context.read<SettingsCubit>().settingsModel.questionsAmount} questions');
        },
      ),
      subtitleTextStyle: const TextStyle(color: AppColors.greyLight),
    );
  }
}

class QuestionsCountDialog extends StatefulWidget {
  const QuestionsCountDialog({super.key});

  @override
  State<QuestionsCountDialog> createState() => _QuestionsCountDialogState();
}

class _QuestionsCountDialogState extends State<QuestionsCountDialog> {
  late int groupValue;
  final List<int> questionCounts = [3, 5, 10, 25, 50, 100];

  @override
  void initState() {
    groupValue = context.read<SettingsCubit>().settingsModel.questionsAmount;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 50),
      title: const Text('Questions'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: questionCounts.asMap().entries.map((entry) {
          int value = entry.value;
          return QuestionCount(value, groupValue, (value) {
            setState(() {
              groupValue = value!;
            });
          });
        }).toList(),
      ),
      actions: [
        TextButton(
          child: const Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: const Text('Ok'),
          onPressed: () {
            context.read<SettingsCubit>().updateQuestionAmount(groupValue);
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}

class QuestionCount extends StatelessWidget {
  final int value;
  final int groupValue;

  final void Function(int?)? onChanged;

  const QuestionCount(this.value, this.groupValue, this.onChanged, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio(value: value, groupValue: groupValue, onChanged: onChanged),
        Text(value.toString()),
      ],
    );
  }
}
