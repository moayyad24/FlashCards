import 'package:flashcards/features/home/manager/home_cubit/home_cubit.dart';
import 'package:flashcards/features/home/manager/home_cubit/home_state.dart';
import 'package:flashcards/features/home/ui/widgets/home_card_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeListView extends StatelessWidget {
  const HomeListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeFetchLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is HomeFetchSuccess) {
          return Expanded(
            child: ListView.builder(
              itemCount: state.homeDataList.length,
              itemBuilder: (context, index) {
                return HomeCardListTile(homeModel: state.homeDataList[index]);
              },
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
