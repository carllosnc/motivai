import 'package:flutter/material.dart';
import 'package:motivai/extensions/string.dart';
import 'package:motivai/utils/colors.dart';
import '../models/folder.dart';
import '../services/cloudinary.dart';

class ListFolders extends StatelessWidget {
  const ListFolders({super.key});

  final _textStyle = const TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 16 ,
  );

  Future<List<FolderModel>> folders() async {
    var cloudinary = Cloudinary();
    var res = await cloudinary.getFolder();

    var folders = (res.data['folders'] as List).map((item) => FolderModel.fromJson(item)).toList();

    return folders;
  }

  Widget showFolders(AsyncSnapshot<List<FolderModel>> snapshot, BuildContext context){
    List<Widget> tiles = [];

    if(snapshot.hasData){
      var folders = snapshot.data ?? [];

      for (var folder in folders) {
        tiles.add(ListTile(
          title: Text(folder.name.capitalize(), style: _textStyle),
          onTap: (){
            Navigator.pop(context);
          },
        ));

        tiles.add(const Divider(height: 0));
      }

      return Column(
        children: tiles,
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

class ButtonSheet extends StatelessWidget {
  const ButtonSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: const [
                ListFolders()
              ],
            ),
          ],
        ),
      ),
    );
  }
}
