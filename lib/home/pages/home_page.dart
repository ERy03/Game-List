import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_list/home/pages/home_layout.dart';
import 'package:game_list/home/widgets/all_games_widget/bloc/all_games_bloc.dart';
import 'package:game_list/home/widgets/category_widget/bloc/category_bloc.dart';
import 'package:game_list/repository/game_repository.dart';
import 'package:game_list/repository/implementation/game_implementation.dart';
import 'package:game_list/service/game_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: RepositoryProvider<GameRepository>(
          create: (context) => GameImplementation(
                GameServiceImpl(dio: Dio()),
              ),
          child: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) =>
                    CategoryBloc(gameRepository: context.read<GameRepository>())
                      ..add(GetCategories()),
              ),
              BlocProvider(
                create: (context) =>
                    AllGamesBloc(gameRepository: context.read<GameRepository>())
                      ..add(GetGames()),
              ),
            ],
            child: const HomeLayout(),
          )),
    );
  }
}
