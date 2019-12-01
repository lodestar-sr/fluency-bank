import 'package:fluencybank/components/raised_gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share/share.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:contacts_service/contacts_service.dart';
import '../../theme.dart';

class InviteFriendsFromcontacts extends StatefulWidget {
  InviteFriendsFromcontacts({Key key}) : super(key: key);

  @override
  _InviteFriendsStateFromcontacts createState() =>
      _InviteFriendsStateFromcontacts();
}

class _InviteFriendsStateFromcontacts extends State<InviteFriendsFromcontacts> {
  var shareLink = "http://fluency.io/fdHFRee98";
  Iterable<Contact> _contacts;
  // get contacts
  @override
  void initState() {
    super.initState();
    GetContacts();
  }

  GetContacts() async {
    PermissionStatus permissionStatus = await _getPermission();
    if (permissionStatus == PermissionStatus.granted) {
      var contacts = await ContactsService.getContacts();

      setState(() {
        _contacts = contacts;
      });
    } else {
      throw PlatformException(
        code: 'PERMISSION_DENIED',
        message: 'Access to location data denied',
        details: null,
      );
    }
  }

  Future<PermissionStatus> _getPermission() async {
    PermissionStatus permission = await PermissionHandler()
        .checkPermissionStatus(PermissionGroup.contacts);
    print(permission);
    if (permission != PermissionStatus.granted &&
        permission != PermissionStatus.disabled) {
      Map<PermissionGroup, PermissionStatus> permisionStatus =
          await PermissionHandler()
              .requestPermissions([PermissionGroup.contacts]);
      return permisionStatus[PermissionGroup.contacts] ??
          PermissionStatus.unknown;
    } else {
      return permission;
    }
  }

  @override
  Widget build(BuildContext context) {
    var pixelheight = MediaQuery.of(context).size.height / 100;
    var pixelwidth = MediaQuery.of(context).size.width / 100;
    ;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
        ),
        body: LayoutBuilder(builder:
            (BuildContext context, BoxConstraints viewportConstraints) {
          return GestureDetector(
              onTap: () => FocusScope.of(context).requestFocus(new FocusNode()),
              child: SingleChildScrollView(
                  child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: viewportConstraints.maxHeight,
                      ),

                      //Removed Intrinsic height
                      child: Container(
                        width: double.infinity,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("Select friends to invite to Fluency",
                                  style: AppStyles.font24
                                      .copyWith(fontWeight: FontWeight.bold)),
                              Padding(
                                padding: EdgeInsets.only(top: 20.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: Colors.grey[100],
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 5.0,
                                        color: Colors.black.withOpacity(0.5),
                                        //offset: Offset(6.0, 7.0),
                                      ),
                                    ],
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(15.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          "Invite link",
                                          style: AppStyles.font16,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 10.0),
                                          child: Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                border: Border.all(
                                                    color: Colors.grey[400]),
                                                borderRadius:
                                                    BorderRadius.circular(5.0)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(15.0),
                                              child: Text(shareLink),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 10.0),
                                          child: Container(
                                            height: 50.0,
                                            width: double.infinity,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: <Widget>[
                                                Expanded(
                                                  child: Container(
                                                    margin: EdgeInsets.all(5),
                                                    child: RaisedGradientButton(
                                                      child: Text(
                                                        "Share",
                                                        style: AppStyles
                                                            .buttonTextStyle,
                                                      ),
                                                      gradient: LinearGradient(
                                                        colors: [
                                                          AppColors.c00B3DF,
                                                          AppColors.c00B3DF
                                                        ],
                                                        begin:
                                                            Alignment.topCenter,
                                                        end: Alignment
                                                            .bottomCenter,
                                                      ),
                                                      onPressed: () {
                                                        setState(() {
                                                          Share.share(shareLink,
                                                              subject:
                                                                  'Invite Link to Fluency Bank');
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  width: 100.0,
                                                  margin: EdgeInsets.all(5),
                                                  child: RaisedGradientButton(
                                                    child: Icon(
                                                        Icons.content_copy),
                                                    border: Border.all(
                                                        color:
                                                            AppColors.c00B3DF),
                                                    onPressed: () {
                                                      setState(() {
                                                        Clipboard.setData(
                                                            new ClipboardData(
                                                                text:
                                                                    shareLink));
                                                        //Copied to Clipboard

                                                        Scaffold.of(context)
                                                            .showSnackBar(
                                                                SnackBar(
                                                          content: Text(
                                                              "Copied to Clipboard."),
                                                        ));
                                                      });
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 25),
                                child: Text("My contacts without Fluency",
                                    style: AppStyles.font18.copyWith(
                                        color: Colors.grey[700],
                                        fontWeight: FontWeight.w600)),
                              ),
                              Padding(
                                  padding: EdgeInsets.only(top: 20.0),
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        border:
                                            Border.all(color: Colors.grey[400]),
                                        borderRadius:
                                            BorderRadius.circular(5.0)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(1.0),
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                          prefixIcon: Icon(
                                            Icons.search,
                                            size: 35.0,
                                            color: Colors.grey[500],
                                          ),
                                          border: InputBorder.none,
                                          hintText: "Search",
                                          hintStyle: AppStyles.font18.copyWith(
                                              color: Colors.grey[500]),
                                        ),
                                      ),
                                    ),
                                  )),

                              //Contacts

                              Container(
                                height: 500,
                                child: Center(
                                  child: _contacts != null
                                      ? ListView.builder(
                                          itemCount: _contacts?.length ?? 0,
                                          itemBuilder: (context, index) {
                                            Contact c =
                                                _contacts?.elementAt(index);
                                            return Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Row(
                                                children: <Widget>[
                                                  Container(
                                                    height: 50.0,
                                                    width: 50.0,
                                                    child: Center(
                                                      child: (c.avatar !=
                                                                  null &&
                                                              c.avatar.length >
                                                                  0)
                                                          ? Image.memory(
                                                              c.avatar,
                                                              fit: BoxFit.cover,
                                                            )
                                                          : Text(c.initials()),
                                                    ),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                        color:
                                                            Colors.grey[300]),
                                                  ),
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 10.0),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: <Widget>[
                                                          Text(
                                                            "${c.displayName ?? ""}",
                                                            style: AppStyles
                                                                .font20,
                                                          ),
                                                          
                                                          Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      top:
                                                                          10.0),
                                                              child: Column(
                                                                children: c
                                                                    .phones
                                                                    .map(
                                                                      (i) =>
                                                                          Text(i.value ?? ""),
                                                                    )
                                                                    .toList(),
                                                              ))
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {},
                                                    child: Text("Invite",
                                                        style: AppStyles.font18
                                                            .copyWith(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Color
                                                                    .fromRGBO(
                                                                        0,
                                                                        179,
                                                                        223,
                                                                        1))),
                                                  )
                                                ],
                                              ),
                                            );
                                          },
                                        )
                                      : CircularProgressIndicator(),
                                ),
                              )
                            ],
                          ),
                        ),
                      ))));
        }),
      ),
    );
  }
}
