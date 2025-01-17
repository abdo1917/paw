import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paw_in_out/ui/dashboard/grid-dashboard.dart';
import 'package:paw_in_out/ui/dashboard/slider.dart';


class DashBoard extends StatelessWidget {
  const DashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back_ios, color: Colors.grey),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Slides(),
          Card(
            color: Colors.amber[100],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(children: [
              ListTile(
                leading: Image.asset("assets/icons/pawprint.png"),
                title: Text(
                  'Next visit to Veterinary',
                  style: GoogleFonts.raleway(
                    textStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                subtitle: Text(
                  '4th January 2021',
                  style: GoogleFonts.raleway(
                    textStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                ),
                contentPadding:
                const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              ),
            ]),
          ),
          GridDashboard(),
        ],
      ),
    );
  }
}
