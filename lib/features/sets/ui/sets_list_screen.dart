import 'package:cardy/core/helper/routes.dart';
import 'package:cardy/core/theme/colors.dart';
import 'package:cardy/core/widgets/my_floating_action_button.dart';
import 'package:cardy/features/sets/manager/sets_cubit/sets_cubit.dart';
import 'package:cardy/features/sets/ui/widgets/sets_list_view.dart';
import 'package:cardy/features/sets/ui/widgets/sets_list_screen_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SetsListScreen extends StatelessWidget {
  const SetsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context)
                  .pushNamed(Routes.editFolderScreen, arguments: {
                'folderModel': context.read<SetsCubit>().folderModel,
                'setsCubit': context.read<SetsCubit>(),
              });
            },
            style: IconButton.styleFrom(
              backgroundColor: AppColors.grey282B36,
              side: BorderSide(
                color: AppColors.border8C909F.withAlpha(90),
              ),
            ),
            icon: const Icon(Icons.mode_edit_rounded,
                color: AppColors.greyLightE1E2EC),
          ),
          const SizedBox(width: 15),
        ],
      ),
      floatingActionButton: MyFloatingActionButton(
        onTap: () {
          Navigator.of(context).pushNamed(Routes.addSetScreen, arguments: {
            'folderId': context.read<SetsCubit>().folderModel.id,
            'setsCubit': BlocProvider.of<SetsCubit>(context),
          });
        },
      ),
      body: const Column(
        children: [
          SetsListScreenTitle(),
          SetsListView(),
        ],
      ),
    );
  }
}
