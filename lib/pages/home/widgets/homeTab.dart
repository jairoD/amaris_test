import 'package:amaris_test/controllers/seriesController.dart';
import 'package:amaris_test/utils/const.dart';
import 'package:amaris_test/widgets/AmarisButton.dart';
import 'package:amaris_test/widgets/rating.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final movieWatcher = context.watch<SeriesController>();
    final movieReader = context.read<SeriesController>();
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: amarisBlack,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Popular',
                      style: TextStyle(
                          color: amarisWhite,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: movieWatcher.populars.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: SizedBox(
                              height: 170,
                              width: 170,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                movieWatcher.populars[index]
                                                            .poster_path !=
                                                        null
                                                    ? 'http://image.tmdb.org/t/p/w185/${movieWatcher.populars[index].poster_path}'
                                                    : 'https://images-na.ssl-images-amazon.com/images/I/31yW7R1ccdL._AC_SY400_.jpg',
                                              ),
                                              fit: BoxFit.cover)),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    movieWatcher.populars[index].name,
                                    textAlign: TextAlign.start,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: amarisWhite),
                                    maxLines: 1,
                                  ),
                                  const SizedBox(height: 10),
                                  Rating(
                                    rating: movieWatcher
                                            .populars[index].vote_average /
                                        2,
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text('See All',
                          style: TextStyle(
                              color: amarisYellow,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                    )
                  ],
                )),
            const SizedBox(height: 10),
            Divider(color: amarisGrey, height: 2),
            const SizedBox(height: 10),
            Text(
              'Recommendations',
              style: TextStyle(
                  color: amarisWhite,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
                child: ListView.builder(
              itemCount: movieWatcher.recommendations.length,
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
                                          ? 'http://image.tmdb.org/t/p/w185/${movieWatcher.recommendations[index].poster_path}'
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
                                rating: movieWatcher
                                        .recommendations[index].vote_average /
                                    2,
                              ),
                              Text(
                                'IMDb: ${movieWatcher.recommendations[index].vote_average}',
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
                                      onPressed: movieWatcher.favorites
                                              .contains(movieWatcher
                                                  .recommendations[index])
                                          ? () => movieWatcher.removeFavorite(
                                              movieWatcher
                                                  .recommendations[index])
                                          : () => movieWatcher.addFavorite(
                                              movieWatcher
                                                  .recommendations[index]),
                                      icon: movieWatcher.favorites.contains(
                                              movieWatcher
                                                  .recommendations[index])
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
            ))
          ],
        ),
      ),
    );
  }
}
