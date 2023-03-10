import 'package:flutter/material.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('Header Title'),
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
