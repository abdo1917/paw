import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:paw_in_out/ui/forum/fourm-detail-page.dart';


class ForumPage extends StatefulWidget {
  final String title = "Forum";

  const ForumPage({super.key});

  @override
  _ForumPageState createState() => _ForumPageState();
}

class _ForumPageState extends State<ForumPage> {
  /// Top Icons
  var topCategoyIcons = Container(
    alignment: Alignment.center,
    decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.amber.shade300,
            Colors.amber.shade400,
          ],
          begin: const FractionalOffset(0.0, 0.0),
          end: const FractionalOffset(0.0, 1.0),
          stops: [0.0, 1.0],
          tileMode: TileMode.clamp,
        )),
    child: Container(
      alignment: Alignment.bottomCenter,
      margin: const EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 0.0,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        // border: new Border.all(color: Colors.black, width: 1.0),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CategoryIcon(FontAwesomeIcons.dog, "Dogs", false),
          CategoryIcon(FontAwesomeIcons.cat, "Cats", false),
          CategoryIcon(FontAwesomeIcons.crow, "Crow", false),
          CategoryIcon(FontAwesomeIcons.fish, "Fish", false),
        ],
      ),
    ),
  );

  var categoryMetric = Container(
    padding: const EdgeInsets.all(5.0),
    margin: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 15.0),
    decoration: const BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Colors.white,
          Colors.white,
        ],
        begin: FractionalOffset(0.0, 0.5),
        end: FractionalOffset(0.0, 1.0),
        stops: [0.0, 1.0],
        tileMode: TileMode.clamp,
      ),
      // border: new Border.all(color: Colors.black, width: 1.0),
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(30.0),
        bottomRight: Radius.circular(30.0),
      ),
    ),
    child: const Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        CategoryIcon(FontAwesomeIcons.cuttlefish, "Cuttle Fish", false),
        CategoryIcon(FontAwesomeIcons.horse, "Horse", false),
        CategoryIcon(FontAwesomeIcons.earlybirds, "Sparrow", false),
        CategoryIcon(FontAwesomeIcons.dove, "Pigeon", false),
      ],
    ),
  );

  static final listItemsData = [
    ListEntry("Forum 1", "test", "Dog breed", 18, 2, true),
    ListEntry("Forum 2", "test", "best pedigree", 15, 3, false),
    ListEntry("Forum 3", "test", "Adopting dog", 17, 0, false),
    ListEntry("Forum 4", "test", "lost my dog", 12, 2, true),
    ListEntry("Forum 5", "test", "mate for dog", 41, 5, true),
    ListEntry("Forum 6", "test", "PAW tag", 12, 1, true),
  ];
  var listView = ListView.builder(
    itemBuilder: (BuildContext context, int index) =>
    EntryItem(listItemsData[index]),
    itemCount: listItemsData.length,
    shrinkWrap: true,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Colors.amber[200],
      appBar: AppBar(
        centerTitle: false,
        elevation: 0.0,
        title: Text(
          widget.title,
          textScaleFactor: 1.3,
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: _onSearchPressed,
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[topCategoyIcons, categoryMetric, listView],
        ),
      ),
    );
  }

  void _onSearchPressed() {
    Navigator.pop(context);
  }
}

class ListEntry {
  final String title;
  final String icon;
  final String description;
  final int views;
  final int responses;
  final bool answered;

  ListEntry(this.title, this.icon, this.description, this.views, this.responses,
      this.answered);
}

class CategoryIcon extends StatelessWidget {
  const CategoryIcon(this.icon, this.iconText, this.selected, {super.key});

  final String iconText;
  final IconData icon;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[Icon(icon), Text(iconText)],
    );
  }
}

class EntryItem extends StatelessWidget {
  const EntryItem(this.entry, {super.key});

  final ListEntry entry;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3.0),
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 3.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
      ),
      child: ListTile(
        title: Text(entry.title),
        subtitle: Text(entry.description),
        leading: Icon(
          Icons.dashboard,
          color: Colors.amber[400],
        ),
        // trailing:
        //     CategoryIcon(Icons.remove_red_eye, entry.views.toString(), false),
        trailing: Container(
          width: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              CategoryIcon(
                  Icons.remove_red_eye, entry.views.toString(), false),
              CategoryIcon(
                  Icons.comment, entry.responses.toString(), false),
            ],
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ForumDetailPage()));
        },
      ),
    );
  }
}
