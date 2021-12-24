import 'package:json_annotation/json_annotation.dart';

part 'list_model_person.g.dart';

@JsonSerializable()
class ListModelPerson {
  @JsonKey(name: 'page')
  final int page;

  @JsonKey(name: 'per_page')
  final int perPage;

  @JsonKey(name: 'total')
  final int total;

  @JsonKey(name: 'total_pages')
  final int totalPages;

  @JsonKey(name: 'data')
  final List<Data> data;
  ListModelPerson({
    required this.page,
    required this.perPage,
    required this.total,
    required this.totalPages,
    required this.data,
  });

  factory ListModelPerson.fromJson(Map<String, dynamic> json) =>
      _$ListModelPersonFromJson(json);

  Map<String, dynamic> toJson() => _$ListModelPersonToJson(this);
}

@JsonSerializable()
class Data {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'email')
  final String email;

  @JsonKey(name: 'first_name')
  final String firsName;

  @JsonKey(name: 'last_name')
  final String lastName;

  @JsonKey(name: 'avatar')
  final String avatar;
  Data({
    required this.id,
    required this.email,
    required this.firsName,
    required this.lastName,
    required this.avatar,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
