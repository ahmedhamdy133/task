import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/features/home/presentation/edit_task_screen.dart';
import 'package:flutter_application_2/core/features/home/presentation/profile_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'add_task_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> tasks = [];

  String searchText = '';

  // =========================
  // Open Edit Task
  // =========================

  Future<void> editTask(int index) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditTaskScreen(task: tasks[index]),
      ),
    );

    if (result == null) return;

    setState(() {
      // Delete
      if (result['delete'] == true) {
        tasks.removeAt(index);
        return;
      }

      // Update task
      tasks[index] = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    // =========================
    // Search
    // =========================

    final filteredTasks = tasks.where((task) {
      final title = task['title'].toString().toLowerCase();

      return title.contains(searchText.toLowerCase());
    }).toList();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ================= HEADER =================
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Text(
                        'Hello!',
                        style: TextStyle(fontSize: 16.sp, color: Colors.grey),
                      ),

                      SizedBox(height: 5.h),

                      Text(
                        'Welcome Back',
                        style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ProfileScreen(),
                        ),
                      );
                    },

                    child: CircleAvatar(
                      radius: 25.r,
                      child: Icon(Icons.person, size: 28.sp),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 25.h),

              // ================= SEARCH =================
              Container(
                height: 50.h,

                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(15.r),
                ),

                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      searchText = value;
                    });
                  },

                  decoration: InputDecoration(
                    hintText: 'Search tasks...',

                    prefixIcon: Icon(Icons.search, size: 24.sp),

                    border: InputBorder.none,

                    contentPadding: EdgeInsets.symmetric(vertical: 14.h),
                  ),
                ),
              ),

              SizedBox(height: 25.h),

              // ================= MY TASKS =================
              Text(
                'My Tasks',
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
              ),

              SizedBox(height: 15.h),

              // ================= TASKS =================
              Expanded(
                child: filteredTasks.isEmpty
                    ? Center(
                        child: Text(
                          tasks.isEmpty ? 'No tasks yet' : 'No tasks found',

                          style: TextStyle(fontSize: 16.sp, color: Colors.grey),
                        ),
                      )
                    : ListView.builder(
                        itemCount: filteredTasks.length,

                        itemBuilder: (context, index) {
                          final task = filteredTasks[index];

                          final realIndex = tasks.indexOf(task);

                          final DateTime taskDate =
                              task['date'] ?? DateTime.now();

                          final bool isDone = task['isDone'] == true;

                          // Date
                          final String date =
                              '${taskDate.day.toString().padLeft(2, '0')}/'
                              '${taskDate.month.toString().padLeft(2, '0')}/'
                              '${taskDate.year}';

                          // Time
                          final String time =
                              '${taskDate.hour.toString().padLeft(2, '0')}:'
                              '${taskDate.minute.toString().padLeft(2, '0')}';

                          return GestureDetector(
                            onTap: () {
                              editTask(realIndex);
                            },

                            child: Container(
                              margin: EdgeInsets.only(bottom: 12.h),

                              padding: EdgeInsets.all(16.w),

                              decoration: BoxDecoration(
                                color: isDone
                                    ? Colors.grey.shade200
                                    : const Color(0xFFE8F5E9),

                                borderRadius: BorderRadius.circular(15.r),
                              ),

                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,

                                children: [
                                  // ================= DATE =================
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,

                                    children: [
                                      const Icon(
                                        Icons.calendar_month,
                                        size: 14,
                                        color: Colors.grey,
                                      ),

                                      SizedBox(width: 5.w),

                                      Text(
                                        '$date  $time',

                                        style: TextStyle(
                                          fontSize: 11.sp,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),

                                  SizedBox(height: 8.h),

                                  // ================= TITLE =================
                                  Text(
                                    task['title'] ?? '',

                                    style: TextStyle(
                                      fontSize: 17.sp,
                                      fontWeight: FontWeight.bold,

                                      decoration: isDone
                                          ? TextDecoration.lineThrough
                                          : null,
                                    ),
                                  ),

                                  SizedBox(height: 6.h),

                                  // ================= DESCRIPTION =================
                                  if (task['description'] != null &&
                                      task['description'].toString().isNotEmpty)
                                    Text(
                                      task['description'],

                                      maxLines: 3,

                                      overflow: TextOverflow.ellipsis,

                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        color: Colors.grey,
                                      ),
                                    ),

                                  SizedBox(height: 10.h),

                                  // ================= BOTTOM =================
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,

                                    children: [
                                      // Group
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 10.w,
                                          vertical: 5.h,
                                        ),

                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(
                                            20.r,
                                          ),
                                        ),

                                        child: Text(
                                          task['group'] ?? 'Home',

                                          style: TextStyle(fontSize: 11.sp),
                                        ),
                                      ),

                                      Row(
                                        children: [
                                          // Done
                                          if (isDone)
                                            const Icon(
                                              Icons.check_circle,
                                              color: Colors.green,
                                              size: 22,
                                            ),

                                          // Delete
                                          IconButton(
                                            onPressed: () {
                                              setState(() {
                                                tasks.removeAt(realIndex);
                                              });
                                            },

                                            icon: const Icon(
                                              Icons.delete_outline,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),

      // ================= ADD TASK =================
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newTask = await Navigator.push(
            context,

            MaterialPageRoute(builder: (context) => const AddTaskScreen()),
          );

          if (newTask != null) {
            setState(() {
              tasks.add(newTask);
            });
          }
        },

        child: const Icon(Icons.add),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
