import 'package:animations/animations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:paw_in_out/ui/adoption/adoption-form.dart';


class AdoptionList extends StatefulWidget {
  const AdoptionList({super.key});

  @override
  _AdoptionListState createState() => _AdoptionListState();
}

class _AdoptionListState extends State<AdoptionList> {
  List<String> animalTypes = [
    'Cats',
    'Dogs',
    'Parrots',
    'Fish',
    'Fish',
  ];

  List<IconData> animalIcons = [
    FontAwesomeIcons.cat,
    FontAwesomeIcons.dog,
    FontAwesomeIcons.crow,
    FontAwesomeIcons.fish,
    FontAwesomeIcons.fish,
  ];

  final List<Animal> animals = [
    Animal(
      name: 'Sola',
      scientificName: 'Abyssinian cat',
      age: 2.0,
      distanceToUser: '3.6 km',
      isFemale: true,
      imageUrl: 'assets/images/dog_2.png',
    ),
    Animal(
      name: 'Orion',
      scientificName: 'Abyssinian cat',
      age: 1.5,
      distanceToUser: '7.8 km',
      isFemale: false,
      imageUrl: 'assets/images/dog_1.png',
    ),
  ];

  int selectedAnimalIconIndex = 0;

  Widget buildAnimalIcon(int index) {
    return Padding(
      padding: const EdgeInsets.only(right: 30.0),
      child: Column(
        children: <Widget>[
          InkWell(
            onTap: () {
              setState(() {
                selectedAnimalIconIndex = index;
              });
            },
            child: Material(
              color: selectedAnimalIconIndex == index
                  ? Theme
                  .of(context)
                  .primaryColor
                  : Colors.white,
              elevation: 8.0,
              borderRadius: BorderRadius.circular(20.0),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Icon(
                  animalIcons[index],
                  size: 30.0,
                  color: selectedAnimalIconIndex == index
                      ? Colors.white
                      : Theme
                      .of(context)
                      .primaryColor,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),
          Text(
            animalTypes[index],
            style: TextStyle(
              color: Theme
                  .of(context)
                  .primaryColor,
              fontSize: 16.0,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const InkWell(
                    child: Icon(
                      FontAwesomeIcons.bars,
                    ),
//                      onTap: widget.menuCallback,
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        'Location',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 18.0,
                          color:
                          Theme
                              .of(context)
                              .primaryColor
                              .withOpacity(0.4),
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Icon(
                            FontAwesomeIcons.mapMarkerAlt,
                            color: Theme
                                .of(context)
                                .primaryColor,
                          ),
                          const Text(
                            'Hyderabad, ',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 22.0,
                            ),
                          ),
                          const Text(
                            'India',
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 22.0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const CircleAvatar(
                    radius: 20.0,
                    // backgroundImage: AssetImage('assets/images/me.jpg'),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 24.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    color: Theme
                        .of(context)
                        .primaryColor
                        .withOpacity(0.06),
                  ),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24.0,
                          vertical: 20.0,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20.0)),
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: const Row(
                            children: <Widget>[
                              Icon(
                                FontAwesomeIcons.search,
                                color: Colors.grey,
                              ),
                              Expanded(
                                child: TextField(
                                  style: TextStyle(fontSize: 18.0),
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide.none),
                                      hintText: 'Search pets to adopt'),
                                ),
                              ),
                              Icon(
                                FontAwesomeIcons.filter,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 120.0,
                        child: ListView.builder(
                            padding: const EdgeInsets.only(
                              left: 24.0,
                              top: 8.0,
                            ),
                            scrollDirection: Axis.horizontal,
                            itemCount: animalTypes.length,
                            itemBuilder: (context, index) {
                              return buildAnimalIcon(index);
                            }),
                      ),
                      Expanded(
                        child: ListView.builder(
                            padding: const EdgeInsets.only(
                              top: 10.0,
                            ),
                            itemCount: animals.length,
                            itemBuilder: (context, index) {
                              final animal = animals[index];

                              return GestureDetector(
                                onTap: () {
                                  /// context.rootNavigator.push('/adoption-item');
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    bottom: 10.0,
                                    right: 20.0,
                                    left: 20.0,
                                  ),
                                  child: Stack(
                                    alignment: Alignment.centerLeft,
                                    children: <Widget>[
                                      Material(
                                        borderRadius:
                                        BorderRadius.circular(20.0),
                                        elevation: 4.0,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 20.0,
                                            vertical: 20.0,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              SizedBox(
                                                width: MediaQuery
                                                    .of(context)
                                                    .size
                                                    .width *
                                                    0.4,
                                              ),
                                              Flexible(
                                                child: Column(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                      mainAxisSize:
                                                      MainAxisSize.max,
                                                      children: <Widget>[
                                                        Text(
                                                          animal.name??'',
                                                          style: TextStyle(
                                                            fontSize: 26.0,
                                                            color: Theme
                                                                .of(
                                                                context)
                                                                .primaryColor,
                                                            fontWeight:
                                                            FontWeight.bold,
                                                          ),
                                                        ),
                                                        Icon(
                                                          animal.isFemale ?? false
                                                              ? FontAwesomeIcons
                                                              .venus
                                                              : FontAwesomeIcons
                                                              .mars,
                                                          color: Colors.grey,
                                                        ),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      height: 10.0,
                                                    ),
                                                    Text(
                                                      animal.scientificName??'',
                                                      style: TextStyle(
                                                        fontSize: 16.0,
                                                        color: Theme
                                                            .of(context)
                                                            .primaryColor,
                                                        fontWeight:
                                                        FontWeight.w500,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 10.0,
                                                    ),
                                                    Text(
                                                      '${animal.age} years old',
                                                      style: const TextStyle(
                                                        color: Colors.grey,
                                                        fontWeight:
                                                        FontWeight.w600,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 10.0,
                                                    ),
                                                    Row(
                                                      children: <Widget>[
                                                        Icon(
                                                          FontAwesomeIcons
                                                              .mapMarkerAlt,
                                                          color:
                                                          Theme
                                                              .of(context)
                                                              .primaryColor,
                                                          size: 16.0,
                                                        ),
                                                        const SizedBox(
                                                          width: 6.0,
                                                        ),
                                                        Text(
                                                          '${animal
                                                              .distanceToUser}',
                                                          style: TextStyle(
                                                            fontSize: 16.0,
                                                            color: Theme
                                                                .of(
                                                                context)
                                                                .primaryColor,
                                                            fontWeight:
                                                            FontWeight.w400,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Stack(
                                        alignment: Alignment.center,
                                        children: <Widget>[
                                          Container(
                                            decoration: BoxDecoration(
                                              color: Colors.amber[400],
                                              borderRadius:
                                              BorderRadius.circular(20.0),
                                            ),
                                            height: 190.0,
                                            width: MediaQuery
                                                .of(context)
                                                .size
                                                .width *
                                                0.4,
                                          ),
                                          Hero(
                                            tag: animal.name?? '',
                                            child: Image(
                                              image:
                                              AssetImage(animal.imageUrl??''),
                                              height: 220.0,
                                              fit: BoxFit.fitHeight,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width *
                                                  0.4,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: OpenContainer(
        closedShape: const CircleBorder(),
        transitionDuration: const Duration(milliseconds: 400),
        closedBuilder: (context, action) {
          return FloatingActionButton(
            onPressed: action,
            child: const Icon(Icons.add),
          );
        },
        openBuilder: (context, action) {
          return AdoptionForm();
        },
      ),
    );
  }
}

class Animal {
  String? name;
  String? scientificName;
  double? age;
  String? distanceToUser;
  bool? isFemale;
  String? imageUrl;

  Animal({
    this.name,
    this.scientificName,
    this.age,
    this.distanceToUser,
    this.isFemale,
    this.imageUrl,
  });
}


//  _card(String image) {
//    return Padding(
//      padding: const EdgeInsets.all(10.0),
//      child: GestureDetector(
//        onTap: () {
//          context.rootNavigator.push('/adoption-item');
//        },
//        child: Stack(
////        alignment: AlignmentDirectional.center,
//          children: [
//            Column(
//              children: [
//                SizedBox(
//                  height: 25,
//                ),
//                Container(
//                  height: 150,
//                  decoration: BoxDecoration(
//                    color: Colors.white,
//                    borderRadius: BorderRadius.all(Radius.circular(20)),
//                    boxShadow: [
//                      new BoxShadow(
//                        color: Colors.grey.shade300,
//                        spreadRadius: 3,
//                        blurRadius: 3,
//                      )
//                    ],
//                  ),
//                  child: Row(
//                    mainAxisAlignment: MainAxisAlignment.end,
//                    children: [
//                      Padding(
//                        padding: const EdgeInsets.all(10.0),
//                        child: Container(
//                          child: Column(
//                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                            crossAxisAlignment: CrossAxisAlignment.start,
//                            children: [
//                              Row(
//                                mainAxisAlignment:
//                                    MainAxisAlignment.spaceBetween,
//                                children: [
//                                  Text(
//                                    'Sola',
////                              textDirection: TextDirection.ltr,
//                                    style: TextStyle(
//                                        fontSize: 25,
//                                        color: Colors.grey.shade700),
//                                  ),
//                                  Icon(FontAwesome.venus)
//                                ],
//                              ),
//                              Text(
//                                'Golden Retriver',
////                              textDirection: TextDirection.ltr,
//                                style: TextStyle(
//                                    fontSize: 15, color: Colors.grey.shade700),
//                              ),
//                              Text(
//                                '2 years old',
////                              textDirection: TextDirection.ltr,
//                                style: TextStyle(
//                                    fontSize: 15, color: Colors.grey.shade700),
//                              ),
//                              Row(
//                                children: [
//                                  Icon(Icons.location_on),
//                                  SizedBox(width: 20),
//                                  Text(
//                                    'Distance 3.6km',
//                                    style: TextStyle(
//                                        fontSize: 15,
//                                        color: Colors.grey.shade700),
//                                  )
//                                ],
//                              )
//                            ],
//                          ),
//                        ),
//                      )
//                    ],
//                  ),
//                ),
//              ],
//            ),
//            Stack(children: [
//              Container(
//                height: 200,
//                width: 150,
//                decoration: BoxDecoration(
//                  borderRadius: BorderRadius.all(Radius.circular(20)),
//                  color: Colors.amber.shade100,
//                ),
//              ),
//              Image(
//                  height: 200,
//                  width: MediaQuery.of(context).size.width / 2,
//                  image: AssetImage(image))
//            ])
//          ],
//        ),
//      ),
//    );
//  }
