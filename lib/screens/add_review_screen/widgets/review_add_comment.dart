// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:hotel_motel/screens/add_review_screen/widgets/review_header.dart';
import 'package:hotel_motel/theme/design_system.dart';

typedef StringCallback(String value);

class ReviewaddComment extends StatelessWidget {
  final StringCallback onChanged;
  const ReviewaddComment({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _maxLines = 5;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Insets.s),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ReviewHeader(label: "Comment"),
          const SizedBox(height: Insets.xs),
          Container(
            height: _maxLines * 24,
            width: double.infinity,
            child: TextField(
              maxLines: _maxLines,
              decoration: InputDecoration(
                hintText: "Enter a comment",
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                focusColor: Colors.black54,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onChanged: (value) => onChanged(value),
            ),
          ),
        ],
      ),
    );
  }
}
