import 'package:flutter/material.dart';
import '../utils/app_colors.dart';


class ProfessionalRequests extends StatefulWidget {

  const ProfessionalRequests({super.key});


  @override
  State<ProfessionalRequests> createState() =>
      _ProfessionalRequestsState();

}



class _ProfessionalRequestsState 
extends State<ProfessionalRequests> {


  final List<Map<String, dynamic>> requests = [

    {
      "name":"Anek Raj",
      "date":"15 July 2026",
      "time":"10:30 AM",
      "reason":"Consultation",
      "status": "Pending",
    },


    {
      "name":"Rahul",
      "date":"18 July 2026",
      "time":"2:00 PM",
      "reason":"Discussion",
      "status": "Pending",
    },


  ];



  @override
  Widget build(BuildContext context) {


    return Scaffold(


      appBar: AppBar(

        title:
        const Text(
          "Appointment Requests",
        ),

        backgroundColor:
        Colors.transparent,

        elevation:0,

        foregroundColor:
        AppColors.heading,

      ),




      body: Container(


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



        child: ListView.builder(


          padding:
          const EdgeInsets.all(15),


          itemCount:
          requests.length,


          itemBuilder:(context,index){


            final request =
            requests[index];



            return Card(


              color:
              Colors.white,


              shape:
              RoundedRectangleBorder(

                borderRadius:
                BorderRadius.circular(20),

              ),



              child:
              Padding(

                padding:
                const EdgeInsets.all(15),


                child:
                Column(

                  crossAxisAlignment:
                  CrossAxisAlignment.start,


                  children:[



                    Text(
  request["name"],
  style: TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppColors.heading,
    decoration: request["status"] == "Rejected"
        ? TextDecoration.lineThrough
        : TextDecoration.none,
  ),
),



                    const SizedBox(height:10),



Text(
  "Date: ${request["date"]}",
),

Text(
  "Time: ${request["time"]}",
),

Text(
  "Reason: ${request["reason"]}",
  style: TextStyle(
    decoration: request["status"] == "Rejected"
        ? TextDecoration.lineThrough
        : TextDecoration.none,
  ),
),

const SizedBox(height:8),

Text(
  "Status: ${request["status"]}",
  style: TextStyle(
    fontWeight: FontWeight.bold,
    color: request["status"] == "Accepted"
        ? Colors.green
        : request["status"] == "Rejected"
            ? Colors.red
            : Colors.orange,
  ),
),

const SizedBox(height:15),

                    const SizedBox(height:15),



                    request["status"] == "Pending"
    ? Row(
        children: [

          Expanded(
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  request["status"] = "Accepted";
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: const Text(
                "Accept",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),

          const SizedBox(width: 10),

          Expanded(
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  request["status"] = "Rejected";
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: const Text(
                "Reject",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),

        ],
      )
    : const SizedBox(),


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