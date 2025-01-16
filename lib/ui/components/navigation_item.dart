import 'package:flutter/material.dart';
import 'package:p2p_test/ui/page/home/home.dart';
import 'package:p2p_test/ui/page/notifications/notifications.dart';
import 'package:p2p_test/ui/page/settings/settings.dart';

enum NavigationItem {
  home(
    title: 'ホーム',
    icon: Icons.home,
    page: Home(),
  ),
  friends(
    title: 'フレンド',
    icon: Icons.people,
    page: Notifications()
  ),
  settings(
    title: '設定',
    icon: Icons.settings,
    page: Settings()
  );

  const NavigationItem({
    required this.title,
    required this.icon,
    required this.page,
  });
  final String title;
  final IconData icon;
  final Widget page;
}
