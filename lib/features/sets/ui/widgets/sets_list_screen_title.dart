import 'package:flashcards/features/sets/manager/sets_cubit/sets_cubit.dart';
import 'package:flashcards/features/sets/manager/sets_cubit/sets_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SetsListScreenTitle extends StatelessWidget {
  const SetsListScreenTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: Align(
        alignment: Alignment.topLeft,
        child: BlocBuilder<SetsCubit, SetsState>(
          builder: (context, state) {
            return Text(
              context.read<SetsCubit>().folderModel.title,
              style: const TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
            );
          },
        ),
      ),
    );
  }
}
