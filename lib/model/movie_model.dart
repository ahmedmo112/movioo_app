class MovieModel {
  List<Results>? results;
 

  MovieModel({ this.results});

  MovieModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(new Results.fromJson(v));
      });
    }
  }

}

class Results {
  String? backdropPath;
  int? id;
  String? originalTitle;
  String? overview;
  String? posterPath;
  String? voteAverage ;
  String? releaseDate;
  

  Results.fromJson(Map<String, dynamic> json) {
    
    backdropPath = json['backdrop_path'];
    id = json['id'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    voteAverage = json['vote_average'].toString();
  }

  
  
}
