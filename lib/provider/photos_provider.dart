import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:taller/models/models.dart';

class PhotosProvider extends ChangeNotifier{
  final String _baseUrl='jsonplaceholder.typicode.com';
  int _albumId=0;

  List<Photos> photosResult=[];
  List<Photos> nextPhotos=[];

  PhotosProvider(){
    getPhoto();
    getNextPhotos();
  }

  Future<String> _getJsonData(String segmentUrl, [int albumId=1]) async{
    final url=Uri.https(_baseUrl, segmentUrl,  {
      'albumId': '$albumId'
    });

    final response=await http.get(url);

    if(response.statusCode != 200){
      return 'Error en la petición';
    }

    return response.body;
  }

  getPhoto() async{
    final jsonData=await _getJsonData('/photos');
    // print(jsonData);
    // print(jsonData is String);

    final photosResponse=PhotosResponse.fromJson(jsonData);
    print(photosResponse);
    photosResult=photosResponse.results;
    //jsonplaceholderResult=jsonplaceholderResponse;

    notifyListeners();
  }

  getNextPhotos() async{
    _albumId++;
    final jsonData=await _getJsonData('/photos', _albumId);
    final responseNextPhoto=PhotosResponse.fromJson(jsonData);
    nextPhotos=[...nextPhotos, ...responseNextPhoto.results]; 
    notifyListeners();
  }

}