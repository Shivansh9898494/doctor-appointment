import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Notification",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
            /*const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xff1E2A3A),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                "1 New",
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),*/
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            _sectionHeader("TODAY"),
            _notificationItem(
              bgColor: const Color(0xffE9F8EF),
              iconColor: const Color(0xff2ECC71),
              title: "Appointment Success",
              desc:
              "You have successfully booked your appointment with Dr. Emily Walker.",
              time: "1h",
            ),
            _notificationItem(
              bgColor: const Color(0xffFDECEC),
              iconColor: const Color(0xffE74C3C),
              title: "Appointment Cancelled",
              desc:
              "You have successfully cancelled your appointment with Dr. David Patel.",
              time: "2h",
            ),
            _notificationItem(
              bgColor: const Color(0xffF1F4F8),
              iconColor: const Color(0xff4A90E2),
              title: "Scheduled Changed",
              desc:
              "You have successfully changes your appointment with Dr. Jesica Turner.",
              time: "8h",
            ),

            const SizedBox(height: 24),

            _sectionHeader("YESTERDAY"),
            _notificationItem(
              bgColor: const Color(0xffE9F8EF),
              iconColor: const Color(0xff2ECC71),
              title: "Appointment success",
              desc:
              "You have successfully booked your appointment with Dr. David Patel.",
              time: "1d",
            ),
          ],
        ),
      ),
    );
  }

  // 🔹 Section Header
  Widget _sectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.w600,
              fontSize: 13,
            ),
          ),
          /*const Text(
            "Mark all as read",
            style: TextStyle(
              color: Color(0xff1E2A3A),
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),*/
        ],
      ),
    );
  }

  // 🔹 Notification Tile
  Widget _notificationItem({
    required Color bgColor,
    required Color iconColor,
    required String title,
    required String desc,
    required String time,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 48,
            width: 48,
            decoration: BoxDecoration(
              color: bgColor,
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.calendar_month, color: iconColor),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Text(
                      time,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  desc,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
