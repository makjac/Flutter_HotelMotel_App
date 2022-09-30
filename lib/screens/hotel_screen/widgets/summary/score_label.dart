import 'package:flutter/material.dart';

import '../../../../widgets/score_bars/linear_score.dart';

class ScoreLabel extends StatelessWidget {
  final String label;
  final num score;
  const ScoreLabel({
    Key? key,
    required this.label,
    required this.score,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 4,
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
            ),
          ),
          Expanded(
            flex: 9,
            child: LinearScoreBar(
              value: score,
              minHeight: 15,
              mainColor: Colors.black,
              backgroundColor: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
