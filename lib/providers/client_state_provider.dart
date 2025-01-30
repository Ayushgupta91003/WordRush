import 'package:flutter/material.dart';
import 'package:wordrush/models/client_state.dart';

class ClientStateProvider extends ChangeNotifier {
  ClientState _clientState = ClientState(
    timer: {
      'countDown': '',
      'msg': '',
    },
  );

  Map<String, dynamic> get clientState => _clientState.toJson();

  setClientState(timer) {
    _clientState = ClientState(timer: timer);
    notifyListeners();
  }
}
