import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio/widgets/footer.dart';

class ExploreDrawer extends StatelessWidget {
  const ExploreDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.blueGrey.shade900,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {},
                child: const Text(
                  'About Me',
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                child: Divider(
                  color: Colors.blueGrey.shade400,
                  thickness: 2,
                ),
              ),
              InkWell(
                onTap: () {},
                child: const Text(
                  'Open Source Projects',
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
              ),
              const Expanded(child: SizedBox()),
              const FooterWidget()
            ],
          ),
        ),
      ),
    );
  }
}
