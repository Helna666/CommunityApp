import 'package:flutter/material.dart';
import 'package:easyreach/screens/roleselection.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() =>
      _OnboardingScreenState();
}

class _OnboardingScreenState
    extends State<OnboardingScreen> {
  final PageController _controller = PageController();

  int currentPage = 0;

  final List<Map<String, String>> pages = [
    {
      "image": "assets/images/onb1.jpg",
      "title": "Find Trusted Professionals",
      "subtitle":
          "Connect with skilled professionals in your community quickly and easily."
    },
    {
      "image": "assets/images/ob2.jpg",
      "title": "Easy Communication",
      "subtitle":
          "Call and message professionals directly from the app."
    },
    {
      "image": "assets/images/o3.jpg",
      "title": "Build Your Community",
      "subtitle":
          "Discover services and strengthen local connections."
    },
  ];

  Widget bubble(
    double top,
    double left,
    double size,
    Color color,
  ) {
    return Positioned(
      top: top,
      left: left,
      child: Container(
        height: size,
        width: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color.withOpacity(0.18),
        ),
      ),
    );
  }

  void nextPage() {
    if (currentPage < 2) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) =>
              const RoleSelectionScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xffD7EEFF),
              Color(0xffB8DFFF),
              Color(0xffC9D6FF),
            ],
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              bubble(80, 30, 90, Colors.white),
              bubble(180, 300, 120, Colors.white),
              bubble(500, 40, 70, Colors.white),
              bubble(650, 280, 100, Colors.white),

              Column(
                children: [
                  if (currentPage != 2)
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 15,
                        right: 20,
                      ),
                      child: Align(
                        alignment:
                            Alignment.topRight,
                        child: TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (_) =>
                                    const RoleSelectionScreen(),
                              ),
                            );
                          },
                          child: const Text(
                            "Skip",
                            style: TextStyle(
                              color:
                                  Color(0xff244D7B),
                              fontSize: 16,
                              fontWeight:
                                  FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    )
                  else
                    const SizedBox(height: 55),

                  Expanded(
                    child: PageView.builder(
                      controller: _controller,
                      itemCount: pages.length,
                      onPageChanged: (index) {
                        setState(() {
                          currentPage = index;
                        });
                      },
                      itemBuilder:
                          (context, index) {
                        return Padding(
                          padding:
                              const EdgeInsets
                                  .symmetric(
                                      horizontal:
                                          30),
                          child:
                              SingleChildScrollView(
                            child: Column(
                              children: [
                                SizedBox(
                                  height:
                                      h * 0.05,
                                ),

                                ClipRRect(
                                  borderRadius:
                                      BorderRadius
                                          .circular(
                                              35),
                                  child:
                                      Image.asset(
                                    pages[index]
                                        ["image"]!,
                                    height:
                                        h * 0.30,
                                    width: double
                                        .infinity,
                                    fit: BoxFit
                                        .cover,
                                  ),
                                ),

                                SizedBox(
                                  height:
                                      h * 0.05,
                                ),

                                Text(
                                  pages[index]
                                      ["title"]!,
                                  textAlign:
                                      TextAlign
                                          .center,
                                  style:
                                      const TextStyle(
                                    fontSize:
                                        28,
                                    fontWeight:
                                        FontWeight
                                            .bold,
                                    color: Color(
                                        0xff244D7B),
                                  ),
                                ),

                                SizedBox(
                                  height:
                                      h * 0.02,
                                ),

                                Text(
                                  pages[index]
                                      ["subtitle"]!,
                                  textAlign:
                                      TextAlign
                                          .center,
                                  style:
                                      const TextStyle(
                                    fontSize:
                                        16,
                                    color: Color(
                                        0xff54718D),
                                    height:
                                        1.5,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.center,
                    children: List.generate(
                      pages.length,
                      (index) =>
                          AnimatedContainer(
                        duration:
                            const Duration(
                                milliseconds:
                                    300),
                        margin:
                            const EdgeInsets.all(
                                4),
                        height: 10,
                        width:
                            currentPage ==
                                    index
                                ? 28
                                : 10,
                        decoration:
                            BoxDecoration(
                          color:
                              currentPage ==
                                      index
                                  ? const Color(
                                      0xff7E8FFF)
                                  : Colors
                                      .white70,
                          borderRadius:
                              BorderRadius
                                  .circular(
                                      20),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 35),

                  Padding(
                    padding:
                        const EdgeInsets
                            .symmetric(
                                horizontal:
                                    30),
                    child: SizedBox(
                      width:
                          double.infinity,
                      height: 58,
                      child:
                          ElevatedButton(
                        onPressed:
                            nextPage,
                        style:
                            ElevatedButton
                                .styleFrom(
                          backgroundColor:
                              const Color(
                                  0xff7E8FFF),
                          elevation: 8,
                          shape:
                              RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius
                                    .circular(
                                        18),
                          ),
                        ),
                        child: Text(
                          currentPage == 2
                              ? "Get Started"
                              : "Next",
                          style:
                              const TextStyle(
                            fontSize: 18,
                            color:
                                Colors.white,
                            fontWeight:
                                FontWeight
                                    .bold,
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 35),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}