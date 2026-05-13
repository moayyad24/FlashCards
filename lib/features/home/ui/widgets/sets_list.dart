import 'package:cardy/core/models/set_model.dart';
import 'package:cardy/features/home/ui/widgets/set_card.dart';
import 'package:flutter/material.dart';

class SetsList extends StatelessWidget {
  final List<SetModel> sets;
  const SetsList({super.key, required this.sets});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: sets.length,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return SetCard(
          setModel: sets[index],
        );
      },
      separatorBuilder: (context, index) => const SizedBox(
        height: 15,
      ),
    );
  }
}
