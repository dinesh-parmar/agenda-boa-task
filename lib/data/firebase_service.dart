import 'package:firebase_database/firebase_database.dart';

class FirebaseService {
  final _fbDatabase = FirebaseDatabase.instance;
  late final _ref = _fbDatabase.reference();

  Future<void> setCounterValue(int counterIndex, int counterValue) async {
    final counterName = "counter${counterIndex + 1}";
    await _ref.child(counterName).set(counterValue);
  }

  Future<int?> getCounterValue(int counterIndex) async {
    final counterName = "counter${counterIndex + 1}";
    final getData = await _ref.child(counterName).once();
    return getData.value;
  }
}
