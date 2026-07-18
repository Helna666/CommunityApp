import 'package:easyreach/user/appointment.dart';
import 'package:flutter/material.dart';
import '../widgets/custom_drawer.dart';
import '../widgets/custom_bottom_nav.dart';
import '../widgets/category_chip.dart';
import '../widgets/professional_card.dart';
import 'favorites.dart';
import '../utils/app_colors.dart';
import '../utils/call_helper.dart';
import 'chat.dart';



class Userhome extends StatefulWidget {

  const Userhome({super.key});


  @override
  State<Userhome> createState() => _UserhomeState();

}



class _UserhomeState extends State<Userhome> {


  int currentIndex = 0;


  String selectedCategory = "All";


  final searchController = TextEditingController();



  final List<String> categories = [

    "All",
    "Doctor",
    "Lawyer",
    "Teacher",
    "Electrician",
    "Mechanic",
    "Trainer",
    "Designer",

  ];



  final List<Map<String,String>> professionals = [


    {

      "name":"Dr. Arun",

      "profession":"Doctor",

      "experience":"5 years",

      "rating":"4.8",

    },


    {

      "name":"John Mathew",

      "profession":"Lawyer",

      "experience":"8 years",

      "rating":"4.7",

    },


    {

      "name":"Akansha Choudhary",

      "profession":"Teacher",

      "experience":"6 years",

      "rating":"4.9",

    },


  ];





  @override
  Widget build(BuildContext context) {


    return Scaffold(


      drawer: CustomDrawer(

        name: "User",

        email: "user@gmail.com",

        role: "User",


        onLogout: (){


        },


        onItemTap: (title){


          // Drawer navigation will be added later


        },

      ),




      body: Container(


        decoration: const BoxDecoration(


          gradient: LinearGradient(


            colors: [

              AppColors.background1,

              AppColors.background2,

              AppColors.background3,

            ],


            begin: Alignment.topLeft,

            end: Alignment.bottomRight,


          ),


        ),



        child: SafeArea(



          child: Column(


            children: [



              AppBar(

                backgroundColor: Colors.transparent,

                elevation:0,

                title: const Text(

                  "Find Professionals",

                  style: TextStyle(

                    color: AppColors.heading,

                    fontWeight: FontWeight.bold,

                  ),

                ),


                iconTheme: const IconThemeData(

                  color: AppColors.heading,

                ),

              ),





              Padding(

                padding: const EdgeInsets.all(15),


                child: TextField(


                  controller: searchController,


                  decoration: InputDecoration(


                    hintText:"Search professionals...",


                    prefixIcon: const Icon(Icons.search),


                    filled:true,


                    fillColor:Colors.white,


                    border:OutlineInputBorder(


                      borderRadius:BorderRadius.circular(20),


                      borderSide:BorderSide.none,


                    ),

                  ),

                ),

              ),





              SizedBox(


                height:50,


                child:ListView.builder(


                  scrollDirection:Axis.horizontal,


                  padding:
                  const EdgeInsets.symmetric(horizontal:15),


                  itemCount:categories.length,


                  itemBuilder:(context,index){


                    return CategoryChip(


                      title:categories[index],


                      selected:
                      selectedCategory==categories[index],


                      onTap:(){


                        setState((){


                          selectedCategory =
                          categories[index];


                        });


                      },


                    );


                  },


                ),

              ),






              const SizedBox(height:10),






              Expanded(


                child: ListView.builder(


                  itemCount:professionals.length,


                  itemBuilder:(context,index){


                    final pro =
                    professionals[index];



                    if(selectedCategory!="All" &&

                        pro["profession"] != selectedCategory){


                      return const SizedBox();


                    }





                    return ProfessionalCard(

  name: pro["name"]!,
  profession: pro["profession"]!,
  experience: pro["experience"]!,
  rating: pro["rating"]!,


  onCall: (){

    CallHelper.makeCall(
    "********",
    );
  },


  onMessage: (){

    Navigator.push(

    context,
MaterialPageRoute(
  builder: (_) => ChatPage(
    chatId: pro["id"]!,
    name: pro["name"]!,
    profession: pro["profession"]!,
  ),
),

  );


  },


  onAppointment: (){

    
  Navigator.push(

    context,

    MaterialPageRoute(

      builder: (_) => AppointmentPage(

        professionalName: pro["name"]!,

        profession: pro["profession"]!,

      ),

    ),

  );

  },


  onFavorite: (){


    Navigator.push(

      context,

      MaterialPageRoute(

        builder: (_) => const Favorites(),

      ),

    );


  },

);


                  },

                ),


              ),


            ],


          ),


        ),

      ),





      bottomNavigationBar: CustomBottomNav(


        currentIndex:currentIndex,


        onTap:(index){


          setState((){


            currentIndex=index;


          });


        },


        items: const [


          BottomNavigationBarItem(

            icon:Icon(Icons.home),

            label:"Home",

          ),



          BottomNavigationBarItem(

            icon:Icon(Icons.chat),

            label:"Messages",

          ),



          BottomNavigationBarItem(

            icon:Icon(Icons.person),

            label:"Profile",

          ),


        ],

      ),


    );

  }

}