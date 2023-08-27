import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:portfolio/view/screens/Home/database/checkUser.dart';

class AuthService {
  signInWithGoogle() async {
    GoogleSignInAccount? guser = await GoogleSignIn().signIn();

    try {
      if (guser != null) {
        final GoogleSignInAuthentication gauth = await guser!.authentication;
        final credential = GoogleAuthProvider.credential(
            accessToken: gauth.accessToken, idToken: gauth.idToken);

        return await FirebaseAuth.instance
            .signInWithCredential(credential)
            .then((value) async {
          if (value != null) {
            if (await CheckUser.checkUser()) {
            } else {
              CheckUser.createUser();
            }
          }
        });
      } else {
        return null;
      }
    } on FirebaseAuthException catch (e) {
      print(e.code);
    }
  }
}
