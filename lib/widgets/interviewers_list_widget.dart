import 'package:flutter/material.dart';
import 'package:interview_list_assignment5/modals/interviewers.dart';
import 'package:interview_list_assignment5/provider/fetch_data.dart';
import 'package:provider/provider.dart';
class InterviewListWidget extends StatefulWidget {
  InterviewListWidget({Key? key, required this.tempList }) : super(key: key);
 List<Interviewers>tempList;
  @override
  State<InterviewListWidget> createState() => _InterviewListWidgetState();
}

class _InterviewListWidgetState extends State<InterviewListWidget> {
  @override
  void initState() {
    Future.delayed(Duration.zero).then((_){
      Provider.of<Data>(context,listen: false).fetchData();
    });
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final dataClass = Provider.of<Data>(context);
    return Container(
      height: MediaQuery.of(context).size.height/1.45,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        itemCount: widget.tempList.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              ListTile(
                title: Text('${(widget.tempList[index].name.title)}'' ${(widget.tempList[index].name.first)}'' ${(widget.tempList[index].name.last)}',style: TextStyle(color: dataClass.isSelectedList[index] ? Color(0xFF098DF3) : Color(0xFF7C849F)),),
                subtitle:  Text((widget.tempList[index].cell).toString()),
                trailing: TextButton(

                  onPressed: () {
                    setState(() {
                        dataClass.toggle(index);
                    });
                  },
                  child: Text((dataClass.isSelectedList[index]) ? 'REMOVE' : 'ADD',style: const TextStyle(color: Color(0xFF0E1A4D),decoration: TextDecoration.underline),),
                ),

              ),
            ],
          );
        },
      ),

    );
  }
}
