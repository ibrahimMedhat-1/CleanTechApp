//  import 'package:image_cropper/image_cropper.dart';
// import 'package:image_picker/image_picker.dart';
//
// class ImageHelper {
//   final ImagePicker _imagePicker;
//   final ImageCropper _imageCropper;
//
//   ImageHelper({
//     ImagePicker? imagePicker,
//     ImageCropper? imageCropper,
//   })  : _imagePicker = imagePicker ?? ImagePicker(),
//         _imageCropper = imageCropper ?? ImageCropper();
//
//   Future<XFile?> pickImageFromCamera({
//     ImageSource source = ImageSource.camera,
//     int imageQuality = 100,
//   }) async {
//     return await _imagePicker.pickImage(
//         source: source, imageQuality: imageQuality);
//   }
//
//   Future<XFile?> pickImageFromGallery({
//     ImageSource source = ImageSource.gallery,
//     int imageQuality = 100,
//     bool multiPle = false,
//   }) async {
//     return await _imagePicker.pickImage(
//       source: source,
//       imageQuality: imageQuality,
//     );
//   }
//
//   Future<CroppedFile?> crop({
//     required XFile file,
//     CropStyle cropStyle = CropStyle.rectangle,
//   }) async =>
//       await _imageCropper.cropImage(
//         sourcePath: file.path,
//         cropStyle: cropStyle,
//         // aspectRatio: CropAspectRatio(ratioX: 100.h, ratioY: 200.w),
//         // compressQuality: 100,
//         // uiSettings: [
//         //   IOSUiSettings(),
//         //   AndroidUiSettings(),
//         // ],
//       );
// }
