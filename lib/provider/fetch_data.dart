import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:interview_list_assignment5/modals/interviewers.dart';

class Data extends ChangeNotifier {
  final url = Uri.parse(
      'https://randomuser.me/api/?seed=ab&inc=name,cell&results=20');
  final List<Interviewers> interviewerList = [];

  List<Interviewers> addedInterviewers =[];
  List<bool> isSelectedList =[];



  Future<void> fetchData() async {
    try {
      final response = await http.get(url);
      final data = json.decode(response.body)['results'];
      for(int i=0;i<data.length;i++){
        interviewerList.add(Interviewers.fromJson(data[i]));
        isSelectedList.add(false);
      }
      notifyListeners();
    }
    catch(error)
    {
      throw error;
    }

  }
  String buttonText ='ADD';
  int selectedInterviewers = 0;


  void addInterview(index)
  {
    addedInterviewers.add(interviewerList[index]);
    notifyListeners();
  }
  void removeInterviewers(index)
  {
    int interviewListIndex = interviewerList.indexWhere((element) => element.cell == addedInterviewers[index].cell);
    addedInterviewers.removeAt(index);
    isSelectedList[interviewListIndex] = !isSelectedList[interviewListIndex];
    selectedInterviewers--;
    notifyListeners();
  }

  void toggle(index)
  {
    isSelectedList[index] = !isSelectedList[index];
    if(isSelectedList[index])
      {
        buttonText = 'REMOVE';
        selectedInterviewers++;
        addInterview(index);
      }
    else
      {
        buttonText ='ADD';
        selectedInterviewers--;
        addedInterviewers.removeWhere((element) => element.cell == interviewerList[index].cell);
      }
    notifyListeners();
  }
}
