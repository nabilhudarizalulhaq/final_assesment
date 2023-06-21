import 'package:final_assessment/bloc/final_assesment_bloc.dart';
import 'package:final_assessment/ui/final_assesment_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}



class MyApp extends StatelessWidget {
  final FinalAssesmentBloc bloc = FinalAssesmentBloc();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Final Assesment'),
          centerTitle: true,
          backgroundColor:  Colors.blue,
        ),
        body: FinalAssesmentView(bloc),
      ),
    );
  }
}
