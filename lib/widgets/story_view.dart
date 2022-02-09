import 'package:flutter/material.dart';
import 'package:utilities/utilities.dart';
import 'package:video_player/video_player.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:just_audio/just_audio.dart';

/// fake data for test
// final List<MediaViewModel> data = [
//   MediaViewModel(
//       link: 'https://abolfazlnezami.ir/file/slider.jpg',
//       type: MediaType.image),
//   MediaViewModel(
//       link: 'https://flutter.dev',
//       type: MediaType.link),
//   MediaViewModel(
//       link: 'https://abolfazlnezami.ir/file/slider1.jpg',
//       type: MediaType.image),
//   MediaViewModel(
//       link: 'https://abolfazlnezami.ir/file/sound.mp3',
//       type: MediaType.voice),
//   MediaViewModel(
//       link: 'https://abolfazlnezami.ir/file/resume.pdf',
//       type: MediaType.pdf),
//   MediaViewModel(
//       link: 'https://abolfazlnezami.ir/file/slider2.jpg',
//       type: MediaType.image),
//   MediaViewModel(
//       link: 'https://abolfazlnezami.ir/file/video.mp4',
//       type: MediaType.video),
// ];

class StoryView extends StatelessWidget {
  final List<MediaViewModel> data;
  final Widget footer;
  final PreferredSizeWidget? appbar;
  final Widget header;

  const StoryView({
    Key? key,
    required this.data,
    required this.footer,
    required this.header,
    this.appbar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SafeArea(
        child: scaffold(
          appBar: appbar,
          body: CarouselSlider(
            options: CarouselOptions(
              height: screenHeight,
              viewportFraction: 1.0,
              enlargeCenterPage: false,
              // autoPlay: false,
            ),
            items: data.map((item) {
              Widget result = Container();
              switch (item.type) {
                case MediaType.svg:
                  result = _showImage(context, item.link);
                  break;
                case MediaType.video:
                  result = VideoPlayerScreen(url: item.link);
                  break;
                case MediaType.pdf:
                  result = _showPdf(context, item.link);
                  break;
                case MediaType.voice:
                  result = ShowVoice(url: item.link);
                  break;
                case MediaType.link:
                  result = _showWeb(context, item.link);
                  break;
                case MediaType.image:
                  result = _showImage(context, item.link);
                  break;
                default:
                  result = Container();
              }
              return Stack(
                children: [
                  result,
                  Positioned(top: 0, left: 0, right: 0, child: header),
                  Positioned(bottom: 0, left: 0, right: 0, child: footer),
                ],
              );
            }).toList(),
          ),
        ),
      );

  Widget _showImage(BuildContext context, String url) => Center(
        child: image(
          url,
          fit: BoxFit.cover,
          height: screenHeight,
        ),
      );

  Widget _showPdf(BuildContext context, String url) => SizedBox(
        height: screenHeight,
        child: SfPdfViewer.network(url),
      );

  Widget _showWeb(BuildContext context, String url) => WebViewX(
        initialContent: url,
        initialSourceType: SourceType.url,
        height: screenHeight,
        width: screenWidth,
      );
}

class VideoPlayerScreen extends StatefulWidget {
  final String url;

  const VideoPlayerScreen({Key? key, required this.url}) : super(key: key);

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.url);
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.play();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Container(
        height: screenHeight,
        child: FutureBuilder(
          future: _initializeVideoPlayerFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done)
              return AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              );
            else
              return const Center(child: CircularProgressIndicator());
          },
        ),
      );
}

class ShowVoice extends StatefulWidget {
  final String url;

  const ShowVoice({Key? key, required this.url}) : super(key: key);

  @override
  _ShowVoiceState createState() => _ShowVoiceState();
}

class _ShowVoiceState extends State<ShowVoice> {
  final player = AudioPlayer();

  @override
  void initState() {
    play(widget.url);
    super.initState();
  }

  void play(String url) async {
    await player.setUrl(url);
    await player.play();
  }

  @override
  void dispose() {
    player.pause();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
