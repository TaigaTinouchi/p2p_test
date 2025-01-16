import 'package:hive_ce_flutter/hive_flutter.dart';

import 'contents.dart';

class ChatRoom extends HiveObject {
  ChatRoom({
    required this.roomId,
    required this.roomName,
    required this.roomType,
    required this.roomIcon,
    required this.roomContents,
    required this.roomMembers,
    this.roomDescription,
  });

  String roomId;
  String roomName;
  String roomType;
  String roomIcon;
  List<Contents> roomContents;
  List<String> roomMembers;
  String? roomDescription;
}
