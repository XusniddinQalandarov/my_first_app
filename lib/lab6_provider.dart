import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void lab6ProviderMain() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CounterModel()),
        ChangeNotifierProvider(create: (_) => UserModel()),
        ChangeNotifierProvider(create: (_) => ExtendedCounterModel()),
        ChangeNotifierProvider(create: (_) => ThemeModel()),
        ChangeNotifierProvider(create: (_) => TodoListModel()),
      ],
      child: const Lab6ProviderApp(),
    ),
  );
}

class Lab6ProviderApp extends StatelessWidget {
  const Lab6ProviderApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeModel = context.watch<ThemeModel>();
    return MaterialApp(
      title: 'Lab 6: Provider State Management',
      theme: themeModel.isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: const ProviderHomePage(),
    );
  }
}

class ProviderHomePage extends StatelessWidget {
  const ProviderHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lab 6: Section 4 - Provider'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('Task 1: Counter with Provider'),
            const CounterScreen(),

            const SizedBox(height: 30),
            _buildSectionTitle('Task 2: User Model'),
            const UserScreen(),

            const SizedBox(height: 30),
            _buildSectionTitle('Task 3: Extended Counter'),
            const ExtendedCounterScreen(),

            const SizedBox(height: 30),
            _buildSectionTitle('Task 4: Theme Switcher'),
            const ThemeSwitch(),

            const SizedBox(height: 30),
            _buildSectionTitle('Task 5: Todo List'),
            const TodoListScreen(),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.blue,
        ),
      ),
    );
  }
}

// ============================================================================
// Task 1: Counter Model (Solution)
// ============================================================================

class CounterModel extends ChangeNotifier {
  int _count = 0;
  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }
}

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Consumer<CounterModel>(
              builder: (context, counter, child) => Text(
                'Count: ${counter.count}',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Provider.of<CounterModel>(context, listen: false).increment();
              },
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================================
// Task 2: User Model
// ============================================================================

class UserModel extends ChangeNotifier {
  String _username = "Guest";
  String get username => _username;

  void setUsername(String newUsername) {
    _username = newUsername;
    notifyListeners();
  }
}

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Consumer<UserModel>(
              builder: (context, userModel, child) => Text(
                'Username: ${userModel.username}',
                style: const TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Provider.of<UserModel>(context, listen: false).setUsername("Admin");
              },
              child: const Text('Change to Admin'),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================================
// Task 3: Extended Counter Model
// ============================================================================

class ExtendedCounterModel extends ChangeNotifier {
  int _count = 0;
  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }

  void decrement() {
    _count--;
    notifyListeners();
  }

  void reset() {
    _count = 0;
    notifyListeners();
  }
}

class ExtendedCounterScreen extends StatelessWidget {
  const ExtendedCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Consumer<ExtendedCounterModel>(
              builder: (context, counter, child) => Text(
                'Count: ${counter.count}',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Provider.of<ExtendedCounterModel>(context, listen: false).decrement();
                  },
                  child: const Icon(Icons.remove),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    Provider.of<ExtendedCounterModel>(context, listen: false).increment();
                  },
                  child: const Icon(Icons.add),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    Provider.of<ExtendedCounterModel>(context, listen: false).reset();
                  },
                  child: const Text('Reset'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================================
// Task 4: Theme Model
// ============================================================================

class ThemeModel extends ChangeNotifier {
  bool _isDarkMode = false;
  bool get isDarkMode => _isDarkMode;

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }
}

class ThemeSwitch extends StatelessWidget {
  const ThemeSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Dark Mode', style: TextStyle(fontSize: 18)),
            Consumer<ThemeModel>(
              builder: (context, themeModel, child) => Switch(
                value: themeModel.isDarkMode,
                onChanged: (value) {
                  themeModel.toggleTheme();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================================
// Task 5: Todo List Model
// ============================================================================

class TodoListModel extends ChangeNotifier {
  final List<String> _tasks = [];
  List<String> get tasks => List.unmodifiable(_tasks);

  void addTask(String task) {
    if (task.isNotEmpty) {
      _tasks.add(task);
      notifyListeners();
    }
  }

  void removeTask(int index) {
    if (index >= 0 && index < _tasks.length) {
      _tasks.removeAt(index);
      notifyListeners();
    }
  }
}

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter task',
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    Provider.of<TodoListModel>(context, listen: false)
                        .addTask(_controller.text);
                    _controller.clear();
                  },
                  child: const Icon(Icons.add),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Consumer<TodoListModel>(
              builder: (context, todoModel, child) {
                return SizedBox(
                  height: 200,
                  child: ListView.builder(
                    itemCount: todoModel.tasks.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(todoModel.tasks[index]),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            todoModel.removeTask(index);
                          },
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}