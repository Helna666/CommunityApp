import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';


class ProfessionalAppointmentCategory extends StatelessWidget {

  final String title;

  const ProfessionalAppointmentCategory({

    super.key,

    required this.title,

  });



  final List<Map<String, String>> appointments = const [

    {
      "name": "Anavadhya",
      "date": "15 July 2026",
      "time": "10:30 AM",
      "reason": "Consultation",
    },

    {
      "name": "Rahul",
      "date": "18 July 2026",
      "time": "2:00 PM",
      "reason": "Follow up",
    },

  ];



  @override
  Widget build(BuildContext context) {


    return Scaffold(


      appBar: AppBar(

        title: Text(title),

        backgroundColor: Colors.transparent,

        elevation: 0,

        foregroundColor: AppColors.heading,

      ),



      body: Container(

        decoration: const BoxDecoration(

          gradient: LinearGradient(

            colors: [

              AppColors.background1,

              AppColors.background3,

            ],

            begin: Alignment.topLeft,

            end: Alignment.bottomRight,

          ),

        ),



        child: ListView.builder(


          padding: const EdgeInsets.all(15),


          itemCount: appointments.length,


          itemBuilder: (context, index) {


            final appointment =
            appointments[index];


            return Card(


              color: Colors.white,


              margin:
              const EdgeInsets.only(bottom: 15),



              shape:
              RoundedRectangleBorder(

                borderRadius:
                BorderRadius.circular(20),

              ),



              child: Padding(

                padding:
                const EdgeInsets.all(16),


                child: Column(


                  crossAxisAlignment:
                  CrossAxisAlignment.start,


                  children: [


                    Text(

                      appointment["name"]!,

                      style:
                      const TextStyle(

                        fontSize: 18,

                        fontWeight:
                        FontWeight.bold,

                        color:
                        AppColors.heading,

                      ),

                    ),


                    const SizedBox(height: 10),


                    Text(
                      "Date: ${appointment["date"]}",
                    ),


                    Text(
                      "Time: ${appointment["time"]}",
                    ),


                    Text(
                      "Reason: ${appointment["reason"]}",
                    ),


                    const SizedBox(height: 10),


                    Container(

                      padding:
                      const EdgeInsets.symmetric(

                        horizontal: 12,

                        vertical: 6,

                      ),


                      decoration:
                      BoxDecoration(

                        color:
                        AppColors.background2,

                        borderRadius:
                        BorderRadius.circular(20),

                      ),


                      child: Text(

                        title,

                        style:
                        const TextStyle(

                          fontWeight:
                          FontWeight.bold,

                        ),

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