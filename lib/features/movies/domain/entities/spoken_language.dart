import 'package:equatable/equatable.dart';

class SpokenLanguage extends Equatable {
  final String iso639;
  final String name;

  const SpokenLanguage({this.iso639, this.name});

  @override
  List<Object> get props => [
        this.iso639,
        this.name,
      ];

  @override
  bool get stringify => true;
}
