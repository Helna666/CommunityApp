import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class ProfessionalCard extends StatefulWidget {

  final String name;
  final String profession;
  final String experience;
  final String rating;

  final VoidCallback onCall;
  final VoidCallback onMessage;
  final VoidCallback onAppointment;
  final VoidCallback onFavorite;


  const ProfessionalCard({

    super.key,

    required this.name,
    required this.profession,
    required this.experience,
    required this.rating,

    required this.onCall,
    required this.onMessage,
    required this.onAppointment,
    required this.onFavorite,

  });



  @override
  State<ProfessionalCard> createState() =>
      _ProfessionalCardState();

}



class _ProfessionalCardState extends State<ProfessionalCard> {


  bool isFavorite = false;



  @override
  Widget build(BuildContext context) {


    return Container(

      margin:
      const EdgeInsets.symmetric(
        horizontal:15,
        vertical:8,
      ),


      padding:
      const EdgeInsets.all(15),


      decoration:
      BoxDecoration(

        color:Colors.white,

        borderRadius:
        BorderRadius.circular(20),

      ),



      child:Column(

        children:[


          Row(

            children:[


              CircleAvatar(

                radius:35,

                backgroundColor:
                AppColors.background1,

                child:
                const Icon(

                  Icons.person,

                  size:40,

                  color:
                  AppColors.primary,

                ),

              ),



              const SizedBox(width:15),



              Expanded(

                child:Column(

                  crossAxisAlignment:
                  CrossAxisAlignment.start,

                  children:[


                    Text(

                      widget.name,

                      style:
                      const TextStyle(

                        fontSize:18,

                        fontWeight:
                        FontWeight.bold,

                        color:
                        AppColors.heading,

                      ),

                    ),



                    Text(
                      widget.profession,
                    ),



                    Text(
                      widget.experience,
                    ),



                    Row(

                      children:[

                        const Icon(

                          Icons.star,

                          size:18,

                          color:
                          Colors.amber,

                        ),

                        Text(
                          widget.rating,
                        )

                      ],

                    )


                  ],

                ),

              ),




              IconButton(

                onPressed:(){


                  setState((){

                    isFavorite =
                    !isFavorite;


                  });


                },


                icon:

               IconButton(

  onPressed: (){

    setState((){

      isFavorite = !isFavorite;

    });


    widget.onFavorite();

  },


  icon: Icon(

    isFavorite
        ? Icons.favorite
        : Icons.favorite_border,

    color: isFavorite
        ? Colors.red
        : Colors.grey,

  ),

),

              )


            ],

          ),




          Row(

            mainAxisAlignment:
            MainAxisAlignment.spaceEvenly,


            children:[


              IconButton(

                onPressed:
                widget.onCall,

                icon:
                const Icon(
                  Icons.call,
                  color:Colors.green,
                ),

              ),



              IconButton(

                onPressed:
                widget.onMessage,

                icon:
                const Icon(
                  Icons.chat,
                  color:AppColors.primary,
                ),

              ),



              IconButton(

                onPressed:
                widget.onAppointment,

                icon:
                const Icon(
                  Icons.calendar_month,
                  color:Colors.orange,
                ),

              ),


            ],

          )


        ],

      ),

    );


  }

}