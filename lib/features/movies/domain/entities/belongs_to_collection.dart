import 'package:equatable/equatable.dart';

class BelongsToCollection extends Equatable {
  final int id;
  final String name;
  final String posterPath;
  final String backdropPath;

  const BelongsToCollection(
      {this.id, this.name, this.posterPath, this.backdropPath});

  @override
  List<Object> get props => [
        this.id,
        this.name,
        this.posterPath,
        this.backdropPath,
      ];

  @override
  bool get stringify => true;
}
