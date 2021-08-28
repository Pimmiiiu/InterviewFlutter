part of 'person_bloc.dart';

@immutable
abstract class PersonEvent {}

class GetPersonPage extends PersonEvent {
  final List<ProfileModel> profileDataChange;

  GetPersonPage(this.profileDataChange);
}

class GetEditProfile extends PersonEvent {
  final ProfileModel profileData;
  final int index;

  GetEditProfile(this.profileData, this.index);
}

class SetNewProfile extends PersonEvent {
  final ProfileModel newProfileData;
  final int? index;

  SetNewProfile(this.newProfileData,this.index);
}