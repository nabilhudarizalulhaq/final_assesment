abstract class FinalAssesmentEvent {}

class GenerateSeriesEvent extends FinalAssesmentEvent {
  final int n;
  final int option;

  GenerateSeriesEvent(this.n, this.option);
}
