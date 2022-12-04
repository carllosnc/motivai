import 'package:flutter/material.dart';
import 'package:motivai/extensions/string.dart';
import 'package:motivai/utils/colors.dart';
import '../models/folder.dart';
import '../services/cloudinary.dart';

class _ListFolders extends StatelessWidget {
  final void Function(FolderModel)? callback;

  const _ListFolders(this.callback);

  final _textStyle = const TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 16 ,
  );

  // get images from cloudinary

  Future<List<FolderModel>> folders() async {
    var cloudinary = Cloudinary();
    var res = await cloudinary.getFolder();

    var folders = (res.data['folders'] as List).map((item) => FolderModel.fromJson(item)).toList();

    return folders;
  }

  // show folder lists

  Widget showFolders(AsyncSnapshot<List<FolderModel>> snapshot, BuildContext context){
    List<Widget> tiles = [];

    if(snapshot.hasData){
      var folders = snapshot.data ?? [];

      folders.add(FolderModel(
        path: "motivai/*", name: 'tudo'
      ));

      for (var folder in folders) {
        tiles.add(ListTile(
          title: Text(folder.name.capitalize(), style: _textStyle),
          onTap:(){
            callback!(folder);
            Navigator.pop(context);
          },
        ));

        tiles.add(const Divider(height: 0));
      }

      return Column(
        children: tiles,
      );
    }

    if (snapshot.hasError){
      return (
        const Padding(
          padding: EdgeInsets.fromLTRB(10, 60, 10, 10),
          child: Center(
            child: Text('Falha no carregamento!', style: TextStyle(fontWeight: FontWeight.w700)),
          ),
        )
      );
    }

    return const SizedBox(
      height: 100,
      child: Center(
        child: SizedBox(
          width: 25,
          height: 25,
          child: CircularProgressIndicator(color: ProjectColors.main),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: folders(),
      builder: (context, snapshot){
        return showFolders(snapshot, context);
      }
    );
  }
}

// button sheet widget

class AppButtonSheet extends StatelessWidget {
  final void Function(FolderModel)? callback;

  const AppButtonSheet({this.callback, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                _ListFolders(callback)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
