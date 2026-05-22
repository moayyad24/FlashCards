import 'package:cardy/core/helper/routes.dart';
import 'package:cardy/core/theme/app_text_styles.dart';
import 'package:cardy/core/theme/colors.dart';
import 'package:cardy/features/home/manager/home_cubit/home_cubit.dart';
import 'package:cardy/features/home/manager/home_cubit/home_state.dart';
import 'package:cardy/features/home/ui/widgets/folder_card_list.dart';
import 'package:cardy/features/home/ui/widgets/home_app_bar.dart';
import 'package:cardy/features/home/ui/widgets/list_title.dart';
import 'package:cardy/core/widgets/my_floating_action_button.dart';
import 'package:cardy/features/home/ui/widgets/sets_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(),
      floatingActionButton: MyFloatingActionButton(onTap: () {
        Navigator.pushNamed(context, Routes.addFolderSetScreen);
      }),
      body: SafeArea(
          child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20).r,
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is HomeFetchLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is HomeFetchSuccess) {
              if (state.homeData.folders.isEmpty &&
                  state.homeData.sets.isEmpty) {
                return Container(
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                      color: AppColors.grey1D2127,
                      borderRadius: BorderRadius.all(Radius.circular(16))),
                  child: Column(children: [
                    Image.asset(
                      'assets/images/app_logo.png',
                      width: 130,
                      height: 130,
                    ),
                    10.verticalSpace,
                    Text(
                      'Start your learning journey!',
                      style: AppTextStyles.bold26,
                      textAlign: TextAlign.center,
                    ),
                    10.verticalSpace,
                    Text(
                      'Looks like you don\'t have any flashcards yet. Create your first folder or set to begin!',
                      style: AppTextStyles.medium16
                          .copyWith(color: AppColors.greyC2C6D6),
                      textAlign: TextAlign.center,
                    ),
                  ]),
                );
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTitle(
                    title: 'Folders',
                    icon: Icons.folder_open_rounded,
                    onViewAllPressed: () {},
                  ),
                  FolderCardList(folders: state.homeData.folders),
                  20.verticalSpace,
                  ListTitle(
                    title: 'Individual Sets',
                    icon: Icons.table_rows_outlined,
                    onViewAllPressed: () {},
                  ),
                  SetsList(
                    sets: state.homeData.sets,
                  )
                ],
              );
            } else {
              return const Center(
                child: Text('There was an error'),
              );
            }
          },
        ),
      )),
    );
  }
}
