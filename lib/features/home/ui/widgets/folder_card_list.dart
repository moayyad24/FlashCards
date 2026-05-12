import 'package:cardy/features/home/manager/home_cubit/home_cubit.dart';
import 'package:cardy/features/home/manager/home_cubit/home_state.dart';
import 'package:cardy/features/home/ui/widgets/folder_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FolderCardList extends StatelessWidget {
  const FolderCardList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeFetchLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is HomeFetchSuccess) {
          return ListView.separated(
            itemCount: state.homeData.folders.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return const FolderCard();
            },
            separatorBuilder: (context, index) => const SizedBox(
              height: 15,
            ),
          );
        } else {
          return const Center(
            child: Text('There was an error'),
          );
        }
      },
    );
  }
}
