import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import 'appointment_status_list.dart';


class Appointments extends StatelessWidget {

  const Appointments({super.key});


  final List<Map<String,dynamic>> statuses = const [

    {
      "title":"Pending",
      "icon":Icons.pending,
    },

    {
      "title":"Approved",
      "icon":Icons.check_circle,
    },

    {
      "title":"Rejected",
      "icon":Icons.cancel,
    },

    {
      "title":"Cancelled",
      "icon":Icons.close,
    },

    {
      "title":"Completed",
      "icon":Icons.done_all,
    },

  ];



  @override
  Widget build(BuildContext context) {


    return Scaffold(


      appBar: AppBar(

        title:
        const Text(
          "My Appointments",
        ),

        backgroundColor:
        Colors.transparent,

        elevation:0,

        foregroundColor:
        AppColors.heading,

      ),



      body:Container(


        decoration:
        const BoxDecoration(

          gradient:
          LinearGradient(

            colors:[

              AppColors.background1,

              AppColors.background3,

            ],

          ),

        ),



        child:GridView.builder(


          padding:
          const EdgeInsets.all(20),


          itemCount:
          statuses.length,


          gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(

            crossAxisCount:2,

            crossAxisSpacing:15,

            mainAxisSpacing:15,

          ),



          itemBuilder:(context,index){


            final item=statuses[index];



            return InkWell(


              onTap:(){


                Navigator.push(

                  context,

                  MaterialPageRoute(

                    builder:(_)=>

                    AppointmentStatusList(

                      status:item["title"],

                    ),

                  ),

                );


              },



              child:Container(


                decoration:
                BoxDecoration(

                  color:
                  Colors.white,

                  borderRadius:
                  BorderRadius.circular(25),

                ),



                child:Column(

                  mainAxisAlignment:
                  MainAxisAlignment.center,


                  children:[



                    Icon(

                      item["icon"],

                      size:40,

                      color:
                      AppColors.primary,

                    ),



                    const SizedBox(height:15),



                    Text(

                      item["title"],

                      style:
                      const TextStyle(

                        fontWeight:
                        FontWeight.bold,

                        color:
                        AppColors.heading,

                      ),

                    )


                  ],

                ),

              ),

            );


          },

        ),

      ),

    );

  }

}