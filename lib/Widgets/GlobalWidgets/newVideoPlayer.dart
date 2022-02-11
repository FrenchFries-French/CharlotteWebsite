import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class NewVideoCard extends StatefulWidget {
  String videoPlayerLink;
  String thumbnailLink;
  NewVideoCard(
      {Key? key, required this.videoPlayerLink, required this.thumbnailLink})
      : super(key: key);

  @override
  State<NewVideoCard> createState() => _NewVideoCardState();
}

class _NewVideoCardState extends State<NewVideoCard> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    _controller = VideoPlayerController.network(
      this.widget.videoPlayerLink,
      videoPlayerOptions: VideoPlayerOptions(
        mixWithOthers: true,
      ),
    );
    _initializeVideoPlayerFuture = _controller.initialize();
    super.initState();
    _controller.setVolume(0.5);
    _controller.pause();
    // _controller.setLooping(true);
    _controller.addListener(() async {
      if (_controller.value.position.inSeconds >=
          _controller.value.duration.inSeconds) {
        isPLaying = false;
        await _controller.seekTo(Duration(seconds: 0));
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool isPLaying = false;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return FutureBuilder(
      future: _initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          // _controller.play();
          return Container(
            constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.9),
            height: width < 460 ? height * 0.3 : height * 0.6,
            width: width < 767
                ? width < 425
                    ? width
                    : width * 0.78
                : width * 0.54,
            child: StatefulBuilder(builder: (context, state) {
              return Stack(
                children: <Widget>[
                  width < 460
                      ? SizedBox(
                          child: VideoPlayer(_controller),
                        )
                      : SizedBox.expand(
                          child: FittedBox(
                            fit: BoxFit.cover,
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              width: _controller.value.size.width,
                              height: _controller.value.size.height,
                              child: VideoPlayer(_controller),
                            ),
                          ),
                        ),
                  //FURTHER IMPLEMENTATION

                  isPLaying == false
                      ? Container(
                          height: width < 460 ? height * 0.3 : height * 0.6,
                          width: width < 767
                              ? width < 425
                                  ? width
                                  : width * 0.78
                              : width * 0.54,
                          child: SizedBox.expand(
                            child: FittedBox(
                              fit: BoxFit.cover,
                              child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                width: _controller.value.size.width,
                                height: _controller.value.size.height,
                                child: CachedNetworkImage(
                                  imageUrl: this.widget.thumbnailLink,
                                  // height:
                                  //     width < 460 ? height * 0.3 : height * 0.6,
                                  // width: width < 767
                                  //     ? width < 425
                                  //         ? width
                                  //         : width * 0.78
                                  //     : width * 0.54,
                                  fit: BoxFit.cover,
                                  fadeInCurve: Curves.ease,
                                  fadeOutCurve: Curves.ease,
                                  placeholder:
                                      (BuildContext context, String url) =>
                                          Container(
                                    height: width < 460
                                        ? height * 0.3
                                        : height * 0.6,
                                    width: width < 767
                                        ? width < 425
                                            ? width
                                            : width * 0.78
                                        : width * 0.54,
                                    // color: Colors.white,
                                  ),
                                ),
                              ),
                            ),

                            // fit: BoxFit.cover,
                            // headers: ,
                          ),
                        )
                      : Container(),
                  Container(
                    height: width < 460 ? height * 0.3 : height * 0.6,
                    width: width < 767
                        ? width < 425
                            ? width
                            : width * 0.78
                        : width * 0.54,
                    child: InkWell(
                      onTap: () {
                        if (isPLaying) {
                          _controller.pause();
                        } else {
                          _controller.play();
                        }
                        state.call(() {
                          isPLaying = !isPLaying;
                        });

                        // _controller.pl
                      },
                      child: isPLaying
                          ? Opacity(
                              opacity: 0,
                              child: Icon(
                                Icons.pause,
                                size: 42,
                                color: Colors.white,
                              ),
                            )
                          : Icon(
                              Icons.play_arrow,
                              size: 42,
                              color: Colors.white,
                            ),
                    ),
                  ),
                ],
              );

              ///
              // return Stack(
              //   clipBehavior: Clip.hardEdge,
              //   children: [
              //     Center(
              //       child: SizedBox.expand(
              //         // height: height * 0.6,
              //         // width: width < 767
              //         //     ? width < 425
              //         //         ? width
              //         //         : width * 0.78
              //         //     : width * 0.54,
              //         child: FittedBox(
              //           child: VideoPlayer(
              //             _controller,
              //           ),
              //         ),
              //       ),
              //     ),
              //     isPLaying == false
              //         ? Container(
              //             width: width < 767
              //                 ? width < 425
              //                     ? width
              //                     : width * 0.78
              //                 : width * 0.54,
              //             height: height * 0.6,
              //             child: CachedNetworkImage(
              //               imageUrl: this.widget.thumbnailLink,
              //               width: width < 767
              //                   ? width < 425
              //                       ? width
              //                       : width * 0.78
              //                   : width * 0.54,
              //               height: height * 0.6,
              //               fit: BoxFit.cover,
              //               fadeInCurve: Curves.ease,
              //               fadeOutCurve: Curves.ease,
              //               placeholder: (BuildContext context, String url) =>
              //                   Container(
              //                 width: width < 767
              //                     ? width < 425
              //                         ? width
              //                         : width * 0.78
              //                     : width * 0.54,
              //                 height: height * 0.6,
              //                 // color: Colors.white,
              //               ),

              //               // fit: BoxFit.cover,
              //               // headers: ,
              //             ),
              //           )
              //         : Container(),
              //     Container(
              //       height: height * 0.6,
              //       width: width < 767
              //           ? width < 425
              //               ? width
              //               : width * 0.78
              //           : width * 0.54,
              //       child: InkWell(
              //         onTap: () {
              //           if (isPLaying) {
              //             _controller.pause();
              //           } else {
              //             _controller.play();
              //           }
              //           state.call(() {
              //             isPLaying = !isPLaying;
              //           });

              //           // _controller.pl
              //         },
              //         child: isPLaying
              //             ? Opacity(
              //                 opacity: 0,
              //                 child: Icon(
              //                   Icons.pause,
              //                   size: 42,
              //                   color: Colors.white,
              //                 ),
              //               )
              //             : Icon(
              //                 Icons.play_arrow,
              //                 size: 42,
              //                 color: Colors.white,
              //               ),
              //       ),
              //     ),
              //   ],
              // );
            }),
          );
        } else {
          // If the VideoPlayerController is still initializing, show a
          // loading spinner.
          return Center(
            child: Container(
              // color: Colors.white,
              child: CircularProgressIndicator.adaptive(
                backgroundColor: Colors.white,
              ),
            ),
            // child: AnimatedContainer(
            //   duration: Duration(seconds: 1),
            //   color: Colors.transparent,
            //   width: width < 767
            //       ? width < 425
            //           ? width
            //           : width * 0.78
            //       : width * 0.54,
            //   height: width < 460 ? height * 0.3 : height * 0.3,
            // ),
          );
        }
      },
    );
  }
}
