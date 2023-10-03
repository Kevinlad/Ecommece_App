import 'package:flutter/material.dart';

class SelectColor extends StatefulWidget {
  const SelectColor({Key? key});

  @override
  _SelectColorState createState() => _SelectColorState();
}

class _SelectColorState extends State<SelectColor> {
  int selectedColorIndex = -1;

  final List<Color> colors = [
    Colors.red,
    const Color.fromARGB(255, 122, 152, 202),
    Colors.pinkAccent[100]!,
    Colors.blueGrey[700]!,
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(colors.length, (index) {
        final color = colors[index];
        final isSelected = selectedColorIndex == index;

        return GestureDetector(
          onTap: () {
            setState(() {
              selectedColorIndex = index;
            });
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              constraints: const BoxConstraints(
                minHeight: 29,
                minWidth: 29,
                maxHeight: 35,
                maxWidth: 32,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(70),
                color: color,
              ),
              child: isSelected
                  ? const Center(
                      child: Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 20,
                      ),
                    )
                  : null,
            ),
          ),
        );
      }),
    );
  }
}
