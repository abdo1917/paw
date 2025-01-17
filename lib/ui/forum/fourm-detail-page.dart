import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class ForumDetailPage extends StatefulWidget {
  const ForumDetailPage({super.key});

  @override
  _ForumDetailPageState createState() => _ForumDetailPageState();
}

var ForumPostArr = [
  ForumPostEntry("User1", "2 Days ago", 0 , 0 , "Hello,\n\n We rescued a small dog during the summer and she’s settled into the house brilliantly. She’s under 7kg, but is very active and does like a good chew/crunch, so I’ve been looking into more natural treats for her - bully sticks, duck/chicken necks, biltong, venison ears etc.What I’m not clear on is how often I should be giving her these in order for her to get enjoyment from them but so not to risk her putting on weight: she’s a lovely condition at present. Are some more high calorie than the others so that I would need to consider reducing her meals in order to balance it out? I was thinking a chew once or twice a week max- does that sound reasonable?"),
  ForumPostEntry("User2", "23 Hours ago", 1 , 0 , "As a small dog you are right to be concerned about weight. \n I'd just reduce her meals slightly on the days you give the treats. My dogs are all around 20kg give or take, and they get a natural treat every day at lunchtime.I'd just get a variety and cut them up into smaller pieces. You can probably fine their nutritional info on the internet somewhere if it's not provided on the packaging. Then reduce her meals accordingly. It's not something I worry about much with my dogs as I feed by eye anyway, adding more or taking away depending on their condition, but if I had a small dog I'd certainly be more aware of what I was feeding treat wise."),
  ForumPostEntry("User3", "2 Days ago", 5 , 0 , "My dog is just under 5.6Kg, he gets chews a couple of times a week? I only feed gross animal bits chews (and occasionally Yakkers) rather than more highly processed carbohydrate commercial chews, but I separate them out in my head into high fat and low fat categories, and won't give a high fat one twice in one week. Dog gets most of his food as part of training, and the situation where he gets chews are thing where I'm busy and need him to occupy himself quietly, which also results in less training time. So effectively he gets that instead of say 1/3 of his daily food allowance? But I just roughly balance it up in my head. It does help though that I have scales I can weigh him on at home, so I can tell very quickly if I've messed up somewhere."),
  //new ForumPostEntry("User4", "2 Days ago", 0 , 0 , "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
];

class _ForumDetailPageState extends State<ForumDetailPage> {
  @override
  Widget build(BuildContext context) {
    var questionSection = Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          const Text(
            "Natural Chews - how often to give to a small dog?",
            textScaleFactor: 1.5,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                IconWithText(FontAwesomeIcons.dog, "Dog"),
                IconWithText(
                  Icons.check_circle,
                  "Answered",
                  iconColor: Colors.green,
                ),
                IconWithText(Icons.remove_red_eye, "54")
              ],
            ),
          ),
          const Divider()
        ],
      ),
    );

    var responses = Container(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) => ForumPost(ForumPostArr[index]),
          itemCount: ForumPostArr.length,
        )
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text("Dog Forum"),
      ),
      body: Column(
        children: <Widget>[
          questionSection,
          Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: responses,
              ))
        ],
      ),
    );
  }
}

class ForumPostEntry{
  final String username;
  final String hours;
  final int likes;
  final int dislikes;
  final String text;

  ForumPostEntry(this.username, this.hours, this.likes, this.dislikes, this.text);
}

class ForumPost extends StatelessWidget {
  final ForumPostEntry entry;

  ForumPost(this.entry, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        color: Colors.amber[400],
        borderRadius: const BorderRadius.all(Radius.circular(20.0)),
      ),
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Colors.amber[400],
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0)),
            ),
            child: Row(
              children: <Widget>[
                const CircleAvatar(
                  radius: 20.0,
                  backgroundImage: AssetImage('assets/images/p1.jpg'),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                          entry.username
                      ),
                      Text(
                          entry.hours
                      ),
                    ],
                  ),
                ),
                Row(
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.all(2.0),
                      child: Icon(Icons.thumb_up),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Text(entry.likes.toString()),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(2.0),
                      child: Icon(Icons.thumb_down),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0, left: 2.0),
                      child: Text(entry.dislikes.toString()),
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 2.0,right: 2.0,bottom: 2.0),
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: const BorderRadius.only(bottomLeft :Radius.circular(20.0),bottomRight :Radius.circular(20.0))
            ),
            child: Text(entry.text,style: const TextStyle(fontSize: 15),),
          ),
        ],
      ),
    );
  }
}

class IconWithText extends StatelessWidget {
  final IconData iconData;
  final String text;
  final Color? iconColor;

  IconWithText(this.iconData, this.text, {super.key, this.iconColor});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Icon(
            iconData,
            color: iconColor,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(text),
          ),
        ],
      ),
    );
  }
}