import 'package:p2p_test/riverpod/firebase/auth/auth.dart';
import 'package:p2p_test/ui/components/button/app_button.dart';
import 'package:p2p_test/ui/core/ui_exporter.dart';

class SignInPage extends HookConsumerWidget {
  const SignInPage ({super.key});

  static const routeLocation = '/sign_in';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailTextController = useTextEditingController();
    final passwordTextController = useTextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text('ログイン'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: emailTextController,
              decoration: const InputDecoration(
                hintText: 'メールアドレスを入力',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: passwordTextController,
              obscureText: true,
              decoration: const InputDecoration(
                hintText: 'パスワードを入力',
              ),
            ),
          ),
          AppButton(
            text: 'ログイン',
            onPressed: () async {
              final email = emailTextController.text;
              final password = passwordTextController.text;
              await ref.read(fbAuthProvider.notifier).signInWithEmailAndPassword(
                email: email,
                password: password,
                onSuccsess: () {},
                onCatchAuthException: () {},
                onFail: () {},
              );
            },
          ),
          AppButton(
            onPressed: () {
              ref.read(fbAuthProvider.notifier).registerWithEmailAndPassword(
                email: emailTextController.text,
                password: passwordTextController.text,
                onSuccsess: () {},
                onInvalidEmail: () {},
                onEmailAlreadyInUse: () {},
                onFail: () {},
              );
            },
            text: '新規登録',
          ),
        ],
      ),
    );
  }
}
