




import 'package:flutter/material.dart';
import 'package:foody_ui/typdef/mytypedef.dart';


class ReviewCells extends StatelessWidget {
  final NormalCallback click;
  final ReviewCellsVM vm;
  ReviewCells(this.vm, this.click);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(right: 15),
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(vm.image),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      vm.title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      vm.description,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(
                        color: Colors.black54,
                      ),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Text(
                      vm.date,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(color: Colors.black54, fontSize: 10),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 20,
              ),
              _buildReviews(context)
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Divider()
        ],
      ),
    );
  }
  Widget _buildReviews(BuildContext context) {
    return vm.review > 0
        ? Column(
            children: <Widget>[
              SizedBox(
                height: 5,
              ),
              Container(
                height: 35,
                width: 60,
                decoration: BoxDecoration(
                  color: Colors.grey[700],
                  borderRadius: BorderRadius.all(Radius.circular(6.0)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Icon(
                      Icons.star,
                      color: Colors.orange,
                      size: 15,
                    ),
                    Text(
                      '4.0',
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    )
                  ],
                ),
              )
            ],
          )
        : Container(
            child: FlatButton(
              color: Colors.blue,
              onPressed: this.click,
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(25.0),
              ),
              child: Container(
                padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
                child: Center(
                  child: Text(
                    "Give Review",
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ),
            ),
          );
  }
}

class ReviewCellsVM{
  String title;
  String description;
  String date;
  double review;
  String image;
  ReviewCellsVM(this.title, this.description, this.date, this.review, this.image);
}


