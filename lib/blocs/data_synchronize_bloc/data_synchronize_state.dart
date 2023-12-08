part of 'data_synchronize_bloc.dart';

class DataSyncronizeState extends Equatable {
  const DataSyncronizeState({this.checkInternet = false});

  final bool checkInternet;

  @override
  List<Object> get props => [
        checkInternet,
      ];
}
