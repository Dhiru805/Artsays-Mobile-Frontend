import 'dart:io';
import 'dart:typed_data';

import 'package:artsays_app/constants/color_constant.dart';
import 'package:artsays_app/home_social/widget/social_bottom_animation.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photo_manager/photo_manager.dart';

import '../../../../../config/size_config.dart';

class CreatePostScreen extends StatefulWidget {
  final Function(File imageFile) onCreatePostTap;
  final File? imageFile;
  const CreatePostScreen({
    super.key,
    required this.onCreatePostTap,
    this.imageFile,
  });

  @override
  _CreatePostScreenState createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  File? _selectedImage;
  File? _selectedVideo;
  final ImagePicker _picker = ImagePicker();
  List<AssetEntity> _deviceImages = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _fetchGalleryImages();

    _tabController.addListener(() async {
      if (!_tabController.indexIsChanging) return;
      if (_tabController.index == 1) await _pickImageFromCamera();
      // if (_tabController.index == 2) await _pickVideo();
    });
  }

  Future<void> _fetchGalleryImages() async {
    final result = await PhotoManager.requestPermissionExtend();
    if (result.isAuth) {
      List<AssetPathEntity> albums = await PhotoManager.getAssetPathList(
        type: RequestType.image,
      );
      if (albums.isNotEmpty) {
        List<AssetEntity> images = await albums[0].getAssetListPaged(
          page: 0,
          size: 100,
        );
        setState(() {
          _deviceImages = images;
        });
      }
    } else {
      _showSnackBar("Gallery permission denied. Please allow in settings.");
    }
  }

  Future<void> _pickImageFromCamera() async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.camera);
      if (image != null) {
        setState(() {
          _selectedImage = File(image.path);
          _selectedVideo = null;
        });
      }
    } catch (e) {
      _showSnackBar('Camera error: $e');
    }
  }

  Future<void> _cropImage() async {
    if (_selectedImage == null) return;

    print("Cropping: ${_selectedImage!.path}");

    try {
      final croppedFile = await ImageCropper().cropImage(
        sourcePath: _selectedImage!.path,
        compressFormat: ImageCompressFormat.jpg,
        compressQuality: 100,
        uiSettings: [
          AndroidUiSettings(
            toolbarTitle: 'Crop Image',
            toolbarColor: Colors.black,
            toolbarWidgetColor: Colors.white,
            activeControlsWidgetColor: Colors.orange,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false,
          ),
        ],
      );

      if (croppedFile != null) {
        setState(() {
          _selectedImage = File(croppedFile.path);
        });
      } else {
        print("Crop canceled");
      }
    } catch (e, s) {
      print("Crop error: $e");
      print("Stacktrace: $s");
      _showSnackBar("Crop failed: $e");
    }
  }

  // Future<void> _pickVideo() async {
  //   try {
  //     final XFile? video = await _picker.pickVideo(source: ImageSource.camera);
  //     if (video != null) {
  //       setState(() {
  //         _selectedVideo = File(video.path);
  //         _selectedImage = null;
  //       });
  //       _showSnackBar('Video selected: ${video.name}');
  //     }
  //   } catch (e) {
  //     _showSnackBar('Video error: $e');
  //   }
  // }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    print("On Create Post Screen");
    final screenHeight = SizeConfig.screenHeight;
    final screenWidth = SizeConfig.screenWidth;

    return Scaffold(
      backgroundColor: ColorConstant.backgroundColor,
      body: SocialBottomAnimation(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(screenWidth * 0.05),
              topRight: Radius.circular(screenWidth * 0.05),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(
              left: screenWidth * 0.05, // 20 / typical 400 screen width ≈ 0.05
              right: screenWidth * 0.05,
            ),
            child: Column(
              children: [
                // Top Row (outside image)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        // setState(() {
                        //   _selectedImage = null;
                        //   _selectedVideo = null;
                        // });
                      },
                      icon: Icon(Icons.close, size: screenWidth * 0.07),
                    ),
                    GestureDetector(
                      onTap: () {
                        if (_selectedImage != null) {
                          widget.onCreatePostTap(_selectedImage!);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Please select an image first"),
                            ),
                          );
                        }
                      },
                      child: Text(
                        'Next',
                        style: TextStyle(
                          fontSize: screenWidth * 0.045,
                          fontWeight: FontWeight.bold,
                          color: ColorConstant.orange,
                        ),
                      ),
                    ),
                  ],
                ),

                // Selected Media Preview
                Container(
                  height: screenHeight * 0.35,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(screenWidth * 0.02),
                  ),
                  child: _selectedImage != null
                      ? Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(
                                screenWidth * 0.03,
                              ),
                              child: Image.file(
                                _selectedImage!,
                                fit: BoxFit.cover,
                                height: screenHeight * 0.35,
                                width: double.infinity,
                              ),
                            ),
                            Positioned(
                              left: 10,
                              bottom: 10,
                              child: GestureDetector(
                                onTap: () async {
                                  print("Crop icon tapped");
                                  await _cropImage();
                                },
                                child: Container(
                                  padding: EdgeInsets.all(6),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withValues(alpha: 0.6),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Icon(
                                    Icons.crop,
                                    color: Colors.black,
                                    size: screenWidth * 0.06,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      : Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.photo_library,
                                size: screenWidth * 0.15,
                                color: Colors.grey,
                              ),
                              SizedBox(height: screenHeight * 0.01),
                              Text(
                                'No Media Selected',
                                style: TextStyle(
                                  fontSize: screenWidth * 0.04,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                ),

                // Tabs Section
                TabBar(
                  dividerColor: Colors.transparent,
                  controller: _tabController,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.black,
                  indicator: UnderlineTabIndicator(
                    borderSide: BorderSide(
                      color: Colors.black, // rgba(0,0,0,1)
                      width: 0.5, // 0.5px border
                    ),
                    insets: EdgeInsets.fromLTRB(0, 0, 0, 10),
                  ),
                  labelPadding: EdgeInsets.zero,
                  tabs: [
                    Tab(text: 'Gallery'),
                    Tab(text: 'Photo'),
                    // Tab(text: 'Video'),
                  ],
                ),

                // Tab Content
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      _buildGalleryTab(screenWidth, screenHeight),
                      _buildCameraTab(),
                      // _buildVideoTab(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGalleryTab(double screenWidth, double screenHeight) {
    if (_deviceImages.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    return GridView.builder(
      itemCount: _deviceImages.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: screenWidth * 0.001,
        crossAxisSpacing: screenWidth * 0.001,
      ),
      itemBuilder: (context, index) {
        final asset = _deviceImages[index];
        return GestureDetector(
          onTap: () async {
            File? file = await asset.file;
            if (file != null) {
              setState(() {
                _selectedImage = file;
                _selectedVideo = null;
              });
            }
          },
          child: FutureBuilder<Uint8List?>(
            future: asset.thumbnailDataWithSize(const ThumbnailSize(200, 200)),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done &&
                  snapshot.data != null) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(screenWidth * 0.01),
                  child: Image.memory(snapshot.data!, fit: BoxFit.cover),
                );
              }
              return Container(color: Colors.grey[300]);
            },
          ),
        );
      },
    );
  }

  Widget _buildCameraTab() {
    return const Center(child: Text(""));
  }

  Widget _buildVideoTab() {
    return const Center(child: Text(""));
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), duration: const Duration(seconds: 2)),
    );
  }
}
