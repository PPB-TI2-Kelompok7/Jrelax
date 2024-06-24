import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:medical/Screens/Widgets/profile_list.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 18, 56, 114),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Center(
              child: Stack(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Container(
                    width: 110,
                    height: 110,
                    decoration: BoxDecoration(
                        border: Border.all(width: 4, color: Colors.white),
                        boxShadow: [
                          BoxShadow(
                              spreadRadius: 2,
                              blurRadius: 10,
                              color: Colors.black.withOpacity(0.1))
                        ],
                        shape: BoxShape.circle,
                        image: const DecorationImage(
                          image: AssetImage("lib/icons/avatar.png"),
                          fit: BoxFit.cover,
                        )),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(width: 1, color: Colors.white),
                          color: Colors.white,
                          image: const DecorationImage(
                              image: AssetImage("lib/icons/camra.png"))),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Muhammad Makhdum Wahid",
                  style: GoogleFonts.poppins(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildInfoCard(
                      context, "lib/icons/callories.png", "Calories", "103lbs"),
                  Container(
                    height: 50,
                    width: 1,
                    color: Colors.white,
                  ),
                  _buildInfoCard(
                      context, "lib/icons/weight.png", "Weight", "756cal"),
                  Container(
                    height: 50,
                    width: 1,
                    color: Colors.white,
                  ),
                  _buildInfoCard(
                      context, "lib/icons/heart.png", "Heart rate", "215bpm"),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              height: 550,
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: Column(children: [
                const SizedBox(
                  height: 50,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/updateProfile');
                  },
                  child: ProfileList(
                    image: "lib/icons/heart2.png",
                    title: "Edit Profile",
                    color: Colors.black87,
                    backgroundColor: Colors.grey[200]!, // Tambahkan ini
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  child: Divider(),
                ),
                ProfileList(
                  image: "lib/icons/appoint.png",
                  title: "Appointmnet",
                  color: Colors.black87,
                  backgroundColor: Colors.grey[200]!, // Tambahkan ini
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  child: Divider(),
                ),
                ProfileList(
                  image: "lib/icons/chat.png",
                  title: "FAQs",
                  color: Colors.black87,
                  backgroundColor: Colors.grey[200]!, // Tambahkan ini
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  child: Divider(),
                ),
                ProfileList(
                  image: "lib/icons/pay.png",
                  title: "Payment Method",
                  color: Colors.black87,
                  backgroundColor: Colors.grey[200]!, // Tambahkan ini
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  child: Divider(),
                ),
                ProfileList(
                  image: "lib/icons/logout.png",
                  title: "Log out",
                  color: Colors.red,
                  backgroundColor: Colors.grey[200]!, // Tambahkan ini
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(
      BuildContext context, String image, String label, String value) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.0900,
      width: MediaQuery.of(context).size.width * 0.2500,
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.0400,
            width: MediaQuery.of(context).size.width * 0.1500,
            child: Image.asset(image, fit: BoxFit.contain),
          ),
          Text(
            label,
            style: GoogleFonts.poppins(
              fontSize: 13.sp,
              fontWeight: FontWeight.w600,
              color: const Color.fromARGB(255, 245, 243, 243),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            value,
            style: GoogleFonts.poppins(
              fontSize: 15.sp,
              fontWeight: FontWeight.w600,
              color: const Color.fromARGB(255, 255, 255, 255),
            ),
          ),
        ],
      ),
    );
  }
}
