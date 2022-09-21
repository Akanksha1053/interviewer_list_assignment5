import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:interview_list_assignment5/provider/fetch_data.dart';
import 'package:interview_list_assignment5/widgets/selected_interview_widget.dart';

class SelectedInterviewerScreen extends StatelessWidget {
  const SelectedInterviewerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final interviewerName = Provider.of<Data>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: const Text('Selected Interviewers',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
      ),
      body: const SelectedInterviewers(),
    );
  }
}
