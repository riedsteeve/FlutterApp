import 'package:flutter/material.dart';

class MyCustomButton extends StatelessWidget {
  final String label;
  final void Function() onPressed;

  const MyCustomButton({
    super.key,
    required this.label,
    required this.onPressed
  });

  //UI
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.amberAccent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        fixedSize: const Size(200, 60)
      ),
        onPressed: onPressed,
        child: Text(label, style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: Colors.white,
        ),)
    );
  }
}
