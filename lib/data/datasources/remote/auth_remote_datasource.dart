import 'package:firebase_auth/firebase_auth.dart';

class AuthRemoteDataSource {
  final FirebaseAuth auth;
  AuthRemoteDataSource(this.auth);

  Future<UserCredential> signInWithEmail(String email, String password) =>
      auth.signInWithEmailAndPassword(email: email, password: password);

  Future<void> sendOtp(String phoneNumber, PhoneCodeSent codeSent) {
    return auth.verifyPhoneNumber(phoneNumber: phoneNumber, codeSent: codeSent, verificationCompleted: (_) {});
  }
}
