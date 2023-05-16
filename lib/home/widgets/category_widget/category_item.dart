import 'package:flutter/material.dart';
import 'package:game_list/models/genre.dart';

typedef CategoryCLicked = Function(Genre categorySelected);

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    Key? key,
    this.category,
    this.callback,
  }) : super(key: key);

  final Genre? category;
  final CategoryCLicked? callback;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // TODO
      onTap: () => debugPrint('category tapped'),
      child: Column(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeInOutCirc,
            padding: const EdgeInsets.symmetric(horizontal: 2.0),
            alignment: Alignment.center,
            height: 60.0,
            width: 60.0,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.amberAccent,
            ),
            child: const Icon(
              Icons.gamepad_outlined,
            ),
          ),
          const SizedBox(height: 4.0),
          // TODO
          const SizedBox(
            width: 60,
            child: Text(
              'game name',
              style: TextStyle(
                  fontSize: 10.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      ),
    );
  }
}
