import 'package:flutter/material.dart';
import 'package:motivai/extensions/string.extension.dart';
import 'package:motivai/repositories/folder.repository.dart';
import 'package:motivai/utils/colors.dart';
import 'package:motivai/models/folder.model.dart';

class ButtonSheetComponent extends StatelessWidget {
  final void Function(FolderModel)? callback;

  ButtonSheetComponent({this.callback, super.key});

  final _textStyle = const TextStyle(
    fontSize: 16,
    color: Colors.white
  );

  final FolderRepository folderRepository = FolderRepository();

  Widget showFolders(
    AsyncSnapshot<List<FolderModel>> snapshot,
    BuildContext context
  ){
    List<Widget> tiles = [];

    if(snapshot.hasData){
      var folders = snapshot.data ?? [];

      folders.add(
        FolderModel(path: "motivai/*", name: 'tudo')
      );

      for (var folder in folders) {
        tiles.add(ListTile(
            title: Text(folder.name.capitalize(), style: _textStyle),
            onTap:(){
              callback!(folder);
              Navigator.pop(context);
            },
          ),
        );

        tiles.add(const Divider(height: 0, color: Color.fromARGB(255, 13, 136, 79)));
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
            child: Text(
              'Falha no carregamento!',
              style: TextStyle(fontWeight: FontWeight.w700)
            ),
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
          child: CircularProgressIndicator(color: Colors.white),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ProjectColors.sheet,
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FutureBuilder(
              future: folderRepository.getFolders(),
              builder: (context, snapshot){
                return showFolders(snapshot, context);
              }
            )
          ],
        ),
      ),
    );
  }
}
