

class Project {
  String? projectName;

  String? description;

  String? startDate;

  String? endDate;
  String? taskGroup;
  String? selectedTime;

  Project({
    required this.taskGroup,
    required this.projectName,
    required this.description,
    required this.startDate,
    required this.endDate,
    required this.selectedTime,
  });

  Project.fromJson(Map<String, dynamic> map)
      : taskGroup = map['taskGroup'],
        projectName = map['projectName'],
        description = map['description'],
        startDate = map['startDate'],
        selectedTime = map['selectedTime'],
        endDate = map['endDate'];

  Map<String, dynamic> toJson() => {
        'taskGroup': taskGroup,
        'projectName': projectName,
        'description': description,
        'startDate': startDate,
        'selectedTime': selectedTime,
        'endDate': endDate,
      };
}
