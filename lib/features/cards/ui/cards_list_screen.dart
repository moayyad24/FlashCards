import 'package:cardy/core/helper/dependency_injection.dart';
import 'package:cardy/core/theme/colors.dart';
import 'package:cardy/features/cards/manager/cards_list_cubit/cards_list_cubit.dart';
import 'package:cardy/features/cards/manager/select_in_list_bloc/select_in_list_bloc.dart';
import 'package:cardy/features/cards/manager/select_in_list_bloc/select_in_list_event.dart';
import 'package:cardy/features/cards/ui/widgets/card_list_view_body.dart';
import 'package:cardy/features/cards/ui/widgets/cards_list_app_bar.dart';
import 'package:cardy/features/cards/ui/widgets/cards_list_floating_action_button.dart';
import 'package:cardy/features/cards/ui/widgets/search_bar.dart';
import 'package:cardy/features/sets/manager/sets_cubit/sets_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardsListScreen extends StatefulWidget {
  const CardsListScreen({super.key});

  @override
  State<CardsListScreen> createState() => _CardsListScreenState();
}

class _CardsListScreenState extends State<CardsListScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged(String value) {
    context.read<CardsListCubit>().updateSearchQuery(value);
    setState(() {});
  }

  void _clearSearch() {
    _searchController.clear();
    context.read<CardsListCubit>().clearSearch();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const CardsListsFloatingActionButton(),
      body: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, t) {
          var selectionController = context.read<SelectInListBloc>();
          if (didPop) {
            return;
          }
          if (selectionController.selectedCardIdsList.isNotEmpty) {
            selectionController.selectedCardIdsList.clear();
            selectionController.add(EndSelectingEvent());
          } else {
            getIt.isRegistered<SetsCubit>()
                ? getIt.unregister<SetsCubit>()
                : null;
            Navigator.of(context).pop();
          }
        },
        child: Column(
          children: [
            const CardsListAppBar(),
            CustomSearchBar(
              controller: _searchController,
              onChanged: _onSearchChanged,
              suffixIcon: _searchController.text.isEmpty
                  ? null
                  : IconButton(
                      onPressed: _clearSearch,
                      icon: const Icon(
                        Icons.close,
                        color: AppColors.greyLightE1E2EC,
                      ),
                    ),
            ),
            const CardListViewBody(),
          ],
        ),
      ),
    );
  }
}
