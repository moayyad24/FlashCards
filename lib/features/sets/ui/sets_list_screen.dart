import 'package:flashcards/core/models/collection_model.dart';
import 'package:flashcards/core/theme/colors.dart';
import 'package:flashcards/features/sets/manager/sets_cubit/sets_cubit.dart';
import 'package:flashcards/features/sets/manager/sets_cubit/sets_state.dart';
import 'package:flashcards/features/sets/ui/widgets/sets_floating_action_button.dart';
import 'package:flashcards/features/sets/ui/widgets/sets_list_screen_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SetsListScreen extends StatelessWidget {
  final CollectionModel folder;
  const SetsListScreen({super.key, required this.folder});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_vert_rounded,
              )),
        ],
      ),
      floatingActionButton: SetsFloatingActionButton(folder: folder),
      body: Column(
        children: [
          SetsListScreenTitle(title: folder.title),
          BlocBuilder<SetsCubit, SetsState>(
            builder: (context, state) {
              if (state is SetsSuccess) {
                return Expanded(
                    child: ListView.builder(
                        itemCount: state.setsList.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: const Icon(
                              Icons.folder,
                              color: AppColors.sulu,
                            ),
                            title: Text(state.setsList[index].title),
                            titleTextStyle: const TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 18),
                            subtitle: Text(state.setsList[index].description),
                            subtitleTextStyle: const TextStyle(
                                color: AppColors.greyLight, fontSize: 16),
                          );
                        }));
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          )
        ],
      ),
    ));
  }
}
