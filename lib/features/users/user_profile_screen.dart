import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          title: const Text('사용자'),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const FaIcon(
                FontAwesomeIcons.gear,
                size: Sizes.size20,
              ),
            ),
          ],
        ),
        SliverToBoxAdapter(
          child: Column(
            children: [
              const CircleAvatar(
                radius: 50,
                foregroundImage: NetworkImage(
                    'https://d18-invdn-com.investing.com/company_logo/9bf775b984346710b77b7ee5cebafeea.jpg?width=170&height=170'),
              ),
              Gaps.v20,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    '@사용자',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: Sizes.size18,
                    ),
                  ),
                  Gaps.h5,
                  FaIcon(
                    FontAwesomeIcons.solidCircleCheck,
                    size: Sizes.size16,
                    color: Colors.blue.shade500,
                  ),
                ],
              ),
              Gaps.v24,
              SizedBox(
                height: 48,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        const Text(
                          '97',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: Sizes.size18,
                          ),
                        ),
                        Gaps.v3,
                        Text(
                          'Following',
                          style: TextStyle(
                            color: Colors.grey.shade500,
                            fontWeight: FontWeight.bold,
                            fontSize: Sizes.size16,
                          ),
                        ),
                      ],
                    ),
                    VerticalDivider(
                      width: Sizes.size32,
                      thickness: Sizes.size1,
                      indent: Sizes.size14,
                      endIndent: Sizes.size14,
                      color: Colors.grey.shade400,
                    ),
                    Column(
                      children: [
                        const Text(
                          '10M',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: Sizes.size18,
                          ),
                        ),
                        Gaps.v3,
                        Text(
                          'Followers',
                          style: TextStyle(
                            color: Colors.grey.shade500,
                            fontWeight: FontWeight.bold,
                            fontSize: Sizes.size16,
                          ),
                        ),
                      ],
                    ),
                    VerticalDivider(
                      width: Sizes.size32,
                      thickness: Sizes.size1,
                      indent: Sizes.size14,
                      endIndent: Sizes.size14,
                      color: Colors.grey.shade400,
                    ),
                    Column(
                      children: [
                        const Text(
                          '222M',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: Sizes.size18,
                          ),
                        ),
                        Gaps.v3,
                        Text(
                          'Likes',
                          style: TextStyle(
                            color: Colors.grey.shade500,
                            fontWeight: FontWeight.bold,
                            fontSize: Sizes.size16,
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
      ],
    );
  }
}
