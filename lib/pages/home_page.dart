import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio/pages/open_source_page.dart';
import 'package:flutter_web_portfolio/utils/colors.dart';
import 'package:flutter_web_portfolio/pages/about_me_page.dart';
import 'package:flutter_web_portfolio/utils/responsive.dart';
import 'package:flutter_web_portfolio/widgets/explore_drawer.dart';
import 'package:flutter_web_portfolio/widgets/footer.dart';
import 'package:flutter_web_portfolio/widgets/top_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  final double _opacity = 0;
  @override
  void initState() {
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
              toolbarHeight: screenSize.height * .08,
              title: Image.asset('assets/images/logo.png'),
            )
          : PreferredSize(
              preferredSize: Size(screenSize.width, 1000),
              child: const TopBarWidget(),
            ),
      body: SingleChildScrollView(
        controller: _scrollController,
        physics: const ClampingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
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
            const FooterWidget(),
          ],
        ),
      ),
    );
  }
}
