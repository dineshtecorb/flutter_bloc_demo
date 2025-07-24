import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

class ImagepickerState extends Equatable {
  final XFile imageFile;

  const ImagepickerState({required this.imageFile});

  ImagepickerState copyWith({XFile? file}) {
    return ImagepickerState(imageFile: file ?? imageFile);
  }

  @override
  List<Object> get props => [imageFile];
}
