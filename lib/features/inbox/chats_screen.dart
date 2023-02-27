import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({super.key});

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: const Text('Direct messages'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const FaIcon(FontAwesomeIcons.plus),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: Sizes.size10),
        children: [
          ListTile(
            leading: const CircleAvatar(
              radius: 30,
              foregroundImage: NetworkImage(
                  'https://product.cdn.cevaws.com/var/storage/images/_aliases/reference/media/feliway-2017/images/kor-kr/1_gnetb-7sfmbx49emluey4a/6341829-1-kor-KR/1_gNETb-7SfMBX49EMLUeY4A.jpg'),
              child: Text('A'),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Text(
                  '사용자A',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                Text(
                  "시간 PM",
                  style: TextStyle(
                    color: Colors.grey.shade500,
                    fontSize: Sizes.size12,
                  ),
                ),
              ],
            ),
            subtitle: const Text("Don't forget to make video"),
          ),
        ],
      ),
    );
  }
}
