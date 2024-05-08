import 'package:animations/animations.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paw_in_out/ui/pets/pet-add-view.dart';
import 'package:paw_in_out/ui/pets/pets-details-view.dart';

import '../../widgets/card.dart';


/// [Petsview] for user pets
class PetsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back_ios, color: Colors.grey),
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: AutoSizeText(
                  "My Pets",
                  minFontSize: 28,
                  style: GoogleFonts.openSans(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.amber[400]),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: OpenContainer(
                closedShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                transitionDuration: const Duration(milliseconds: 400),
                closedBuilder: (context, action) {
                  return const ListTileButton(
                    label: 'Add Pet',
                    icon: Icons.add,
                    // onPressed: () {},
                  );
                },
                openBuilder: (context, action) {
                  return const AddPetView();
                },
              ),
            ),
            OpenContainer(
              closedShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              transitionDuration: const Duration(milliseconds: 400),
              closedBuilder: (context, action) {
                return const PetCard(
                  // onTap: ,
                  name: "Maxiee",
                  caption: "Fun little pup always filled with energy",
                  age: '9 months',
                  imageURL: 'assets/images/i1.jpg',
                );
              },
              openBuilder: (context, action) {
                return const PetsDetailView();
              },
            ),
            const PetCard(
              // onTap: () {},
              name: "Benji",
              caption: "Playful and Joyful",
              age: '2 years',
              imageURL: 'assets/images/i3.jpg',
            )
          ],
        ),
      ),
    );
  }
}
