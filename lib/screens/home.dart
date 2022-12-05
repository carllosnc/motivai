import 'package:flutter/material.dart';
import 'package:motivai/widgets/app_bottom_sheet.dart';
import '../models/folder.dart';
import '../utils/colors.dart';
import '../widgets/app_card_list.dart';
import '../extensions/string.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _category  = 'tudo';
  String _path = 'motivai/*';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: ProjectColors.main,
        title: Text('Motivai  •  $_category')
      ),
      body: Container(
        color: ProjectColors.main,
        child: CardList(path: _path)
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context){
              return AppButtonSheet(callback: (FolderModel folder){
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