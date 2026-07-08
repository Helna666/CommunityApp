import 'package:easyreach/providers/auth_providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'user_login.dart';

class UserRegister extends StatefulWidget {
  const UserRegister({super.key});

  @override
  State<UserRegister> createState() =>
      _UserRegisterState();
}

class _UserRegisterState
    extends State<UserRegister> {
  final nameController =
      TextEditingController();
  final emailController =
      TextEditingController();
  final phoneController =
      TextEditingController();
  final passwordController =
      TextEditingController();
  final usernameController = 
      TextEditingController();

  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xffD7EEFF),
              Color(0xffB8DFFF),
              Color(0xffC9D6FF),
            ],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(25),
            child: Column(
              children: [
                const SizedBox(height: 20),

                ClipRRect(
                  borderRadius:
                      BorderRadius.circular(40),
                  child: Image.asset(
                    "assets/images/reg.jpg",
                    height: 220,
                  ),
                ),

                const SizedBox(height: 30),

                const Text(
                  "Create Account",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight:
                        FontWeight.bold,
                    color: Color(0xff244D7B),
                  ),
                ),

                buildField(
                  usernameController,
                 "Username",
                  Icons.person_outline,
                ),
                const SizedBox(height: 35),

                buildField(
                  nameController,
                  "Full Name",
                  Icons.person,
                ),

                const SizedBox(height: 20),

                buildField(
                  emailController,
                  "Email",
                  Icons.email,
                ),

                const SizedBox(height: 20),

                buildField(
                  phoneController,
                  "Phone Number",
                  Icons.phone,
                ),

                const SizedBox(height: 20),

                TextField(
                  controller:
                      passwordController,
                  obscureText: obscure,
                  decoration:
                      InputDecoration(
                    hintText: "Password",
                    filled: true,
                    fillColor:
                        Colors.white,
                    prefixIcon:
                        const Icon(
                            Icons.lock),
                    border:
                        OutlineInputBorder(
                      borderRadius:
                          BorderRadius
                              .circular(
                                  20),
                    ),
                  ),
                ),

                const SizedBox(height: 35),

                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child:
                      ElevatedButton(
                  onPressed: () async {
  final authProvider = Provider.of<AuthProvider>(
    context,
    listen: false,
  );

  bool success = await authProvider.registerUser(
    fullName: nameController.text.trim(),
    username: usernameController.text.trim(),
    email: emailController.text.trim(),
    phone: phoneController.text.trim(),
    password: passwordController.text,
  );

  if (!mounted) return;

  if (success) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Registration Successful"),
      ),
    );

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => const UserLogin(),
      ),
    );
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          authProvider.errorMessage ?? "Registration Failed",
        ),
      ),
    );
  }
},
                    style:
                        ElevatedButton
                            .styleFrom(
                      backgroundColor:
                          const Color(
                              0xff7E8FFF),
                      shape:
                          RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius
                                .circular(
                                    20),
                      ),
                    ),
                    child: const Text(
                      "Register",
                      style:
                          TextStyle(
                        fontSize: 18,
                        color:
                            Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildField(
    TextEditingController controller,
    String hint,
    IconData icon,
  ) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: Colors.white,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(
          borderRadius:
              BorderRadius.circular(20),
        ),
      ),
    );
  }
}