import 'package:flutter/material.dart';
import 'package:motivai/utils/colors.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';

class AppCard extends StatelessWidget {
  final String image;

  const AppCard({
    this.image = '',
    super.key
  });

  @override
  Widget build(BuildContext context) {

    return Card(
      elevation: 0,
      child: Container(
        width: 500,
        padding: const EdgeInsets.all(3),
        child: Column(
          children: [

            Container(
              color: Colors.black,
              child: FadeInImage.memoryNetwork(
                fadeInDuration: const Duration(milliseconds: 300),
                placeholder: kTransparentImage,
                image: image,
                width: 1000,
                fit: BoxFit.fitHeight
              ),
            ),

            const SizedBox(height: 3),

            MaterialButton(
              minWidth: double.infinity,
              height: 50,
              color: ProjectColors.main,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              elevation: 0,
              onPressed: () async{

                Uint8List bytes = (await NetworkAssetBundle(Uri.parse(image))
                .load(image)).buffer.asUint8List();

                Share.shareXFiles(
                  [XFile.fromData(bytes, name: 'motivai', mimeType: 'image/jpeg')]
                );

              },
              child: const Text(
                'COMPARTILHAR',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w700
                )
              )
            )
          ],
        ),
      )
    );

  }
}
