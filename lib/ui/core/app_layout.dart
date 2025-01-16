import 'package:p2p_test/ui/core/layout/desktop.dart';
import 'package:p2p_test/ui/core/layout/mobile.dart';
import 'package:p2p_test/ui/core/ui_exporter.dart';

class AppLayout extends HookConsumerWidget {
  const AppLayout({super.key});

  static const routeLocation = '/';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = useState(0);

    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return Mobile(
            currentIndex: currentIndex.value,
            onTapNavigationBarItem: (index) => currentIndex.value = index,
          );
        } else {
          return Desktop(
            currentIndex: currentIndex.value,
            onTapListTile: (index) => currentIndex.value = index,
          );
        }
      },
    );
  }
}
