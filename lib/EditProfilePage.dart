import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Bloc/person_bloc.dart';
import 'ProfileModel.dart';

class EditProfilePage extends StatefulWidget {
  final ProfileModel? profile;
  final int? index;
  final List<ProfileModel>? listProfile;

  const EditProfilePage({Key? key, this.profile, required this.index, this.listProfile}) : super(key: key);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {

  String? get name => widget.profile?.name;
  String? get email => widget.profile?.email;
  String? get address => widget.profile?.address;
  String? get dob => widget.profile?.dob;
  String? get photo => widget.profile?.photo;

  String? newName = '';
  String? newEmail = '';
  String? newAddress = '';
  String? newDob = '';

  @override
  void initState() {
    newName = name;
    newEmail = email;
    newAddress = address;
    newDob = dob;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextStyle textStyleError = TextStyle(fontSize: 14, color: Colors.red);
    TextStyle textStyle = TextStyle(fontSize: 14, color: Colors.blueGrey[800]);
    TextStyle titleTextStyle = TextStyle(
        fontSize: 14, color: Colors.blueGrey[800], fontWeight: FontWeight.bold);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Profile',
          style: titleTextStyle,
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.blueGrey[800],
          ),
          onPressed: () async {
            ProfileModel profileData = ProfileModel(
                name: name, email: email, address: address, dob: dob ,photo: photo);
            context.read<PersonBloc>().add(SetNewProfile(profileData,widget.index));
          },
        ),
        actions: [
          TextButton(
              onPressed: () async => context.read<PersonBloc>().add(
                  SetNewProfile(
                      ProfileModel(
                          name: newName, email: newEmail, address: newAddress, dob: newDob ,photo: photo),
                      widget.index ?? 1)),
              child: Text(
                'Save',
                style: titleTextStyle,
              ))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(photo!),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              'Name',
              style: titleTextStyle,
            ),
            TextFormField(
              initialValue: name,
              onChanged: (text) {
                newName = text;
              },
              keyboardType: TextInputType.text,
              cursorColor: Colors.blueGrey,
              style: textStyle,
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                isCollapsed: true,
                fillColor: Colors.white,
                filled: true,
                errorStyle: textStyleError,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.blueGrey)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.blueGrey)),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.blueGrey)),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              'E-mail',
              style: titleTextStyle,
            ),
            TextFormField(
              initialValue: email,
              onChanged: (text) {
                newEmail = text;
              },
              keyboardType: TextInputType.text,
              cursorColor: Colors.blueGrey,
              style: textStyle,
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                isCollapsed: true,
                fillColor: Colors.white,
                filled: true,
                errorStyle: textStyleError,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.blueGrey)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.blueGrey)),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.blueGrey)),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              'Birth Date',
              style: titleTextStyle,
            ),
            TextFormField(
              initialValue: dob,
              onChanged: (text) {
                newDob = text;
              },
              keyboardType: TextInputType.text,
              cursorColor: Colors.blueGrey,
              style: textStyle,
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                isCollapsed: true,
                fillColor: Colors.white,
                filled: true,
                errorStyle: textStyleError,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.blueGrey)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.blueGrey)),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.blueGrey)),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              'Address',
              style: titleTextStyle,
            ),
            TextFormField(
              initialValue: address,
              onChanged: (text) {
                newAddress = text;
              },
              keyboardType: TextInputType.text,
              cursorColor: Colors.blueGrey,
              style: textStyle,
              maxLines: 4,
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                isCollapsed: true,
                fillColor: Colors.white,
                filled: true,
                errorStyle: textStyleError,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.blueGrey)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.blueGrey)),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.blueGrey)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
