import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:tiktok_clone/firebase_options.dart';
import 'package:tiktok_clone/main.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

//setup=테스트가 본격적으로 시작되기 전에 돌아가는 함수.
  setUp(() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    await FirebaseAuth.instance.signOut();
  });
  testWidgets("Create Account Flow", (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: TikTokApp(),
      ),
    );
    //pumpAndSettle 애니메이션 효과, 화면 전환 등으로 나오는 프레임은 넘어가고 화면의 최종 프레임만 렌더링.
    await tester.pumpAndSettle();
    expect(find.text("Sign up for TikTok"), findsOneWidget);
    final login = find.text("Log in");
    expect(login, findsOneWidget);
    await tester.tap(login);
    await tester.pumpAndSettle();
    final signUp = find.text("Sign Up");
    expect(signUp, findsOneWidget);
    await tester.tap(signUp);
    await tester.pumpAndSettle();
    final emailBtn = find.text("Use email & password");
    expect(emailBtn, findsOneWidget);
    await tester.tap(emailBtn);
    await tester.pumpAndSettle();
  });
  //tearDown=테스트가 완료된 다음에 돌아가는 함수
  tearDown(() => null);
}
