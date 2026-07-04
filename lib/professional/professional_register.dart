import 'package:flutter/material.dart';
import 'professional_login.dart';

class ProfessionalRegister
    extends StatefulWidget {
  const ProfessionalRegister(
      {super.key});

  @override
  State<ProfessionalRegister>
      createState() =>
          _ProfessionalRegisterState();
}

class _ProfessionalRegisterState
    extends State<ProfessionalRegister> {
  final nameController =
      TextEditingController();
  final emailController =
      TextEditingController();
  final phoneController =
      TextEditingController();
  final passwordController =
      TextEditingController();
  final experienceController =
      TextEditingController();
  final addressController =
      TextEditingController();
  final aboutController =
      TextEditingController();

  bool obscure = true;

  String? selectedProfession;

  final List<String> professions = [
    'Electrician',
    'Plumber',
    'Carpenter',
    'Painter',
    'Mechanic',
    'Tutor',
    'Doctor',
    'Lawyer',
    'Beautician',
    'Photographer',
    'Designer',
    'Other',
  ];

  Widget field(
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
            padding:
                const EdgeInsets.all(25),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius:
                      BorderRadius.circular(
                          40),
                  child: Image.asset(
                    "assets/images/reg.jpg",
                    height: 220,
                  ),
                ),

                const SizedBox(height: 25),

                const Text(
                  "Create Professional Account",
                  textAlign:
                      TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight:
                        FontWeight.bold,
                    color: Color(
                        0xff244D7B),
                  ),
                ),

                const SizedBox(height: 30),

                field(
                  nameController,
                  "Full Name",
                  Icons.person,
                ),

                const SizedBox(height: 20),

                field(
                  emailController,
                  "Email",
                  Icons.email,
                ),

                const SizedBox(height: 20),

                field(
                  phoneController,
                  "Phone Number",
                  Icons.phone,
                ),

                const SizedBox(height: 20),

                DropdownButtonFormField<
                    String>(
                  value:
                      selectedProfession,
                  decoration:
                      InputDecoration(
                    hintText:
                        "Profession",
                    filled: true,
                    fillColor:
                        Colors.white,
                    prefixIcon:
                        const Icon(
                            Icons.work),
                    border:
                        OutlineInputBorder(
                      borderRadius:
                          BorderRadius
                              .circular(
                                  20),
                    ),
                  ),
                  items: professions
                      .map(
                        (e) =>
                            DropdownMenuItem(
                          value: e,
                          child:
                              Text(e),
                        ),
                      )
                      .toList(),
                  onChanged:
                      (value) {
                    setState(() {
                      selectedProfession =
                          value;
                    });
                  },
                ),

                const SizedBox(height: 20),

                field(
                  experienceController,
                  "Years of Experience",
                  Icons.star,
                ),

                const SizedBox(height: 20),

                field(
                  addressController,
                  "Address",
                  Icons.location_on,
                ),

                const SizedBox(height: 20),

                TextField(
                  controller:
                      aboutController,
                  maxLines: 3,
                  decoration:
                      InputDecoration(
                    hintText:
                        "About Yourself",
                    filled: true,
                    fillColor:
                        Colors.white,
                    prefixIcon:
                        const Icon(
                            Icons.info),
                    border:
                        OutlineInputBorder(
                      borderRadius:
                          BorderRadius
                              .circular(
                                  20),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                TextField(
                  controller:
                      passwordController,
                  obscureText:
                      obscure,
                  decoration:
                      InputDecoration(
                    hintText:
                        "Password",
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
                      onPressed:
                          () {
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
                  width:
                      double.infinity,
                  height: 55,
                  child:
                      ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              const ProfessionalLogin(),
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
                      "Register",
                      style:
                          TextStyle(
                        color:
                            Colors.white,
                        fontSize: 18,
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
}