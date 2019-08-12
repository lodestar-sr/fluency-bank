import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:wealthpal/components/circular_image.dart';
import 'package:wealthpal/utils/globals.dart';
import 'package:wealthpal/utils/utils.dart';
import 'package:wealthpal/views/theme.dart';

import 'country_code.dart';
import 'country_codes.dart';
import 'selection_dialog.dart';

class CountryCodePicker extends StatefulWidget {

  final ValueChanged<CountryCode> onChanged;
  String initialSelection;
  final List<String> favorite;
  final TextStyle textStyle;
  final EdgeInsetsGeometry padding;
  final bool showCountryOnly;
  final InputDecoration searchDecoration;
  final TextStyle searchStyle;
  final WidgetBuilder emptySearchBuilder;
  final bool autoInitial;

  /// shows the name of the country instead of the dialcode
  final bool showOnlyCountryWhenClosed;

  /// aligns the flag and the Text left
  ///
  /// additionally this option also fills the available space of the widget.
  /// this is especially usefull in combination with [showOnlyCountryWhenClosed],
  /// because longer countrynames are displayed in one line
  final bool alignLeft;

  /// shows the flag
  final bool showFlag;

  CountryCodePicker(
      {this.onChanged,
      this.initialSelection,
      this.favorite = const [],
      this.textStyle,
      this.padding = const EdgeInsets.all(0.0),
      this.showCountryOnly = false,
      this.searchDecoration = const InputDecoration(),
      this.searchStyle,
      this.emptySearchBuilder,
      this.showOnlyCountryWhenClosed = false,
      this.alignLeft = false,
      this.showFlag = true,
      this.autoInitial = false,});

  @override
  State<StatefulWidget> createState() {
    List<Map> jsonList = codes;

    List<CountryCode> elements = jsonList
        .map((s) => CountryCode(
              name: s['name'],
              code: s['code'],
              dialCode: s['dial_code'],
              flagUri: 'assets/flags/${s['code'].toLowerCase()}.png',
            ))
        .toList();

    return new _CountryCodePickerState(elements);
  }
}

class _CountryCodePickerState extends State<CountryCodePicker> {

  CountryCode selectedItem;
  List<CountryCode> elements = [];
  List<CountryCode> favoriteElements = [];

  _CountryCodePickerState(this.elements);

  @override
  Widget build(BuildContext context) =>
      FlatButton(
        padding: EdgeInsets.all(0),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              child: Row(
                children: <Widget>[
                  !widget.showOnlyCountryWhenClosed
                      ? Container(
                    padding: EdgeInsets.only(right: 8),
                    child: Text(selectedItem.toString(),
                        style: AppStyles.font14),
                  )
                      : Container(),
                  widget.showFlag
                      ? Container(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: CircularImage(
                      image: AssetImage(selectedItem.flagUri),
                      width: 14,
                      height: 14,
                    ),
                  )
                      : Container(),
                  widget.showOnlyCountryWhenClosed
                      ? Container(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Text(selectedItem.toCountryStringOnly(),
                        style: AppStyles.font14),
                  )
                      : Container(),
                ],
              ),
            ),
            Image.asset("assets/images/arrow_down.png", width: 16, height: 16,),
          ],
        ),
        onPressed: _showSelectionDialog,
      );

  Future<Position> getCurrentLocation() async {
    Position position;
    try {
      position = await Geolocator().getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
    } on Exception catch (e) {
      position = null;
    }

    return position;
  }

  @override
  initState() {
    if (widget.autoInitial) {

      getCurrentLocation().then((Position pos) {
        getAddressListByGeo(latitude: pos.latitude, longitude:pos.longitude).then((result) {
          Globals.preAddresses = json.decode(result);
          if (Globals.preAddresses.length > 0) {
            setState(() {
              widget.initialSelection = Globals.preAddresses[0]['countryCode'];
              initComponent();
              widget.onChanged(selectedItem);
            });
          }
        });
      });

    }

    initComponent();

    super.initState();
  }

  initComponent() {
    if (widget.initialSelection != null) {
      selectedItem = elements.firstWhere(
              (e) =>
          (e.code.toUpperCase() == widget.initialSelection.toUpperCase()) ||
              (e.dialCode == widget.initialSelection.toString()),
          orElse: () => elements[0]);
    } else {
      selectedItem = elements[0];
    }

    favoriteElements = elements
        .where((e) =>
    widget.favorite.firstWhere(
            (f) => e.code == f.toUpperCase() || e.dialCode == f.toString(),
        orElse: () => null) !=
        null)
        .toList();
  }

  void _showSelectionDialog() {
    showDialog(
      context: context,
      builder: (_) => SelectionDialog(elements, favoriteElements,
          showCountryOnly: widget.showCountryOnly,
          emptySearchBuilder: widget.emptySearchBuilder,
          searchDecoration: widget.searchDecoration,
          searchStyle: widget.searchStyle,
          showFlag: widget.showFlag),
    ).then((e) {
      if (e != null) {
        setState(() {
          selectedItem = e;
        });

        _publishSelection(e);
      }
    });
  }

  void _publishSelection(CountryCode e) {
    if (widget.onChanged != null) {
      widget.onChanged(e);
    }
  }
}
