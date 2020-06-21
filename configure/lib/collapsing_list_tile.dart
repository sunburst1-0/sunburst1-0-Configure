import 'package:configure/theme.dart';
import 'package:flutter/material.dart';



class CollapsingListTile extends StatefulWidget {

  final String title;
  final IconData icon;
  final bool isSelected;
  final Function onTap;

  CollapsingListTile({@required this.title,@required this.icon,
    this.isSelected=false,this.onTap});

  @override
  _CollapsingListTileState createState() => _CollapsingListTileState();
}

class _CollapsingListTileState extends State<CollapsingListTile> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:widget.onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
          color: widget.isSelected ? Colors.transparent.withOpacity(0.3): Colors.transparent,
        ),
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        padding: EdgeInsets.symmetric(horizontal: 8.0,vertical: 8.0),
        child: Row(
            children: <Widget>[
            Icon(widget.icon, color:widget.isSelected ? selectedColor :Colors.white10,size:38.0),
            Text(widget.title,style: widget.isSelected? listTitleSelectedStyle: listTitleDefaultStyle, ),
            SizedBox(width:10.0),


          ],
        ),
      ),
    );
  }


}
