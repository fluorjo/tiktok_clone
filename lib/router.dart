import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok_clone/common/widgets/main_navigation/main_navigation_screen.dart';
import 'package:tiktok_clone/features/authentication/login_screen.dart';
import 'package:tiktok_clone/features/authentication/repos/authentication_repo.dart';
import 'package:tiktok_clone/features/authentication/sign_up_screen.dart';
import 'package:tiktok_clone/features/inbox/views/activity_screen.dart';
import 'package:tiktok_clone/features/inbox/views/chat_detail_screen.dart';
import 'package:tiktok_clone/features/inbox/views/chats_screen.dart';
import 'package:tiktok_clone/features/onboarding/interests_screen.dart';
import 'package:tiktok_clone/features/videos/views/video_recording_screen.dart';

final routerProvider = Provider(
  (ref) {
    //ref.watch(authState);
    return GoRouter(
      initialLocation: '/home',
      //state값에 따라 사용자를 어디로 리다이렉트 시킬 지 정할 수 있음.
      redirect: (context, state) {
        final isLoggedIn = ref.read(authRepo).isLoggedIn;
        //subloc = 라우터의 서브 로케이션 = 유저가 있는 곳.
        if (!isLoggedIn) {
          if (state.subloc != SignUpScreen.routeURL &&
              state.subloc != LoginScreen.routeURL) {
            return SignUpScreen.routeURL;
          }
        }
        return null;
      },
      routes: [
        GoRoute(
          name: SignUpScreen.routeName,
          path: SignUpScreen.routeURL,
          builder: (context, state) => const SignUpScreen(),
        ),
        GoRoute(
          name: LoginScreen.routeName,
          path: LoginScreen.routeURL,
          builder: (context, state) => const LoginScreen(),
        ),
        GoRoute(
          path: InterestsScreen.routeURL,
          name: InterestsScreen.routeName,
          builder: (context, state) => const InterestsScreen(),
        ),
        GoRoute(
          path: ActivityScreen.routeURL,
          name: ActivityScreen.routeName,
          builder: (context, state) => const ActivityScreen(),
        ),
        GoRoute(
          path: VideoRecordingScreen.routeURL,
          name: VideoRecordingScreen.routeName,
          pageBuilder: (context, state) => CustomTransitionPage(
            transitionDuration: const Duration(
              milliseconds: 150,
            ),
            child: const VideoRecordingScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              final position = Tween(
                begin: const Offset(0, 1),
                end: Offset.zero,
              ).animate(animation);
              return SlideTransition(
                position: position,
                child: child,
              );
            },
          ),
        ),
        GoRoute(
          path: ChatsScreen.routeURL,
          name: ChatsScreen.routeName,
          builder: (context, state) => const ChatsScreen(),
          routes: [
            GoRoute(
              path: ChatDetailScreen.routeURL,
              name: ChatDetailScreen.routeName,
              builder: (context, state) {
                final chatId = state.params['chatId']!;
                return ChatDetailScreen(chatId: chatId);
              },
            ),
          ],
        ),
        GoRoute(
          path: "/:tab(home|discover|inbox|profile)",
          name: MainNavigationScreen.routeName,
          builder: (context, state) {
            final tab = state.params['tab']!;
            return MainNavigationScreen(tab: tab);
          },
        ),
      ],
    );
  },
);
