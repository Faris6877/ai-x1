// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ContentsModels {
  final String role;

  final List<PartsModel> parts;
  ContentsModels({
    required this.role,
    required this.parts,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'role': role,
      'parts': parts.map((x) => x.toMap()).toList(),
    };
  }

  factory ContentsModels.fromMap(Map<String, dynamic> map) {
    return ContentsModels(
      role: map['role'] as String,
      parts: List<PartsModel>.from(
        (map['parts'] as List<int>).map<PartsModel>(
          (x) => PartsModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory ContentsModels.fromJson(String source) =>
      ContentsModels.fromMap(json.decode(source) as Map<String, dynamic>);
}

class PartsModel {
  final String text;
  PartsModel({
    required this.text,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'text': text,
    };
  }

  factory PartsModel.fromMap(Map<String, dynamic> map) {
    return PartsModel(
      text: map['text'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PartsModel.fromJson(String source) =>
      PartsModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

class CandidateText {
  final String text;

  CandidateText(this.text);

  factory CandidateText.fromJson(Map<String, dynamic> json) {
    if (json.containsKey('text')) {
      return CandidateText(json['text'] as String); // Explicit type casting
    } else {
      // Handle potential errors/fallback values as needed
      throw ArgumentError('Missing required field "text" in JSON data.');
    }
  }

  Map<String, dynamic> toJson() {
    return {'text': text};
  }
}

class CandidatePart {
  final CandidateText? text;

  CandidatePart(this.text);

  factory CandidatePart.fromJson(Map<String, dynamic> json) {
    return CandidatePart(
      json.containsKey('text') ? CandidateText.fromJson(json['text']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {'text': text?.toJson()};
  }
}

class Candidate {
  final Map<String, dynamic>? content;
  final String? finishReason;
  final int? index;
  Candidate({
    this.content,
    this.finishReason,
    this.index,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'content': content,
      'finishReason': finishReason,
      'index': index,
    };
  }

  factory Candidate.fromMap(Map<String, dynamic> map) {
    return Candidate(
      content: map['content'] != null
          ? Map<String, dynamic>.from((map['content'] as Map<String, dynamic>))
          : null,
      finishReason:
          map['finishReason'] != null ? map['finishReason'] as String : null,
      index: map['index'] != null ? map['index'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Candidate.fromJson(String source) =>
      Candidate.fromMap(json.decode(source) as Map<String, dynamic>);
}
