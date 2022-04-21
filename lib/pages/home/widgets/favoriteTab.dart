import 'package:amaris_test/controllers/seriesController.dart';
import 'package:amaris_test/utils/const.dart';
import 'package:amaris_test/widgets/AmarisButton.dart';
import 'package:amaris_test/widgets/rating.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Favoritepage extends StatelessWidget {
  const Favoritepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final movieWatcher = context.watch<SeriesController>();
    final movieReader = context.read<SeriesController>();
    return Container(
      width: MediaQuery.of(context).size.width,
      color: amarisBlack,
      height: MediaQuery.of(context).size.height,
      child: Padding(
          padding: const EdgeInsets.all(12),
          child: ListView.builder(
            itemCount: movieWatcher.favorites.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: SizedBox(
                  height: 200,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.35,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  image: NetworkImage(
                                    movieWatcher.recommendations[index]
                                                .poster_path !=
                                            null
                                        ? 'http://image.tmdb.org/t/p/w185/${movieWatcher.favorites[index].poster_path}'
                                        : 'https://images-na.ssl-images-amazon.com/images/I/31yW7R1ccdL._AC_SY400_.jpg',
                                  ),
                                  fit: BoxFit.cover)),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              movieWatcher.recommendations[index].name,
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: amarisWhite),
                              maxLines: 1,
                            ),
                            Rating(
                              rating:
                                  movieWatcher.favorites[index].vote_average /
                                      2,
                            ),
                            Text(
                              'IMDb: ${movieWatcher.favorites[index].vote_average}',
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: amarisGrey),
                              maxLines: 1,
                            ),
                            Row(
                              children: [
                                AmarisButton(
                                    backgroundColor: amarisYellow,
                                    fontColor: amarisBlack,
                                    text: 'Watch Now',
                                    function: () => {},
                                    disabled: false),
                                IconButton(
                                    onPressed: movieWatcher.favorites.contains(
                                            movieWatcher.favorites[index])
                                        ? () => movieWatcher.removeFavorite(
                                            movieWatcher.favorites[index])
                                        : () => movieWatcher.addFavorite(
                                            movieWatcher.favorites[index]),
                                    icon: movieWatcher.favorites.contains(
                                            movieWatcher.favorites[index])
                                        ? Icon(
                                            Icons.favorite,
                                            color: amarisYellow,
                                          )
                                        : Icon(
                                            Icons.favorite_border,
                                            color: amarisGrey,
                                          ))
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          )),
    );
  }
}
