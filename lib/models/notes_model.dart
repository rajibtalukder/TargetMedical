

import 'dart:convert';

class NotesModel {
  final List<Note>? notes;

  NotesModel({
    this.notes,
  });

  NotesModel copyWith({
    List<Note>? note,
  }) =>
      NotesModel(
        notes: note ?? notes,
      );

  factory NotesModel.fromJson(String str) => NotesModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory NotesModel.fromMap(Map<String, dynamic> json) => NotesModel(
    notes: json["note"] == null ? [] : List<Note>.from(json["note"]!.map((x) => Note.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "note": notes == null ? [] : List<dynamic>.from(notes!.map((x) => x.toMap())),
  };
}

class Note {
  final int? noteId;
  final String? noteName;
  final String? noteFileUrl;
  final int? subId;
  final String? subEnName;
  final int? chapterId;
  final String? chapterEnName;

  Note({
    this.noteId,
    this.noteName,
    this.noteFileUrl,
    this.subId,
    this.subEnName,
    this.chapterId,
    this.chapterEnName,
  });

  Note copyWith({
    int? noteId,
    String? noteName,
    String? noteFileUrl,
    int? subId,
    String? subEnName,
    int? chapterId,
    String? chapterEnName,
  }) =>
      Note(
        noteId: noteId ?? this.noteId,
        noteName: noteName ?? this.noteName,
        noteFileUrl: noteFileUrl ?? this.noteFileUrl,
        subId: subId ?? this.subId,
        subEnName: subEnName ?? this.subEnName,
        chapterId: chapterId ?? this.chapterId,
        chapterEnName: chapterEnName ?? this.chapterEnName,
      );

  factory Note.fromJson(String str) => Note.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Note.fromMap(Map<String, dynamic> json) => Note(
    noteId: json["note_id"],
    noteName: json["note_name"],
    noteFileUrl: json["note_file_url"],
    subId: json["sub_id"],
    subEnName: json["sub_en_name"],
    chapterId: json["chapter_id"],
    chapterEnName: json["chapter_en_name"],
  );

  Map<String, dynamic> toMap() => {
    "note_id": noteId,
    "note_name": noteName,
    "note_file_url": noteFileUrl,
    "sub_id": subId,
    "sub_en_name": subEnName,
    "chapter_id": chapterId,
    "chapter_en_name": chapterEnName,
  };
}
