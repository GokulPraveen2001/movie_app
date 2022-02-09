import 'package:flutter/material.dart';

class tv extends StatelessWidget
{
  List tv_shows;

  tv({required this.tv_shows});

  @override
  Widget build(BuildContext context)
  {
    return Column(
      children: [SizedBox(height: 10.0)
        ,
        Container
          (
            height:200,

                child:ListView.builder(scrollDirection:Axis.horizontal,
                                        itemCount:tv_shows.length,
                                        itemBuilder:(context,index)
                                        {
                                          return
                                                  tv_shows[index]['name']==null?Container():InkWell(onTap:()
                                                            {
                                                              Navigator.pushNamed(context,'/description',arguments:{'backdrop_path':'https://image.tmdb.org/t/p/w500'+(tv_shows[index]['backdrop_path']??tv_shows[index]['poster_path']),
                                                              'poster_path':'https://image.tmdb.org/t/p/w500'+tv_shows[index]['poster_path'],
                                                               'rating':tv_shows[index]['vote_average'].toString(),
                                                               'name':tv_shows[index]['name']??tv_shows[index]['original_title'],
                                                              'release_date':tv_shows[index]['first_air_date']??tv_shows[index]['release_date'],
                                                               'description':tv_shows[index]['overview']
                                                              });
                                                            }
                                                            ,
                                              child: Container(
                                                        width:250,
                                                          padding:EdgeInsets.all(5.0),
                                                          child:Column(
                                                            children: [
                                                              Container(
                                                                        height:140,
                                                                        decoration:BoxDecoration(borderRadius:BorderRadius.circular(20.0),image:DecorationImage(image:NetworkImage('https://image.tmdb.org/t/p/w500'+(tv_shows[index]['backdrop_path']??tv_shows[index]['poster_path'])),fit:BoxFit.cover))

                                                                       ),
                                                              SizedBox(height:10.0),
                                                              Text(tv_shows[index]['name']??tv_shows[index]['original_name'],style: TextStyle(
                                                                  fontWeight: FontWeight.bold,
                                                                  color: Colors.yellowAccent,
                                                                  fontSize: 15.0))
                                                            ],
                                                          )
                                                      ),
                                            );
                                        }
                                      ),
          ),
      ],
    );
  }
}
