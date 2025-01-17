import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class PetsDetailView extends StatelessWidget {
  const PetsDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
      children: const [
        PetDetailPage(),
        PetDetailPage(),
        PetDetailPage(),
      ],
    ));
  }
}

class PetDetailPage extends StatelessWidget {
  const PetDetailPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [
          SliverAppBar(
            backgroundColor: Colors.amber[300],
            leading: const SizedBox.shrink(),
            expandedHeight: 0.32.sh,
            floating: true,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: AutoSizeText(
                "Maxiee",
                style: GoogleFonts.openSans(fontSize: 30),
                maxLines: 1,
              ),
              background: const Image
                  // CachedNetworkImage
                  (
                image: AssetImage('assets/images/i1.jpg'),
                // imageUrl: widget.event.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          // )
        ];
      },
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const DetialsCards(),
            const BirthdayTile(),
            const HealthCard(),
            const CheckUpCard(),
            const FoodCard(),
            Container()
          ],
        ),
      ),
    );
  }
}

class FoodCard extends StatelessWidget {
  final Function? onTap;
  final String? value;
  final String? totalValue;

  const FoodCard({
    super.key,
    this.onTap,
    this.value,
    this.totalValue,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          height: 0.2.sh,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 0.18.sh,
                width: 0.3.sw,
                child: const Image(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    'assets/images/pedigree.png',
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "300g of 1200g remaining",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  InkWell(
                    onTap: () {
                      onTap;
                    },
                    child: Row(
                      children: [
                        Icon(
                          MaterialCommunityIcons.cart,
                          color: Colors.amber[300],
                        ),
                        Text(
                          "Order Now",
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall
                              ?.copyWith(fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CheckUpCard extends StatelessWidget {
  final Function? onTap;
  final int? data;

  const CheckUpCard({
    super.key,
    this.onTap,
    this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 2,
        child: ListTile(
          onTap: () {
            onTap;
          },
          leading: const Icon(Icons.calendar_today),
          title: Text(
            "Last Checkup was 38 days ago",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          subtitle: Container(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Book an appointment",
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall
                      ?.copyWith(fontSize: 14),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 14,
                  color: Colors.amber[400],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HealthCard extends StatelessWidget {
  const HealthCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          padding: const EdgeInsets.all(10.0),
          height: 0.28.sh,
          width: 1.sw,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  "Health",
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CirluarData(
                        icon: MaterialCommunityIcons.water,
                        value: 50,
                      ),
                      SizedBox(
                        height: 0.02.sh,
                      ),
                      Text("water",
                          style: Theme.of(context).textTheme.bodyMedium),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CirluarData(
                        icon: MaterialCommunityIcons.heart_pulse,
                        value: 82,
                      ),
                      SizedBox(
                        height: 0.02.sh,
                      ),
                      Text("pulse",
                          style: Theme.of(context).textTheme.bodyMedium),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CirluarData(
                        icon: MaterialCommunityIcons.food_apple,
                        value: 30,
                      ),
                      SizedBox(
                        height: 0.02.sh,
                      ),
                      Text("diet",
                          style: Theme.of(context).textTheme.bodyMedium),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CirluarData extends StatelessWidget {
  final IconData? icon;
  final double? value;

  const CirluarData({
    super.key,
    this.icon,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    return SleekCircularSlider(
      innerWidget: (val) => Icon(
        icon,
        size: 35,
        color: Colors.amber[400],
      ),
      appearance: CircularSliderAppearance(
          size: 100,
          startAngle: 0,
          angleRange: 360,
          customWidths: CustomSliderWidths(
              // handlerSize: 15,
              progressBarWidth: 8,
              trackWidth: 8),
          customColors: CustomSliderColors(
            progressBarColor: Colors.amber[300],
            trackColor: Colors.amber[100],
          )),
      min: 10,
      max: 100,
      initialValue: value ?? 50,
    );
  }
}

class DetialsCards extends StatelessWidget {
  const DetialsCards({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        height: 0.12.sh,
        padding: const EdgeInsets.all(10),
        child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          children: const [
            PetdetailContainer(
              label: "Age",
              value: "1 Year",
            ),
            PetdetailContainer(
              label: "Sex",
              value: "Male",
            ),
            PetdetailContainer(
              label: "Breed",
              value: "Golden Retriver",
            ),
            PetdetailContainer(
              label: "Color",
              value: "Brunette",
            ),
            PetdetailContainer(
              label: "Color",
              value: "Brunette",
            ),
          ],
        ),
      ),
    );
  }
}

class BirthdayTile extends StatelessWidget {
  const BirthdayTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0.05.sw, vertical: 0.02.sh),
      child: Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.amber.shade300)),
        child: ListTile(
          leading: const Icon(Icons.cake),
          title: Text(
            "Birthday in 56 days",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          trailing: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_off),
          ),
        ),
      ),
    );
  }
}

class PetdetailContainer extends StatelessWidget {
  final String? label;
  final String? value;

  const PetdetailContainer({
    super.key,
    this.label,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
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
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              label!,
              style: GoogleFonts.openSans(fontSize: 13, color: Colors.black54),
            ),
            const SizedBox(height: 5),
            Expanded(
              child: AutoSizeText(
                value!,
                style: GoogleFonts.openSans(),
                maxFontSize: 13,
                minFontSize: 9,
                textAlign: TextAlign.center,
                maxLines: 2,
              ),
            )
          ],
        ),
      ),
    );
  }
}
