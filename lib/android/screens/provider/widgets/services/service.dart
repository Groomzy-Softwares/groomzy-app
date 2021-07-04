import 'package:flutter/material.dart';

import 'edit_service.dart';
import 'delete_service.dart';

class Service extends StatelessWidget {
  final String name;
  final String category;
  final String description;
  final double price;
  final int serviceId;
  final bool inHouse;
  final double duration;
  final String durationUnit;

  const Service({
    this.price,
    this.name,
    this.description,
    this.category,
    this.serviceId,
    this.inHouse,
    this.duration,
    this.durationUnit,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey.shade50,
      elevation: 0.5,
      child: Column(
        children: [
          Divider(height: 0.0,),
          Container(
            margin: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0,),
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              subtitle: Table(
                children: [
                  TableRow(children: [
                    TableCell(
                      child: Text(
                        'title',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, color: Colors.black),
                      ),
                    ),
                    TableCell(
                      child: Text(
                        'Price',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, color: Colors.black),
                      ),
                    ),
                    TableCell(
                      child: Text(
                        'Duration',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, color: Colors.black),
                      ),
                    ),
                    TableCell(
                      child: Text(
                        'In-house',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, color: Colors.black),
                      ),
                    ),
                  ]),
                  TableRow(children: [
                    TableCell(
                      child: Divider(),
                    ),
                    TableCell(
                      child: Divider(),
                    ),
                    TableCell(
                      child: Divider(),
                    ),
                    TableCell(
                      child: Divider(),
                    ),
                  ]),
                  TableRow(children: [
                    TableCell(
                      child: Text(
                        name,
                      ),
                    ),
                    TableCell(
                      child: Text(
                        'R$price',
                      ),
                    ),
                    TableCell(
                      child: Text(
                        '$duration $durationUnit',
                      ),
                    ),
                    TableCell(
                      child: Text(
                        inHouse ? 'Yes' : 'No',
                      ),
                    ),
                  ])
                ],
              ),
              trailing: Container(
                padding: EdgeInsets.only(top: 10.0),
                width: 70.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(
                              child: EditService(
                                serviceId: serviceId,
                                title: name,
                                category: category,
                                description: description,
                                duration: duration,
                                durationUnit: durationUnit,
                                inHouse: inHouse,
                                price: price,
                              ),
                            );
                          },
                        );
                      },
                      child: Icon(
                        Icons.edit_outlined,
                        color: Colors.amber,
                      ),
                    ),
                    VerticalDivider(),
                    GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return DeleteService(
                              serviceId: serviceId,
                              category: category,
                            );
                          },
                        );
                      },
                      child: Icon(
                        Icons.delete_forever_outlined,
                        color: Colors.redAccent,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 10.0,)
        ],
      ),
    );
  }
}
