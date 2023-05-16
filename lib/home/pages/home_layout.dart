import 'package:flutter/material.dart';
import 'package:game_list/home/widgets/category_widget/category_item.dart';
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
                SizedBox(height: 8),
                SizedBox(height: 8),
                Text('Games by category'),
                Text('all games'),
              ],
            ),
          ),
          Column(
            children: [
              const Text('Categories'),
              SizedBox(
                height: 200,
                child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    scrollDirection: Axis.horizontal,
                    itemCount: 6,
                    itemBuilder: (context, index) => Container(
                        margin: const EdgeInsets.only(right: 10),
                        child: const CategoryItem())),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
