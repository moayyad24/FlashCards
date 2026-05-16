import 'package:cardy/core/theme/app_text_styles.dart';
import 'package:cardy/features/cards/manager/cards_list_cubit/cards_list_cubit.dart';
import 'package:cardy/features/cards/manager/cards_list_cubit/cards_list_state.dart';
import 'package:cardy/features/cards/ui/widgets/card_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardListViewBody extends StatelessWidget {
  const CardListViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CardsListCubit, CardListState>(
      builder: (context, state) {
        if (state is CardListSuccess ||
            state is CardListSetEdited ||
            state is CardListSearchUpdated) {
          final cubit = context.read<CardsListCubit>();
          final visibleCards = cubit.visibleCardsList;
          return Expanded(
            child: visibleCards.isEmpty
                ? Center(
                    child: Text(
                      'No cards found',
                      style: AppTextStyles.medium16,
                    ),
                  )
                : ListView.builder(
                    itemCount: visibleCards.length,
                    itemBuilder: (context, index) {
                      return _AnimatedCardItem(
                        index: index,
                        child: CardListTile(
                          cardModel: visibleCards[index],
                        ),
                      );
                    },
                  ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

class _AnimatedCardItem extends StatefulWidget {
  final Widget child;
  final int index;

  const _AnimatedCardItem({required this.child, required this.index});

  @override
  State<_AnimatedCardItem> createState() => _AnimatedCardItemState();
}

class _AnimatedCardItemState extends State<_AnimatedCardItem>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _fadeAnimation;
  late final Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    // Each item animates with a small delay based on its index (staggered effect)
    final startDelay = Duration(milliseconds: widget.index * 50);
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.2),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    // Start animation after the delay
    Future.delayed(startDelay, () {
      if (mounted) {
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(
        position: _slideAnimation,
        child: widget.child,
      ),
    );
  }
}
