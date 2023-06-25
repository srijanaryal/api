// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_container.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UsersContainer _$UsersContainerFromJson(Map<String, dynamic> json) =>
    UsersContainer(
      json['address'] == null
          ? null
          : Address.fromJson(json['address'] as Map<String, dynamic>),
      json['id'] as int,
      json['phone'] as String,
      json['username'] as String,
      json['email'] as String,
      json['company'] == null
          ? null
          : Company.fromJson(json['company'] as Map<String, dynamic>),
    )..website = json['website'] as String?;

Map<String, dynamic> _$UsersContainerToJson(UsersContainer instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'email': instance.email,
      'address': instance.address,
      'phone': instance.phone,
      'website': instance.website,
      'company': instance.company,
    };

Address _$AddressFromJson(Map<String, dynamic> json) => Address(
      json['street'] as String,
      json['suite'] as String,
      json['city'] as String,
      json['zipcode'] as String,
    )..geo = json['geo'] == null
        ? null
        : Geo.fromJson(json['geo'] as Map<String, dynamic>);

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'street': instance.street,
      'suite': instance.suite,
      'city': instance.city,
      'zipcode': instance.zipcode,
      'geo': instance.geo,
    };

Geo _$GeoFromJson(Map<String, dynamic> json) => Geo(
      json['lat'] as String,
      json['lng'] as String,
    );

Map<String, dynamic> _$GeoToJson(Geo instance) => <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
    };

Company _$CompanyFromJson(Map<String, dynamic> json) => Company(
      json['name'] as String,
      json['catchPhrase'] as String,
      json['bs'] as String,
    );

Map<String, dynamic> _$CompanyToJson(Company instance) => <String, dynamic>{
      'name': instance.name,
      'catchPhrase': instance.catchPhrase,
      'bs': instance.bs,
    };
