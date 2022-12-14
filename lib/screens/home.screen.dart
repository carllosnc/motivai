import 'package:flutter/material.dart';
import 'package:motivai/components/bottom-sheet.component.dart';
import 'package:motivai/components/card-list.component.dart';
import 'package:motivai/utils/colors.dart';
import 'package:motivai/controllers/home.controller.dart';
import 'package:motivai/extensions/string.extension.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {

    var category = HomeController.instance.category;

    return ValueListenableBuilder(
      valueListenable: category,
      builder: (context, value, child) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: ProjectColors.main,
            title: Text('Motivai  •  ${'${category.value.name}'.capitalize()}')
          ),
          body: Container(
            color: ProjectColors.main,
            child: CardListComponent(path: category.value.path)
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          floatingActionButton: FloatingActionButton.extended(
            onPressed: (){
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context){
                  return ButtonSheetComponent();
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
      },
    );
  }

}