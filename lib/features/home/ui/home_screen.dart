import 'package:cardy/core/theme/colors.dart';
import 'package:cardy/features/home/ui/widgets/folder_card_list.dart';
import 'package:cardy/features/home/ui/widgets/home_app_bar.dart';
import 'package:cardy/features/home/ui/widgets/my_floating_action_button.dart';
import 'package:cardy/features/home/ui/widgets/set_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(),
      floatingActionButton: const MyFloatingActionButton(),
      body: SafeArea(
          child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTitle(
              title: 'Folders',
              icon: Icons.folder_open_rounded,
              onViewAllPressed: () {},
            ),
            const FolderCardList(),
            const SizedBox(
              height: 20,
            ),
            ListTitle(
              title: 'Individual Sets',
              icon: Icons.table_rows_outlined,
              onViewAllPressed: () {},
            ),
            const SetCard(),
          ],
        ),
      )),
    );
  }
}

class ListTitle extends StatelessWidget {
  final String title;
  final IconData icon;
  final void Function()? onViewAllPressed;
  const ListTitle({
    super.key,
    required this.title,
    required this.icon,
    this.onViewAllPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: AppColors.orangeFFB786,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          title,
          style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: AppColors.greyLightE1E2EC),
        ),
        const Spacer(),
        TextButton(
            onPressed: onViewAllPressed,
            child: const Text(
              'View All',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ))
      ],
    );
  }
}
