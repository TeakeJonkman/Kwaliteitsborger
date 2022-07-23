import 'package:flutter/material.dart';

class DiciplineScreen extends StatelessWidget {
  const DiciplineScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    String? dropdownValue;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Disciplines"),
          backgroundColor: Colors.green,
        ),
        body: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: ElevatedButton.icon(
                onPressed: () {
                  print("Camera");
                },
                icon: Icon(Icons.photo_camera),
                label: Text("Take picture"),
                style: ElevatedButton.styleFrom(
                  textStyle: TextStyle(fontSize: 15),
                  minimumSize: const Size(350, 350),
                  maximumSize: const Size(350, 350),
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: DropdownButton<String>(
                hint: Text('Selecteer discipline...'),
                value: dropdownValue,
                isExpanded: true,
                icon: const Icon(Icons.arrow_downward),
                elevation: 16,
                style: const TextStyle(color: Colors.black),
                underline: Container(
                  height: 2,
                  color: Colors.blue,
                ),
                onChanged: (String? newValue) {
                  dropdownValue = newValue!;
                  print(dropdownValue);
                },
                items: <String>[
                  'Achterwand plaatsen',
                  'Tegels plakken',
                  'Voegen',
                  'Kitten'
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Description...',
                  hintText: 'Description...',
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 3, color: Colors.blue),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                keyboardType: TextInputType.multiline,
                maxLines: null,
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: ElevatedButton.icon(
                onPressed: () {
                  print("Add discipline");
                },
                icon: Icon(Icons.add_task),
                label: Text("Add discipline"),
                style: ElevatedButton.styleFrom(
                  textStyle: TextStyle(fontSize: 15),
                  minimumSize: const Size(350, 40),
                  maximumSize: const Size(350, 40),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// import 'dart:async';
// import 'dart:io';

// import 'package:camera/camera.dart';
// import 'package:flutter/material.dart';

// Future<void> getCamera() async {
//   // Ensure that plugin services are initialized so that `availableCameras()`
//   // can be called before `runApp()`
//   WidgetsFlutterBinding.ensureInitialized();

//   // Obtain a list of the available cameras on the device.
//   final cameras = await availableCameras();

//   // Get a specific camera from the list of available cameras.
//   final firstCamera = cameras.first;

//   runApp(
//     MaterialApp(
//       theme: ThemeData.dark(),
//       home: TakePictureScreen(
//         // Pass the appropriate camera to the TakePictureScreen widget.
//         camera: firstCamera,
//       ),
//     ),
//   );
// }

// // A screen that allows users to take a picture using a given camera.
// class TakePictureScreen extends StatefulWidget {
//   const TakePictureScreen({
//     Key? key,
//     required this.camera,
//   }) : super(key: key);

//   final CameraDescription camera;

//   @override
//   TakePictureScreenState createState() => TakePictureScreenState();
// }

// class TakePictureScreenState extends State<TakePictureScreen> {
//   late CameraController _controller;
//   late Future<void> _initializeControllerFuture;

//   @override
//   void initState() {
//     super.initState();
//     // To display the current output from the Camera,
//     // create a CameraController.
//     _controller = CameraController(
//       // Get a specific camera from the list of available cameras.
//       widget.camera,
//       // Define the resolution to use.
//       ResolutionPreset.medium,
//     );

//     // Next, initialize the controller. This returns a Future.
//     _initializeControllerFuture = _controller.initialize();
//   }

//   @override
//   void dispose() {
//     // Dispose of the controller when the widget is disposed.
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Take a picture')),
//       // You must wait until the controller is initialized before displaying the
//       // camera preview. Use a FutureBuilder to display a loading spinner until the
//       // controller has finished initializing.
//       body: FutureBuilder<void>(
//         future: _initializeControllerFuture,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.done) {
//             // If the Future is complete, display the preview.
//             return CameraPreview(_controller);
//           } else {
//             // Otherwise, display a loading indicator.
//             return const Center(child: CircularProgressIndicator());
//           }
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         // Provide an onPressed callback.
//         onPressed: () async {
//           // Take the Picture in a try / catch block. If anything goes wrong,
//           // catch the error.
//           try {
//             // Ensure that the camera is initialized.
//             await _initializeControllerFuture;

//             // Attempt to take a picture and get the file `image`
//             // where it was saved.
//             final image = await _controller.takePicture();

//             // If the picture was taken, display it on a new screen.
//             await Navigator.of(context).push(
//               MaterialPageRoute(
//                 builder: (context) => DisplayPictureScreen(
//                   // Pass the automatically generated path to
//                   // the DisplayPictureScreen widget.
//                   imagePath: image.path,
//                 ),
//               ),
//             );
//           } catch (e) {
//             // If an error occurs, log the error to the console.
//             print(e);
//           }
//         },
//         child: const Icon(Icons.camera_alt),
//       ),
//     );
//   }
// }

// // A widget that displays the picture taken by the user.
// class DisplayPictureScreen extends StatelessWidget {
//   final String imagePath;

//   const DisplayPictureScreen({Key? key, required this.imagePath})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Display the Picture')),
//       // The image is stored as a file on the device. Use the `Image.file`
//       // constructor with the given path to display the image.
//       body: Image.file(File(imagePath)),
//     );
//   }
// }
