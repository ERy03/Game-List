import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:game_list/models/result.dart';

class AllGamesItem extends StatelessWidget {
  const AllGamesItem({
    Key? key,
    required this.game,
  }) : super(key: key);

  final Result game;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.grey.withOpacity(.1),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 20.0,
            top: 15.0,
            bottom: 15.0,
            child: AllGamesItemImage(
              backgroundImage: game.backgroundImage ?? '',
            ),
          ),
          Positioned(
            top: 25.0,
            left: 100.0,
            child: SizedBox(
              width: MediaQuery.of(context).size.width * .5,
              child: Text(
                game.name ?? '',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14.0,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          Positioned(
            left: 100.0,
            top: 45.0,
            child: Text(
              game.genres?.first.name ?? '',
              style: const TextStyle(
                fontSize: 12.0,
              ),
            ),
          ),
          Positioned(
            top: 65.0,
            left: 100.0,
            child: AllGamesItemRating(
              rating: game.rating ?? 0.0,
            ),
          ),
          Positioned(
            right: 20.0,
            bottom: 10.0,
            child: AllGamesItemButton(
              callback: () {
                print('item name-->${game.name}');
              },
            ),
          ),
        ],
      ),
    );
  }
}

class AllGamesItemImage extends StatelessWidget {
  const AllGamesItemImage({
    Key? key,
    required this.backgroundImage,
  }) : super(key: key);
  final String backgroundImage;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: backgroundImage,
      imageBuilder: (context, imageProvider) => Container(
        width: 70,
        height: 70,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          image: DecorationImage(
            image: NetworkImage(
              backgroundImage,
            ),
            fit: BoxFit.cover,
          ),
        ),
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

class AllGamesItemButton extends StatelessWidget {
  const AllGamesItemButton({
    Key? key,
    required this.callback,
  }) : super(key: key);
  final VoidCallback callback;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        alignment: Alignment.center,
        width: 65.0,
        height: 30.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: Colors.amberAccent,
        ),
        child: const Text(
          'View more',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 9.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class AllGamesItemRating extends StatelessWidget {
  const AllGamesItemRating({
    Key? key,
    required this.rating,
  }) : super(key: key);
  final double rating;
  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: rating,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      ignoreGestures: true,
      itemCount: 5,
      itemSize: 16,
      unratedColor: Colors.black45,
      itemBuilder: (context, _) => const Icon(
        Icons.star,
        color: Colors.amber,
      ),
      onRatingUpdate: (rating) {},
    );
  }
}
