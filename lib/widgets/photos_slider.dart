import 'package:flutter/material.dart';
import 'package:taller/models/models.dart';

class PhotosSlider extends StatefulWidget {
  const PhotosSlider({super.key, required this.photos, required this.title, required this.onNextPage});

  final List<Photos> photos;
  final String title;
  final Function onNextPage;

  @override
  State<PhotosSlider> createState() => _PhotosSliderState();
}

class _PhotosSliderState extends State<PhotosSlider> {
  final ScrollController scrollController=ScrollController();

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      if (scrollController.position.pixels >= scrollController.position.maxScrollExtent-500){
        widget.onNextPage();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 260,
      child: Column(
        children: [
          if(widget.title != null)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:20),
            child: Text(widget.title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: widget.photos.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => _PhotoPoster(photo: widget.photos[index])
            )
          )
        ]
      ),
    );
  }
}

class _PhotoPoster extends StatelessWidget {
  const _PhotoPoster({super.key, required this.photo});

  final Photos photo;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 190,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'detail', arguments: photo),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: const AssetImage('assets/no-image.jpg'),
                image: NetworkImage("${photo.url}.jpg"),
                width: 130,
                height: 190,
                fit: BoxFit.cover
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            photo.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          )
        ]
      ),
    );
  }
}