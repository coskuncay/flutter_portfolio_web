import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio/utils/colors.dart';

class TopBarWidget extends StatefulWidget {
  const TopBarWidget({Key? key}) : super(key: key);

  @override
  State<TopBarWidget> createState() => _TopBarWidgetState();
}

class _TopBarWidgetState extends State<TopBarWidget> {
  final List _isHovering = [
    false,
    false,
  ];
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return PreferredSize(
      preferredSize: Size(screenSize.width, 1000),
      child: Container(
        color: ColorConstants.kDarkMainColor,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildTopBarLogoWidget(),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    _buildTopBarButton('About Me', 0),
                    // SizedBox(width: screenSize.width * .02),
                    _buildTopBarButton('Open Source', 1),
                    // SizedBox(width: screenSize.width * .02),
                    // _buildTopBarButton('Contact Me', 2),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTopBarLogoWidget() {
    return Image.asset('assets/images/logo.png');
  }

  Widget _buildTopBarButton(String title, int ind) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: InkWell(
        onHover: (value) {
          setState(() {
            _isHovering[ind] = value;
          });
        },
        onTap: () {},
        child: Container(
          color: _isHovering[ind]
              ? ColorConstants.kButtonColor
              : Colors.transparent,
          padding: const EdgeInsets.all(20),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight:
                  _isHovering[ind] ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}
