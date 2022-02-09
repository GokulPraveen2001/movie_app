import 'package:flutter/material.dart';

class movies extends StatelessWidget
{
  List movies_list;

  movies({required this.movies_list});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment:CrossAxisAlignment.start,
        children: [SizedBox(height: 10.0)
          ,
          Container(height: 290,
            child: ListView.builder(
                scrollDirection: Axis.horizontal
                ,
                itemCount: movies_list.length,

                itemBuilder: (context, index) {
                  return Container(width: 150, padding: EdgeInsets.all(1.0),
                    child: FlatButton(onPressed: ()
                    {
                      Navigator.pushNamed(context,'/description',arguments:{'backdrop_path':'https://image.tmdb.org/t/p/w500'+(movies_list[index]['backdrop_path']??movies_list[index]['poster_path']),
                        'poster_path':'https://image.tmdb.org/t/p/w500'+movies_list[index]['poster_path'],
                        'rating':movies_list[index]['vote_average'].toString(),
                        'name':movies_list[index]['name']??movies_list[index]['original_title'],
                        'release_date':movies_list[index]['first_air_date']??movies_list[index]['release_date'],
                        'description':movies_list[index]['overview']
                      });
                    },
                      child: Column(children: [
                        Container(height: 200,
                            decoration: BoxDecoration(image: DecorationImage(
                                image: NetworkImage(
                                    'https://image.tmdb.org/t/p/w500' +
                                        movies_list[index]['poster_path']),
                                fit: BoxFit.cover)))
                        ,
                        SizedBox(height: 10.0),
                        Text(movies_list[index]['title'] ??
                            movies_list[index]['name'], style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.yellowAccent,
                            fontSize: 15.0))
                      ]

                      ),
                    ),
                  );
                }),
          )

        ]
    );
  }
}

