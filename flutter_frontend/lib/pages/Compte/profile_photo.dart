import 'package:flutter/material.dart';

class ProfilePic extends StatelessWidget {
  const ProfilePic({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 115,
              width: 115,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage("assets/images/profile.jpg"),
                  ),
                  Positioned(
                    bottom: 0,
                    right: -4,
                    child: SizedBox(
                        height: 46,
                        width: 46,
                        child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: Color(0XFFF5F6F9),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                  side: BorderSide(color: Colors.white)),
                            ),
                            onPressed: () {},
                            child: Icon(
                              Icons.camera_alt_rounded,
                              color: Colors.black54,
                            ))),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(2),
            child: Column(
              children: [
                Text("Aly KONTE"),
                SizedBox(
                  height: 10,
                ),
                Text("alykonte19@gmail.com"),
              ],
            ),
          )
         
        ],
      ),
    );
  }
}
