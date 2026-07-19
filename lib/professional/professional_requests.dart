import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import 'professional_home.dart';

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
      "name": "Anek Raj",
      "date": "15 July 2026",
      "time": "10:30 AM",
      "reason": "Consultation",
      "status": "Pending",
    },
    {
      "name": "Rahul",
      "date": "18 July 2026",
      "time": "2:00 PM",
      "reason": "Discussion",
      "status": "Pending",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          child: Stack(
            children: [
              Positioned(
                top: 50,
                left: 20,
                child: _bubble(
                  90,
                  Colors.white,
                ),
              ),

              Positioned(
                top: 160,
                right: 15,
                child: _bubble(
                  120,
                  Colors.white,
                ),
              ),

              Positioned(
                bottom: 100,
                left: 15,
                child: _bubble(
                  75,
                  Colors.white,
                ),
              ),

              Column(
                children: [
                  AppBar(
                    leading: IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                const ProfessionalHome(),
                          ),
                        );
                      },
                    ),
                    title: const Text(
                      "Appointment Requests",
                    ),
                    centerTitle: true,
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    foregroundColor: AppColors.heading,
                    titleTextStyle: const TextStyle(
                      color: AppColors.heading,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 10,
                      ),
                      itemCount: requests.length,
                      itemBuilder: (context, index) {
                        final request = requests[index];

                        final status = request["status"];

                        final isRejected =
                            status == "Rejected";

                        final isAccepted =
                            status == "Accepted";

                        return Container(
                          margin: const EdgeInsets.only(
                            bottom: 18,
                          ),
                          padding: const EdgeInsets.all(18),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(
                              0.68,
                            ),
                            borderRadius:
                                BorderRadius.circular(25),
                            border: Border.all(
                              color: Colors.white70,
                              width: 1.5,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.blue.withOpacity(
                                  0.10,
                                ),
                                blurRadius: 18,
                                spreadRadius: 2,
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: 25,
                                    backgroundColor:
                                        Colors.white,
                                    child: Text(
                                      request["name"][0],
                                      style:
                                          const TextStyle(
                                        color:
                                            AppColors.primary,
                                        fontSize: 20,
                                        fontWeight:
                                            FontWeight.bold,
                                      ),
                                    ),
                                  ),

                                  const SizedBox(width: 12),

                                  Expanded(
                                    child: Text(
                                      request["name"],
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight:
                                            FontWeight.bold,
                                        color:
                                            AppColors.heading,
                                        decoration: isRejected
                                            ? TextDecoration
                                                .lineThrough
                                            : TextDecoration
                                                .none,
                                      ),
                                    ),
                                  ),

                                  _statusBadge(
                                    status,
                                  ),
                                ],
                              ),

                              const SizedBox(height: 18),

                              _infoRow(
                                Icons.calendar_today,
                                request["date"],
                              ),

                              const SizedBox(height: 10),

                              _infoRow(
                                Icons.access_time,
                                request["time"],
                              ),

                              const SizedBox(height: 10),

                              _infoRow(
                                Icons.notes,
                                request["reason"],
                                isRejected: isRejected,
                              ),

                              if (status == "Pending") ...[
                                const SizedBox(height: 20),

                                Row(
                                  children: [
                                    Expanded(
                                      child:
                                          ElevatedButton.icon(
                                        onPressed: () {
                                          setState(() {
                                            request["status"] =
                                                "Accepted";
                                          });
                                        },
                                        icon: const Icon(
                                          Icons.check,
                                          color: Colors.white,
                                        ),
                                        label: const Text(
                                          "Accept",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight:
                                                FontWeight.bold,
                                          ),
                                        ),
                                        style: ElevatedButton
                                            .styleFrom(
                                          backgroundColor:
                                              Colors.green,
                                          elevation: 0,
                                          padding:
                                              const EdgeInsets
                                                  .symmetric(
                                            vertical: 13,
                                          ),
                                          shape:
                                              RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius
                                                    .circular(
                                              15,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),

                                    const SizedBox(width: 12),

                                    Expanded(
                                      child:
                                          ElevatedButton.icon(
                                        onPressed: () {
                                          setState(() {
                                            request["status"] =
                                                "Rejected";
                                          });
                                        },
                                        icon: const Icon(
                                          Icons.close,
                                          color: Colors.white,
                                        ),
                                        label: const Text(
                                          "Reject",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight:
                                                FontWeight.bold,
                                          ),
                                        ),
                                        style: ElevatedButton
                                            .styleFrom(
                                          backgroundColor:
                                              Colors.redAccent,
                                          elevation: 0,
                                          padding:
                                              const EdgeInsets
                                                  .symmetric(
                                            vertical: 13,
                                          ),
                                          shape:
                                              RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius
                                                    .circular(
                                              15,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],

                              if (isAccepted ||
                                  isRejected) ...[
                                const SizedBox(height: 15),

                                Container(
                                  width: double.infinity,
                                  padding:
                                      const EdgeInsets.symmetric(
                                    vertical: 10,
                                  ),
                                  decoration: BoxDecoration(
                                    color: isAccepted
                                        ? Colors.green
                                            .withOpacity(0.12)
                                        : Colors.red.withOpacity(
                                            0.12,
                                          ),
                                    borderRadius:
                                        BorderRadius.circular(
                                      14,
                                    ),
                                  ),
                                  child: Text(
                                    isAccepted
                                        ? "Appointment Accepted"
                                        : "Appointment Rejected",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: isAccepted
                                          ? Colors.green
                                          : Colors.red,
                                      fontWeight:
                                          FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _bubble(
    double size,
    Color color,
  ) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color.withOpacity(0.18),
      ),
    );
  }

  Widget _infoRow(
    IconData icon,
    String text, {
    bool isRejected = false,
  }) {
    return Row(
      children: [
        Icon(
          icon,
          size: 19,
          color: AppColors.primary,
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              color: AppColors.text,
              decoration: isRejected
                  ? TextDecoration.lineThrough
                  : TextDecoration.none,
            ),
          ),
        ),
      ],
    );
  }

  Widget _statusBadge(String status) {
    Color backgroundColor;
    Color textColor;

    if (status == "Accepted") {
      backgroundColor = Colors.green.withOpacity(0.15);
      textColor = Colors.green;
    } else if (status == "Rejected") {
      backgroundColor = Colors.red.withOpacity(0.15);
      textColor = Colors.red;
    } else {
      backgroundColor = Colors.orange.withOpacity(0.18);
      textColor = Colors.orange.shade800;
    }

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 6,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        status,
        style: TextStyle(
          color: textColor,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}