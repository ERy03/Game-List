import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:game_list/models/result.dart';

class CategorizedGamesSuccessWidget extends StatelessWidget {
  const CategorizedGamesSuccessWidget({
    Key? key,
    required this.categoryName,
    required this.games,
  }) : super(key: key);

  final String categoryName;
  final List<Result> games;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            bottom: 16.0,
          ),
          child: Text(
            categoryName,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.2,
          child: ListView.separated(
            padding: const EdgeInsets.only(
              right: 16.0,
            ),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return GameByCategoryImage(
                name: games[index].name ?? 'No data',
                backgroundImage: games[index].backgroundImage ?? '',
              );
            },
            separatorBuilder: (_, __) => const SizedBox(
              width: 25.0,
            ),
            itemCount: games.length,
          ),
        ),
      ],
    );
  }
}

class GameByCategoryImage extends StatelessWidget {
  const GameByCategoryImage({
    Key? key,
    required this.name,
    required this.backgroundImage,
  }) : super(key: key);

  final String name;
  final String backgroundImage;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: backgroundImage,
      imageBuilder: (context, imageProvider) => Stack(
        children: [
          Container(
            width: 270.0,
            height: 150.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                20.0,
              ),
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
                colorFilter: const ColorFilter.mode(
                  Colors.black45,
                  BlendMode.darken,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 18.0,
            child: GameByCategoryTitle(
              name: name,
            ),
          ),
        ],
      ),
      placeholder: (context, url) => const Center(
        child: CircularProgressIndicator(),
      ),
      errorWidget: (context, url, error) => const Icon(
        Icons.error,
        color: Colors.deepOrangeAccent,
      ),
    );
  }
}

class GameByCategoryTitle extends StatelessWidget {
  const GameByCategoryTitle({
    Key? key,
    required this.name,
  }) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 8.0,
        right: 8.0,
      ),
      alignment: Alignment.centerLeft,
      height: 50.0,
      width: 270.0,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
        ),
        color: Colors.grey.withOpacity(0.5),
      ),
      child: Text(
        name,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
