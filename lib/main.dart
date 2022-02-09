import 'package:flutter/material.dart';
import 'package:movie_app/screens/description.dart';
import 'package:movie_app/screens/home.dart';
import 'package:movie_app/screens/loading.dart';


//api key:892981dc2a11d0ca3f811c915cef56b4
//api read access token:eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4OTI5ODFkYzJhMTFkMGNhM2Y4MTFjOTE1Y2VmNTZiNCIsInN1YiI6IjYyMDBjNDM3ZTI3MjYwMDEwNDAwYjM2MiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.vNptZ8Wg9VnA5MAAjy-r1V7252Q0hGpLAdZF7qKKV_s

void main()
{
  runApp(MaterialApp(
                        debugShowCheckedModeBanner:false,
                        theme:ThemeData(brightness:Brightness.dark,primaryColor:Colors.redAccent)
                        ,
                        routes:{
                                  '/':(context)=>Home(),
                                  '/loading':(context)=>Loading(),
                                  '/description':(context)=>Description()
                              },
                    )
        );
}