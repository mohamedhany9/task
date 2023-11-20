
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:task/model/doctor_data.dart';


Future<DoctorData> getdata(String token) async{
  DoctorData? result;

  String url = "https://dev.minaini.com:2053/r/appointments";

  Response response = await Dio().get(url,options: Options(
    headers: {
      "Authorization": "Bearer $token",
    },
  ));

  DoctorData data = DoctorData.fromJson(response.data);
  result = data;

  return result;
}

class DoctorServiceApi extends ChangeNotifier{
  DoctorData? apiData;

  getDoctordata(String token) async{
    apiData = await getdata(token);
    notifyListeners();
  }

}