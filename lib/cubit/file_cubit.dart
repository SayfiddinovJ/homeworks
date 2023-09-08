import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homeworks/cubit/file_state.dart';
import 'package:homeworks/data/model/file_model.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class FileManagerCubit extends Cubit<FileManagerState> {
  FileManagerCubit()
      : super(
    const FileManagerState(
      progress: 0.0,
      newFileLocation: "",
    ),
  );

  myProgressEmitter(double pr) {
    emit(state.copyWith(progress: pr));
  }

  downloadFile({
    required FileModel fileInfo,
  }) async {
    //Permission get
    bool hasPermission = await _requestWritePermission();
    if (!hasPermission) return;
    Dio dio = Dio();

    // Userga ko'rinadigan path
    var directory = await getDownloadPath();
    String newFileLocation = "${directory?.path}/${fileInfo.name}${fileInfo.url.substring(fileInfo.url.length - 5, fileInfo.url.length)}";
    var allFiles = directory?.list();

    debugPrint("NEW FILE:$newFileLocation");

    List<String> filePaths = [];
    await allFiles?.forEach((element) {
      debugPrint("FILES IN DOWNLOAD FOLDER:${element.path}");
      filePaths.add(element.path.toString());
    });

    if (filePaths.contains(newFileLocation)) {
      OpenFilex.open(newFileLocation);
    } else {
      try {
        await dio.download(
          fileInfo.url,
          newFileLocation,
          onReceiveProgress: (count, total) {
            myProgressEmitter(count / total);
            if (count / total == 1.0) {
              emit(state.copyWith(newFileLocation: newFileLocation));
            }
          },
        );
      } catch (error) {
        debugPrint("DOWNLOAD ERROR:$error");
      }
    }
  }

  Future<bool> _requestWritePermission() async {
    await Permission.storage.request();
    return await Permission.storage.request().isGranted;
  }

  Future<Directory?> getDownloadPath() async {
    Directory? directory;
    try {
      if (Platform.isIOS) {
        directory = await getApplicationDocumentsDirectory();
      } else {
        directory = Directory('/storage/emulated/0/Download');
        if (!await directory.exists()) {
          directory = await getExternalStorageDirectory();
        }
      }
    } catch (err) {
      debugPrint("Cannot get download folder path");
    }
    return directory;
  }
}