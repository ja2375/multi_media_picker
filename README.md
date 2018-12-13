# multi_media_picker

A fork of the official image_picker plugin that adds the functionality to pick multiple images.

NOTE: On iOS only one image can be picked as of now. Android is fully supported.

## Installation

In your `pubspec.yaml` file within your Flutter Project: 

```yaml
dependencies:
  multi_media_picker: ^0.1.2
```

### iOS

**NOT FULLY SUPPORTED YET**

Add the following keys to your _Info.plist_ file, located in `<project root>/ios/Runner/Info.plist`:

* `NSPhotoLibraryUsageDescription` - describe why your app needs permission for the photo library. This is called _Privacy - Photo Library Usage Description_ in the visual editor.
* `NSCameraUsageDescription` - describe why your app needs access to the camera. This is called _Privacy - Camera Usage Description_ in the visual editor.
* `NSMicrophoneUsageDescription` - describe why your app needs access to the microphone, if you intend to record videos. This is called _Privacy - Microphone Usage Description_ in the visual editor.

### Android

No configuration required - the plugin should work out of the box.

### Example

``` dart
import 'package:multi_media_picker/multi_media_picker.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<File> _images;

  Future getImage() async {
    var images = await MultiMediaPicker.pickImages(sources: ImageSource.camera);

    setState(() {
      _images = images;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Picker Example'),
      ),
      body: Center(
        child: _images == null
            ? Text('No image selected.')
            : Image.file(_images[0]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        tooltip: 'Pick Image',
        child: Icon(Icons.add_a_photo),
      ),
    );
  }
}
```