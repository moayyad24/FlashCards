import 'package:cardy/core/helper/routes.dart';
import 'package:cardy/core/theme/app_text_styles.dart';
import 'package:cardy/core/theme/colors.dart';
import 'package:cardy/core/models/card_model.dart';
import 'package:cardy/features/cards/manager/cards_list_cubit/cards_list_cubit.dart';
import 'package:cardy/features/cards/manager/select_in_list_bloc/select_in_list_bloc.dart';
import 'package:cardy/features/cards/manager/select_in_list_bloc/select_in_list_event.dart';
import 'package:cardy/features/cards/manager/select_in_list_bloc/select_in_list_state.dart';
import 'package:cardy/features/cards/ui/widgets/check_box_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardListTile extends StatelessWidget {
  const CardListTile({
    super.key,
    required this.cardModel,
  });

  final CardModel cardModel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectInListBloc, SelectInListState>(
      builder: (context, state) {
        final selectBloc = context.read<SelectInListBloc>();
        final isSelected =
            selectBloc.selectedCardIdsList.contains(cardModel.id);
        final isSelecting = state is StartSelectingState &&
            selectBloc.selectedCardIdsList.isNotEmpty;

        return Padding(
          padding: const EdgeInsets.only(left: 12.0, right: 12.0, bottom: 12.0),
          child: Container(
            decoration: BoxDecoration(
                color: isSelected
                    ? AppColors.blueADC6FF.withAlpha(60)
                    : AppColors.grey1D2127,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.border424754)),
            child: InkWell(
              onLongPress: () {
                selectBloc.add(AddToSelectedListEvent(cards: cardModel.id!));
              },
              onTap: () {
                if (isSelecting) {
                  selectBloc.add(AddToSelectedListEvent(cards: cardModel.id!));
                } else {
                  Navigator.of(context).pushNamed(
                    Routes.editCardScreen,
                    arguments: {
                      'cardModel': cardModel,
                      'cardListCubit': BlocProvider.of<CardsListCubit>(context),
                    },
                  );
                }
              },
              borderRadius: BorderRadius.circular(16),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 12.0, vertical: 14.0),
                child: Row(
                  children: [
                    // Leading icon with subtle background
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: AppColors.blueADC6FF.withAlpha(40),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.article_outlined,
                        size: 22,
                        color: AppColors.blueADC6FF,
                      ),
                    ),
                    const SizedBox(width: 16),
                    // Question & answer column
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            cardModel.question,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyles.medium16,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            cardModel.answer,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyles.medium15,
                          ),
                        ],
                      ),
                    ),
                    // Checkbox (selection indicator)
                    CheckboxWidget(cardModel: cardModel),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
