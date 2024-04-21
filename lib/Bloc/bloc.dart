import 'package:flutter_bloc/flutter_bloc.dart';
part 'state.dart';
part 'event.dart';

class EducationAppBloc extends Bloc<EducationAppEvent, EducationAppState> {
  EducationAppBloc() : super(EducationAppInitial()) {
    on<EducationAppEvent>((event, emit) {

    });
  }
}