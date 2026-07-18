import 'package:flutter/material.dart';
import '../utils/app_colors.dart';



class AppointmentStatusList extends StatelessWidget {


  final String status;


  const AppointmentStatusList({

    super.key,

    required this.status,

  });



  @override
  Widget build(BuildContext context) {


    return Scaffold(


      appBar:AppBar(

        title:Text(status),

        backgroundColor:
        Colors.transparent,

        foregroundColor:
        AppColors.heading,

        elevation:0,

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



        child:Center(


          child:Text(

            "No $status appointments",

            style:
            const TextStyle(

              fontSize:18,

              color:
              AppColors.heading,

            ),

          ),

        ),

      ),

    );


  }


}