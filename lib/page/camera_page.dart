import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_yourche/page/photo_preview_page.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:path_provider/path_provider.dart';

class CameraPage extends StatefulWidget {
  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  var cameras;
  CameraController _controller;
  List<Asset> images = List<Asset>();

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
                          InkWell(
                            onTap: _loadAssets,
                            child: Image.asset(
                              'images/ic_camera_photo.png',
                              width: 24,
                              height: 24,
                            ),
                          ),
                          SizedBox(
                            width: 69,
                          ),
                          InkWell(
                            onTap: _captureImage,
                            child: Container(
                              width: 63,
                              height: 63,
                              color: Colors.blueAccent,
                            ),
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

  void _captureImage() async {
    if (_controller.value.isInitialized) {
      final Directory extDir = await getApplicationDocumentsDirectory();
      final String dirPath = "${extDir.path}/media";
      await Directory(dirPath).create(recursive: true);
      final String filePath =
          "$dirPath/${DateTime.now().millisecondsSinceEpoch.toString()}.jpeg";
      print(filePath);
      await _controller.takePicture(filePath);
      //跳转至照片预览页面
      Navigator.of(context).push(MaterialPageRoute(builder: (_) {
        return PhotoPreViewPage(
          imgPath: filePath,
        );
      }));
    }
  }

  Future<String> _startVideoRecord() async {
    if (!_controller.value.isInitialized) {
      return null;
    }

    final Directory extDir = await getApplicationDocumentsDirectory();
    final String dirPath = "${extDir.path}/media";
    await Directory(dirPath).create(recursive: true);
    final String filePath =
        "$dirPath/${DateTime.now().millisecondsSinceEpoch.toString()}.mp4";
    print(filePath);
    if (_controller.value.isRecordingVideo) {
      return null;
    }
    try {
      await _controller.startVideoRecording(filePath);
    } on CameraException catch (e) {
      return null;
    }
    return filePath;
  }

  Future<void> _stopVideoRecord() async {
    if (!_controller.value.isRecordingVideo) {
      return null;
    }
    try {
      await _controller.stopVideoRecording();
      //视频录制结束后跳转至视频预览页
      Navigator.of(context).push(MaterialPageRoute(builder: (_) {
        return PhotoPreViewPage(
          imgPath: "",
        );
      }));
    } on CameraException catch (e) {
      return null;
    }
  }

  Future<void> _loadAssets() async {
    List<Asset> resultList = List<Asset>();
    String error = 'No Error Dectected';

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 300,
        enableCamera: true,
        selectedAssets: images,
        cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
        materialOptions: MaterialOptions(
          actionBarColor: "#abcdef",
          actionBarTitle: "Example App",
          allViewTitle: "All Photos",
          useDetailsView: false,
          selectCircleStrokeColor: "#000000",
        ),
      );
    } on Exception catch (e) {
      error = e.toString();
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

//    setState(() {
//      images = resultList;
//      _error = error;
//    });
  }


}
