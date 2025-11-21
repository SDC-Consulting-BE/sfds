import "package:firebase_core/firebase_core.dart";
import "package:sfds/config.dart";

class FirebaseConfig implements SteveAppConfigItem {
  const FirebaseConfig({
    required this.firebaseOptions,
  });

  final FirebaseOptions firebaseOptions;

  @override
  Future<void> configure() async {
    await Firebase.initializeApp(options: firebaseOptions);
  }
}
