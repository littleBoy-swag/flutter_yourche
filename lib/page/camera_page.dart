import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CameraPage extends StatefulWidget {
  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  var cameras;
  CameraController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initCamera();
  }

  Future initCamera() async {
    cameras = await availableCameras();
    _controller = CameraController(cameras[0], ResolutionPreset.max);
    _controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final device_ratio = size.width / size.height;
    if (_controller == null || _controller.value == null) {
      return Container(
        child: Center(
          child: CupertinoActivityIndicator(),
        ),
      );
    }
    if (!_controller.value.isInitialized) {
      return Container(
        child: Center(
          child: CupertinoActivityIndicator(),
        ),
      );
    }
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Transform.scale(
            scale: _controller.value.aspectRatio / device_ratio,
            child: AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: CameraPreview(_controller),
            ),
          ),
          Positioned(
            top: 32,
            left: 16,
            child: InkWell(
              child: Icon(
                Icons.arrow_back_ios,
                size: 20,
                color: Colors.white,
              ),
              onTap: () {
                Navigator.maybePop(context);
              },
            ),
          ),
          Positioned(
            top: 32,
            right: 16,
            child: Image.asset(
              'images/ic_camera_flash.png',
              width: 20,
              height: 20,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 165,
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 15),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        "点击拍照，长按录制",
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 49),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset(
                            'images/ic_camera_photo.png',
                            width: 24,
                            height: 24,
                          ),
                          SizedBox(
                            width: 69,
                          ),
                          Container(
                            width: 63,
                            height: 63,
                            color: Colors.blueAccent,
                          ),
                          SizedBox(
                            width: 69,
                          ),
                          InkWell(
                            onTap: _switchCamera,
                            child: Image.asset(
                              'images/ic_camera_switch.png',
                              width: 24,
                              height: 24,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  void _switchCamera() async {
    final CameraDescription cameraDescription =
        (_controller.description == cameras[0]) ? cameras[1] : cameras[0];
    if (_controller != null) {
      await _controller.dispose();
    }
    _controller = CameraController(cameraDescription, ResolutionPreset.medium);
    _controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }
}
