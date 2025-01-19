import 'package:p2p_test/app.dart';
import 'package:p2p_test/riverpod/firebase/auth/auth.dart';
import 'package:p2p_test/riverpod/theme/theme.dart';
import 'package:p2p_test/ui/components/tool/qr_code_reader.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:p2p_test/ui/components/dialog/dialog_util.dart';
import 'package:p2p_test/ui/core/ui_exporter.dart';


class Settings extends ConsumerWidget {
  const Settings ({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(themeModeProvider.notifier).isDarkMode;
    final uid = ref.watch(fbAuthProvider.notifier).uid;
    return Scaffold(
      appBar: AppBar(
        title: const Text('設定'),
      ),
      body:  ListView(
        children: [
          if (uid != null)...[
            Stack(
              children: [
                Container(
                  padding: const EdgeInsets.all(10.0),
                  alignment: Alignment.center,
                  child: QrImageView(
                    data: uid,
                    version: QrVersions.auto,
                    size: 200.0,
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    dataModuleStyle: QrDataModuleStyle(
                      dataModuleShape: QrDataModuleShape.square,
                      color: Theme.of(context).textTheme.bodyLarge?.color,
                    ),
                    eyeStyle: QrEyeStyle(
                      eyeShape: QrEyeShape.square,
                      color: Theme.of(context).textTheme.bodyLarge?.color,
                    ),
                  ),
                ),
                Positioned(
                  right: 40.0,
                  bottom: 10.0,
                  child: IconButton(
                    icon: const Icon(Icons.camera_alt),
                    onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => QrCodeReader()),
                    ),
                  ),
                ),
              ],
            ),
          ],
          Container(
            padding: const EdgeInsets.only(bottom: 10.0),
            alignment: Alignment.center,
            child: Text('マイQRコード'),
          ),
          const Divider(),
          ListTile(
            title: Text('Profile'),
            leading: Icon(Icons.person),
            subtitle: Text('プロフィールを編集する'),
          ),
          const Divider(),
          ListTile(
            title: Text('Dark Mode'),
            leading: Icon(Icons.dark_mode),
            subtitle: Text('ダークモードを有効にする'),
            trailing: Switch(
              value: isDarkMode,
              onChanged: (_) => ref.read(themeModeProvider.notifier).toggle(),
            ),
          ),
          const Divider(),
          ListTile(
            title: Text('Notification'),
            leading: Icon(Icons.notifications),
            subtitle: Text('通知を有効にする'),
          ),
          const Divider(),
          ListTile(
            title: Text('Language'),
            leading: Icon(Icons.language),
            subtitle: Text('言語を選択する'),
          ),
          const Divider(),
          ListTile(
            title: Text('Logout'),
            leading: Icon(Icons.logout),
            subtitle: Text('ログアウトする'),
            onTap: () => DialogUtil.showAlertDialog(
              context: context,
              title: 'ログアウト',
              message: 'ログアウトしますか？',
              positiveText: 'ログアウト',
              negativeText: 'キャンセル',
              onPositive: () async => {
                await ref.read(fbAuthProvider).signOut(),
                runApp(
                  UncontrolledProviderScope(
                    key: UniqueKey(),
                    container: ProviderContainer(),
                    child: const App(),
                  )
                ),
              },
            )
          ),
          const Divider(),
        ],
      ),
    );
  }
}
