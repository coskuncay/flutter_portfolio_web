import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio/widgets/socials.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return SizedBox(
      width: double.infinity,
      height: screenSize.height * .15,
      child: Column(
        children: [
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'Made with ',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              FlutterLogo(
                size: 30,
              ),
              Text.rich(
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
                TextSpan(
                  children: [
                    TextSpan(text: ' by '),
                    TextSpan(
                      text: 'justecdev',
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          SocialsWidget(),
        ],
      ),
    );
  }
}
