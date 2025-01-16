import 'package:p2p_test/ui/core/ui_exporter.dart';

class Home extends ConsumerWidget {
  const Home ({super.key});

  @override

  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ホーム'),
      ),
      body: const Placeholder(),
    );
  }
}
