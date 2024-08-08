import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AudioScreen extends StatefulWidget {
  final String audioUrl;
  const AudioScreen({super.key, required this.audioUrl});

  @override
  State<AudioScreen> createState() => _AudioScreenState();
}

class _AudioScreenState extends State<AudioScreen> {
  late AudioPlayer _audioPlayer;
  bool _isPlaying = false;
  Duration _position = Duration();
  Duration _duration = Duration();

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _audioPlayer.onPositionChanged.listen((event) {
      setState(() {
        _position = event;
      });
    });
    _audioPlayer.onDurationChanged.listen((event) {
      setState(() {
        _duration = event;
      });
    });
    _audioPlayer.onPlayerComplete.listen((event) {
      context.pop();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(_isPlaying ? Icons.pause : Icons.play_arrow),
                onPressed: () {
                  if (_isPlaying) {
                    _audioPlayer.pause();
                  } else {
                    _audioPlayer.play(UrlSource(widget.audioUrl));
                  }
                  setState(() {
                    _isPlaying = !_isPlaying;
                  });
                },
              ),
            ],
          ),
          _position != Duration()
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: LinearProgressIndicator(
                    value: _position.inMilliseconds / _duration.inMilliseconds,
                  ),
                )
              : SizedBox.shrink(),
          SizedBox(
            height: 5,
          ),
          if (_position != Duration()) ...[
            Text(
              "${_position.inMinutes}:${(_position.inSeconds % 60).toString().padLeft(2, '0')} / ${_duration.inMinutes}:${(_duration.inSeconds % 60).toString().padLeft(2, '0')}",
              style: TextStyle(fontSize: 12),
            ),
          ]
        ],
      ),
    );
  }
}
