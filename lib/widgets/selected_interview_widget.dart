import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:interview_list_assignment5/provider/fetch_data.dart';

class SelectedInterviewers extends StatelessWidget {
  const SelectedInterviewers({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dataClass = Provider.of<Data>(context);
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        itemCount: dataClass.addedInterviewers.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              ListTile(
                title: Text(
                    '${(dataClass.addedInterviewers[index].name.title)}'
                    ' ${(dataClass.addedInterviewers[index].name.first)}'
                    ' ${(dataClass.addedInterviewers[index].name.last)}'),
                subtitle: Text(
                    (dataClass.addedInterviewers[index].cell).toString()),
                trailing: TextButton(
                  onPressed: () {
                    dataClass.removeInterviewers(index);
                  },
                  child: const Text(
                    'REMOVE',
                    style: TextStyle(
                        color: Color(0xFF0E1A4D),
                        decoration: TextDecoration.underline),
                  ),
                ),
              ),
              const Divider(thickness: 1.5),
            ],
          );
        },
      ),
    );
  }
}
