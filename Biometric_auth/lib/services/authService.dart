import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:local_auth/local_auth.dart';

class BiometricAuthService {

  final LocalAuthentication auth = LocalAuthentication();
  final FlutterSecureStorage storage = FlutterSecureStorage();

  // checking  if biometric or device credentials are available
  Future<bool> isBiometricAvailable() async {
    try {
      return await auth.canCheckBiometrics || await auth.isDeviceSupported();
    }
    catch (e){
      print("-- BIOMETRIC AVAILABILITY ERROR -- : $e");
      return false;
    }
  } 

  // getting all the auth methods thta are enrolled (fingerprint , face , etc.)
  Future<List<BiometricType>> getAvailableBiometrics() async{
    try{
      final available = await auth.getAvailableBiometrics();
      print("AVAILABLE BIOMETRICS ARE : $available");
      return available;
    }
    catch(e){
      print("ERROR GETTING AVAILABLE BIOMETRICS : $e");
      return[];
    }
  }


  Future<bool> authenticateUser({String reason = " Please authenticate "}) async {
    try{
      bool isAuthenticated = await auth.authenticate(
        localizedReason: reason,
        options: AuthenticationOptions(
          biometricOnly: false,   // allows device pin , pswd (fallback) if biometric is not available
          stickyAuth: true,
          useErrorDialogs: true,
        ),
      );

      if(isAuthenticated){
        // write the token to the secure storage
        await storage.write(key: 'auth_token', value: '123');
      }
      return isAuthenticated;

    }
    catch(e){
      print("-- AUTHENTICATE USER ERROR -- : $e");
      return false;
    }
  }

  // reading the token
  Future<String?> getToken() async {
    return await storage.read(key: 'auth_token');
  }

  // clearing the token while logging out
  Future<void> clearToken() async {
    await storage.delete(key: 'auth_token');
  }
}