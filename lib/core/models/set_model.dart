import 'package:flutter/animation.dart';

class SetModel {
  final int id;
  final String title;
  final String description;
  final Color color;
  final String icon;
  final int folderId;
  final int? numOfCards;
  final String? createdAt;

  SetModel({
    required this.id,
    required this.title,
    required this.description,
    required this.color,
    required this.icon,
    required this.folderId,
    this.numOfCards,
    this.createdAt,
  });

  factory SetModel.fromSql(Map<String, dynamic> map) {
    return SetModel(
        id: map['set_id'],
        title: map['set_title'],
        description: map['set_desc'],
        color: Color(int.parse(map['set_color'], radix: 16)),
        icon: map['set_icon'],
        folderId: map['folder_id'],
        numOfCards: map['num_of_cards'],
        createdAt: map['created_at']);
  }
}
