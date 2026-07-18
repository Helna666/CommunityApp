import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class CustomDrawer extends StatelessWidget {
  final String name;
  final String email;
  final String role;

  final VoidCallback onLogout;

  // Handles drawer item clicks
  final Function(String) onItemTap;


  const CustomDrawer({
    super.key,
    required this.name,
    required this.email,
    required this.role,
    required this.onLogout,
    required this.onItemTap,
  });


  @override
  Widget build(BuildContext context) {

    return Drawer(

      child: Container(

        color: AppColors.background1,

        child: Column(

          children: [

            UserAccountsDrawerHeader(

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


              currentAccountPicture: const CircleAvatar(

                backgroundColor: Colors.white,

                child: Icon(

                  Icons.person,

                  size: 40,

                  color: AppColors.primary,

                ),

              ),


              accountName: Text(

                name,

                style: const TextStyle(

                  color: AppColors.heading,

                  fontWeight: FontWeight.bold,

                ),

              ),


              accountEmail: Text(

                email,

                style: const TextStyle(

                  color: Colors.black54,

                ),

              ),

            ),



            // USER DRAWER
            if(role == "User") ...[


              drawerItem(

                context,

                Icons.calendar_month,

                "Appointments",

              ),


              drawerItem(

                context,

                Icons.favorite,

                "Favorites",

              ),


              drawerItem(

                context,

                Icons.settings,

                "Settings",

              ),


              drawerItem(

                context,

                Icons.info,

                "About",

              ),


              drawerItem(

                context,

                Icons.help,

                "Help & Support",

              ),


              drawerItem(

                context,

                Icons.privacy_tip,

                "Privacy Policy",

              ),


            ]



            // PROFESSIONAL DRAWER
            else ...[


              drawerItem(

                context,

                Icons.today,

                "Today's Appointments",

              ),


              drawerItem(

                context,

                Icons.calendar_month,

                "Upcoming Appointments",

              ),


              drawerItem(

                context,

                Icons.check_circle,

                "Accepted Appointments",

              ),


              drawerItem(

                context,

                Icons.cancel,

                "Rejected Appointments",

              ),


              drawerItem(

                context,

                Icons.done_all,

                "Completed Appointments",

              ),


              drawerItem(

                context,

                Icons.settings,

                "Settings",

              ),


              drawerItem(

                context,

                Icons.info,

                "About",

              ),

            ],



            const Spacer(),



            ListTile(

              leading: const Icon(

                Icons.logout,

                color: Colors.red,

              ),


              title: const Text(

                "Logout",

              ),


              onTap: (){

                Navigator.pop(context);

                onLogout();

              },

            ),



            const SizedBox(height:20),

          ],

        ),

      ),

    );

  }



  Widget drawerItem(

      BuildContext context,

      IconData icon,

      String title,

      ){

    return ListTile(

      leading: Icon(

        icon,

        color: AppColors.primary,

      ),


      title: Text(

        title,

        style: const TextStyle(

          fontWeight: FontWeight.w500,

        ),

      ),


      onTap: (){

        Navigator.pop(context);

        onItemTap(title);

      },

    );

  }

}