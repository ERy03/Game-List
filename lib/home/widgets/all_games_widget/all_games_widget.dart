import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_list/home/widgets/all_games_widget/all_games_success_widget.dart';
import 'package:game_list/home/widgets/all_games_widget/bloc/all_games_bloc.dart';
import 'package:game_list/home/widgets/common/error_game_widget.dart';

class AllGamesWidget extends StatelessWidget {
  const AllGamesWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16.0,
        right: 16.0,
        top: 16.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            'All Games',
            textAlign: TextAlign.start,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          Flexible(
            child: BlocBuilder<AllGamesBloc, AllGamesState>(
              builder: (context, state) {
                return state.status.isSuccess
                    ? AllGamesSuccessWidget(
                        games: state.games.results,
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
          ),
        ],
      ),
    );
  }
}
