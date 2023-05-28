import 'package:flutter/material.dart';
import 'package:game_list/home/widgets/all_games_widget/all_games_item.dart';
import 'package:game_list/models/result.dart';

class AllGamesSuccessWidget extends StatelessWidget {
  const AllGamesSuccessWidget({
    Key? key,
    required this.games,
  }) : super(key: key);

  final List<Result> games;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.only(
        top: 12.0,
      ),
      itemBuilder: (context, index) {
        return AllGamesItem(
          game: games[index],
        );
      },
      separatorBuilder: (_, __) => const SizedBox(
        height: 20.0,
      ),
      itemCount: games.length,
    );
  }
}
