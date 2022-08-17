// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

class SearchDetails {
  final String location;
  final DateTime start;
  final DateTime end;
  final int rooms;
  final int adults;
  final int kids;
  SearchDetails({
    required this.location,
    required this.start,
    required this.end,
    required this.rooms,
    required this.adults,
    required this.kids,
  });

  SearchDetails copyWith({
    String? location,
    DateTime? start,
    DateTime? end,
    int? rooms,
    int? adults,
    int? kids,
  }) {
    return SearchDetails(
      location: location ?? this.location,
      start: start ?? this.start,
      end: end ?? this.end,
      rooms: rooms ?? this.rooms,
      adults: adults ?? this.adults,
      kids: kids ?? this.kids,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'location': location,
      'start': start.millisecondsSinceEpoch,
      'end': end.millisecondsSinceEpoch,
      'rooms': rooms,
      'adults': adults,
      'kids': kids,
    };
  }

  factory SearchDetails.fromMap(Map<String, dynamic> map) {
    return SearchDetails(
      location: map['location'] as String,
      start: DateTime.fromMillisecondsSinceEpoch(map['start'] as int),
      end: DateTime.fromMillisecondsSinceEpoch(map['end'] as int),
      rooms: map['rooms'] as int,
      adults: map['adults'] as int,
      kids: map['kids'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory SearchDetails.fromJson(String source) =>
      SearchDetails.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'SearchDetails(location: $location, start: $start, end: $end, rooms: $rooms, adults: $adults, kids: $kids)';
  }

  @override
  bool operator ==(covariant SearchDetails other) {
    if (identical(this, other)) return true;

    return other.location == location &&
        other.start == start &&
        other.end == end &&
        other.rooms == rooms &&
        other.adults == adults &&
        other.kids == kids;
  }

  @override
  int get hashCode {
    return location.hashCode ^
        start.hashCode ^
        end.hashCode ^
        rooms.hashCode ^
        adults.hashCode ^
        kids.hashCode;
  }
}
