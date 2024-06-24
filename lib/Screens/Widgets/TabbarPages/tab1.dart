import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical/auth/auth_password_exception.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class tab1 extends StatefulWidget {
  tab1({super.key});
  static final auth = FirebaseAuth.instance;
  static late AuthStatus _status;

  @override
  State<tab1> createState() => _tab1State();
}

class _tab1State extends State<tab1> {
  final _key = GlobalKey<FormState>();

  final emailController = TextEditingController();
  static late AuthStatus _status;

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  Future<AuthStatus> resetPassword({required String email}) async {
    await tab1.auth
        .sendPasswordResetEmail(email: email)
        .then((value) => _status = AuthStatus.successful)
        .catchError(
            (e) => _status = AuthExceptionHandler.handleAuthException(e));

    return tab1._status;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(children: [
        SizedBox(
          height: 40,
        ),
        Center(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.1,
            width: MediaQuery.of(context).size.width * 0.9,
            child: TextField(
              textAlign: TextAlign.start,
              textInputAction: TextInputAction.none,
              obscureText: false,
              keyboardType: TextInputType.emailAddress,
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                  focusColor: Colors.black26,
                  fillColor: Color.fromARGB(255, 247, 247, 247),
                  filled: true,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: Container(
                      child: Image.asset("lib/icons/email.png"),
                    ),
                  ),
                  prefixIconColor: const Color.fromARGB(255, 18, 56, 114),
                  label: Text("Enter your email"),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(30),
                  )),
            ),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.05,
          width: MediaQuery.of(context).size.width * 01,
          child: ElevatedButton(
            onPressed: () async {
              if (_key.currentState!.validate()) {
                final _status =
                    await resetPassword(email: emailController.text.trim());
                if (_status == AuthStatus.successful) {
                  //your logic
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Password has been successfully reset.'),
                      duration:
                          Duration(seconds: 3), // Durasi SnackBar ditampilkan
                    ),
                  );
                } else {
                  // Show SnackBar with error message
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content:
                          Text('Failed to reset password. Please try again.'),
                      duration:
                          Duration(seconds: 3), // Durasi SnackBar ditampilkan
                    ),
                  );
                }
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 18, 56, 114),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: Text(
              "Reset Password",
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 18.sp,
                color: Color.fromARGB(255, 255, 255, 255),
                fontWeight: FontWeight.w500,
                letterSpacing: 0,
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
