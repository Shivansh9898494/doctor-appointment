import 'DoctorModel.dart';

class AppointmentModel {
  String? Uname;
  String? Dname;
  String? month;
  String? year;
  String? date;
  String? time;
  Doctor? doctor;

  AppointmentModel({this.Uname,this.Dname, this.month, this.year, this.date, this.time, this.doctor});

  factory AppointmentModel.fromMap(Map<String, dynamic> data) {
    return AppointmentModel(
      Uname: data['Uname'],
      Dname: data['Dname'],
      month: data['month'],
      year: data['year'],
      date: data['date'],
      time: data['time'],
      doctor: data['doctor'] != null
          ? Doctor.fromJson(data['doctor'])
          : null,
    );
  }

}