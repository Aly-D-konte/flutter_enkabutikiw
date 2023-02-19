import 'package:flutter/material.dart';


class ProfileMenu extends StatelessWidget {
  ProfileMenu({
    super.key,
    required this.text,
    required this.icon,
    required this.press,
  });
  final String text, icon;
  final VoidCallback press;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: TextButton(
          style: TextButton.styleFrom(
              padding: EdgeInsets.all(20),
              backgroundColor: Color(0XFFF5F6F9),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              side: BorderSide(color: Color.fromARGB(255, 219, 223, 233))),
          onPressed: press,
          child: Row(
            children: [
              Image.asset(icon, width: 22, color: Colors.black54),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: Text(
                  text,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              Icon(Icons.arrow_forward_ios_outlined)
            ],
          )
          ),
    );
  }
}
