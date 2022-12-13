import 'package:flutter/material.dart';
import 'package:motivai/components/bottom-sheet.component.dart';
import 'package:motivai/components/card-list.component.dart';
import 'package:motivai/extensions/string.extension.dart';
import 'package:motivai/models/folder.model.dart';
import 'package:motivai/utils/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _category  = 'Tudo';
  String _path = 'motivai/*';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ProjectColors.main,
        title: Text('Motivai ${_category == 'Tudo' ? '' : ' •  $_category'}')
      ),
      body: Container(
        color: ProjectColors.main,
        child: CardListComponent(path: _path)
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context){
              return ButtonSheetComponent(callback: (FolderModel folder){
                setState(() {
                  _category = folder.name.capitalize();
                  _path = folder.path;
                });
              });
            }
          );
        },

        backgroundColor: Colors.white,
        label: const Text(
          'CATEGORIAS',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: ProjectColors.font
          ),
        ),
      ),
    );
  }

}