import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../data/models/student_model.dart';
import '../../data/providers/student_provider.dart';

class EditStudentScreen extends StatefulWidget {
  final Student? student;
  const EditStudentScreen({super.key, this.student});

  @override
  State<EditStudentScreen> createState() => _EditStudentScreenState();
}

class _EditStudentScreenState extends State<EditStudentScreen> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _majorNameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.student != null) {
      _firstNameController.text = widget.student!.firstName;
      _lastNameController.text = widget.student!.lastName;
      _ageController.text = widget.student!.age.toString();
      _majorNameController.text = widget.student!.major;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.student == null ? 'Add Student' : 'Update Student'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 24,
          children: [
            Text(widget.student == null ? 'Add Student' : 'Update Student'),
            _buildTextFormField(_firstNameController, 'First Name'),
            _buildTextFormField(_lastNameController, 'Last Name'),
            _buildTextFormField(_ageController, 'Age'),
            _buildTextFormField(_majorNameController, 'Major'),
            ElevatedButton(
              onPressed: () => _saveStudent(context),
              child: Text(
                  widget.student == null ? 'Save Student' : 'Update Student'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextFormField(
      TextEditingController controller, String labelText) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
      ),
    );
  }

  void _saveStudent(BuildContext context) {
    final student = Student(
        id: widget.student?.id ?? DateTime.now().microsecondsSinceEpoch,
        firstName: _firstNameController.text,
        lastName: _lastNameController.text,
        age: int.parse(_ageController.text),
        major: _majorNameController.text);

    if (widget.student == null) {
      Provider.of<StudentProvider>(context, listen: false).addStudent(student);
    } else {
      Provider.of<StudentProvider>(context, listen: false)
          .updateStudent(student);
    }
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _ageController.dispose();
    _majorNameController.dispose();
    super.dispose();
  }
}
