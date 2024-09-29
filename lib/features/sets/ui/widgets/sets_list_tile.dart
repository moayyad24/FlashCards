import 'package:flashcards/core/helper/dependency_injection.dart';
import 'package:flashcards/core/helper/routes.dart';
import 'package:flashcards/core/models/collection_model.dart';
import 'package:flashcards/core/theme/colors.dart';
import 'package:flashcards/core/widgets/app_dialog.dart';
import 'package:flashcards/features/sets/manager/sets_cubit/sets_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SetsListTile extends StatelessWidget {
  final CollectionModel setModel;
  const SetsListTile({
    super.key,
    required this.setModel,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.of(context).pushNamed(
          Routes.cardsListScreen,
          arguments:  setModel,
        );
        getIt.registerSingleton<SetsCubit>(context.read<SetsCubit>());
      },
      onLongPress: () {
        _buildModalBottomSheet(context);
      },
      leading: const Icon(
        Icons.folder,
        color: AppColors.sulu,
      ),
      title: Text(setModel.title),
      titleTextStyle:
          const TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
      subtitle: Text(setModel.description),
      subtitleTextStyle:
          const TextStyle(color: AppColors.greyLight, fontSize: 16),
    );
  }

  Future<dynamic> _buildModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.black,
      isScrollControlled: true,
      builder: (_) {
        return SizedBox(
          child: ListTile(
            onTap: () {
              Navigator.pop(context);
              appDialog(
                context: context,
                title: 'Delete this set?',
                onPressed: () async {
                  Navigator.pop(context);
                  await BlocProvider.of<SetsCubit>(context)
                      .deleteASet(setModel.setId!, setModel.folderId!);
                },
              );
            },
            leading: const Icon(Icons.delete),
            title: const Text('Delete'),
          ), // Set height of Bottom Sheet
        );
      },
    );
  }
}
