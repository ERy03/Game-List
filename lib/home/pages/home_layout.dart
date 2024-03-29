import 'package:flutter/material.dart';
import 'package:game_list/home/widgets/all_games_widget/all_games_widget.dart';
import 'package:game_list/home/widgets/categorized_games_widget/categorized_games_widget.dart';
import 'package:game_list/home/widgets/category_widget/category_widget.dart';
import 'package:game_list/home/widgets/header.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          const Header(),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          Expanded(
              child: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: const Column(children: [
                CategoriesWidget(),
                CategorizedGamesWidget(),
                Flexible(child: AllGamesWidget())
              ]),
            ),
          )),
        ],
      ),
    );
  }
}
