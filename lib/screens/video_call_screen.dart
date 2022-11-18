import 'package:flutter/material.dart';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:zoom_clone/resources/auth_methods.dart';
import 'package:zoom_clone/resources/jitsi_meet_methods.dart';
import 'package:zoom_clone/utils/colors.dart';
import 'package:zoom_clone/widgets/meeting_option.dart';

class VideoCallScreen extends StatefulWidget {
  const VideoCallScreen({Key? key}) : super(key: key);

  @override
  _VideoCallScreenState createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  final AuthMethod _authMethod = AuthMethod();
  final JitsiMeetMethod _jitsiMeetMethod = JitsiMeetMethod();

  late TextEditingController _meetingIdController;
  late TextEditingController _nameController;

  late bool isAudioMuted = false;
  late bool isVideoMuted = false;
  @override
  void initState() {
    _meetingIdController = TextEditingController();
    _nameController = TextEditingController(
        text: _authMethod
            .user.displayName); //Because we want firstly it define by username
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _meetingIdController.dispose();
    _nameController.dispose();
    JitsiMeet.removeAllListeners();
  }

  _joinMeeting() {
    _jitsiMeetMethod.createMeeting(
        roomName: _meetingIdController.text,
        isAudioMuted: isAudioMuted,
        isVideoMuted: isVideoMuted,
        username: _nameController.text);
  }

  onAudioMuted(bool value) {
    setState(() {
      isAudioMuted = value;
    });
  }

  onVideoMuted(bool value) {
    setState(() {
      isVideoMuted = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Join a Meeting",
          style: TextStyle(fontSize: 18),
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 60,
            child: TextField(
              controller: _meetingIdController,
              maxLines: 1,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  fillColor: secondaryBackgroundColor,
                  filled: true,
                  hintText: "Meeting ID",
                  border: InputBorder.none),
            ),
          ),
          SizedBox(
            height: 60,
            child: TextField(
              controller: _nameController,
              maxLines: 1,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(
                  fillColor: secondaryBackgroundColor,
                  filled: true,
                  hintText: "Your Name",
                  border: InputBorder.none),
            ),
          ),
          SizedBox(
            height: height * 0.02,
          ),
          InkWell(
            onTap: _joinMeeting,
            child: const Padding(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: Text(
                "Join",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          SizedBox(
            height: height * 0.04,
          ),
          const Text(
            "JOIN OPTIONS",
            style: TextStyle(
              fontSize: 20,
            ),
            textAlign: TextAlign.start,
          ),
          SizedBox(
            height: height * 0.005,
          ),
          MeetingOption(
              text: "Don't Connect To Audio",
              isMute: isAudioMuted,
              onChange: onAudioMuted),
          SizedBox(
            height: height * 0.01,
          ),
          MeetingOption(
              text: "Turn Off My Video",
              isMute: isVideoMuted,
              onChange: onVideoMuted)
        ],
      ),
    );
  }
}
