
abstract class FinalAssesmentState {}

class InitialState extends FinalAssesmentState {}

class GeneratedState extends FinalAssesmentState {
  final String series;

  GeneratedState(this.series);
}
