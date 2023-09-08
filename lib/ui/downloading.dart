import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homeworks/cubit/file_cubit.dart';
import 'package:homeworks/cubit/file_state.dart';
import 'package:homeworks/data/model/file_model.dart';
import 'package:open_filex/open_filex.dart';

// ignore: must_be_immutable
class SingleFileDownload extends StatelessWidget {
  SingleFileDownload({Key? key, required this.fileModel}) : super(key: key);

  final FileModel fileModel;
  FileManagerCubit fileManagerCubit = FileManagerCubit();

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: fileManagerCubit,
      child: BlocBuilder<FileManagerCubit, FileManagerState>(
        builder: (context, state) {
          return ListTile(
            leading: state.newFileLocation.isEmpty
                ? const Icon(Icons.download)
                : const Icon(Icons.download_done),
            title: Text("Downloaded: ${state.progress * 100} %"),
            subtitle: LinearProgressIndicator(
              value: state.progress,
              backgroundColor: Colors.black,
            ),
            onTap: () {
              context
                  .read<FileManagerCubit>()
                  .downloadFile(fileInfo: fileModel);
            },
            trailing: IconButton(
              onPressed: () {
                if (state.newFileLocation.isNotEmpty) {
                  debugPrint(state.newFileLocation);
                  OpenFilex.open(state.newFileLocation);
                }
              },
              icon: const Icon(Icons.file_open),
            ),
          );
        },
      ),
    );
  }
}