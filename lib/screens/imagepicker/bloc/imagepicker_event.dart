import 'package:equatable/equatable.dart';

abstract class ImagepickerEvent extends Equatable {
  const ImagepickerEvent();

  @override
  List<Object> get props => [];
}

class ImageCaptureEvent extends ImagepickerEvent {}

class ImagePickFromGalleryEvent extends ImagepickerEvent {}
