import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter/services.dart' show rootBundle;

import '../ProfileModel.dart';
part 'person_event.dart';
part 'person_state.dart';

class PersonBloc extends Bloc<PersonEvent, PersonState> {
  PersonBloc() : super(PersonState.personPage());

  List<ProfileModel>? profileData;

  @override
  Stream<PersonState> mapEventToState(
    PersonEvent event,
  ) async* {
    if(event is GetPersonPage)
      {
        if(event.profileDataChange.isEmpty){
          var jsonText = await rootBundle.loadString('assets/ProfileData.json');
           profileData = profileModelFromJson(jsonText);
          yield PersonState.personPage(profileData : profileData);
        }
        else if (event.profileDataChange.isNotEmpty){
          yield PersonState.personPage(profileData : event.profileDataChange);
        }
      }
    if(event is GetEditProfile){
      yield PersonState.editPage(profileSelect: event.profileData,index:event.index);
    }
    if(event is SetNewProfile) {
      int index = int.parse(event.index.toString());
      profileData!.removeAt(index);
      profileData!.insert(index, event.newProfileData);
      yield PersonState.personPage(profileData : profileData);
      }
  }
}
