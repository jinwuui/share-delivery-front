import 'package:share_delivery/src/data/model/User.dart';

class AuthenticationRepository {
  signInWithEmailAndPassword(String id, String password) {
    return User(name: 'test', phoneNumber: '1234');
  }

  signOut() {}

  getCurrentUser() {
    // return User(name: 'test', phoneNumber: '1234');
  }
}
