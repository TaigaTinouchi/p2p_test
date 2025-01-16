import 'package:flutter/gestures.dart';
import 'package:p2p_test/ui/components/navigation_item.dart';
import 'package:p2p_test/ui/core/ui_exporter.dart';

class Desktop extends ConsumerWidget{
  const Desktop ({
    super.key,
    required this.currentIndex,
    required this.onTapListTile
  });

  final int currentIndex;
  final void Function(int) onTapListTile;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Desktop Layout'),
      ),
      body: NavigationItem.values[currentIndex].page,
      drawerDragStartBehavior: DragStartBehavior.down,
      drawerScrimColor: Colors.black.withValues(alpha: 0.1),
      drawerEdgeDragWidth: 100,
      drawerEnableOpenDragGesture: true,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('メニュー'),
            ),
            ...NavigationItem.values.map((item) => ListTile(
              title: Text(item.title),
              leading: Icon(item.icon),
              onTap: () => onTapListTile(item.index),
            )),
          ],
        ),
      ),
    );
  }
}
