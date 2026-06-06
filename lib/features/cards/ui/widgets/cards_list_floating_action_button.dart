import 'package:cardy/core/cubits/ads_cubit/ads_cubit.dart';
import 'package:cardy/core/helper/routes.dart';
import 'package:cardy/core/theme/colors.dart';
import 'package:cardy/core/widgets/app_snack_bar.dart';
import 'package:cardy/features/cards/manager/cards_list_cubit/cards_list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardsListsFloatingActionButton extends StatelessWidget {
  const CardsListsFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(
          height: 50.w,
          width: 50.w,
          child: FloatingActionButton(
            onPressed: () {
              Navigator.of(context)
                  .pushNamed(Routes.addNewCardScreen, arguments: {
                'setId': BlocProvider.of<CardsListCubit>(context).setModel.id,
                'cardListCubit': BlocProvider.of<CardsListCubit>(context)
              });
            },
            heroTag: 'first',
            backgroundColor: AppColors.greyLightE1E2EC,
            child: Icon(
              Icons.add_rounded,
              size: 20.w,
            ),
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 60.w,
          width: 60.w,
          child: FloatingActionButton(
            onPressed: () async {
              CardsListCubit c = context.read<CardsListCubit>();
              await c.filterCardsBySettings();
              if (context.mounted && c.filteredCardsList.isNotEmpty) {
                context.read<AdsCubit>().loadInterstitialAd();
                Navigator.of(context).pushNamed(
                  Routes.cardsTestScreen,
                  arguments: context.read<CardsListCubit>(),
                );
              } else {
                if (context.mounted) {
                  AppSnackBar.showInfo(context,
                      message: 'Create one card at least to start a test');
                }
              }
            },
            heroTag: 'second',
            child: Icon(
              Icons.play_arrow_rounded,
              color: AppColors.grey282B36,
              size: 22.w,
            ),
          ),
        ),
      ],
    );
  }
}
