import 'package:flashcards/features/sets/manager/sets_cubit/sets_cubit.dart';
import 'package:flashcards/features/sets/manager/sets_cubit/sets_state.dart';
import 'package:flashcards/features/sets/ui/widgets/sets_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardsListView extends StatelessWidget {
  const CardsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SetsCubit, SetsState>(
      builder: (context, state) {
        if (state is SetsSuccess) {
          return Expanded(
              child: ListView.builder(
                  itemCount: state.setsList.length,
                  itemBuilder: (context, index) {
                    return SetsListTile(
                      setModel: state.setsList[index],
                    );
                  }));
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
