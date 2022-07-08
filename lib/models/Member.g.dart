// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Member.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Member _$MemberFromJson(Map<String, dynamic> json) => Member()
  ..id = json['id'] as int?
  ..firstName = json['first_name'] as String?
  ..lastName = json['last_name'] as int?
  ..gender = json['gender'] as String?
  ..dateOfBirth = json['date_of_birth'] as String?
  ..birthplace = json['birthplace'] as String?
  ..nationality = json['nationality'] as String?
  ..category = json['category'] as String?
  ..subCategory = json['sub_category'] as String?
  ..language = json['language'] as String?
  ..department = json['department'] as String?
  ..municipality = json['municipality'] as String?
  ..district = json['district'] as String?
  ..locality = json['locality'] as String?
  ..address = json['address'] as String?
  ..longitude = (json['longitude'] as num?)?.toDouble()
  ..latitude = (json['latitude'] as num?)?.toDouble()
  ..phone = json['phone'] as String?
  ..phoneWhatsapp = json['phone_whatsapp'] as String?
  ..email = json['email'] as String?
  ..website = json['website'] as String?
  ..casualEmployees = json['casual_employees'] as int?
  ..permanentEmployees = json['permanent_employees'] as int?
  ..annualSales = (json['annual_sales'] as num?)?.toDouble()
  ..totalMembers = json['total_members'] as int?
  ..denomination = json['denomination'] as String?
  ..tradeName = json['trade_name'] as String?
  ..acronym = json['acronym'] as String?
  ..primarySector = json['primary_sector'] as String?
  ..primaryActivity = json['primary_activity'] as String?
  ..secondarySector = json['secondary_sector'] as String?
  ..secondaryActivity = json['secondary_activity'] as String?
  ..creationDate = json['creation_date'] as String?
  ..registration = json['registration'] as String?
  ..mainService = json['main_service'] as String?
  ..secondaryService = json['secondary_service'] as String?
  ..occasionalService = json['occasional_service'] as String?
  ..needHelp1 = json['need_help1'] as String?
  ..needHelp2 = json['need_help2'] as String?
  ..needHelp3 = json['need_help3'] as String?
  ..dateAdded = DateTime.parse(json['date_added'] as String);

Map<String, dynamic> _$MemberToJson(Member instance) => <String, dynamic>{
      'id': instance.id,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'gender': instance.gender,
      'date_of_birth': instance.dateOfBirth,
      'birthplace': instance.birthplace,
      'nationality': instance.nationality,
      'category': instance.category,
      'sub_category': instance.subCategory,
      'language': instance.language,
      'department': instance.department,
      'municipality': instance.municipality,
      'district': instance.district,
      'locality': instance.locality,
      'address': instance.address,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'phone': instance.phone,
      'phone_whatsapp': instance.phoneWhatsapp,
      'email': instance.email,
      'website': instance.website,
      'casual_employees': instance.casualEmployees,
      'permanent_employees': instance.permanentEmployees,
      'annual_sales': instance.annualSales,
      'total_members': instance.totalMembers,
      'denomination': instance.denomination,
      'trade_name': instance.tradeName,
      'acronym': instance.acronym,
      'primary_sector': instance.primarySector,
      'primary_activity': instance.primaryActivity,
      'secondary_sector': instance.secondarySector,
      'secondary_activity': instance.secondaryActivity,
      'creation_date': instance.creationDate,
      'registration': instance.registration,
      'main_service': instance.mainService,
      'secondary_service': instance.secondaryService,
      'occasional_service': instance.occasionalService,
      'need_help1': instance.needHelp1,
      'need_help2': instance.needHelp2,
      'need_help3': instance.needHelp3,
      'date_added': instance.dateAdded.toIso8601String(),
    };
