import 'package:flutter/material.dart';

/// A custom chip widget that displays a title and handles tap events.
///
/// The [ChipWidget] is a stylized button that displays a text label.
class ChipWidget extends StatelessWidget {
  /// The title to be displayed on the chip.
  final String title;

  /// Creates a [ChipWidget].
  ///
  /// The [title] parameter are required.
  const ChipWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFBB86FC),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 14,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
