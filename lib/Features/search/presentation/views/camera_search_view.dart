// ignore_for_file: deprecated_member_use, use_build_context_synchronously

import 'dart:developer';
import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:store_powered_ai/Features/search/presentation/views/recognize_view.dart';
import 'package:store_powered_ai/Features/search/presentation/views/widgets/custom_bottom_history_sheet.dart';
import 'package:store_powered_ai/core/utils/asset_data.dart';
import 'package:store_powered_ai/main.dart';
import 'package:image/image.dart' as img;

class CameraSearchView extends StatefulWidget {
  const CameraSearchView({super.key});

  @override
  State<CameraSearchView> createState() => _CameraSearchViewState();
}

class _CameraSearchViewState extends State<CameraSearchView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CameraSearchViewBody(),
    );
  }
}

class CameraSearchViewBody extends StatefulWidget {
  const CameraSearchViewBody({super.key});

  @override
  CameraSearchViewBodyState createState() => CameraSearchViewBodyState();
}

class CameraSearchViewBodyState extends State<CameraSearchViewBody> {
  CameraController? _controller;
  bool _isFlashOn = false;
  int _cameraIndex = 0;
  List<File> historyImageList = [];
  double _currentZoomLevel = 1.0;
  double _maxZoomLevel = 1.0;
  double _minZoomLevel = 1.0;
  double _baseZoom = 1.0;
  File? _latestImage;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
    _fetchLatestImage();
  }

  Future<void> _fetchLatestImage() async {
    var status = await Permission.storage.request();
    if (status.isGranted) {
      final directory = Directory("/storage/emulated/0/DCIM/Camera");
      if (directory.existsSync()) {
        List<FileSystemEntity> files = directory.listSync()
          ..sort(
              (a, b) => b.statSync().modified.compareTo(a.statSync().modified));

        if (files.isNotEmpty) {
          setState(() {
            _latestImage = File(files.first.path);
          });
        }
      }
    }
  }

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => RecognizeView(imageFile: File(pickedFile.path)),
        ),
      );
      historyImageList.add(File(pickedFile.path));
    }
  }

  Future<void> _initializeCamera() async {
    _controller = CameraController(
      cameras[_cameraIndex],
      ResolutionPreset.high,
    );

    await _controller?.initialize();
    if (mounted) {
      setState(() {});
    }
    _maxZoomLevel = await _controller!.getMaxZoomLevel();
    _minZoomLevel = await _controller!.getMinZoomLevel();

    setState(() {});
  }

  Future<void> _switchCamera() async {
    setState(() {
      _cameraIndex = (_cameraIndex + 1) % cameras.length;
    });
    await _initializeCamera();
  }

  Future<void> _showFlashEffect() async {
    OverlayEntry overlayEntry = OverlayEntry(
      builder: (context) => Container(
        color: Colors.white.withOpacity(1.0),
      ),
    );
    Overlay.of(context).insert(overlayEntry);
    await Future.delayed(
        const Duration(milliseconds: 300)); // تأثير أكثر وضوحًا مثل الكشاف
    overlayEntry.remove();
  }

  Future<File> flipImageHorizontally(File imageFile) async {
    final Uint8List bytes = await imageFile.readAsBytes();
    img.Image image = img.decodeImage(bytes)!;
    img.Image flippedImage = img.flipHorizontal(image);

    final flippedFile = File(imageFile.path)
      ..writeAsBytesSync(img.encodeJpg(flippedImage));

    return flippedFile;
  }

  Future<void> _captureImage() async {
    if (_controller == null || !_controller!.value.isInitialized) return;

    if (_controller!.description.lensDirection == CameraLensDirection.back &&
        _isFlashOn) {
      await _controller!.setFlashMode(FlashMode.torch);
    } else if (_isFlashOn) {
      await _showFlashEffect();
    }

    try {
      final image = await _controller!.takePicture();
      File finalImageFile = File(image.path);

      if (_controller!.description.lensDirection == CameraLensDirection.front) {
        finalImageFile = await flipImageHorizontally(finalImageFile);
      }

      if (mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RecognizeView(imageFile: finalImageFile),
          ),
        );
        historyImageList.add(finalImageFile);
      }
    } catch (e) {
      log("Error capturing image: $e");
    }

    if (_controller!.description.lensDirection == CameraLensDirection.back) {
      await _controller!.setFlashMode(FlashMode.off);
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          _controller != null && _controller!.value.isInitialized
              ? SizedBox(
                  width: _controller!.value.previewSize!.height,
                  height: _controller!.value.previewSize!.width,
                  child: GestureDetector(
                    onScaleStart: (details) {
                      _baseZoom = _currentZoomLevel;
                    },
                    onScaleUpdate: (details) async {
                      double newZoomLevel = (_baseZoom * details.scale)
                          .clamp(_minZoomLevel, _maxZoomLevel);

                      await _controller!.setZoomLevel(newZoomLevel);
                      setState(() {
                        _currentZoomLevel = newZoomLevel;
                      });
                    },
                    child: CameraPreview(_controller!),
                  ),
                )
              : const Center(child: CircularProgressIndicator()),
          Positioned(
            top: 10,
            left: 16,
            right: 15,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back,
                      size: 26, color: Color(0xff000000)),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        showModalBottomSheet(
                            isScrollControlled: true,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30),
                              ),
                            ),
                            context: context,
                            builder: (context) {
                              return CustomBottomHistorySheet(
                                imagesFileList: historyImageList,
                              );
                            });
                      },
                      icon: const Icon(
                        Icons.history,
                        color: Colors.black,
                        size: 26,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          _isFlashOn = !_isFlashOn;
                        });
                      },
                      icon: Icon(
                        _isFlashOn ? Icons.flash_on : Icons.flash_off,
                        color: Colors.black,
                        size: 26,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 24,
            left: 16,
            right: 15,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: _pickImage,
                    child: Container(
                      height: 57,
                      width: 61,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Colors.grey[300],
                      ),
                      child: _latestImage != null
                          ? Image.file(_latestImage!, fit: BoxFit.cover)
                          : const Icon(
                              Icons.photo,
                            ),
                    )),
                GestureDetector(
                  onTap: () {
                    _captureImage();
                  },
                  child: Container(
                    width: 75,
                    height: 75,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.black,
                        width: 4,
                      ),
                    ),
                    child: Image.asset(
                      AssetsData.cameraIconSearch,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: _switchCamera,
                  icon: Image.asset(
                    AssetsData.iconFlipCamera,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
