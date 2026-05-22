import 'package:cardy/core/models/set_model.dart';
import 'package:cardy/features/home/ui/widgets/list_title.dart';
import 'package:cardy/features/home/ui/widgets/set_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SetsList extends StatelessWidget {
  final List<SetModel> sets;
  const SetsList({super.key, required this.sets});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTitle(
          title: 'Individual Sets',
          icon: Icons.table_rows_outlined,
          onViewAllPressed: () {},
        ),
        ListView.separated(
          itemCount: sets.length,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return SetCard(
              setModel: sets[index],
            );
          },
          separatorBuilder: (context, index) => SizedBox(
            height: 15.h,
          ),
        ),
      ],
    );
  }
}
