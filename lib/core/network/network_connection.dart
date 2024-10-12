// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:internet_connection_checker/internet_connection_checker.dart';

class NetworkConnection {
  final InternetConnectionChecker internetConnectionChecker;
  NetworkConnection({
    required this.internetConnectionChecker,
  });

  Future<bool> get isConnected async {
    return await internetConnectionChecker.hasConnection;
  }
}
