import 'package:flutter/material.dart';
import 'package:game_list/home/widgets/header.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Header(),
              SizedBox(height: 8),
              Text('Categories'),
              SizedBox(height: 8),
              Text('Games by category'),
              Text('all games'),
            ],
          ),
        ),
      ),
    );
  }
}
