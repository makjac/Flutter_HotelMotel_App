// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:hotel_motel/theme/theme_base.dart';
import 'package:hotel_motel/widgets/counter_widget/counter_controller.dart';

// ignore: must_be_immutable
class Counter extends StatefulWidget {
  int initCount;
  int minimalValue;
  final CounterController controller;
  Counter({
    Key? key,
    this.initCount = 0,
    this.minimalValue = 0,
    required this.controller,
  }) : super(key: key);

  int get number => initCount;

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  @override
  void initState() {
    if (widget.initCount < widget.minimalValue) {
      widget.controller.number = widget.initCount;
    }
    widget.controller.number = widget.initCount;
    super.initState();
  }

  void _increment() {
    setState(() {
      widget.initCount++;
      widget.controller.number = widget.initCount;
    });
  }

  void _decrement() {
    if (widget.initCount > widget.minimalValue) {
      setState(() {
        widget.initCount--;
        widget.controller.number = widget.initCount;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          border: Border.all(color: Colors.grey, width: 2)),
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: IconButton(
                onPressed: _decrement,
                icon: const Icon(Icons.remove),
              ),
            ),
            Expanded(
              flex: 2,
              child: Card(
                color: Colors.grey[200],
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(Insets.xs),
                    child: Text(
                      "${widget.initCount}",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: IconButton(
                onPressed: _increment,
                icon: const Icon(Icons.add),
              ),
            )
          ],
        ),
      ),
    );
  }
}
