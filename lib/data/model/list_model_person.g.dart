// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_model_person.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListModelPerson _$ListModelPersonFromJson(Map<String, dynamic> json) =>
    ListModelPerson(
      page: json['page'] as int,
      perPage: json['per_page'] as int,
      total: json['total'] as int,
      totalPages: json['total_pages'] as int,
      data: (json['data'] as List<dynamic>)
          .map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListModelPersonToJson(ListModelPerson instance) =>
    <String, dynamic>{
      'page': instance.page,
      'per_page': instance.perPage,
      'total': instance.total,
      'total_pages': instance.totalPages,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: json['id'] as int,
      email: json['email'] as String,
      firsName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      avatar: json['avatar'] as String,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'first_name': instance.firsName,
      'last_name': instance.lastName,
      'avatar': instance.avatar,
    };
