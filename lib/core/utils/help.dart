import 'dart:developer';

import 'package:file_picker/file_picker.dart';
import 'package:intl/intl.dart';

Future<FilePickerResult?> pickCustomFile() async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowedExtensions: ['jpg', 'jpeg', 'png'],
    allowMultiple: false,
    onFileLoading: (FilePickerStatus status) => log(status.toString()),
    allowCompression: true,
  );

  return result;
}

String formateDate(String date) {
  DateTime dateTime = DateTime.parse(date);

  return DateFormat("EEEE, dd MMMM yyyy").format(dateTime);
}
