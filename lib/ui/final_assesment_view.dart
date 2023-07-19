import 'package:final_assessment/bloc/final_assesment_bloc.dart';
import 'package:final_assessment/bloc/final_assesment_event.dart';
import 'package:final_assessment/bloc/final_assesment_state.dart';
import 'package:flutter/material.dart';

class FinalAssesmentView extends StatefulWidget {
  final FinalAssesmentBloc bloc;

  const FinalAssesmentView(this.bloc);

  @override
  // ignore: library_private_types_in_public_api
  _FinalAssesmentViewState createState() => _FinalAssesmentViewState();
}

class _FinalAssesmentViewState extends State<FinalAssesmentView> {
  int n = 9;
  int selectedOption = 1;

  @override
  void dispose() {
    widget.bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //input section
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
              left: 20.0, bottom: 4.0, right: 20.0, top: 18.0),
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            elevation: 1.0,
            child: TextFormField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    n = int.tryParse(value) ?? 0;
                  });
                }),
          ),
        ),

        // Button Section
        Column(
          children: [
            Container(
              margin: const EdgeInsets.only(
                  top: 10, right: 10, left: 10, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // 1
                  ElevatedButton(
                    onPressed: () {
                      widget.bloc.dispatch(GenerateSeriesEvent(n, 1));
                    },
                    child: const Text('1'),
                  ),
                  //2
                  ElevatedButton(
                    onPressed: () {
                      widget.bloc.dispatch(GenerateSeriesEvent(n, 2));
                    },
                    child: const Text('2'),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                  top: 10, right: 10, left: 10, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //3
                  ElevatedButton(
                    onPressed: () {
                      widget.bloc.dispatch(GenerateSeriesEvent(n, 3));
                    },
                    child: const Text('3'),
                  ),
                  //4
                  ElevatedButton(
                    onPressed: () {
                      widget.bloc.dispatch(GenerateSeriesEvent(n, 4));
                    },
                    child: const Text('4'),
                  ),
                ],
              ),
            ),
          ],
        ),

        // Result Section
        StreamBuilder<FinalAssesmentState>(
          stream: widget.bloc.stateStream,
          initialData: InitialState(),
          builder: (context, snapshot) {
            if (snapshot.data is GeneratedState) {
              final series = (snapshot.data as GeneratedState)
                  .series
                  .replaceAll('', '');
            return Container(
                margin: const EdgeInsets.all(16),
                child: Text(
                  'Result: \n $series',
                  style: const TextStyle(fontSize: 16),
                ),
              );
            } else {
              return Container();
            }
          },
        ),
      ],
    );
  }
}

