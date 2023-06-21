import 'dart:async';
import 'package:final_assessment/bloc/final_assesment_event.dart';
import 'package:final_assessment/bloc/final_assesment_state.dart';

class FinalAssesmentBloc {
  FinalAssesmentState _currentState = InitialState();

  final _stateStreamController = StreamController<FinalAssesmentState>.broadcast();
  StreamSink<FinalAssesmentState> get _stateSink => _stateStreamController.sink;
  Stream<FinalAssesmentState> get stateStream => _stateStreamController.stream;

  void dispatch(FinalAssesmentEvent event) {
    if (event is GenerateSeriesEvent) {
      final n = event.n;
      final option = event.option;
      String series = '';

      switch (option) {
        case 1:
          for (int i = 1; i <= n; i++) {
            series += i.toString();
          }
          break;
        case 2:
          for (int i = 1; i <= n; i++) {
            series += i.toString();
          }
          for (int i = n - 1; i >= 1; i--) {
            series += i.toString();
          }
          break;
        case 3:
          for (int i = 1; i <= n; i++) {
            series += (i * 10).toString() + ' ';
          }
          break;
        case 4:
          for (int i = 1; i <= n; i++) {
            if (i % 5 == 0) {
              series += 'LIMA ';
            } else if (i % 7 == 0) {
              series += 'TUJUH ';
            } else {
              series += i.toString() + ' ';
            }
          }
          break;
      }

      _currentState = GeneratedState(series);
      _stateSink.add(_currentState);
    }
  }

  void dispose() {
    _stateStreamController.close();
  }
}
