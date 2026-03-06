
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Models/AppointmentModel.dart';

class AppointmentCard extends StatelessWidget {
  final AppointmentModel appointment;

  const AppointmentCard({super.key, required this.appointment});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.18),
            blurRadius: 10,
            spreadRadius: 1,
            offset: const Offset(0, 4),
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// Date + Time
          Text(
            "${appointment.month} ${appointment.date}, ${appointment.year} - ${appointment.time}",
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),

          const SizedBox(height: 10),

          Divider(color: Colors.grey.shade300),

          const SizedBox(height: 12),

          Row(
            children: [

              /// Doctor Image
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  appointment.doctor?.image ?? "assets/images/doctor.png",
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
                )
              ),

              const SizedBox(width: 14),

              /// Doctor Info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text(
                      appointment.doctor?.name ?? "",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    const SizedBox(height: 4),

                    Text(
                      appointment.doctor?.specialization ?? "",
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 13,
                      ),
                    ),

                    const SizedBox(height: 6),

                    Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          size: 16,
                          color: Colors.grey.shade600,
                        ),

                        const SizedBox(width: 4),

                        Expanded(
                          child: Text(
                            appointment.doctor?.hospital ?? "",
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 13,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}