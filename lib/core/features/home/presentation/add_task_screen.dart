import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  String selectedGroup = 'Home';
  DateTime? selectedDate;

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  // اختيار التاريخ والوقت
  Future<void> selectDateTime() async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    );

    if (date == null) return;

    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
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
                        'Add Task',
                        style: TextStyle(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(width: 48.w),
                ],
              ),

              SizedBox(height: 15.h),

              // =========================
              // Task Image
              // =========================
              ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: Image.asset(
                  'assets/images/Gettylmages-1315607788 3.png',
                  width: double.infinity,
                  height: 145.h,
                  fit: BoxFit.cover,
                ),
              ),

              SizedBox(height: 18.h),

              // =========================
              // Task Title
              // =========================
              _buildTextField(controller: titleController, hintText: 'Title'),

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
              // Group Dropdown
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

                    icon: const Icon(Icons.keyboard_arrow_down),

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
              // End Time
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

                      Expanded(
                        child: Text(
                          selectedDate == null
                              ? 'End Time'
                              : formatDate(selectedDate!),

                          style: TextStyle(
                            color: selectedDate == null
                                ? Colors.grey
                                : Colors.black,
                            fontSize: 13.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 25.h),

              // =========================
              // Add Task Button
              // =========================
              SizedBox(
                width: double.infinity,
                height: 50.h,

                child: ElevatedButton(
                  onPressed: addTask,

                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff00C853),
                    foregroundColor: Colors.white,
                    elevation: 0,

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),

                  child: Text(
                    'Add Task',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
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

  // =========================
  // TextField Design
  // =========================

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

        hintStyle: TextStyle(color: Colors.grey, fontSize: 13.sp),

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

  // =========================
  // Format Date
  // =========================

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

    return '$day/${date.year}/$month    $hour:$minute $period';
  }

  // =========================
  // Add Task
  // =========================

  void addTask() {
    if (titleController.text.trim().isEmpty) {
      return;
    }

    final taskDate = selectedDate ?? DateTime.now();

    Navigator.pop(context, {
      'title': titleController.text.trim(),
      'description': descriptionController.text.trim(),
      'group': selectedGroup,
      'date': taskDate,
    });
  }
}
