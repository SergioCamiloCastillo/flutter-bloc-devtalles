import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(12);
  void incrementBy(int value) => emit(state + value);
}
