// import 'dart:developer';

// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:sizer/sizer.dart';
// import 'package:video_player/video_player.dart';

// class VideoCard extends StatefulWidget {
//   final String videoPlayerLink;
//   final String thumbnailLink;
//   VideoCard({
//     Key? key,
//     required this.thumbnailLink,
//     required this.videoPlayerLink,
//   }) : super(key: key);

//   @override
//   _VideoCardState createState() => _VideoCardState();
// }

// class _VideoCardState extends State<VideoCard> {
//   late VideoPlayerController _controller;
//   late Future<void> _initializeVideoPlayerFuture;

//   @override
//   void initState() {
//     /***
//     Create and store the VideoPlayerController. The VideoPlayerController
//     offers several different constructors to play videos from assets, files,
//     or the internet.
//     ***/
//     // _controller = VideoPlayerController.network(this.widget.videoPlayerLink);
//     _controller = VideoPlayerController.network(
//       this.widget.videoPlayerLink,
//       // "https://firebasestorage.googleapis.com/v0/b/buhm-5e89b.appspot.com/o/Homepage%2Fbee.mp4?alt=media&token=c828f0ea-3541-4178-bde6-bfab4ed12a77",
//       videoPlayerOptions: VideoPlayerOptions(
//         mixWithOthers: true,
//       ),
//     );
//     _initializeVideoPlayerFuture = _controller.initialize();
//     super.initState();
//     _controller.setVolume(0.5);
//     _controller.pause();
//     // _controller.setLooping(true);
//     _controller.addListener(() async {
//       log("Total video duration is ${_controller.value.duration.inSeconds}");
//       log("Current video duration is ${_controller.value.position.inSeconds}");
//       // ÷.then((value) {
//       // return null;
//       if (_controller.value.position.inSeconds >=
//           _controller.value.duration.inSeconds) {
//         log("Video Finished");
//         isPLaying = false;
//         // _controller.pause();
//         await _controller.seekTo(Duration(seconds: 0));
//       }
//       // });
//     });
//   }

//   @override
//   void dispose() {
//     // Ensure disposing of the VideoPlayerController to free up resources.
//     _controller.dispose();
//     super.dispose();
//   }

//   bool isPLaying = false;

//   @override
//   Widget build(BuildContext context) {
//     var width = MediaQuery.of(context).size.width;
//     var height = MediaQuery.of(context).size.height;

//     return Container(
//       constraints:
//           BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.9),
//       width: width < 767
//           ? width < 425
//               ? width
//               : width * 0.78
//           : width * 0.54,
//       height: height * 0.6,
//       child:,
//     );

//     // return FutureBuilder(
//     //   // future: _initializeVideoPlayerFuture,
//     //   builder: (context, snapshot) {
//     //     if (snapshot.connectionState == ConnectionState.done) {
//     //       // _controller.play();
//     //       return Container(
//     //         constraints: BoxConstraints(
//     //             maxWidth: MediaQuery.of(context).size.width * 0.9),
//     //         width: width < 767
//     //             ? width < 425
//     //                 ? width
//     //                 : width * 0.78
//     //             : width * 0.54,
//     //         height: height * 0.6,
//     //         child: StatefulBuilder(builder: (context, state) {
//     //           log("Aspect ration is ${_controller.value.aspectRatio}");
//     //           return Stack(
//     //             children: <Widget>[
//     //               // SizedBox.expand(
//     //               //   child: FittedBox(
//     //               //     fit: BoxFit.cover,
//     //               //     child: Container(
//     //               //       margin: EdgeInsets.symmetric(horizontal: 10),
//     //               //       width: _controller.value.size.width -10,
//     //               //       height: _controller.value.size.height,
//     //               //       child: VideoPlayer(_controller),
//     //               //     ),
//     //               //   ),
//     //               // ),
//     //               //FURTHER IMPLEMENTATION

//     //               isPLaying == false
//     //                   ? Container(
//     //                       width: width < 767
//     //                           ? width < 425
//     //                               ? width
//     //                               : width * 0.78
//     //                           : width * 0.54,
//     //                       height: height * 0.6,
//     //                       child: CachedNetworkImage(
//     //                         imageUrl: this.widget.thumbnailLink,
//     //                         width: width < 767
//     //                             ? width < 425
//     //                                 ? width
//     //                                 : width * 0.78
//     //                             : width * 0.54,
//     //                         height: height * 0.6,
//     //                         fit: BoxFit.cover,
//     //                         fadeInCurve: Curves.ease,
//     //                         fadeOutCurve: Curves.ease,
//     //                         placeholder: (BuildContext context, String url) =>
//     //                             Container(
//     //                           width: width < 767
//     //                               ? width < 425
//     //                                   ? width
//     //                                   : width * 0.78
//     //                               : width * 0.54,
//     //                           height: height * 0.6,
//     //                           // color: Colors.white,
//     //                         ),

//     //                         // fit: BoxFit.cover,
//     //                         // headers: ,
//     //                       ),
//     //                     )
//     //                   : Container(),
//     //               Container(
//     //                 height: height * 0.6,
//     //                 width: width < 767
//     //                     ? width < 425
//     //                         ? width
//     //                         : width * 0.78
//     //                     : width * 0.54,
//     //                 child: InkWell(
//     //                   onTap: () {
//     //                     if (isPLaying) {
//     //                       _controller.pause();
//     //                     } else {
//     //                       _controller.play();
//     //                     }
//     //                     state.call(() {
//     //                       isPLaying = !isPLaying;
//     //                     });

//     //                     // _controller.pl
//     //                   },
//     //                   child: isPLaying
//     //                       ? Opacity(
//     //                           opacity: 0,
//     //                           child: Icon(
//     //                             Icons.pause,
//     //                             size: 42,
//     //                             color: Colors.white,
//     //                           ),
//     //                         )
//     //                       : Icon(
//     //                           Icons.play_arrow,
//     //                           size: 42,
//     //                           color: Colors.white,
//     //                         ),
//     //                 ),
//     //               ),
//     //             ],
//     //           );

//     //           ///
//     //           // return Stack(
//     //           //   clipBehavior: Clip.hardEdge,
//     //           //   children: [
//     //           //     Center(
//     //           //       child: SizedBox.expand(
//     //           //         // height: height * 0.6,
//     //           //         // width: width < 767
//     //           //         //     ? width < 425
//     //           //         //         ? width
//     //           //         //         : width * 0.78
//     //           //         //     : width * 0.54,
//     //           //         child: FittedBox(
//     //           //           child: VideoPlayer(
//     //           //             _controller,
//     //           //           ),
//     //           //         ),
//     //           //       ),
//     //           //     ),
//     //           //     isPLaying == false
//     //           //         ? Container(
//     //           //             width: width < 767
//     //           //                 ? width < 425
//     //           //                     ? width
//     //           //                     : width * 0.78
//     //           //                 : width * 0.54,
//     //           //             height: height * 0.6,
//     //           //             child: CachedNetworkImage(
//     //           //               imageUrl: this.widget.thumbnailLink,
//     //           //               width: width < 767
//     //           //                   ? width < 425
//     //           //                       ? width
//     //           //                       : width * 0.78
//     //           //                   : width * 0.54,
//     //           //               height: height * 0.6,
//     //           //               fit: BoxFit.cover,
//     //           //               fadeInCurve: Curves.ease,
//     //           //               fadeOutCurve: Curves.ease,
//     //           //               placeholder: (BuildContext context, String url) =>
//     //           //                   Container(
//     //           //                 width: width < 767
//     //           //                     ? width < 425
//     //           //                         ? width
//     //           //                         : width * 0.78
//     //           //                     : width * 0.54,
//     //           //                 height: height * 0.6,
//     //           //                 // color: Colors.white,
//     //           //               ),

//     //           //               // fit: BoxFit.cover,
//     //           //               // headers: ,
//     //           //             ),
//     //           //           )
//     //           //         : Container(),
//     //           //     Container(
//     //           //       height: height * 0.6,
//     //           //       width: width < 767
//     //           //           ? width < 425
//     //           //               ? width
//     //           //               : width * 0.78
//     //           //           : width * 0.54,
//     //           //       child: InkWell(
//     //           //         onTap: () {
//     //           //           if (isPLaying) {
//     //           //             _controller.pause();
//     //           //           } else {
//     //           //             _controller.play();
//     //           //           }
//     //           //           state.call(() {
//     //           //             isPLaying = !isPLaying;
//     //           //           });

//     //           //           // _controller.pl
//     //           //         },
//     //           //         child: isPLaying
//     //           //             ? Opacity(
//     //           //                 opacity: 0,
//     //           //                 child: Icon(
//     //           //                   Icons.pause,
//     //           //                   size: 42,
//     //           //                   color: Colors.white,
//     //           //                 ),
//     //           //               )
//     //           //             : Icon(
//     //           //                 Icons.play_arrow,
//     //           //                 size: 42,
//     //           //                 color: Colors.white,
//     //           //               ),
//     //           //       ),
//     //           //     ),
//     //           //   ],
//     //           // );
//     //         }),
//     //       );
//     //     } else {
//     //       // If the VideoPlayerController is still initializing, show a
//     //       // loading spinner.
//     //       return Center(
//     //         child: AnimatedContainer(
//     //           duration: Duration(seconds: 1),
//     //           color: Colors.white,
//     //           width: width < 767
//     //               ? width < 425
//     //                   ? width
//     //                   : width * 0.78
//     //               : width * 0.54,
//     //           height: height * 0.3,
//     //         ),
//     //       );
//     //     }
//     //   },
//     // );
//   }
// }

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:charletwebsite/Widgets/GlobalWidgets/newVideoPlayer.dart';

class VideoCard extends StatefulWidget {
  final String videoPlayerLink;
  final String thumbnailLink;
  VideoCard({
    Key? key,
    required this.thumbnailLink,
    required this.videoPlayerLink,
  }) : super(key: key);

  @override
  State<VideoCard> createState() => _VideoCardState();
}

class _VideoCardState extends State<VideoCard> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    // return
    return InkWell(
      onTap: () {
        showDialog(
          barrierColor: Colors.black.withOpacity(0.4),
          context: context,
          builder: (context) {
            return Container(
              height: width < 460 ? height * 0.3 : height * 0.6,
              width: width < 767
                  ? width < 425
                      ? width
                      : width * 0.78
                  : width * 0.54,
              child: AlertDialog(
                backgroundColor: Colors.transparent,
                contentPadding: EdgeInsets.zero,
                content: NewVideoCard(
                    videoPlayerLink: this.widget.videoPlayerLink,
                    thumbnailLink: this.widget.thumbnailLink),
              ),
            );
          },
        );
      },
      child: width < 767
          ? CachedNetworkImage(
              imageUrl: this.widget.thumbnailLink,
              fit: BoxFit.fill,
              fadeInCurve: Curves.ease,
              fadeOutCurve: Curves.ease,
              placeholder: (BuildContext context, String url) => Container(
                constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.9),
                height: width < 460 ? height * 0.3 : height * 0.6,
                width: width < 767
                    ? width < 425
                        ? width
                        : width * 0.78
                    : width * 0.54,
                // color: Colors.white,
              ),
            )
          : Container(
              constraints: BoxConstraints(
                  minWidth: width < 767
                      ? width < 425
                          ? width
                          : width * 0.78
                      : width * 0.54,
                  maxWidth: MediaQuery.of(context).size.width * 0.9),
              height: width < 460 ? height * 0.3 : height * 0.6,
              width: width < 1180
                  ? width < 425
                      ? width
                      : width * 0.78
                  : width * 0.54,
              // height: width < 460 ? height * 0.3 : height * 0.6,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    // constraints: BoxConstraints(
                    //     maxWidth: MediaQuery.of(context).size.width * 0.9),
                    // height: width < 460 ? height * 0.3 : height * 0.6,
                    // width: width < 767
                    //     ? width < 425
                    //         ? width
                    //         : width * 0.78
                    //     : width * 0.54,
                    child: SizedBox.expand(
                      child: CachedNetworkImage(
                        imageUrl: this.widget.thumbnailLink,
                        fit: BoxFit.fill,
                        fadeInCurve: Curves.ease,
                        fadeOutCurve: Curves.ease,
                        placeholder: (BuildContext context, String url) =>
                            Container(
                          constraints: BoxConstraints(
                              maxWidth:
                                  MediaQuery.of(context).size.width * 0.9),
                          height: width < 460 ? height * 0.3 : height * 0.6,
                          // color: Colors.white,
                        ),
                      ),
                    ),
                  ),

                  Center(
                    child: Container(
                      constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.9),
                      height: width < 460 ? height * 0.3 : height * 0.6,
                      width: width < 767
                          ? width < 425
                              ? width
                              : width * 0.78
                          : width * 0.54,
                      child: Icon(
                        Icons.play_arrow,
                        size: 42,
                        color: Colors.white,
                      ),
                    ),
                  )

                  // fit: BoxFit.cover,
                  // headers: ,
                ],
              ),
            ),
    );
  }
}
