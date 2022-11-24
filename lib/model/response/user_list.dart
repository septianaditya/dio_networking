import 'package:dio_networking/model/response/data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_list.g.dart';

@JsonSerializable()
class UserList {
  UserList({
    required this.data,
  });

  List<Data> data;

  factory UserList.fromJson(Map<String, dynamic> json) =>
      _$UserListFromJson(json);
  Map<String, dynamic> toJson() => _$UserListToJson(this);
}
