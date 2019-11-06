import 'package:flutter/material.dart';
import 'package:fluencybank/components/circular_image.dart';
import 'package:fluencybank/views/theme.dart';

import 'country_code.dart';

/// selection dialog used for selection of the country code
class SelectionDialog extends StatefulWidget {
  final List<CountryCode> elements;
  final bool showCountryOnly;
  final InputDecoration searchDecoration;
  final TextStyle searchStyle;
  final WidgetBuilder emptySearchBuilder;
  final bool showFlag;

  /// elements passed as favorite
  final List<CountryCode> favoriteElements;

  SelectionDialog(this.elements, this.favoriteElements,
      {Key key, this.showCountryOnly, this.emptySearchBuilder, InputDecoration searchDecoration = const InputDecoration(), this.searchStyle, this.showFlag})
      : assert(searchDecoration != null, 'searchDecoration must not be null!'),
        this.searchDecoration = searchDecoration.copyWith(prefixIcon: Icon(Icons.search)),
        super(key: key);

  @override
  State<StatefulWidget> createState() => _SelectionDialogState();
}

class _SelectionDialogState extends State<SelectionDialog> {
  /// this is useful for filtering purpose
  List<CountryCode> filteredElements;
  bool isSearchable = false;

  @override
  Widget build(BuildContext context) => SimpleDialog(
//      title: Column(
//        children: <Widget>[
//          TextField(
//            style: widget.searchStyle,
//            decoration: widget.searchDecoration,
//            onChanged: _filterElements,
//          ),
//        ],
//      ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Image.asset(
                "assets/images/arrow_back.png",
                width: 24,
                height: 24,
              ),
            ),
            Expanded(
              child: Text(
                "Countries",
                textAlign: TextAlign.center,
                style: AppStyles.font16.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  isSearchable = !isSearchable;
                });
              },
              child: Image.asset(
                "assets/images/search.png",
                width: 24,
                height: 24,
              ),
            ),
          ],
        ),
        children: [
          isSearchable
              ? Container(
                  margin: EdgeInsets.only(left: 24, right: 24),
                  child: TextField(
                    style: AppStyles.font14,
                    cursorWidth: 1,
                    cursorColor: AppColors.c212121,
                    decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColors.c00B3DF)),
                        enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColors.cBDBDBD)),
//              prefixIcon: Icon(Icons.search),
                        contentPadding: EdgeInsets.fromLTRB(16, 0, 16, 16)),
                    onChanged: _filterElements,
                  ),
                )
              : Container(),
          Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: ListView(
                  children: [
                widget.favoriteElements.isEmpty
                    ? const DecoratedBox(decoration: BoxDecoration())
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[]
                          ..addAll(widget.favoriteElements
                              .map(
                                (f) => SimpleDialogOption(
                                  child: _buildOption(f),
                                  onPressed: () {
                                    _selectItem(f);
                                  },
                                ),
                              )
                              .toList())
                          ..add(const Divider())),
              ]..addAll(filteredElements.isEmpty
                      ? [_buildEmptySearchWidget(context)]
                      : filteredElements.map((e) => SimpleDialogOption(
                            key: Key(e.toLongString()),
                            child: _buildOption(e),
                            onPressed: () {
                              _selectItem(e);
                            },
                          ))))),
        ],
      );

  Widget _buildOption(CountryCode e) {
    return Container(
      width: 400,
      child: Flex(
        direction: Axis.horizontal,
        children: <Widget>[
          widget.showFlag
              ? Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: new CircularImage(
                      image: new AssetImage(e.flagUri),
                      width: 24,
                      height: 24,
                    ),
                  ),
                )
              : Container(),
          Expanded(
            flex: 4,
            child: Text(
              widget.showCountryOnly ? e.toCountryStringOnly() : e.toLongString(),
              overflow: TextOverflow.fade,
              style: AppStyles.font14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptySearchWidget(BuildContext context) {
    if (widget.emptySearchBuilder != null) {
      return widget.emptySearchBuilder(context);
    }

    return Center(child: Text('No Country Found'));
  }

  @override
  void initState() {
    filteredElements = widget.elements;
    super.initState();
  }

  void _filterElements(String s) {
    s = s.toUpperCase();
    setState(() {
      filteredElements = widget.elements.where((e) => e.code.contains(s) || e.dialCode.contains(s) || e.name.toUpperCase().contains(s)).toList();
    });
  }

  void _selectItem(CountryCode e) {
    Navigator.pop(context, e);
  }
}
