import 'package:flutter/material.dart';

class Description extends StatelessWidget 
{

  @override
  Widget build(BuildContext context)
  {
    Map details=ModalRoute.of(context)!.settings.arguments as Map;

    return Scaffold(backgroundColor:Colors.black87,
                    body: Column(crossAxisAlignment:CrossAxisAlignment.start,
                                  children: [
                                              SafeArea(child:Stack
                                                                  (
                                                                    children:[Positioned(child:Container(width:MediaQuery.of(context).size.width,
                                                                                                        height:(MediaQuery.of(context).size.height)/3.0,
                                                                                                        decoration:BoxDecoration(image:DecorationImage(image:NetworkImage(details['backdrop_path']),fit:BoxFit.cover))
                                                                                                        )
                                                                                        )

                                                                              ,
                                                                              Positioned(bottom:10.0,child:Container(margin:EdgeInsets.only(left:5.0),padding:EdgeInsets.all(3.0),child:Text("Rating:"+(details['rating']??''),style:TextStyle(color:Colors.greenAccent,fontWeight:FontWeight.bold,fontSize:20.0))))
                                                                            ]


                                                                )
                                                       ),
                                                SizedBox(height:30.0),
                                                Container(margin:EdgeInsets.only(left:5.0),child: Text(details['name']??'',style:TextStyle(color:Colors.red,fontWeight:FontWeight.bold,fontSize:24.0))),
                                                SizedBox(height:10.0),
                                                Container(margin:EdgeInsets.only(left:5.0),child: Text("Release Date:${details['release_date']??''}",style:TextStyle(color:Colors.pink,fontWeight:FontWeight.bold,fontSize:14.0))),
                                                SizedBox(height:20.0),
                                                Row(crossAxisAlignment:CrossAxisAlignment.center,
                                                    children: [
                                                              Container(height:200,width:150,padding:EdgeInsets.all(10.0),decoration:BoxDecoration(borderRadius:BorderRadius.circular(5.0),image:DecorationImage(image:NetworkImage(details['poster_path']),fit:BoxFit.cover)))
                                                              ,
                                                              SizedBox(width:10.0)
                                                              ,
                                                             Flexible(child:Container(height:(MediaQuery.of(context).size.height)/2.5,padding:EdgeInsets.all(7.0),child:SingleChildScrollView(scrollDirection:Axis.vertical,child: Text(details['description']??'',style:TextStyle(color:Colors.white,fontWeight:FontWeight.bold,fontSize:20.0)))))
                                                              ],
                                                  )
                                           ],
                              ),
                  );
  }
}
