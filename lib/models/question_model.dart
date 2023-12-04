import 'dart:convert';

class QuestionModel {
  final Ques? ques;
  final List<Option>? option;
  final int? ans;
  final Explanation? explanation;
  int? selectedAnsIndex;

  QuestionModel({
    this.ques,
    this.option,
    this.ans,
    this.explanation,
    this.selectedAnsIndex,
  });

  factory QuestionModel.fromJson(String str) =>
      QuestionModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory QuestionModel.fromMap(Map<String, dynamic> json) => QuestionModel(
    ques: json["ques"] == null ? null : Ques.fromMap(json["ques"]),
    option: json["option"] == null
        ? []
        : List<Option>.from(json["option"]!.map((x) => Option.fromMap(x))),
    ans: int.parse(json["ans"]),
    explanation: json["explanation"] == null
        ? null
        : Explanation.fromMap(json["explanation"]),
  );

  Map<String, dynamic> toMap() => {
    "ques": ques?.toMap(),
    "option": option == null
        ? []
        : List<dynamic>.from(option!.map((x) => x.toMap())),
    "ans": ans,
    "explanation": explanation?.toMap(),
  };
}

class Explanation {
  final String? data;
  final Type? type;

  Explanation({
    this.data,
    this.type,
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

class Option {
  final int? index;
  final String? data;
  final Type? type;

  Option({
    this.index,
    this.data,
    this.type,
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

// ignore: constant_identifier_names
enum Type { TEXT, IMAGE }

final typeValues = EnumValues({"image": Type.IMAGE, "text": Type.TEXT});

class Ques {
  final int ? mcqId;
  final String? data;
  final Type? type;

  Ques({
    this.mcqId,
    this.data,
    this.type,
  });

  factory Ques.fromJson(String str) => Ques.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Ques.fromMap(Map<String, dynamic> json) => Ques(
    mcqId: json["mcq_id"],
    data: json["data"],
    type: typeValues.map[json["type"]],
  );

  Map<String, dynamic> toMap() => {
    "mcq_id": mcqId,
    "data": data,
    "type": typeValues.reverse[type],
  };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
