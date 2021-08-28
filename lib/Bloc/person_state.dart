part of 'person_bloc.dart';

enum PersonStatus {
  //Idle state
  initialized,
  PersonPage,
  EditPage
}

class PersonState {
  const PersonState._(
      {required this.status, this.profileData, this.profileSelect, this.index,this.newProfile});

  const PersonState.initialized() : this._(status: PersonStatus.initialized);

  const PersonState.personPage({List<ProfileModel>? profileData})
      : this._(status: PersonStatus.PersonPage, profileData: profileData);

  const PersonState.editPage({ProfileModel? profileSelect, int? index,List<ProfileModel>? newProfile})
      : this._(
            status: PersonStatus.EditPage,
            profileSelect: profileSelect,
            newProfile:newProfile,
            index: index);

  final PersonStatus status;
  final List<ProfileModel>? profileData;
  final List<ProfileModel>? newProfile;
  final ProfileModel? profileSelect;
  final int? index;
}
