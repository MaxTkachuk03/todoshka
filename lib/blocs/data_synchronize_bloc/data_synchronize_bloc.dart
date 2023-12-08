import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoshka/repository/repository.dart';

part 'data_synchronize_event.dart';
part 'data_synchronize_state.dart';

class DataSyncronizeBloc
    extends Bloc<DataSyncronizeEvent, DataSyncronizeState> {
  DataSyncronizeBloc(this.checkInternet, this.tasksRepository, this.tasksLocal)
      : super(const DataSyncronizeState()) {
    on<DataSyncronizeEvent>((event, emit) async {
      final result = await checkInternet.checkInternetConnection();

      if (result == true) {
        await tasksRepository.synchronizeData(locaL: tasksLocal);
      }
      emit(DataSyncronizeState(checkInternet: result));
    });
  }
  final AbstractApiServices tasksRepository;
  final InternetConnection checkInternet;
  final AbstarctLocalServices tasksLocal;
}
