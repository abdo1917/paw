import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MessageDetailView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back_ios, color: Colors.grey),
        elevation: 1,
        title: Text("Nicole", style: Theme.of(context).textTheme.displaySmall),
        backgroundColor: Colors.white,
        actions: [
          const Icon(Icons.call),
          SizedBox(
            width: 0.05.sw,
          ),
          const CircleAvatar(
            backgroundImage: AssetImage('assets/images/m4.jpeg'),
          ),
          SizedBox(
            width: 0.05.sw,
          ),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                const ChatBubble(
                  isSelf: false,
                  text: "Your pet was found at Alphonso Street",
                  //  "Hello , welcome to Shirtz How may I help You",
                ),
                const ChatBubble(
                  isSelf: true,
                  text: "Thank you so much!, I was so worried",
                  //  "Hello , welcome to Shirtz How may I help You",
                ),
                const ChatBubble(
                  isSelf: false,
                  text: "No problem, he's safe and sound",
                  //  "Hello , welcome to Shirtz How may I help You",
                ),
                const ChatBubble(
                  isSelf: true,
                  text: "I'm on my way!",
                  //  "Hello , welcome to Shirtz How may I help You",
                ),
                SizedBox(
                  height: 0.09.sh,
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 0.08.sh,
              width: 0.95.sw,
              color: Theme.of(context).primaryColor,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      child: TextField(
                        // controller: chatText,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Type your message...",
                          hintStyle: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.attach_file),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.mic),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: () async {},
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final String text;
  final bool isSelf;
  const ChatBubble({
    super.key,
    required this.text,
    this.isSelf = false,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSelf ? Alignment.topRight : Alignment.topLeft,
      child: SizedBox(
        width: 0.5.sw,
        child: Bubble(
          padding: const BubbleEdges.all(15),
          radius: const Radius.circular(25),
          margin: const BubbleEdges.only(top: 15),
          color: !isSelf ? Colors.white : Theme.of(context).primaryColor,
          child: Text(
            text,
            textAlign: TextAlign.left,
            style: isSelf
                ? Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: Colors.white)
                : Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ),
    );
  }
}
