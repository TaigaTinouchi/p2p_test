import 'package:p2p_test/ui/components/navigation_item.dart';
import 'package:p2p_test/ui/core/ui_exporter.dart';

class Mobile extends ConsumerWidget {
  const Mobile({
    super.key,
    required this.currentIndex,
    required this.onTapNavigationBarItem,
  });

  final int currentIndex;
  final void Function(int) onTapNavigationBarItem;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: NavigationItem.values[currentIndex].page,
      bottomNavigationBar: BottomNavigationBar(
        items: NavigationItem.values.map((item) => BottomNavigationBarItem(
          icon: Icon(item.icon),
          label: item.title,
        )).toList(),
        currentIndex: currentIndex,
        selectedItemColor: Colors.amber[800],
        onTap: (index) => onTapNavigationBarItem(index),
      ),
    );
  }
}
