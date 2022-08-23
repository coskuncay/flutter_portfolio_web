import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio/controllers/repo_controller.dart';
import 'package:flutter_web_portfolio/models/repo_model.dart';
import 'package:flutter_web_portfolio/utils/colors.dart';
import 'package:line_icons/line_icons.dart';
import 'dart:js' as js;

class OpenSourcePage extends StatefulWidget {
  const OpenSourcePage({Key? key}) : super(key: key);

  @override
  State<OpenSourcePage> createState() => _OpenSourcePageState();
}

class _OpenSourcePageState extends State<OpenSourcePage> {
  List<RepoModel> repoList = [];
  @override
  void initState() {
    _getUsers();
    super.initState();
  }

  _getUsers() {
    RepoController.getPinnedRepos().then((response) {
      setState(() {
        repoList = response;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(20),
      height: screenSize.height * .8,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text(
            'Open Source Projects',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 50,
            ),
          ),
          Expanded(
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: screenSize.width * .35,
                mainAxisExtent: screenSize.height * .2,
                childAspectRatio: 3,
                crossAxisSpacing: 40,
                mainAxisSpacing: 30,
              ),
              itemCount: repoList.length,
              itemBuilder: (BuildContext ctx, index) {
                return InkWell(
                  onTap: () {
                    js.context.callMethod('open', ['${repoList[index].link}']);
                  },
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: Container(
                      decoration: BoxDecoration(
                        color: ColorConstants.kButtonColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.book,
                                color: Colors.white,
                              ),
                              const SizedBox(width: 10),
                              SizedBox(
                                width: screenSize.width * .2,
                                child: Text(
                                  '${repoList[index].repo}',
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                      overflow: TextOverflow.ellipsis),
                                ),
                              ),
                            ],
                          ),
                          const Expanded(child: SizedBox()),
                          Text(
                            repoList[index].description ?? '',
                            style: TextStyle(
                              color: Colors.grey.withOpacity(.9),
                              fontStyle: FontStyle.italic,
                              fontSize: 20,
                            ),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const Expanded(child: SizedBox()),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: hexToColor(
                                        repoList[index].languageColor!),
                                    radius: 8,
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    '${repoList[index].language}',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Row(
                                    children: [
                                      const Icon(
                                        LineIcons.starAlt,
                                        size: 22,
                                        color: Colors.white,
                                      ),
                                      const SizedBox(width: 5),
                                      Text(
                                        '${repoList[index].stars}',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(width: 10),
                                  Row(
                                    children: [
                                      const Icon(
                                        LineIcons.codeBranch,
                                        color: Colors.white,
                                        size: 25,
                                      ),
                                      const SizedBox(width: 5),
                                      Text(
                                        '${repoList[index].forks}',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: screenSize.height * .01),
          Center(
            child: InkWell(
              onTap: () {
                js.context.callMethod('open', ['https://github.com/coskuncay']);
              },
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: ColorConstants.kButtonColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  'More Projects',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

Color hexToColor(String hex) {
  assert(RegExp(r'^#([0-9a-fA-F]{6})|([0-9a-fA-F]{8})$').hasMatch(hex),
      'hex color must be #rrggbb or #rrggbbaa');

  return Color(
    int.parse(hex.substring(1), radix: 16) +
        (hex.length == 7 ? 0xff000000 : 0x00000000),
  );
}
