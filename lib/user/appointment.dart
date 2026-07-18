import 'package:flutter/material.dart';
import '../utils/app_colors.dart';


class AppointmentPage extends StatefulWidget {

  final String professionalName;
  final String profession;


  const AppointmentPage({

    super.key,

    required this.professionalName,

    required this.profession,

  });


  @override
  State<AppointmentPage> createState() =>
      _AppointmentPageState();

}



class _AppointmentPageState extends State<AppointmentPage> {


  DateTime? selectedDate;

  TimeOfDay? selectedTime;


  final reasonController =
      TextEditingController();


  final notesController =
      TextEditingController();



  Future<void> pickDate() async {


    DateTime? date = await showDatePicker(

      context: context,

      firstDate: DateTime.now(),

      lastDate:
      DateTime.now().add(
        const Duration(days:365),
      ),

      initialDate: DateTime.now(),

    );


    if(date != null){

      setState((){

        selectedDate=date;

      });

    }

  }




  Future<void> pickTime() async {


    TimeOfDay? time =
    await showTimePicker(

      context: context,

      initialTime:
      TimeOfDay.now(),

    );


    if(time != null){

      setState((){

        selectedTime=time;

      });

    }

  }




  @override
  Widget build(BuildContext context) {


    return Scaffold(


      appBar:AppBar(

        title:
        const Text(
          "Book Appointment",
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



        child:SingleChildScrollView(


          padding:
          const EdgeInsets.all(20),



          child:Column(


            children:[



              Card(


                shape:
                RoundedRectangleBorder(

                  borderRadius:
                  BorderRadius.circular(20),

                ),



                child:ListTile(


                  leading:
                  const CircleAvatar(

                    child:
                    Icon(Icons.person),

                  ),



                  title:Text(

                    widget.professionalName,

                    style:
                    const TextStyle(

                      fontWeight:
                      FontWeight.bold,

                      color:
                      AppColors.heading,

                    ),

                  ),



                  subtitle:
                  Text(

                    widget.profession,

                  ),

                ),

              ),



              const SizedBox(height:20),




              buildButton(

                icon:Icons.calendar_month,

                text:selectedDate == null

                ? "Select Date"

                : "${selectedDate!.day}/"
                "${selectedDate!.month}/"
                "${selectedDate!.year}",


                onTap:pickDate,

              ),





              const SizedBox(height:15),





              buildButton(

                icon:Icons.access_time,

                text:selectedTime == null

                ? "Select Time"

                : selectedTime!.format(context),


                onTap:pickTime,

              ),





              const SizedBox(height:20),





              TextField(


                controller:
                reasonController,


                decoration:
                inputDecoration(
                  "Reason",
                ),


              ),



              const SizedBox(height:15),





              TextField(


                controller:
                notesController,


                maxLines:4,


                decoration:
                inputDecoration(
                  "Additional Notes",
                ),


              ),





              const SizedBox(height:30),





              SizedBox(


                width:double.infinity,


                height:55,


                child:ElevatedButton(


                  onPressed:(){


                    ScaffoldMessenger.of(context)
                        .showSnackBar(

                      const SnackBar(

                        content:
                        Text(
                          "Appointment Request Sent",
                        ),

                      ),

                    );


                  },



                  style:
                  ElevatedButton.styleFrom(

                    backgroundColor:
                    AppColors.primary,

                    shape:
                    RoundedRectangleBorder(

                      borderRadius:
                      BorderRadius.circular(20),

                    ),

                  ),



                  child:
                  const Text(

                    "Send Request",

                    style:
                    TextStyle(

                      color:
                      Colors.white,

                      fontSize:18,

                    ),

                  ),

                ),

              )



            ],

          ),

        ),

      ),

    );


  }





  Widget buildButton({

    required IconData icon,

    required String text,

    required VoidCallback onTap,

  }){


    return InkWell(


      onTap:onTap,


      child:Container(


        width:double.infinity,


        padding:
        const EdgeInsets.all(18),


        decoration:
        BoxDecoration(

          color:
          Colors.white,

          borderRadius:
          BorderRadius.circular(20),

        ),



        child:Row(

          children:[


            Icon(

              icon,

              color:
              AppColors.primary,

            ),


            const SizedBox(width:15),


            Text(text),


          ],

        ),

      ),

    );


  }





  InputDecoration inputDecoration(String hint){


    return InputDecoration(

      hintText:hint,

      filled:true,

      fillColor:
      Colors.white,


      border:
      OutlineInputBorder(

        borderRadius:
        BorderRadius.circular(20),

        borderSide:
        BorderSide.none,

      ),

    );


  }


}