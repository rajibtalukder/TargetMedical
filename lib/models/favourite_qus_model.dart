import 'dart:convert';

class FavouriteQusModel {
  final Explanation ques;
  final List<Option> option;
  final String ans;
  final Explanation explanation;

  FavouriteQusModel({
    required this.ques,
    required this.option,
    required this.ans,
    required this.explanation,
  });

  factory FavouriteQusModel.fromJson(String str) =>
      FavouriteQusModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory FavouriteQusModel.fromMap(Map<String, dynamic> json) => FavouriteQusModel(
    ques: Explanation.fromMap(json["ques"]),
    option: List<Option>.from(json["option"].map((x) => Option.fromMap(x))),
    ans: json["ans"],
    explanation: Explanation.fromMap(json["explanation"]),
  );

  Map<String, dynamic> toMap() => {
    "ques": ques.toMap(),
    "option": List<dynamic>.from(option.map((x) => x.toMap())),
    "ans": ans,
    "explanation": explanation.toMap(),
  };
}

class Explanation {
  final String data;
  final Type type;

  Explanation({
    required this.data,
    required this.type,
  });

  factory Explanation.fromJson(String str) =>
      Explanation.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Explanation.fromMap(Map<String, dynamic> json) => Explanation(
    data: json["data"],
    type: typeValues.map[json["type"]]!,
  );

  Map<String, dynamic> toMap() => {
    "data": data,
    "type": typeValues.reverse[type],
  };
}

enum Type {
  TEXT
}

final typeValues = EnumValues({
  "text": Type.TEXT,
});

class Option {
  final int index;
  final String data;
  final Type type;

  Option({
    required this.index,
    required this.data,
    required this.type,
  });

  factory Option.fromJson(String str) => Option.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Option.fromMap(Map<String, dynamic> json) => Option(
    index: json["index"],
    data: json["data"],
    type: typeValues.map[json["type"]]!,
  );

  Map<String, dynamic> toMap() => {
    "index": index,
    "data": data,
    "type": typeValues.reverse[type],
  };
}

class EnumValues<T> {
  final Map<String, T> map;
  late final Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
