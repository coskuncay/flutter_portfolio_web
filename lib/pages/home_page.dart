import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio/pages/open_source_page.dart';
import 'package:flutter_web_portfolio/utils/colors.dart';
import 'package:flutter_web_portfolio/pages/about_me_page.dart';
import 'package:flutter_web_portfolio/utils/responsive.dart';
import 'package:flutter_web_portfolio/widgets/explore_drawer.dart';
import 'package:flutter_web_portfolio/widgets/top_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  double _scrollPosition = 0;
  final double _opacity = 0;
  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
  }

  @override
  void initState() {
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      drawer: const ExploreDrawer(),
      backgroundColor: ColorConstants.kDarkMainColor,
      appBar: ResponsiveWidget.isSmallScreen(context)
          ? AppBar(
              backgroundColor: Colors.blueGrey.shade900.withOpacity(_opacity),
              elevation: 5,
              centerTitle: true,
              title: Container(
                padding: const EdgeInsets.all(20),
                color: ColorConstants.kButtonColor,
                child: const Text(
                  'LOGO',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 3,
                  ),
                ),
              ),
            )
          : PreferredSize(
              preferredSize: Size(screenSize.width, 1000),
              child: const TopBarWidget(),
            ),
      body: SingleChildScrollView(
        controller: _scrollController,
        physics: const ClampingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: ResponsiveWidget.isSmallScreen(context)
                  ? screenSize.height * .05
                  : screenSize.height * .1,
            ),
            const AboutMePage(),
            const Divider(color: Colors.grey, thickness: .3),
            const OpenSourcePage(),
            const Divider(color: Colors.grey, thickness: .3),
            // const ContactPage(),
          ],
        ),
      ),
    );
  }
}
