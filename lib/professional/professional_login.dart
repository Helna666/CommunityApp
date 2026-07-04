import 'package:flutter/material.dart';
import 'professional_home.dart';
import 'professional_register.dart';

class ProfessionalLogin extends StatefulWidget {
  const ProfessionalLogin({super.key});

  @override
  State<ProfessionalLogin> createState() =>
      _ProfessionalLoginState();
}

class _ProfessionalLoginState
    extends State<ProfessionalLogin> {
  final emailController = TextEditingController();
  final passwordController =
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
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(25),
            child: Column(
              children: [
                const SizedBox(height: 40),

                ClipRRect(
                  borderRadius:
                      BorderRadius.circular(40),
                  child: Image.asset(
                    "assets/images/pp1.jpg",
                    height: 220,
                  ),
                ),

                const SizedBox(height: 35),

                const Text(
                  "Professional Login",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight:
                        FontWeight.bold,
                    color: Color(0xff244D7B),
                  ),
                ),

                const SizedBox(height: 35),

                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: "Email",
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon:
                        const Icon(Icons.email),
                    border:
                        OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(
                              20),
                    ),
                  ),
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
                    suffixIcon:
                        IconButton(
                      icon: Icon(
                        obscure
                            ? Icons
                                .visibility_off
                            : Icons
                                .visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          obscure =
                              !obscure;
                        });
                      },
                    ),
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
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              const ProfessionalHome(),
                        ),
                      );
                    },
                    style:
                        ElevatedButton
                            .styleFrom(
                      backgroundColor:
                          const Color(
                              0xff7E8FFF),
                    ),
                    child: const Text(
                      "Login",
                      style:
                          TextStyle(
                        color:
                            Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 25),

                Row(
                  mainAxisAlignment:
                      MainAxisAlignment
                          .center,
                  children: [
                    const Text(
                        "Don't have an account?"),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                const ProfessionalRegister(),
                          ),
                        );
                      },
                      child:
                          const Text(
                        "Register",
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}