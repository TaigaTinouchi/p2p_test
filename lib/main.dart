import 'package:p2p_test/riverpod/firebase/firebase_app/app.dart';
import 'package:p2p_test/riverpod/theme/theme.dart';
import 'package:p2p_test/ui/core/ui_exporter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    UncontrolledProviderScope(
      container: ProviderContainer(),
      child: const App(),
    )
  );
}

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    final router = ref.watch(routerProvider);
    return ref.watch(fbAppProvider).when(
      data: (app) => MaterialApp.router(
        title: 'P2P Test',
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        themeMode: themeMode,
        routerConfig: router,
        builder: (context, child) {
          // 現在のMediaQueryデータを取得
          final mediaQueryData = MediaQuery.of(context);
          // テキストスケールファクターを制限
          final clampedTextScaler = mediaQueryData.textScaler.clamp(
            minScaleFactor: 0.8,
            maxScaleFactor: 1.0,
          );
          if (child == null) {
            return const SizedBox();
          }
          // 新しいMediaQueryDataを作成して適用
          return MediaQuery(
            data: mediaQueryData.copyWith(textScaler: clampedTextScaler),
            child: child,
          );
        },
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, _) => Center(child: Text('Error: $error')),
    );
  }
}
