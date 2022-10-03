// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class SearchCryteria extends Equatable {
  final String location;
  DateTimeRange timeRange;
  final int rooms;
  final int adults;
  final int kids;
  SearchCryteria({
    required this.location,
    required this.timeRange,
    required this.rooms,
    required this.adults,
    required this.kids,
  });

  @override
  List<Object> get props {
    return [
      location,
      timeRange,
      rooms,
      adults,
      kids,
    ];
  }

  @override
  bool get stringify => true;
}
