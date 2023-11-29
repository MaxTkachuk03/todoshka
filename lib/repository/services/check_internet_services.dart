import 'package:connectivity_plus/connectivity_plus.dart';

class InternetConnection {
  const InternetConnection({
    required this.connectivity,
  });
  final Connectivity connectivity;

  Future<bool> checkInternetConnection() async {
    ConnectivityResult result = await (connectivity.checkConnectivity());

    if (result == ConnectivityResult.none) {
      return false;
    } else {
      return true;
    }
  }
}
