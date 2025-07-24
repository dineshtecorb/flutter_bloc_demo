import 'package:bloc_demo_poc/screens/imagepicker/bloc/imagepicker_event.dart';
import 'package:bloc_demo_poc/screens/imagepicker/bloc/imagepicker_state.dart';
import 'package:bloc_demo_poc/utils/image_picker_utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class ImagepickerBloc extends Bloc<ImagepickerEvent, ImagepickerState> {
  ImagePickerUtils imagePickerUtils;
  ImagepickerBloc(this.imagePickerUtils)
      : super(ImagepickerState(imageFile: XFile(''))) {
    on<ImageCaptureEvent>(_caputeImage);
    on<ImagePickFromGalleryEvent>(_pickImageFromGallery);
  }

  Future<void> _caputeImage(
      ImageCaptureEvent event, Emitter<ImagepickerState> emit) async {
    XFile? file = await imagePickerUtils.cameraCapture();
    emit(state.copyWith(file: file));
  }

  Future<void> _pickImageFromGallery(
      ImagePickFromGalleryEvent event, Emitter<ImagepickerState> emit) async {
    XFile? file = await imagePickerUtils.pickImageFromGallery();
    Future.delayed(Duration(seconds: 2), () {
      if (file != null) {
        emit(state.copyWith(file: file));
      } else {
        emit(state.copyWith(file: state.imageFile));
      }
    });
  }
}
