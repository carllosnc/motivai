import 'package:flutter/material.dart';
import 'package:motivai/widgets/app_bottom_sheet.dart';
import '../models/image.dart';
import '../utils/colors.dart';
import '../widgets/app_card.dart';
import '../services/cloudinary.dart';

class ImageData extends StatelessWidget {
  const ImageData({ super.key });

  Future<List<ImageModel>> fetchImages() async{
    var cloudinary = Cloudinary();
    var res = await cloudinary.getImages();

    List<ImageModel> images = (res.data['resources'] as List).map((item) => ImageModel.fromJson(item)).toList();

    return images;
  }

  Widget showCards(AsyncSnapshot<List<ImageModel>> snapshot, BuildContext context){
    List<Widget> cards = [];

    if(snapshot.hasData) {
      var images = snapshot.data;
      images!.shuffle();

      for(var item in images){
        cards.add(AppCard(image: item.secureUrl));
      }

      return ListView(
        padding: const EdgeInsets.fromLTRB(0, 5, 0, 76),
        children: cards,
      );
    }

    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: const Center(child: CircularProgressIndicator(
        color: Colors.white
      ))
    );
  }

  @override
  Widget build(BuildContext context){
    return FutureBuilder<List<ImageModel>>(
      future: fetchImages(),
      builder: (context, snapshot){
        return showCards(snapshot, context);
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ProjectColors.main,
        title: const Text('Motivai', style: TextStyle(fontWeight: FontWeight.w700))
      ),
      body: Container(
        color: ProjectColors.main,
        child: const ImageData()
      ),
       floatingActionButton: FloatingActionButton.extended(
        onPressed: (){
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context){
              return const ButtonSheet();
            }
          );
        },
        backgroundColor: Colors.white,
        label: const Text(
          'CATEGORIAS',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: ProjectColors.backdrop
          ),
        ),
        icon: const Icon(Icons.star, color: ProjectColors.backdrop),
      ),
    );
  }
}
