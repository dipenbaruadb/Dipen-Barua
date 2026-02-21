import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:local_auth/local_auth.dart';

class SecurityService {
  final _storage = const FlutterSecureStorage();
  final _localAuth = LocalAuthentication();

  Future<void> setPin(String pin) => _storage.write(key: 'app_pin', value: pin);
  Future<String?> getPin() => _storage.read(key: 'app_pin');

  Future<bool> authenticateBiometric() {
    return _localAuth.authenticate(
      localizedReason: 'Unlock Taka Manager',
      options: const AuthenticationOptions(biometricOnly: true),
    );
  }
}
