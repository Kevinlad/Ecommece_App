import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  final ValueChanged<int> onCountChanged;
  final int initialValue;
  const Counter(
      {super.key, required this.onCountChanged, required this.initialValue});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  late int count;
  void initState() {
    super.initState();
    count = widget.initialValue; // Initialize count with the initial value
  }

  bool isVisible = true;
  void increment() {
    setState(() {
      count++;
      widget.onCountChanged(count);
    });
  }

  void decrement() {
    setState(() {
      if (count > 1) {
        count--;
        widget.onCountChanged(
            count); // Notify the parent widget of the new quantity
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 85,
      decoration: BoxDecoration(
          color: Colors.grey[100], borderRadius: BorderRadius.circular(30)),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(3.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: decrement,
                  child: const CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 12,
                      child: Icon(CupertinoIcons.minus_circle)),
                ),
                Text(
                  "${count}",
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w900),
                ),
                GestureDetector(
                  onTap: increment,
                  child: const CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 12,
                    child: Icon(CupertinoIcons.add_circled),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
