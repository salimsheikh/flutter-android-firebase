// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool loading;
  const RoundButton(
      {Key? key,
      required this.title,
      required this.onTap,
      this.loading = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.deepPurple,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Center(
          child: loading
              ? const CircularProgressIndicator(
                  strokeWidth: 3, color: Colors.white)
              : Text(
                  title,
                  style: const TextStyle(color: Colors.white),
                ),
        ),
      ),
    );
  }
}
