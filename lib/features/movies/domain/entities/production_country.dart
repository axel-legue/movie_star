import 'package:equatable/equatable.dart';

class ProductionCountry extends Equatable {
  final String iso3166;
  final String name;

  const ProductionCountry({this.iso3166, this.name});

  @override
  List<Object> get props => [
        this.iso3166,
        this.name,
      ];
}
