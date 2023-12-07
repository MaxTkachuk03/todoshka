part of 'data_synchronize_bloc.dart';

class DataSyncronizeEvent extends Equatable {
  const DataSyncronizeEvent({this.checkInternet});
  final bool? checkInternet;

  @override
  List<Object?> get props => [
        checkInternet,
      ];
}
