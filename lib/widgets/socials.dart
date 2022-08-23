import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio/utils/responsive.dart';
import 'package:line_icons/line_icons.dart';

class SocialsWidget extends StatelessWidget {
  const SocialsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return SizedBox(
      width: ResponsiveWidget.isSmallScreen(context)
          ? screenSize.width * .5
          : screenSize.width * .2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          CircleAvatar(
            radius: 25,
            backgroundColor: Color(0xff0077b5),
            child: Icon(
              LineIcons.linkedinIn,
              size: 30,
              color: Colors.white,
            ),
          ),
          CircleAvatar(
            radius: 25,
            backgroundColor: Colors.black,
            child: Icon(
              LineIcons.github,
              size: 30,
              color: Colors.white,
            ),
          ),
          CircleAvatar(
            radius: 25,
            backgroundColor: Color(0xff1DA1F2),
            child: Icon(
              LineIcons.twitter,
              size: 30,
              color: Colors.white,
            ),
          ),
          CircleAvatar(
            radius: 25,
            backgroundColor: Colors.red,
            child: Icon(
              LineIcons.envelope,
              size: 30,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
