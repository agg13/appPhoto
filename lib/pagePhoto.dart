import 'dart:developer' as developer;
import 'dart:math';
import 'dart:io';
import 'package:app_photo/generated/l10n.dart';
import 'package:flutter/material.dart';
//import 'package:path_provider/path_provider.dart';
import 'package:camera/camera.dart';
import 'package:app_photo/tools.dart';

class Photo extends StatefulWidget {
  @override
  TakePhoto createState() => TakePhoto();
}

class TakePhoto extends State<Photo> with WidgetsBindingObserver {
  // ******** Global
  CameraController _controller;
  Future<void> _initController;
  bool isCameraReady = false;
  XFile imageFile;

  // ******** override Methods
  @override
  void initState() {
    super.initState();
    initCamera();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _controller?.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _initController = _controller != null ? _controller.initialize() : null;
    }
    if (!mounted) return;
    setState(() {
      isCameraReady = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
      future: _initController,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Stack(children: [
            cameraWidget(context),
            Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                    color: Color(0xAA333639),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          IconButton(
                            iconSize: 40,
                            icon: Icon(
                              Icons.camera_alt,
                              color: Colors.white,
                            ),
                            onPressed: () => captureImage(context),
                          )
                        ])))
          ]);
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    ));
  }

  // ******** Methods usewd to open the camera and capture the picture/photo
  Widget cameraWidget(context) {
    var camera = _controller.value;
    final size = MediaQuery.of(context).size;
    var scale = size.aspectRatio * camera.aspectRatio;
    if (scale < 1) scale = 1 / scale;
    return Transform.scale(
        scale: scale, child: Center(child: CameraPreview(_controller)));
  }

  Future<void> initCamera() async {
    final cameras = await availableCameras();
    final firstCamera = cameras.first;
    _controller = CameraController(firstCamera, ResolutionPreset.high);
    _initController = _controller.initialize();
    if (!mounted) return;
    setState(() {
      isCameraReady = true;
    });
  }

  captureImage(BuildContext context) {
    _controller.takePicture().then((file) {
      setState(() {
        imageFile = file;
      });
      if (mounted) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    DisplayPictureOnScreen(image: imageFile)));
      }
    });
  }
}

class DisplayPictureOnScreen extends StatefulWidget {
  // ******** Global
  final XFile image;

  DisplayPictureOnScreen({this.image});

  @override
  _DisplayPictureOnScreen createState() =>
      new _DisplayPictureOnScreen(image: this.image);
}

class _DisplayPictureOnScreen extends State<DisplayPictureOnScreen> {
  // ******** Global
  var _result;
  final XFile image;
  Directory directory;

  // ********
  _DisplayPictureOnScreen({this.image, this.directory});

  // ******** override Methods
  @override
  void initState() {
    super.initState();
    var toolFile = ToolsFiles();
    toolFile.getDir().then((result) => {
          setState(() {
            _result = result;
            directory = toolFile.appExternalStorageDirectory;
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    if (_result == null) {
      return new Container();
    }
    //var toolFile = ToolsFiles();
    developer.log("[AGG-T] Image Path: ${image.path}");
    developer.log("[AGG-T] Image Path: ${image.name}");
    developer.log("[AGG-T] Directory Path: ${directory.path}");
    //toolFile.getDir();
    //directory = toolFile.appExternalStorageDirectory;
    return Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).titlePictureDisplayText),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Image.file(File(image.path)),
                  ElevatedButton(
                      child: Text(S.of(context).savePictureButtonText),
                      onPressed: () {
                        // Simulating good and bad pictures/photos [only for testing]
                        var rng = new Random();
                        int randNumGenerated = rng.nextInt(100);
                        bool isPictureOk =
                            (randNumGenerated % 2) == 0 ? true : false;
                        if (!isPictureOk) {
                          showAlertDialog(context);
                        } else {
                          showSuccessDialog(context);
                          String newPath = "${directory.path}/${image.name}";
                          image.saveTo(newPath); // need to handle error
                        }
                        // Tooltip to show the random generated numbers [it does not work]
                        String infoRNG = S
                            .of(context)
                            .infoRandomNumberGeneratorText(
                                randNumGenerated, isPictureOk);
                        Tooltip(
                          message: infoRNG,
                          child: Text(""),
                        );
                        developer.log(infoRNG);
                      })
                ],
              ),
            ),
          ),
        ));
  }

  // ******** Methods to get path storage and to show dialog to simulate bad/good picture
  showAlertDialog(BuildContext context) {
    Widget okButton = TextButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: Text(S.of(context).alertDialogTextOkButton));

    AlertDialog alert = AlertDialog(
      title: Text(S.of(context).alertDialogPhotoNOKTitleText),
      content: Text(S.of(context).alertDialogPhotoNOKContentText),
      actions: [okButton],
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  }

  showSuccessDialog(BuildContext context) {
    Widget okButton = TextButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: Text(S.of(context).alertDialogTextOkButton));

    AlertDialog alert = AlertDialog(
      title: Text(S.of(context).alertDialogPhotoOKTitleText),
      content: Text(S.of(context).alertDialogPhotoOKContentText),
      actions: [okButton],
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  }
}
