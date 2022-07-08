import 'package:json_annotation/json_annotation.dart';

part 'Member.g.dart';

@JsonSerializable()
class Member {
  int? id;
  @JsonKey(name: 'first_name')
  String? firstName;
  @JsonKey(name: 'last_name')
  int? lastName;
  String? gender;
  @JsonKey(name: 'date_of_birth')
  String? dateOfBirth;
  String? birthplace;
  String? nationality;
  String? category;
  @JsonKey(name: 'sub_category')
  String? subCategory;
  String? language;
  String? department;
  String? municipality;
  String? district;
  String? locality;
  String? address;
  double? longitude;
  double? latitude;
  String? phone;
  @JsonKey(name: "phone_whatsapp")
  String? phoneWhatsapp;
  String? email;
  String? website;
  @JsonKey(name: "casual_employees")
  int? casualEmployees;
  @JsonKey(name: "permanent_employees")
  int? permanentEmployees;
  @JsonKey(name: "annual_sales")
  double? annualSales;
  @JsonKey(name: "total_members")
  int? totalMembers;
  String? denomination;
  @JsonKey(name: "trade_name")
  String? tradeName;
  String? acronym;
  @JsonKey(name: 'primary_sector')
  String? primarySector;
  @JsonKey(name: 'primary_activity')
  String? primaryActivity;
  @JsonKey(name: 'secondary_sector')
  String? secondarySector;
  @JsonKey(name: 'secondary_activity')
  String? secondaryActivity;
  @JsonKey(name: 'creation_date')
  String? creationDate;
  String? registration;
  @JsonKey(name: 'main_service')
  String? mainService;
  @JsonKey(name: 'secondary_service')
  String? secondaryService;
  @JsonKey(name: 'occasional_service')
  String? occasionalService;
  @JsonKey(name: 'need_help1')
  String? needHelp1;
  @JsonKey(name: 'need_help2')
  String? needHelp2;
  @JsonKey(name: 'need_help3')
  String? needHelp3;
  @JsonKey(name: "date_added")
  late DateTime dateAdded = DateTime.now();

  Member();

  factory Member.fromJson(Map<String, dynamic> json) => _$MemberFromJson(json);

  Map<String, dynamic> toJson() => _$MemberToJson(this);
}
