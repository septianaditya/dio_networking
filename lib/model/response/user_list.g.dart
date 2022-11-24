// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserList _$UserListFromJson(Map<String, dynamic> json) {
  return UserList(
    data: (json['data'] as List<dynamic>)
        .map((e) => Data.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$UserListToJson(UserList instance) => <String, dynamic>{
      'data': instance.data,
    };
