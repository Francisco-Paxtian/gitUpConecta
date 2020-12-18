class Peliculas{

  List<Pelicula> items = new List();

  Peliculas();

  Peliculas.fromJsonList(List<dynamic> jsonList){
    
    if (jsonList == null) return;

    for(var item in jsonList){

      final pelicula = new Pelicula.fromJsonMap(item);
      items.add(pelicula);
      
    }

  }

}

class Pelicula {
  String title;
  double voteAverage;
  double popularity;
  String overview;
  String releaseDate;
  bool adult;
  String backdropPath;
  int id;
  List<int> genreIds;
  int voteCount;
  String originalLanguage;
  String originalTitle;
  String posterPath;
  bool video;

  Pelicula({
    this.title,
    this.voteAverage,
    this.popularity,
    this.overview,
    this.releaseDate,
    this.adult,
    this.backdropPath,
    this.id,
    this.genreIds,
    this.voteCount,
    this.originalLanguage,
    this.originalTitle,
    this.posterPath,
    this.video,
  });

  Pelicula.fromJsonMap(Map<String , dynamic> json){

    title             = json['title'];
    voteAverage       = json['vote_average'] / 1  ;
    popularity        = json['popularity'] / 1;
    overview          = json['overview'];
    releaseDate       = json['release_date'];
    adult             = json['adult'];
    backdropPath      = json['backdrop_path'];
    id                = json['id'];
    genreIds          = json['genre_ids'].cast<int>();
    voteCount         = json['vote_count'];
    originalLanguage  = json['original_language'];
    originalTitle     = json['original_title'];
    posterPath        = json['poster_path'];
    video             = json['video'];

  }

  getImgPelicula(){    
    return 'http://image.tmdb.org/t/p/w500/$backdropPath';
  }
}


