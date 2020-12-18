import 'dart:convert';
import 'package:conecta/src/models/pelicula_model.dart';
import 'package:http/http.dart' as http;

class PeliculasProvider{

  String _apikey    = 'b90dbb45e9da08c425c514d9cd0b0f2c';
  String _url       = 'api.themoviedb.org';
  String _language  = 'es-ES';

  Future<List<Pelicula>> getEnCines() async {

    final url = Uri.https( _url, '3/movie/now_playing', {
      'api_key'   : _apikey,
      'language'  : _language
    });

    final resp = await http.get(url);
    final decodeData = json.decode(resp.body);

    final peliculas = new Peliculas.fromJsonList(decodeData['results']);    

    return peliculas.items;

  }

}