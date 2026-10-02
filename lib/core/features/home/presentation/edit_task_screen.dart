import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditTaskScreen extends StatefulWidget {
  final Map<String, dynamic> task;

  const EditTaskScreen({super.key, required this.task});

  @override
  State<EditTaskScreen> createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
  late TextEditingController titleController;
  late TextEditingController descriptionController;

  late String selectedGroup;
  late DateTime selectedDate;

  @override
  void initState() {
    super.initState();

    titleController = TextEditingController(text: widget.task['title'] ?? '');

    descriptionController = TextEditingController(
      text: widget.task['description'] ?? '',
    );

    selectedGroup = widget.task['group'] ?? 'Home';

    selectedDate = widget.task['date'] ?? DateTime.now();
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  Future<void> selectDateTime() async {
    final date = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );

    if (date == null) return;

    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(selectedDate),
    );

    if (time == null) return;

    setState(() {
      selectedDate = DateTime(
        date.year,
        date.month,
        date.day,
        time.hour,
        time.minute,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8F8F8),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // =========================
              // Top Bar
              // =========================
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back_ios_new, size: 18),
                  ),

                  Expanded(
                    child: Center(
                      child: Text(
                        'Edit Task',
                        style: TextStyle(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),

                  // Delete Button
                  Container(
                    height: 30.h,
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: TextButton(
                      onPressed: deleteTask,
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: Size.zero,
                      ),
                      child: Text(
                        'Delete',
                        style: TextStyle(color: Colors.white, fontSize: 10.sp),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 15.h),

              // =========================
              // Image
              // =========================
              ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: Image.asset(
                  'assets/images/Gettylmages-1315607788 3.png',
                  width: double.infinity,
                  height: 100.h,
                  fit: BoxFit.cover,
                ),
              ),

              SizedBox(height: 12.h),

              // =========================
              // Task Info
              // =========================
              Row(
                children: [
                  const Icon(Icons.flag, color: Colors.green, size: 20),

                  SizedBox(width: 8.w),

                  Text(
                    'In Progress',
                    style: TextStyle(fontSize: 11.sp, color: Colors.grey[700]),
                  ),
                ],
              ),

              SizedBox(height: 12.h),

              // =========================
              // Group
              // =========================
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                decoration: BoxDecoration(
                  color: const Color(0xffEEEEEE),
                  borderRadius: BorderRadius.circular(10.r),
                ),

                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: selectedGroup,
                    isExpanded: true,

                    items: const [
                      DropdownMenuItem(
                        value: 'Home',
                        child: Row(
                          children: [
                            Icon(Icons.home, color: Colors.pink, size: 20),
                            SizedBox(width: 10),
                            Text('Home'),
                          ],
                        ),
                      ),

                      DropdownMenuItem(
                        value: 'Personal',
                        child: Row(
                          children: [
                            Icon(Icons.person, color: Colors.green, size: 20),
                            SizedBox(width: 10),
                            Text('Personal'),
                          ],
                        ),
                      ),

                      DropdownMenuItem(
                        value: 'Work',
                        child: Row(
                          children: [
                            Icon(Icons.work, color: Colors.black, size: 20),
                            SizedBox(width: 10),
                            Text('Work'),
                          ],
                        ),
                      ),
                    ],

                    onChanged: (value) {
                      if (value == null) return;

                      setState(() {
                        selectedGroup = value;
                      });
                    },
                  ),
                ),
              ),

              SizedBox(height: 12.h),

              // =========================
              // Title
              // =========================
              _buildTextField(
                controller: titleController,
                hintText: 'Task Title',
              ),

              SizedBox(height: 12.h),

              // =========================
              // Description
              // =========================
              _buildTextField(
                controller: descriptionController,
                hintText: 'Description',
                maxLines: 4,
              ),

              SizedBox(height: 12.h),

              // =========================
              // Date
              // =========================
              InkWell(
                onTap: selectDateTime,

                child: Container(
                  width: double.infinity,
                  height: 50.h,
                  padding: EdgeInsets.symmetric(horizontal: 15.w),

                  decoration: BoxDecoration(
                    color: const Color(0xffEEEEEE),
                    borderRadius: BorderRadius.circular(10.r),
                  ),

                  child: Row(
                    children: [
                      const Icon(
                        Icons.calendar_month,
                        color: Colors.green,
                        size: 21,
                      ),

                      SizedBox(width: 10.w),

                      Text(
                        formatDate(selectedDate),
                        style: TextStyle(fontSize: 13.sp),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 20.h),

              // =========================
              // Mark as Done
              // =========================
              SizedBox(
                width: double.infinity,
                height: 50.h,

                child: ElevatedButton(
                  onPressed: markAsDone,

                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff00C853),
                    foregroundColor: Colors.white,
                    elevation: 0,

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),

                  child: const Text('Mark as Done'),
                ),
              ),

              SizedBox(height: 10.h),

              // =========================
              // Update
              // =========================
              SizedBox(
                width: double.infinity,
                height: 50.h,

                child: OutlinedButton(
                  onPressed: updateTask,

                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.grey),

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),

                  child: const Text(
                    'Update',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),

              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    int maxLines = 1,
  }) {
    return TextField(
      controller: controller,
      maxLines: maxLines,

      decoration: InputDecoration(
        hintText: hintText,

        filled: true,
        fillColor: const Color(0xffEEEEEE),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide.none,
        ),

        contentPadding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 14.h),
      ),
    );
  }

  String formatDate(DateTime date) {
    String day = date.day.toString().padLeft(2, '0');
    String month = date.month.toString().padLeft(2, '0');

    int hour = date.hour;
    String period = hour >= 12 ? 'pm' : 'am';

    hour = hour % 12;

    if (hour == 0) {
      hour = 12;
    }

    String minute = date.minute.toString().padLeft(2, '0');

    return '$day June, ${date.year}    $hour:$minute $period';
  }

  void updateTask() {
    Navigator.pop(context, {
      'title': titleController.text.trim(),
      'description': descriptionController.text.trim(),
      'group': selectedGroup,
      'date': selectedDate,
      'isDone': false,
    });
  }

  void markAsDone() {
    Navigator.pop(context, {
      'title': titleController.text.trim(),
      'description': descriptionController.text.trim(),
      'group': selectedGroup,
      'date': selectedDate,
      'isDone': true,
    });
  }

  void deleteTask() {
    Navigator.pop(context, {'delete': true});
  }
}
