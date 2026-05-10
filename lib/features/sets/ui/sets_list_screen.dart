import 'package:cardy/core/helper/routes.dart';
import 'package:cardy/core/theme/colors.dart';
import 'package:cardy/features/sets/manager/sets_cubit/sets_cubit.dart';
import 'package:cardy/features/sets/ui/widgets/sets_list_view.dart';
import 'package:cardy/features/sets/ui/widgets/sets_floating_action_button.dart';
import 'package:cardy/features/sets/ui/widgets/sets_list_screen_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SetsListScreen extends StatelessWidget {
  const SetsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        actions: [
          PopupMenuButton<String>(
            color: AppColors.grey20232A,
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem<String>(
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(Routes.editFolderScreen, arguments: {
                      'folderModel': context.read<SetsCubit>().folderModel,
                      'setsCubit': context.read<SetsCubit>(),
                    });
                  },
                  child: const Row(
                    children: [
                      Icon(Icons.edit),
                      SizedBox(width: 10),
                      Text(
                        'Edit abstract',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ];
            },
          ),
        ],
      ),
      floatingActionButton: const SetsFloatingActionButton(),
      body: const Column(
        children: [
          SetsListScreenTitle(),
          SetsListView(),
        ],
      ),
    ));
  }
}
