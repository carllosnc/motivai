import 'package:flutter/material.dart';
import '../models/image.dart';
import '../utils/colors.dart';
import '../widgets/app_card.dart';
import '../widgets/app_drawer.dart';
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
      drawer: const AppDrawer(),
      body: Container(
        color: ProjectColors.main,
        child: const ImageData()
      )
    );
  }
}
