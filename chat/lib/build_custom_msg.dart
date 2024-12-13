import 'package:flutter/material.dart';

import 'constant.dart';

class BuildCustomMSG extends StatefulWidget {
  BuildCustomMSG({super.key, required this.msg});

  Map<String, dynamic> msg;

  @override
  State<BuildCustomMSG> createState() => _BuildCustomMSGState();
}

class _BuildCustomMSGState extends State<BuildCustomMSG> {
  bool isSender = false;

  @override
  void initState() {
    isSender = widget.msg['senderId'] == Constant.userId ? true : false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment:
          isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: width * .8,
            decoration: BoxDecoration(
                color: isSender
                    ? Colors.blue.withOpacity(.7)
                    : Colors.grey.withOpacity(.3),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                    topLeft:
                        isSender ? Radius.circular(20) : Radius.circular(0),
                    topRight:
                        isSender ? Radius.circular(0) : Radius.circular(20))),
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                widget.msg['text'],
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
