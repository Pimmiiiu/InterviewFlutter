import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Bloc/person_bloc.dart';
import 'EditProfilePage.dart';
import 'PersonPage.dart';

class PersonPageMain extends StatefulWidget {
  const PersonPageMain({Key? key}) : super(key: key);

  @override
  _PersonPageMainState createState() => _PersonPageMainState();
}

class _PersonPageMainState extends State<PersonPageMain> {

  void initState() {
    //start event GetPersonPage
    context.read<PersonBloc>().add(GetPersonPage([]));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PersonBloc, PersonState>(builder: (context, state) {
      // check state
      switch (state.status) {
        case PersonStatus.PersonPage:
          return PersonPage(
            listProfile: state.profileData,
          );
        case PersonStatus.EditPage:
          return EditProfilePage(
            profile: state.profileSelect,
            index: state.index,
            listProfile: state.newProfile,
          );
        default:
          return PersonPage(
            listProfile: state.profileData,
          );
      }
    });
  }
}
