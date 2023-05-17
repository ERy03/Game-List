import 'package:flutter/material.dart';
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
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Header(),
                SizedBox(height: 40),
                CategoriesWidget(),
                Text('Games by category'),
                Text('all games'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
