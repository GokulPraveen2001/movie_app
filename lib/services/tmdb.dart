import 'package:flutter/cupertino.dart';
import 'package:tmdb_api/tmdb_api.dart';

class tmdb
{
  String api_key;
  String api_read_access;

  tmdb({required this.api_key,required this.api_read_access});

  TMDB create_instance()
  {
    TMDB tmdb = TMDB(
                      ApiKeys(api_key, api_read_access),
                                    logConfig: ConfigLogger(
                                                              showLogs: true,//must be true than only all other logs will be shown
                                                              showErrorLogs: true,
                                                            ),
                                  );

    return tmdb;
  }

  Future<List> get_trending_movies() async
  {
    try
    {
      TMDB tmdb=create_instance();

      Map trending_movies=await tmdb.v3.trending.getTrending();
      return trending_movies['results'];
    }

    catch(e)
    {
      print("ERROR OCCURRED:$e");
      return [];
    }
  }

  Future<List> get_popular_movies() async
  {
    try
    {
      TMDB tmdb = create_instance();
      Map popular_movies=await tmdb.v3.movies.getPopular();
      return popular_movies['results'];
    }

    catch(e)
    {
      print("Error OCURRED$e");
      return [];
    }
  }

  Future<List> get_tv_shows() async
  {
    try
    {
      TMDB tmdb = create_instance();
      Map tv_shows=await tmdb.v3.tv.getTopRated();  //get top rated tv shows
      return tv_shows['results'];
    }

    catch(e)
    {
      print("Error OCURRED$e");
      return [];
    }
  }

}