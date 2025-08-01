import 'package:flutter/material.dart';

class EducationModel {
  String institution;
  String city;
  String title;
  String description;
  DateTimeRange period;

  EducationModel({
    required this.institution,
    required this.city,
    required this.title,
    required this.description,
    required this.period,
  });
}
