import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio/utils/responsive.dart';
import 'package:flutter_web_portfolio/widgets/socials.dart';

class AboutMePage extends StatefulWidget {
  const AboutMePage({Key? key}) : super(key: key);

  @override
  State<AboutMePage> createState() => _AboutMePageState();
}

class _AboutMePageState extends State<AboutMePage> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: screenSize.height * .05),
        const CircleAvatar(
          radius: 90,
          backgroundImage: AssetImage('assets/images/pp.png'),
        ),
        SizedBox(height: screenSize.height * .05),
        SizedBox(
          width: ResponsiveWidget.isSmallScreen(context)
              ? screenSize.width * .5
              : screenSize.width * .25,
          child: DefaultTextStyle(
            style: const TextStyle(
              fontSize: 20.0,
              fontFamily: 'Agne',
            ),
            child: AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                  'Hi all , I\'m Emre!',
                  speed: const Duration(
                    milliseconds: 200,
                  ),
                  textStyle: const TextStyle(
                    fontSize: 60.0,
                    fontFamily: 'Canterbury',
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: screenSize.height * .05),
        Center(
          child: SizedBox(
            width: ResponsiveWidget.isSmallScreen(context)
                ? screenSize.width * .7
                : screenSize.width * .4,
            child: const Text(
              'A passionate Full Stack Software Developer having an experience of building Web and Mobile applications with Flutter / VueJS/ .NET and some other cool libraries and frameworks.',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
              ),
            ),
          ),
        ),
        SizedBox(
          width: ResponsiveWidget.isSmallScreen(context)
              ? screenSize.width * .5
              : screenSize.width * .3,
          child: SocialsWidget(),
        ),
        SizedBox(height: screenSize.height * .05),
      ],
    );
  }
}
