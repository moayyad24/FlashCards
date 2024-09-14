import 'package:flashcards/features/home/manager/home_cubit/home_cubit.dart';
import 'package:flashcards/features/home/manager/home_cubit/home_state.dart';
import 'package:flashcards/features/home/ui/widgets/card_list_tile.dart';
import 'package:flashcards/features/home/ui/widgets/home_title.dart';
import 'package:flashcards/features/home/ui/widgets/my_floating_action_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_vert_rounded,
              )),
        ],
      ),
      floatingActionButton: const MyFloatingActionButton(),
      body: SafeArea(
          child: Column(
        children: [
          const HomeTitle(),
          BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              if (state is HomeFetchLoading) {
                return const CircularProgressIndicator();
              } else if (state is HomeFetchSuccess) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: state.homeDataList.length,
                    itemBuilder: (context, index) {
                      return CardListTile(homeModel: state.homeDataList[index]);
                    },
                  ),
                );
              } else {
                return const Center(
                  child: Text('There was an error'),
                );
              }
            },
          )
        ],
      )),
    );
  }
}
