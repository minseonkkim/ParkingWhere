import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parkwhere/model/parking_lot.dart';

class RemainStat extends StatelessWidget{
  final ParkingLot data;
  const RemainStat(this.data);
 
  @override
  Widget build(BuildContext context) {
    var color = Colors.white;
    var ableCnt = data.ableCnt;
    var totalAbleCnt = data.totalAbleCnt;
    if(ableCnt == 0){
      return Container(
        width: MediaQuery.of(context).size.width * 0.95,
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 2),
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.red[300]
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 10.0,
            ),
            Expanded(
              flex: 1,
              child: Image.asset('assets/images/tears.png', width: 20.0),
            ),
            SizedBox(
              width: 22.0,
            ),
            Expanded(
                flex: 4,
                child: Text(
                    '현재 주차 가능 구역이 없어요',
                    style: GoogleFonts.lato(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)
                )
            )

          ],
        ),
      );
    } else if(ableCnt < 10){
      return Container(
        width: MediaQuery.of(context).size.width * 0.95,
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 2),
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.yellow[100],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 10.0,
            ),
            Expanded(
              flex: 1,
              child: Image.asset('assets/images/neutral.png', width: 20.0,),
            ),
            SizedBox(
              width: 22.0,
            ),
            Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('현재 주차 가능 구역 : ',
                      style: GoogleFonts.lato(
                          fontSize: 18.0,
                          color: Colors.grey[700])),
                  SizedBox(height: 3.0,),
                  Row(
                    children: [
                      Text('보통',
                          style: GoogleFonts.lato(
                              fontSize: 28.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.yellow[900])),
                      SizedBox(width: 23.0,),
                      Text(
                          '${ableCnt}',
                          style: GoogleFonts.lato(
                              fontSize: 28.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[800])
                      ),
                      Text(
                          '  /  ${totalAbleCnt}',
                          style: GoogleFonts.lato(
                              fontSize: 25.0,
                              color: Colors.grey[800])
                      ),
                    ],
                  )

                ],
              ),
            )

          ],
        ),
      );
    } else{
      return Container(
        width: MediaQuery.of(context).size.width * 0.95,
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 2),
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.blue[50],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 10.0,
            ),
            Expanded(
              flex: 1,
              child: Image.asset('assets/images/smile.png', width: 20.0,),
            ),
            SizedBox(
              width: 22.0,
            ),
            Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('현재 주차 가능 구역 : ',
                      style: GoogleFonts.lato(
                          fontSize: 18.0,
                          color: Colors.grey[700])),
                  SizedBox(height: 3.0,),
                  Row(
                    children: [
                      Text('충분',
                          style: GoogleFonts.lato(
                              fontSize: 28.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue[800])),
                      SizedBox(width: 23.0,),
                      Text(
                          '${ableCnt}',
                          style: GoogleFonts.lato(
                              fontSize: 28.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[800])
                      ),
                      Text(
                          '  /  ${totalAbleCnt}',
                          style: GoogleFonts.lato(
                              fontSize: 25.0,
                              color: Colors.grey[800])
                      ),
                    ],
                  )

                ],
              ),
            )

          ],
        ),
      );
    }
  }
}