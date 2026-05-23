import 'package:cardy/core/cubits/ads_cubit/ads_cubit.dart';
import 'package:cardy/core/cubits/ads_cubit/ads_state.dart';
import 'package:cardy/core/helper/routes.dart';
import 'package:cardy/features/home/manager/home_cubit/home_cubit.dart';
import 'package:cardy/features/home/manager/home_cubit/home_state.dart';
import 'package:cardy/features/home/ui/widgets/empty_placeholder.dart';
import 'package:cardy/features/home/ui/widgets/folder_card_list.dart';
import 'package:cardy/features/home/ui/widgets/home_app_bar.dart';
import 'package:cardy/core/widgets/my_floating_action_button.dart';
import 'package:cardy/features/home/ui/widgets/sets_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<AdsCubit>().createBannerAd();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(),
      floatingActionButton: MyFloatingActionButton(onTap: () {
        Navigator.pushNamed(context, Routes.addFolderSetScreen);
      }),
      bottomNavigationBar: BlocBuilder<AdsCubit, AdsState>(
        builder: (context, state) {
          if (state.isBannerSuccess &&
              context.read<AdsCubit>().banner != null) {
            return SafeArea(
              child: SizedBox(
                width: context.read<AdsCubit>().banner!.size.width.toDouble(),
                height: context.read<AdsCubit>().banner!.size.height.toDouble(),
                child: AdWidget(ad: context.read<AdsCubit>().banner!),
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
      body: SafeArea(
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is HomeFetchLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is HomeFetchSuccess) {
              if (state.homeData.folders.isEmpty &&
                  state.homeData.sets.isEmpty) {
                return const EmptyPlaceholder();
              }
              return SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20).r,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (state.homeData.folders.isNotEmpty) ...[
                      FolderCardList(folders: state.homeData.folders),
                      20.verticalSpace,
                    ],
                    if (state.homeData.sets.isNotEmpty)
                      SetsList(sets: state.homeData.sets),
                  ],
                ),
              );
            } else {
              return const Center(
                child: Text('There was an error'),
              );
            }
          },
        ),
      ),
    );
  }
}
