import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/authentication/username_screen.dart';
import 'package:tiktok_clone/features/authentication/login_screen.dart';
import 'package:tiktok_clone/features/authentication/widgets/auth_button.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  void _onLoginTap(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const LoginScreen(),
    ));
  }

  void _onEmailTap(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const UsernameScreen(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (
      BuildContext context,
      //orientation=디바이스 방향을 보여줌.
      //portrait면 세로, landscape면 가로.
      Orientation orientation,
    ) {
      //이렇게 회전했을 때 경고 화면만 띄우는 방법도 있긴 함.
      /* if (orientation == Orientation.landscape) {
          return const Scaffold(
            body: Center(
              child: Text('Plz rotate ur phone.'),
            ),
          );
        } */
      return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size40,
            ),
            child: Column(
              children: [
                Gaps.v80,
                Text(
                  'Sign up for TikTok',
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        color: Colors.red,
                      ),
                ),
                Gaps.v20,
                Opacity(
                  opacity: 0.7,
                  child: Text(
                    "Create a profile, follow other accounts, make your own videos, and more.",
                    style: Theme.of(context).textTheme.titleMedium,
                    // TextStyle(
                    //   fontSize: Sizes.size16,
                    //   // color: isDarkMode(context) ?Colors.grey.shade300 : Colors.black45,
                    //   // fontWeight: FontWeight.w700,
                    // ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Gaps.v40,
                if (orientation == Orientation.portrait) ...
                  //...은 바로 밑 리스트에 있는 것들을 꺼내서 위 조건문을 전부 적용시키는 기능.
                  [
                  GestureDetector(
                    onTap: () => _onEmailTap(context),
                    child: const AuthButton(
                        icon: FaIcon(FontAwesomeIcons.user),
                        text: "Use email & password"),
                  ),
                  Gaps.v16,
                  const AuthButton(
                    icon: FaIcon(FontAwesomeIcons.apple),
                    text: "Continue with Apple",
                  ),
                ],
                if (orientation == Orientation.landscape)
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () => _onEmailTap(context),
                          child: const AuthButton(
                              icon: FaIcon(FontAwesomeIcons.user),
                              text: "Use email & password"),
                        ),
                      ),
                      Gaps.h16,
                      const Expanded(
                        child: AuthButton(
                          icon: FaIcon(FontAwesomeIcons.apple),
                          text: "Continue with Apple",
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
            // color: Colors.grey.shade50,
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: Sizes.size32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Already have an account?'),
                  Gaps.h5,
                  GestureDetector(
                    onTap: () => _onLoginTap(context),
                    child: Text(
                      'Log in',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                  ),
                ],
              ),
            )),
      );
    });
  }
}
