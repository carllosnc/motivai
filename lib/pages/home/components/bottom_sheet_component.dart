import 'package:flutter/material.dart';

import '/domain/domain.dart';
import '/data/data.dart';
import '/core/core.dart';

import '../home_controller.dart';

class ButtonSheetComponent extends StatelessWidget {
  ButtonSheetComponent({super.key});

  final FolderRepository folderRepository = FolderRepository();

  Widget showFolders(
    AsyncSnapshot<List<Folder>> snapshot,
    BuildContext context,
  ) {
    List<Widget> tiles = [];

    if (snapshot.hasData) {
      var folders = snapshot.data ?? [];

      folders.add(
        Folder(path: "motivai/*", name: 'tudo'),
      );

      for (var folder in folders) {
        tiles.add(
          ListTile(
            title: Text(
              folder.name.capitalize(),
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            onTap: () {
              HomeController.instance.setCategory(folder);
              Navigator.pop(context);
            },
          ),
        );

        tiles.add(
          const Divider(
            height: 0,
            color: Color.fromARGB(255, 13, 136, 79),
          ),
        );
      }

      return Column(
        children: tiles,
      );
    }

    if (snapshot.hasError) {
      return const Padding(
        padding: EdgeInsets.fromLTRB(10, 60, 10, 10),
        child: Center(
          child: Text(
            'Falha no carregamento!',
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
        ),
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
      height: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FutureBuilder(
              future: folderRepository.getFolders(),
              builder: (context, snapshot) {
                return showFolders(snapshot, context);
              },
            )
          ],
        ),
      ),
    );
  }
}
