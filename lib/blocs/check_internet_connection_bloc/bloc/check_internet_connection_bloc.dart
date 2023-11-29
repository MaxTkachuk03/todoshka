
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoshka/repository/services/services.dart';

part 'check_internet_connection_event.dart';
part 'check_internet_connection_state.dart';

class CheckInternetConnectionBloc
    extends Bloc<CheckInternetConnectionEvent, CheckInternetConnectionState> {
  CheckInternetConnectionBloc(this.checkInternet)
      : super(const CheckInternetConnectionState()) {
    on<CheckInternetConnectionEvent>((event, emit) async {
      final result = await checkInternet.checkInternetConnection();
      emit(CheckInternetConnectionState(checkInternet: result));
    });
  }

  final InternetConnection checkInternet;
}
