import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'FotoPage.dart';

class DDPersonal extends StatefulWidget {
  final List<String> dynamicList;

  const DDPersonal({Key? key, required this.dynamicList}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return new _DDPersonalState();
  }
}

class _DDPersonalState extends State<DDPersonal> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return PopupMenuButton(
      padding: EdgeInsets.zero,
      child: Text("Portfolios",
          style: TextStyle(
            color: Colors.black,
            fontSize: 2.3.w,
          )),
      offset: const Offset(-20, 25),
      itemBuilder: (BuildContext context) => <PopupMenuEntry<PopupMenuButton>>[
        PopupMenuItem(
          padding: EdgeInsets.zero,
          child: PopupMenuButton<String>(
            padding: EdgeInsets.zero,
            child: const SizedBox(
                height: kMinInteractiveDimension,
                child: Center(child: Text('Portrait'))),

            onSelected: (String result) {},

            offset:
                width > 400 ? const Offset(100, -20) : const Offset(155, -20),
            itemBuilder: (BuildContext context) => widget.dynamicList
                .map(
                  (e) => PopupMenuItem<String>(
                    // value: "All Albums",
                    value: e,
                    child: Text(e),
                    onTap: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (context, animation1, animation2) =>
                              FotoPage(
                            albumName: e,
                            showGalleryText: true,
                          ), //This has to be changed to MyHomePage(),
                          transitionDuration: const Duration(seconds: 0),
                        ),
                      );
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (context, animation1, animation2) =>
                              FotoPage(
                            albumName: e,
                            showGalleryText: true,
                          ), //This has to be changed to MyHomePage(),
                          transitionDuration: const Duration(seconds: 0),
                        ),
                      );
                    },
                  ),
                )
                .toList(),
            //     <PopupMenuEntry<String>>[
            //   const PopupMenuItem<String>(
            //     value: "All Albums",
            //     child: Text('All Albums'),
            //   ),
            //   const PopupMenuItem<String>(
            //     value: "Portfolio A",
            //     child: Text('Portfolio A'),
            //   ),
            //   const PopupMenuItem<String>(
            //     value: "Portfolio B",
            //     child: Text('Portfolio B'),
            //   ),
            //   const PopupMenuItem<String>(
            //     value: "Portfolio C",
            //     child: Text('Portfolio C'),
            //   ),
            // ],
          ),
        ),
        PopupMenuItem(
          child: const Center(child: Text('Urban')),
          enabled: true,
          onTap: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation1, animation2) => FotoPage(
                  albumName: "Urban",
                  showGalleryText: false,
                ), //This has to be changed to MyHomePage(),
                transitionDuration: const Duration(seconds: 0),
              ),
            );
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation1, animation2) => FotoPage(
                  albumName: "Urban",
                  showGalleryText: false,
                ), //This has to be changed to MyHomePage(),
                transitionDuration: const Duration(seconds: 0),
              ),
            );
          },
        ),
        PopupMenuItem(
          child: const Center(child: Text('Landscape')),
          onTap: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation1, animation2) => FotoPage(
                  albumName: "Landscape",
                  showGalleryText: false,
                ), //This has to be changed to MyHomePage(),
                transitionDuration: const Duration(seconds: 0),
              ),
            );
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation1, animation2) => FotoPage(
                  albumName: "Landscape",
                  showGalleryText: false,
                ), //This has to be changed to MyHomePage(),
                transitionDuration: const Duration(seconds: 0),
              ),
            );
          },
        ),
        PopupMenuItem(
          child: const Center(child: Text('Film')),
          onTap: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation1, animation2) => FotoPage(
                  albumName: "Film",
                  showGalleryText: false,
                ), //This has to be changed to MyHomePage(),
                transitionDuration: const Duration(seconds: 0),
              ),
            );
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation1, animation2) => FotoPage(
                  albumName: "Film",
                  showGalleryText: false,
                ), //This has to be changed to MyHomePage(),
                transitionDuration: const Duration(seconds: 0),
              ),
            );
          },
        ),
      ],
    );

    // return PopupMenuButton(
    //   child: Text(
    //     "Portfolios",
    //     style: TextStyle(
    //       color: Colors.black,
    //       fontSize: 2.w,
    //     ),
    //   ),
    //   // offset: Offset(300, 0),
    //   elevation: 10,
    //   itemBuilder: (context) {
    //     return [
    //       PopupMenuItem<String>(
    //         value: "1",
    //         child: Text('1'),
    //         onTap: () {
    //           log("hi");
    //         },
    //       ),
    //       PopupMenuItem<String>(
    //         value: "2",
    //         child: Text('1'),
    //         onTap: () {
    //           log("hi");
    //         },
    //       ),
    //       PopupMenuItem<String>(
    //         value: "1",
    //         child: Text('3'),
    //         onTap: () {
    //           log("hi");
    //         },
    //       ),
    //       PopupMenuButton(
    //         itemBuilder: (context) {
    //           return [];
    //         },
    //       ),

    //       // PopupMenuButton<String>(
    //       //   itemBuilder: (context) => [],
    //       // ),
    //     ];
    //   },
    // );
    // return DropdownButton<String>(
    //   hint: Text("Portfolios",
    //       style: TextStyle(color: Colors.black, fontSize: 2.w)),
    //   elevation: 4,
    //   underline: Container(
    //     height: 0,
    //   ),
    //   isExpanded: true,
    //   icon: SizedBox(
    //     height: 0,
    //   ),
    //   onChanged: (value) {},
    //   items: [
    //     DropdownMenuItem(
    //       child: Text("Portfolio A",
    //           style: TextStyle(color: Colors.black, fontSize: 2.w)),
    //       value: "1",
    //       onTap: () {
    //         Navigator.push(
    //           context,
    //           PageRouteBuilder(
    //             pageBuilder: (context, animation1, animation2) => PortfolioA(),
    //             transitionDuration: Duration(seconds: 0),
    //           ),
    //         );
    //         Navigator.push(
    //           context,
    //           PageRouteBuilder(
    //             pageBuilder: (context, animation1, animation2) => PortfolioA(),
    //             transitionDuration: Duration(seconds: 0),
    //           ),
    //         );
    //       },
    //     ),
    //     DropdownMenuItem(
    //       child: Text("Portfolio B",
    //           style: TextStyle(color: Colors.black, fontSize: 2.w)),
    //       value: "2",
    //       onTap: () {
    //         Navigator.push(
    //           context,
    //           PageRouteBuilder(
    //             pageBuilder: (context, animation1, animation2) => PortfolioB(),
    //             transitionDuration: Duration(seconds: 0),
    //           ),
    //         );
    //         Navigator.push(
    //           context,
    //           PageRouteBuilder(
    //             pageBuilder: (context, animation1, animation2) => PortfolioB(),
    //             transitionDuration: Duration(seconds: 0),
    //           ),
    //         );
    //       },
    //     ),
    //     DropdownMenuItem(
    //       child: Text("Portfolio C",
    //           style: TextStyle(color: Colors.black, fontSize: 2.w)),
    //       value: "3",
    //       onTap: () {
    //         Navigator.push(
    //           context,
    //           PageRouteBuilder(
    //             pageBuilder: (context, animation1, animation2) => PortfolioC(),
    //             transitionDuration: Duration(seconds: 0),
    //           ),
    //         );
    //         Navigator.push(
    //           context,
    //           PageRouteBuilder(
    //             pageBuilder: (context, animation1, animation2) => PortfolioC(),
    //             transitionDuration: Duration(seconds: 0),
    //           ),
    //         );
    //       },
    //     ),
    //     DropdownMenuItem(
    //       child: Text("Portfolio D",
    //           style: TextStyle(color: Colors.black, fontSize: 2.w)),
    //       value: "3",
    //       onTap: () {},
    //     ),
    //   ],
    // );
  }
}
