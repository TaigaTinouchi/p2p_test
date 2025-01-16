import 'package:p2p_test/ui/core/ui_exporter.dart';

class Notifications extends ConsumerWidget {
  const Notifications ({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('通知'),
      ),
      body: const Placeholder(),
    );
  }
}
