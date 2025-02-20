// Importing the required Firebase and authentication packages
import 'package:firebase_auth/firebase_auth.dart'; // For Firebase Authentication
import 'package:google_sign_in/google_sign_in.dart'; // For Google Sign-In

// AuthService class handles all authentication-related operations
class AuthService {
  // Firebase Authentication instance to manage user authentication
  final _auth = FirebaseAuth.instance;

  // Method to send an email verification link to the currently logged-in user
  Future<void> sendEmailVerificationLink() async {
    try {
      // Triggers email verification link to be sent to the user's email
      await _auth.currentUser?.sendEmailVerification();
    } catch (e) {
      // Prints error if sending the verification link fails
      print(e.toString());
    }
  }

  // Method to send a password reset link to the specified email
  Future<void> sendPasswordResetLink(String email) async {
    try {
      // Sends password reset email
      await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      // Prints error if sending the reset link fails
      print(e.toString());
    }
  }

  // Method to handle Google Sign-In and authenticate the user in Firebase
  Future<UserCredential?> loginWithGoogle() async {
    try {
      // Opens Google Sign-In prompt and waits for the user to select an account
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // If the user cancels the sign-in process, return null
      if (googleUser == null) {
        return null;
      }

      // Retrieves authentication details from the signed-in Google account
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      // Creates a Firebase credential using Google account's ID and access tokens
      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
        accessToken: googleAuth.accessToken,
      );

      // Signs in to Firebase using the Google credentials
      return await _auth.signInWithCredential(credential);
    } catch (e) {
      // Prints error message if Google Sign-In fails
      print("Google Sign-In failed: $e");
    }
    return null; // Returns null if sign-in fails
  }

  // Method to create a new user account using email and password
  Future<User?> createUserWithEmailAndPassword(String email, String password) async {
    try {
      // Creates a new user account in Firebase with the provided email and password
      final credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return credential.user; // Returns the user object if successful
    } on FirebaseAuthException catch (e) {
      // Handles specific Firebase errors, such as email already in use
      if (e.code == 'email-already-in-use') {
        throw Exception("The email is already in use. Please try another email to login.");
      } else {
        throw Exception(e.message ?? "An error occurred");
      }
    } catch (e) {
      // Handles general errors
      throw Exception("Error: $e");
    }
  }

  // Method to log in an existing user using email and password
  Future<User?> loginUserWithEmailAndPassword(String email, String password) async {
    try {
      // Logs in the user with Firebase Authentication
      final credential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return credential.user; // Returns the logged-in user object
    } catch (e) {
      // Prints error message if login fails
      print("Error $e");
      return null; // Returns null if login fails
    }
  }

  // Method to log out the currently logged-in user
  Future<void> signout() async {
    try {
      // Signs out the user from Firebase
      await _auth.signOut();
    } catch (e) {
      // Prints an error message if sign-out fails
      print("Something went wrong");
    }
  }
}
