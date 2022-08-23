import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio/utils/responsive.dart';
import 'package:line_icons/line_icons.dart';
import 'dart:js' as js;

class SocialsWidget extends StatelessWidget {
  SocialsWidget({Key? key}) : super(key: key);
  List socialList = [
    {
      'icon': LineIcons.linkedinIn,
      'color': const Color(0xff0077b5),
      'link': 'https://www.linkedin.com/in/coskuncayemre/',
    },
    {
      'icon': LineIcons.github,
      'color': Colors.black,
      'link': 'https://github.com/coskuncay',
    },
    {
      'icon': LineIcons.twitter,
      'color': const Color(0xff1DA1F2),
      'link': 'https://twitter.com/justecdev',
    },
  ];
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return SizedBox(
      height: screenSize.height * .1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => SizedBox(
              width: ResponsiveWidget.isSmallScreen(context)
                  ? screenSize.width * .01
                  : screenSize.width * .01,
            ),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  js.context
                      .callMethod('open', ['${socialList[index]['link']}']);
                },
                child: CircleAvatar(
                  radius: 25,
                  backgroundColor: socialList[index]['color'],
                  child: Icon(
                    socialList[index]['icon'],
                    size: 30,
                    color: Colors.white,
                  ),
                ),
              );
            },
            itemCount: socialList.length,
          ),
        ],
      ),
    );
  }
}
