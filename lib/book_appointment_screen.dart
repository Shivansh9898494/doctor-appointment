import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'AppointmentBookDailog.dart';

class BookAppointmentScreen extends StatefulWidget {
  const BookAppointmentScreen({super.key});

  @override
  State<BookAppointmentScreen> createState() => _BookAppointmentScreenState();
}

class _BookAppointmentScreenState extends State<BookAppointmentScreen> {
  final int year = DateTime.now().year;
  int currentMonth = DateTime.now().month;
  int selectedDate = DateTime.now().day+1;
  String selectedTime = "10.00 AM";

  List<int> get dates {
    final daysInMonth = DateUtils.getDaysInMonth(year, currentMonth);
    return List.generate(daysInMonth, (index) => index + 1);
  }

  final List<String> times = [
    "09.00 AM",
    "09.30 AM",
    "10.00 AM",
    "10.30 AM",
    "11.00 AM",
    "11.30 AM",
    "03.00 PM",
    "03.30 PM",
    "04.00 PM",
    "04.30 PM",
    "05.00 PM",
    "05.30 PM",
  ];

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
        title: const Text(
          "Book Appointment",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Select Date",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            _calendarCard(),
            const SizedBox(height: 24),
            const Text(
              "Select Hour",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            _timeGrid(),
            const SizedBox(height: 80),
          ],
        ),
      ),
      bottomNavigationBar: _confirmButton(),
    );
  }

  // 🔹 Calendar Card
  Widget _calendarCard() {
    final monthName = DateFormat.MMMM().format(
      DateTime(year, currentMonth),
    );

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withOpacity(0.05),
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "$monthName $year",
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.chevron_left),
                    onPressed :
                      _previousMonth

                  ),
                  IconButton(
                    icon: const Icon(Icons.chevron_right),
                    onPressed: _nextMonth,
                  ),
                ],
              )
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              "Sun",
              "Mon",
              "Tue",
              "Wed",
              "Thu",
              "Fri",
              "Sat",
            ]
                .map(
                  (e) => Text(e, style: TextStyle(color: Colors.grey)),
            )
                .toList(),
          ),
          const SizedBox(height: 12),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: dates.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
            ),
            itemBuilder: (_, index) {
              final day = dates[index];
              final isSelected = selectedDate == day;

              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedDate = day;
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: isSelected
                        ? const Color(0xff1C2A3A)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    "$day",
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.black,
                      fontWeight:
                      isSelected ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  // 🔹 Month Controls
  void _previousMonth() {
    setState(() {

      if (currentMonth > DateTime.now().month) {
        currentMonth--;
        selectedDate = DateTime.now().day;
      }

    });
  }

  void _nextMonth() {
    setState(() {
      if (currentMonth < 12) {
        currentMonth++;
        selectedDate = 1;
      }
    });
  }

  // 🔹 Time Grid
  Widget _timeGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: times.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 2.4,
      ),
      itemBuilder: (_, index) {
        final time = times[index];
        final isSelected = selectedTime == time;

        return GestureDetector(
          onTap: () {
            setState(() {
              selectedTime = time;
            });
          },
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: isSelected
                  ? const Color(0xff1C2A3A)
                  : Colors.grey.shade100,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              time,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontWeight:
                isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ),
        );
      },
    );
  }

  // 🔹 Confirm Button
  Widget _confirmButton() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xff1C2A3A),
          minimumSize: const Size(double.infinity, 52),
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        ),
        onPressed: () {
          final monthName = DateFormat.MMMM().format(
            DateTime(year, currentMonth),
          );
          showDialog(
            context: context,
            builder: (context) => Appointmentbookdailog(name: "",month: monthName,date: selectedDate.toString(),year: year.toString() , time: selectedTime,),
          );
          /*
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                "Appointment booked on $selectedDate $monthName $year at $selectedTime",
              ),
            ),
          );
          Navigator.pop(context);
          */
        },
        child: const Text("Confirm" , style: TextStyle(color: Colors.white),),
      ),
    );
  }
}
