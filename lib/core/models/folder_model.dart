import 'package:flutter/material.dart';

class FolderModel {
  final int id;
  final String title;
  final String description;
  final Color color;
  final int numOfSets;
  final int numOfCards;
  final String? createdAt;

  FolderModel(
      {required this.id,
      required this.title,
      required this.description,
      required this.color,
      required this.numOfSets,
      required this.numOfCards,
      this.createdAt});

  factory FolderModel.fromSql(Map<String, dynamic> map) {
    return FolderModel(
        id: map['folder_id'],
        title: map['folder_title'],
        description: map['folder_desc'],
        color: Color(int.parse(map['folder_color'], radix: 16)),
        numOfSets: map['num_of_sets'],
        numOfCards: map['num_of_cards'],
        createdAt: map['created_at']);
  }
}
