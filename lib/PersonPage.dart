import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Bloc/person_bloc.dart';
import 'ProfileModel.dart';

class PersonPage extends StatefulWidget {
  final List<ProfileModel>? listProfile;
  const PersonPage({Key? key, this.listProfile}) : super(key: key);

  @override
  _PersonPageState createState() => _PersonPageState();
}

class _PersonPageState extends State<PersonPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(
            height: 8,
          ),
          ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: widget.listProfile?.length ?? 0,
              itemBuilder: (context, index) {
                return PersonCard(
                  name: widget.listProfile![index].name ?? '',
                  email: widget.listProfile![index].email ?? '',
                  address: widget.listProfile![index].address ?? '',
                  photo: "",
                  onTap: () async {
                    print('profile : $index');
                    context
                        .read<PersonBloc>()
                        .add(GetEditProfile(widget.listProfile![index],index));
                  },
                );
              }),
        ],
      ),
    );
  }
}

class PersonCard extends StatelessWidget {
  final String? name;
  final String? email;
  final String? address;
  final Function()? onTap;
  final String? photo;

  const PersonCard(
      {Key? key, this.name, this.email, this.address, this.onTap, this.photo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 16, right: 8, top: 16, bottom: 16),
              child: CircleAvatar(
                child: (photo == "")
                    ? Text(name!.substring(0, 1))
                    : Image.asset(photo!),
              ),
            ),
            Expanded(
              child: Padding(
                padding:
                    EdgeInsets.only(left: 8, right: 16, top: 16, bottom: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(name ?? ""),
                    Text(email ?? ""),
                    Text(address ?? ""),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
