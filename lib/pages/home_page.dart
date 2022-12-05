import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taller/provider/photos_provider.dart';
import 'package:taller/widgets/photos_slider.dart';
import 'package:taller/widgets/swiper_container.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final getPhotosProvider=Provider.of<PhotosProvider>(context, listen: true);

    //print (getPhotosProvider.photosResult);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photos App', style: TextStyle(color: Colors.white)), 
        centerTitle: true,
        elevation: 20,
      ),
      backgroundColor: Colors.blueGrey,
      
      body: SingleChildScrollView(
        child: Column(
          children: [
            SwiperContainer(photos: getPhotosProvider.photosResult),
            PhotosSlider(
              photos: getPhotosProvider.nextPhotos, 
              title: 'photos totales', 
              onNextPage: ()=>getPhotosProvider.getNextPhotos(),
            )
          ]
        ),
      ),
    );
  }
}