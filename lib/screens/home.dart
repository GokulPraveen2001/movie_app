import 'dart:async';
import 'package:flutter/material.dart';
import 'package:movie_app/services/tmdb.dart';
import 'package:movie_app/screens/loading.dart';
import 'package:movie_app/custom_layouts/movies.dart';
import 'package:movie_app/custom_layouts/tv_shows.dart';

class Home extends StatefulWidget
{
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<Home>
{
  List trending_movies=[];
  List popular_movies=[];
  List tv_shows=[];
  bool loading=false;

  Future<void> get_movies() async
  {
    tmdb tmdb_data=tmdb(api_key:'892981dc2a11d0ca3f811c915cef56b4',api_read_access:'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4OTI5ODFkYzJhMTFkMGNhM2Y4MTFjOTE1Y2VmNTZiNCIsInN1YiI6IjYyMDBjNDM3ZTI3MjYwMDEwNDAwYjM2MiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.vNptZ8Wg9VnA5MAAjy-r1V7252Q0hGpLAdZF7qKKV_s');
    trending_movies=await tmdb_data.get_trending_movies();
    popular_movies=await tmdb_data.get_popular_movies();
    tv_shows=await tmdb_data.get_tv_shows();

    print(popular_movies);

    setState(()
              {
                loading=true;
              }
            );

  }

  @override
  void initState()
  {
    get_movies();
    super.initState();
  }

  @override
  Widget build(BuildContext context)
  {
    return loading==false?Loading():Scaffold(
                backgroundColor:Colors.black87,
                appBar:AppBar(title:Text("MOVIE APP",style:TextStyle(color:Colors.red[500],fontWeight:FontWeight.bold)),centerTitle:true,backgroundColor:Colors.transparent)
                ,
                  body:SingleChildScrollView(scrollDirection:Axis.vertical,
                       child: Column(crossAxisAlignment:CrossAxisAlignment.start,
                            children:[SizedBox(height: 20.0)
                                      ,
                                      Text("TV SHOWS", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.lightGreenAccent, fontSize: 20.0))
                                      ,
                                      tv(tv_shows:tv_shows)
                                      ,
                                      SizedBox(height: 15.0)
                                      ,
                                      Text("POPULAR MOVIES", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.lightGreenAccent, fontSize: 20.0))
                                      ,
                                     movies(movies_list:popular_movies,)
                                      ,
                                      SizedBox(height: 15.0)
                                      ,
                                      Text("TRENDING MOVIES", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.lightGreenAccent, fontSize: 20.0))
                                      ,
                                      movies(movies_list:trending_movies)
                                     ]
                        ),
                  )

    );
  }
}
