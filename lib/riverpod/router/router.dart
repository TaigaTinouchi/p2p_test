import 'package:go_router/go_router.dart';
import 'package:p2p_test/riverpod/firebase/auth/is_sign_in.dart';
import 'package:p2p_test/riverpod/router/navigator_key.dart';
import 'package:p2p_test/ui/components/tool/qr_code_reader.dart';
import 'package:p2p_test/ui/core/app_layout.dart';
import 'package:p2p_test/ui/page/sign_in/sign_in_page.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'router.g.dart';

@riverpod
GoRouter router(Ref ref) {
  final authStateStream = ref.watch(isSignInProvider);
  return GoRouter(
    navigatorKey: ref.watch(navigatorKeyProvider),
    redirect: (context, state) {
      // 非同期状態がロード中であれば、リダイレクトは行わない。
      if (authStateStream.isLoading || authStateStream.hasError) return null;

      final isAuth = authStateStream.valueOrNull != null;
      return isAuth ? AppLayout.routeLocation : SignInPage.routeLocation;
    },
    routes: [
      GoRoute(
        path: AppLayout.routeLocation,
        builder: (context, state) => const AppLayout(),
      ),
      GoRoute(
        path: SignInPage.routeLocation,
        builder: (context, state) => const SignInPage(),
      ),
      GoRoute(
        path: QrCodeReader.routeLocation,
        builder: (context, state) => const QrCodeReader(),
      ),
    ],
  );
}
