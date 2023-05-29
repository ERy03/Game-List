import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_list/home/widgets/categorized_games_widget/bloc/categorized_games_bloc.dart';
import 'package:game_list/home/widgets/categorized_games_widget/categorized_games_success_widget.dart';
import 'package:game_list/home/widgets/common/error_game_widget.dart';

class CategorizedGamesWidget extends StatelessWidget {
  const CategorizedGamesWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: BlocBuilder<CategorizedGamesBloc, CategorizedGamesState>(
        builder: (context, state) {
          return state.status.isSuccess
              ? CategorizedGamesSuccessWidget(
                  categoryName: state.categoryName,
                  games: state.games,
                )
              : state.status.isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : state.status.isError
                      ? const ErrorGameWidget()
                      : const SizedBox();
        },
      ),
    );
  }
}
