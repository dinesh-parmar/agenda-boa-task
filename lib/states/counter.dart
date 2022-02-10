import 'package:agenda_boa/data/firebase_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class CounterState extends ChangeNotifier {
  List<int> counterValue = [0, 0, 0];
  final _firebaseService = FirebaseService();

  void setValue(int index, int value) async {
    counterValue[index] = value;
    _firebaseService.setCounterValue(index, value);
    notifyListeners();
  }

  void incrementCounter(int index) => setValue(index, ++counterValue[index]);

  Future<void> retrieveCounterValue(int counterIndex) async {
    counterValue[counterIndex] = (await _firebaseService.getCounterValue(counterIndex)) ?? 0;
    notifyListeners();
  }
}

final counterState = CounterState();
