import 'package:flutter/material.dart';
import 'package:interview_list_assignment5/modals/interviewers.dart';
import 'package:interview_list_assignment5/provider/fetch_data.dart';
import 'package:interview_list_assignment5/widgets/interviewers_list_widget.dart';
import 'package:provider/provider.dart';
import 'selected_interview_screen.dart';

class HomePage extends StatefulWidget {

  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Interviewers> tempList =[];
    void searchInterviewer(query) {
    final dataClass = Provider.of<Data>(context,listen: false);
    if(query.isEmpty)
      {
        setState(() {
          tempList = dataClass.interviewerList;
        });
      }
     else{
       List<Interviewers> resultsList = dataClass.interviewerList.where((e) {
         final interviewerFirst = e.name.first!.toLowerCase().startsWith(query);
         final interviewerLast = e.name.last!.toLowerCase().startsWith(query);
         return interviewerFirst || interviewerLast;
       }).toList();
       setState(() {
         tempList = resultsList;
       });
     }

  }
  late FocusNode focusNode1;
  @override
  void initState() {
    // TODO: implement initState
    focusNode1=FocusNode();
    Future.delayed(Duration.zero).then((value) {
      final dataClass = Provider.of<Data>(context,listen: false);
      tempList = dataClass.interviewerList;
    });
    super.initState();
  }
  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    focusNode1.dispose();

    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: false,
        title: const Text(
          'Interviewers',
          style: TextStyle(
              fontSize: 30, color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Material(
              borderRadius: BorderRadius.circular(20),
              elevation: 5,
              color: Theme.of(context).scaffoldBackgroundColor,
              child: Container(
                margin: const EdgeInsets.only(left: 24,right: 24),
                height: 50,
                padding: const EdgeInsets.only(left: 8),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2,
                        child:  TextField(
                          onTap: ()=> focusNode1.requestFocus(),
                          focusNode: focusNode1,
                          onChanged: searchInterviewer,
                          decoration:  const InputDecoration(
                            label: Text('Search Interviewers'),
                            enabledBorder: InputBorder.none,
                            focusColor: Color(0xFFEEEFF5),
                            focusedBorder: InputBorder.none,
                          ),
                        ),
                      ),
                      IconButton(
                          icon: const Icon(
                            Icons.search,
                            size: 30,
                          ),
                          onPressed: ()=>focusNode1.unfocus(),
                     ),
                    ],
                  ),
              ),
            ),
            const SizedBox(height: 32),
            Container(
              margin: const EdgeInsets.only(left: 16),
              child: Text(
                '${Provider.of<Data>(context).selectedInterviewers}' ' ADDED',
                style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
              ),
            ),
             InterviewListWidget(tempList: tempList),
          ],
        ),
      ),
      floatingActionButton: Container(
        height: 40,
        width: 100,
        margin: const EdgeInsets.only(right: 32),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: FloatingActionButton.extended(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const SelectedInterviewerScreen()));
          },
          backgroundColor: const Color(0xFF14873B),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          label: Row(
            children: const [
              Text(
                'Next',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              Icon(Icons.keyboard_arrow_right),
            ],
          ),
        ),
      ),
    );
  }
}

