import 'package:flashcards/core/helper/routes.dart';
import 'package:flashcards/core/models/collection_model.dart';

import 'package:flashcards/core/theme/colors.dart';
import 'package:flashcards/features/cards/manager/cards_list_cubit/cards_list_cubit.dart';
import 'package:flashcards/features/cards/manager/cards_list_cubit/cards_list_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DefaultAppBar extends StatelessWidget {
  const DefaultAppBar({super.key, required CollectionModel collectionModel});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: BlocBuilder<CardListCubit, CardListState>(
        builder: (context, state) {
          return Text(
            context.read<CardListCubit>().setModel.title,
            style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w500),
          );
        },
      ),
      actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
        PopupMenuButton<String>(
          color: AppColors.grey,
          itemBuilder: (BuildContext context) {
            return [
              PopupMenuItem<String>(
                onTap: () {
                  Navigator.of(context)
                      .pushNamed(Routes.editSetScreen, arguments: {
                    'setModel': context.read<CardListCubit>().setModel,
                    'cardListCubit': BlocProvider.of<CardListCubit>(context),
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
    );
  }
}
