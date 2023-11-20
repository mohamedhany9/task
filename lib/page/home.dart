
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/service_api/service_api.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  late double heaght , width;

  String token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzAwNTY5MTI5LCJpYXQiOjE3MDA0ODI3MjksImp0aSI6ImNjYzZmYzllZTI2YTRhYTVhZjNkMjZkNTMyYjE1OGUyIiwidXNlcl9pZCI6Mn0.BlyQ9q-L_TsC6s5AUCZD3IgqETaNwgZafrXzF2EsGvQ";

  startProvider() async{

    final doctorprovider = Provider.of<DoctorServiceApi>(context,listen: false);
     doctorprovider.getDoctordata(token);
  }
  @override
  void initState() {
    startProvider();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final doctorprovider = Provider.of<DoctorServiceApi>(context);
    heaght = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: heaght,
        width: width,
        child: doctorprovider.apiData == null ? const Center(child: CircularProgressIndicator()):ListView.builder(
            itemCount: doctorprovider.apiData!.count,
            itemBuilder: (context,index){
          return Text(doctorprovider.apiData!.results[index].doctor.user.name);
        }),
      ),
    );
  }
}
