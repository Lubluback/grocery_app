import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile(
      {super.key,
      required this.onPressed,
      required this.text,
      required this.icons});
  final void Function() onPressed;
  final String text;
  final IconData icons;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPressed,
      leading: Icon(
        icons,
        color: const Color(0xff4F7B39),
      ),
      title: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            text,
            style: const TextStyle(color: Colors.black),
          )),
      trailing: const Icon(Icons.arrow_forward_ios),
    );
  }
}
