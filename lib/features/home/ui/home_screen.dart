import 'package:flashcards/features/home/manager/sets_cubit.dart/sets_cubit.dart';
import 'package:flashcards/features/home/manager/sets_cubit.dart/sets_state.dart';
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
          BlocBuilder<SetsCubit, SetsState>(
            builder: (context, state) {
              if (state is SetsLoading) {
                return const CircularProgressIndicator();
              } else if (state is SetsSuccess) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: state.setsList.length,
                    itemBuilder: (context, index) {
                      return CardListTile(setModel: state.setsList[index]);
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
