import 'dart:io';

import 'package:bloc_demo_poc/screens/imagepicker/bloc/imagepicker_bloc.dart';
import 'package:bloc_demo_poc/screens/imagepicker/bloc/imagepicker_event.dart';
import 'package:bloc_demo_poc/screens/imagepicker/bloc/imagepicker_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImagePickerScreen extends StatefulWidget {
  const ImagePickerScreen({super.key});

  @override
  State<ImagePickerScreen> createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Picker'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
      ),
      body: BlocBuilder<ImagepickerBloc, ImagepickerState>(
        builder: (context, state) {
          if (state.imageFile.path.isEmpty) {
            return Center(
                child: GestureDetector(
                    onTap: () {
                      context
                          .read<ImagepickerBloc>()
                          .add(ImagePickFromGalleryEvent());
                    },
                    child: Icon(Icons.camera)));
          } else {
            return Image.file(File(state.imageFile.path.toString()));
          }
        },
      ),
    );
  }
}
