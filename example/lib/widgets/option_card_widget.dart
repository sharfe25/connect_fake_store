import 'package:flutter/material.dart';

class OptionCardWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;
  const OptionCardWidget(
      {Key? key, required this.title, required this.icon, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.centerLeft,
        margin: const EdgeInsets.only(
          top: 8,
        ),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const <BoxShadow>[
            BoxShadow(
              color: Color.fromARGB(255, 208, 208, 208),
              blurRadius: 8,
            )
          ],
        ),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 30,
              ),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ]),
      ),
    );
  }
}
