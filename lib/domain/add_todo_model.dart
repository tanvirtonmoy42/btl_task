import 'dart:convert';

import 'package:equatable/equatable.dart';

class AddTodoModel extends Equatable {
  final String title;
  final String description;
  final bool isCompleted;
  const AddTodoModel({
    required this.title,
    required this.description,
    required this.isCompleted,
  });

  AddTodoModel copyWith({
    String? title,
    String? description,
    bool? isCompleted,
  }) {
    return AddTodoModel(
      title: title ?? this.title,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'is_completed': isCompleted,
    };
  }

  factory AddTodoModel.fromMap(Map<String, dynamic> map) {
    return AddTodoModel(
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      isCompleted: map['is_completed'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory AddTodoModel.fromJson(String source) =>
      AddTodoModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'AddTodoModel(title: $title, description: $description, isCompleted: $isCompleted)';

  @override
  List<Object> get props => [title, description, isCompleted];
}
