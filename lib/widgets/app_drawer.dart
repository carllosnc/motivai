import 'package:flutter/material.dart';
import '../utils/colors.dart';
import '../services/cloudinary.dart';
import '../models/folder.dart';
import '../extensions/string.dart';

class ListFolders extends StatelessWidget {
  const ListFolders({super.key});

  final _textStyle = const TextStyle(
    color: Colors.white,
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
          onTap: (){},
        ));
      }

      return Column(
        children: tiles,
      );
    }

    return const SizedBox(
      height: 100,
      child: Center(
        child: SizedBox(
          width: 30,
          height: 30,
          child: CircularProgressIndicator(color: Colors.white),
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

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: ProjectColors.main,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: ProjectColors.backdrop,
                image: DecorationImage(
                  image: AssetImage('images/drawer_backdrop.png'),
                  fit: BoxFit.cover
                )
              ),
              child: Stack(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Positioned(
                    right: 12,
                    bottom: 20,
                    child: Image.asset('images/motivai_symbol.png', width: 50)
                  )
                ],
              )
            ),

            const ListFolders()
          ],
        ),
      );
  }
}
