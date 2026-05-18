import 'package:cardy/features/home/ui/widgets/set_card.dart';
import 'package:cardy/features/sets/manager/sets_cubit/sets_cubit.dart';
import 'package:cardy/features/sets/manager/sets_cubit/sets_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SetsListView extends StatelessWidget {
  const SetsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SetsCubit, SetsState>(
      builder: (context, state) {
        if (state is SetsSuccess || state is SetsFolderEdited) {
          return Expanded(
            child: ListView.separated(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 12).r,
              itemCount: context.read<SetsCubit>().setsList.length,
              itemBuilder: (context, index) {
                return SetCard(
                  setModel: context.read<SetsCubit>().setsList[index],
                );
              },
              separatorBuilder: (context, index) => const SizedBox(
                height: 14,
              ),
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
