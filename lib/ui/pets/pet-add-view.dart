import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paw_in_out/widgets/text_field.dart';

List<IconData> animalIcons = [
  FontAwesomeIcons.cat,
  FontAwesomeIcons.dog,
  FontAwesomeIcons.crow,
  FontAwesomeIcons.fish,
  FontAwesomeIcons.fish,
];

class AddPetView extends HookWidget {
  const AddPetView({super.key});

  @override
  Widget build(BuildContext context) {
    var page = usePageController();
    var gender = useState('');
    var gender2 = useState('');

    return Scaffold(
      body: PageView(
        controller: page,
        scrollDirection: Axis.vertical,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 0.07.sh,
                    child: AutoSizeText("What does your pet look like?",
                        style: Theme.of(context).textTheme.displaySmall),
                  ),
                  SizedBox(
                    height: 0.05.sh,
                  ),
                  Row(
                    children: [
                      PetOptionsCard(
                        iconData: animalIcons[0],
                        value: "Cat",
                        onTap: () {
                          // page.animateToPage(1,
                          //     duration: Duration(seconds: 1),
                          //     curve: Curves.fastOutSlowIn);
                        },
                      ),
                      PetOptionsCard(
                        iconData: animalIcons[1],
                        value: "Dog",
                        onTap: () {
                          page.animateToPage(1,
                              duration: const Duration(seconds: 1),
                              curve: Curves.fastOutSlowIn);
                        },
                      ),
                      PetOptionsCard(
                        iconData: animalIcons[2],
                        value: "Bird",
                        onTap: () {},
                      ),
                      PetOptionsCard(
                        iconData: animalIcons[3],
                        value: "Fish",
                        onTap: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 0.07.sh,
                  child: AutoSizeText("What does it actually look like?",
                      style: Theme.of(context).textTheme.displaySmall),
                ),
                SizedBox(
                  height: 0.15.sh,
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: [
                      PetOptionsCard(
                        iconData: Icons.search,
                        value: "Search",
                        onTap: () {},
                      ),
                      PetBreedOptionsCard(
                        imageUrl: 'assets/images/labrador.png',
                        value: "labrador",
                        onTap: () {
                          page.animateToPage(2,
                              duration: const Duration(seconds: 1),
                              curve: Curves.fastOutSlowIn);
                        },
                      ),
                      const PetBreedOptionsCard(
                        imageUrl: 'assets/images/husky.png',
                        value: "Husky",
                      ),
                      const PetBreedOptionsCard(
                        imageUrl: 'assets/images/shihtzu.png',
                        value: "Beagle",
                      ),
                      const PetBreedOptionsCard(
                        imageUrl: 'assets/images/beagle.png',
                        value: "Beagle",
                      ),
                    ],
                  ),
                )
              ],
            )),
          ),
          Container(
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PetOptionsCard(
                  iconData: MaterialCommunityIcons.gender_male,
                  value: "Male",
                  onTap: () {
                    gender.value = 'him';
                    gender2.value = 'he';

                    page.animateToPage(3,
                        duration: const Duration(seconds: 1),
                        curve: Curves.fastOutSlowIn);
                  },
                ),
                SizedBox(
                  height: 0.05.sh,
                  child: AutoSizeText("Or",
                      style: Theme.of(context).textTheme.displaySmall),
                ),
                PetOptionsCard(
                  iconData: MaterialCommunityIcons.gender_female,
                  value: "Female",
                  onTap: () {
                    gender.value = 'her';
                    gender2.value = 'she';

                    page.animateToPage(3,
                        duration: const Duration(seconds: 1),
                        curve: Curves.fastOutSlowIn);
                  },
                ),
              ],
            )),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 0.07.sh,
                    child: AutoSizeText("What do you call ${gender.value}?",
                        style: Theme.of(context).textTheme.displaySmall),
                  ),
                  TextField(
                    decoration: inputFormat2(context, label: 'Name'),
                  ),
                  SizedBox(
                    height: 0.1.sh,
                  ),
                  SizedBox(
                    height: 0.07.sh,
                    child: AutoSizeText("What is ${gender2.value} like?",
                        style: Theme.of(context).textTheme.displaySmall),
                  ),
                  TextField(
                    decoration: inputFormat2(context, label: 'Description'),
                  )
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 0.07.sh,
                    child: AutoSizeText("How fluffy is ${gender2.value}?",
                        style: Theme.of(context).textTheme.displaySmall),
                  ),
                  TextField(
                    decoration: inputFormat2(context, label: 'Weight'),
                  ),
                  SizedBox(
                    height: 0.1.sh,
                  ),
                  SizedBox(
                    height: 0.07.sh,
                    child: AutoSizeText(
                        "What color does ${gender2.value} have?",
                        style: Theme.of(context).textTheme.displaySmall),
                  ),
                  TextField(
                    decoration: inputFormat2(context, label: 'Color'),
                  )
                ],
              ),
            ),
          ),
          Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 0.1.sh,
                    child: AutoSizeText("Upload an Image",
                        style: Theme.of(context).textTheme.displaySmall),
                  ),
                  CircleAvatar(
                    radius: 0.1.sh,
                  ),
                  SizedBox(
                    height: 0.2.sh,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0.1.sw),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        backgroundColor: Colors.amber[300],
                      ),
                      onPressed: () {},
                      child: Text(
                        "Submit",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class PetOptionsCard extends StatelessWidget {
  final IconData iconData;
  final String value;
  final Function onTap;

  const PetOptionsCard({
    super.key,
    required this.iconData,
    required this.value,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap;
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: Colors.amber[200],
        child: Container(
          padding: const EdgeInsets.all(5),
          height: 0.1.sh,
          width: 0.22.sw,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(iconData),
              // Text(
              //   label,
              //   style: GoogleFonts.openSans(fontSize: 13, color: Colors.black54),
              // ),
              const SizedBox(height: 5),
              AutoSizeText(
                value,
                style: GoogleFonts.openSans(),
                maxFontSize: 13,
                minFontSize: 9,
                textAlign: TextAlign.center,
                maxLines: 2,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class PetBreedOptionsCard extends StatelessWidget {
  final String imageUrl;
  final String value;
  final Function? onTap;

  const PetBreedOptionsCard({
    super.key,
    required this.imageUrl,
    required this.value,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap;
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: Colors.amber[200],
        child: Container(
          padding: const EdgeInsets.all(5),
          height: 0.15.sh,
          width: 0.22.sw,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                height: 0.1.sh,
                child: Image(
                  fit: BoxFit.cover,
                  image: AssetImage(imageUrl),
                ),
              ),
              const SizedBox(height: 5),
              AutoSizeText(
                value,
                style: GoogleFonts.openSans(),
                maxFontSize: 13,
                minFontSize: 9,
                textAlign: TextAlign.center,
                maxLines: 2,
              )
            ],
          ),
        ),
      ),
    );
  }
}
