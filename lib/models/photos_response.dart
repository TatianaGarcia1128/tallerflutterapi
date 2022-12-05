import 'dart:convert';
import 'package:taller/models/photos.dart';

class PhotosResponse {
    PhotosResponse({
        required this.results,
    });

    List<Photos> results; 

    factory PhotosResponse.fromJson(String str) => PhotosResponse.toList(json.decode(str));

    // factory PhotosResponse.toLi(Map<String, dynamic> json) => PhotosResponse(
    //     results: List<Photos>.from(json["results"].map((x) => Photos.fromMap(x))),
    // );
    factory PhotosResponse.toList(List<dynamic> json) => PhotosResponse(
        results: List<Photos>.from(json.map((x) => Photos.fromMap(x))),
    );
}
