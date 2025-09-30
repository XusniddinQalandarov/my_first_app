import 'package:flutter/material.dart';

void lab6Main() {
  runApp(const Lab6CompleteApp());
}

class Lab6CompleteApp extends StatelessWidget {
  const Lab6CompleteApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lab 6: State Management',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Lab6HomePage(),
    );
  }
}

class Lab6HomePage extends StatelessWidget {
  const Lab6HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lab 6: State Management'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('Section 1: Stateless vs Stateful'),
            const StaticProfileCard(),
            const SizedBox(height: 10),
            const InteractiveProfileCard(),
            const SizedBox(height: 10),
            const ProductCard(productName: 'Laptop', price: 999.99),
            const SizedBox(height: 10),
            const LikeButton(),
            const SizedBox(height: 10),
            const InteractiveLikeButton(),
            const SizedBox(height: 10),
            const UserNameInput(),

            const SizedBox(height: 30),
            _buildSectionTitle('Section 2: setState Tasks'),
            const CounterPage(),
            const SizedBox(height: 10),
            const CounterWithDecrement(),
            const SizedBox(height: 10),
            const VisibilityToggle(),
            const SizedBox(height: 10),
            const ItemListManager(),
            const SizedBox(height: 10),
            const ColorBox(),

            const SizedBox(height: 30),
            _buildSectionTitle('Section 3: Lifting State Up'),
            const SwitchManager(),
            const SizedBox(height: 10),
            const GreetingParent(),
            const SizedBox(height: 10),
            const TemperatureConverter(),
            const SizedBox(height: 10),
            const SurveyApp(),
            const SizedBox(height: 10),
            const Grandparent(),
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

// Section 1, Task 1: StaticProfileCard
class StaticProfileCard extends StatelessWidget {
  const StaticProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      child: ListTile(
        leading: Icon(Icons.person),
        title: Text('John Doe'),
        subtitle: Text('john.doe@email.com'),
      ),
    );
  }
}

// Section 1, Task 1: InteractiveProfileCard
class InteractiveProfileCard extends StatefulWidget {
  const InteractiveProfileCard({super.key});

  @override
  State<InteractiveProfileCard> createState() => _InteractiveProfileCardState();
}

class _InteractiveProfileCardState extends State<InteractiveProfileCard> {
  @override
  Widget build(BuildContext context) {
    return const Card(
      child: ListTile(
        leading: Icon(Icons.person),
        title: Text('Jane Smith'),
        subtitle: Text('jane.smith@email.com'),
      ),
    );
  }
}

// Section 1, Task 2: ProductCard
class ProductCard extends StatelessWidget {
  final String productName;
  final double price;

  const ProductCard({super.key, required this.productName, required this.price});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.shopping_bag),
        title: Text(productName),
        subtitle: Text('\$${price.toStringAsFixed(2)}'),
      ),
    );
  }
}

// Section 1, Task 3: LikeButton (non-interactive)
class LikeButton extends StatefulWidget {
  const LikeButton({super.key});

  @override
  State<LikeButton> createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  bool _isLiked = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Icon(
          _isLiked ? Icons.favorite : Icons.favorite_border,
          color: _isLiked ? Colors.red : Colors.grey,
          size: 40,
        ),
      ),
    );
  }
}

// Section 1, Task 4: InteractiveLikeButton
class InteractiveLikeButton extends StatefulWidget {
  const InteractiveLikeButton({super.key});

  @override
  State<InteractiveLikeButton> createState() => _InteractiveLikeButtonState();
}

class _InteractiveLikeButtonState extends State<InteractiveLikeButton> {
  bool _isLiked = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: IconButton(
          icon: Icon(
            _isLiked ? Icons.favorite : Icons.favorite_border,
            color: _isLiked ? Colors.red : Colors.grey,
            size: 40,
          ),
          onPressed: () {
            setState(() {
              _isLiked = !_isLiked;
            });
          },
        ),
      ),
    );
  }
}

// Section 1, Task 5: UserNameInput
class UserNameInput extends StatefulWidget {
  const UserNameInput({super.key});

  @override
  State<UserNameInput> createState() => _UserNameInputState();
}

class _UserNameInputState extends State<UserNameInput> {
  String _userName = '';

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter your name',
              ),
              onChanged: (value) {
                setState(() {
                  _userName = value;
                });
              },
            ),
            const SizedBox(height: 10),
            Text('Current name: $_userName'),
          ],
        ),
      ),
    );
  }
}

// Section 2, Task 1: CounterPage
class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('Count: $_counter', style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _incrementCounter,
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}

// Section 2, Task 2: CounterWithDecrement
class CounterWithDecrement extends StatefulWidget {
  const CounterWithDecrement({super.key});

  @override
  State<CounterWithDecrement> createState() => _CounterWithDecrementState();
}

class _CounterWithDecrementState extends State<CounterWithDecrement> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('Count: $_counter', style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _decrementCounter,
                  child: const Icon(Icons.remove),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: _incrementCounter,
                  child: const Icon(Icons.add),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Section 2, Task 3: VisibilityToggle
class VisibilityToggle extends StatefulWidget {
  const VisibilityToggle({super.key});

  @override
  State<VisibilityToggle> createState() => _VisibilityToggleState();
}

class _VisibilityToggleState extends State<VisibilityToggle> {
  bool _isVisible = true;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            if (_isVisible) const Text('Now you see me!', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _isVisible = !_isVisible;
                });
              },
              child: Text(_isVisible ? 'Hide' : 'Show'),
            ),
          ],
        ),
      ),
    );
  }
}

// Section 2, Task 4: ItemListManager
class ItemListManager extends StatefulWidget {
  const ItemListManager({super.key});

  @override
  State<ItemListManager> createState() => _ItemListManagerState();
}

class _ItemListManagerState extends State<ItemListManager> {
  final List<String> _items = [];
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
                      labelText: 'Enter item',
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    if (_controller.text.isNotEmpty) {
                      setState(() {
                        _items.add(_controller.text);
                        _controller.clear();
                      });
                    }
                  },
                  child: const Icon(Icons.add),
                ),
              ],
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 150,
              child: ListView.builder(
                itemCount: _items.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_items[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Section 2, Task 5: ColorBox
class ColorBox extends StatefulWidget {
  const ColorBox({super.key});

  @override
  State<ColorBox> createState() => _ColorBoxState();
}

class _ColorBoxState extends State<ColorBox> {
  Color _boxColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              width: 200,
              height: 200,
              color: _boxColor,
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  onPressed: () {
                    setState(() {
                      _boxColor = Colors.red;
                    });
                  },
                  child: const Text('Red'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  onPressed: () {
                    setState(() {
                      _boxColor = Colors.green;
                    });
                  },
                  child: const Text('Green'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  onPressed: () {
                    setState(() {
                      _boxColor = Colors.blue;
                    });
                  },
                  child: const Text('Blue'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


// Section 3, Task 1: SwitchManager (Solution)
class SwitchManager extends StatefulWidget {
  const SwitchManager({super.key});

  @override
  State<SwitchManager> createState() => _SwitchManagerState();
}

class _SwitchManagerState extends State<SwitchManager> {
  bool _isActive = false;

  void _handleSwitchChanged(bool newValue) {
    setState(() {
      _isActive = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('The Switch is: ${_isActive ? "ON" : "OFF"}'),
            const SizedBox(height: 10),
            InteractiveSwitch(
              isActive: _isActive,
              onChanged: _handleSwitchChanged,
            ),
          ],
        ),
      ),
    );
  }
}

class InteractiveSwitch extends StatelessWidget {
  final bool isActive;
  final ValueChanged<bool> onChanged;

  const InteractiveSwitch({
    super.key,
    required this.isActive,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: isActive,
      onChanged: onChanged,
    );
  }
}

// Section 3, Task 2: GreetingParent
class GreetingParent extends StatefulWidget {
  const GreetingParent({super.key});

  @override
  State<GreetingParent> createState() => _GreetingParentState();
}

class _GreetingParentState extends State<GreetingParent> {
  String _name = "Guest";

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Greeting(name: _name),
      ),
    );
  }
}

class Greeting extends StatelessWidget {
  final String name;

  const Greeting({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Text('Hello, $name', style: const TextStyle(fontSize: 18));
  }
}

// Section 3, Task 3: TemperatureConverter
class TemperatureConverter extends StatefulWidget {
  const TemperatureConverter({super.key});

  @override
  State<TemperatureConverter> createState() => _TemperatureConverterState();
}

class _TemperatureConverterState extends State<TemperatureConverter> {
  double _celsius = 0.0;

  void _updateCelsius(double newCelsius) {
    setState(() {
      _celsius = newCelsius;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CelsiusInput(onChanged: _updateCelsius),
            const SizedBox(height: 10),
            FahrenheitDisplay(celsius: _celsius),
          ],
        ),
      ),
    );
  }
}

class CelsiusInput extends StatelessWidget {
  final ValueChanged<double> onChanged;

  const CelsiusInput({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Celsius',
      ),
      keyboardType: TextInputType.number,
      onChanged: (value) {
        final celsius = double.tryParse(value) ?? 0.0;
        onChanged(celsius);
      },
    );
  }
}

class FahrenheitDisplay extends StatelessWidget {
  final double celsius;

  const FahrenheitDisplay({super.key, required this.celsius});

  @override
  Widget build(BuildContext context) {
    final fahrenheit = celsius * 9 / 5 + 32;
    return Text(
      'Fahrenheit: ${fahrenheit.toStringAsFixed(2)}°F',
      style: const TextStyle(fontSize: 18),
    );
  }
}

// Section 3, Task 4: SurveyApp
class SurveyApp extends StatefulWidget {
  const SurveyApp({super.key});

  @override
  State<SurveyApp> createState() => _SurveyAppState();
}

class _SurveyAppState extends State<SurveyApp> {
  double _satisfaction = 5.0;

  @override
  Widget build(BuildContext context) {
    String message;
    if (_satisfaction < 3) {
      message = "Awful";
    } else if (_satisfaction < 7) {
      message = "Okay";
    } else {
      message = "Great!";
    }

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('Satisfaction: ${_satisfaction.toStringAsFixed(1)} - $message',
                style: const TextStyle(fontSize: 18)),
            Slider(
              value: _satisfaction,
              min: 0,
              max: 10,
              divisions: 10,
              label: _satisfaction.toString(),
              onChanged: (value) {
                setState(() {
                  _satisfaction = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

// Section 3, Task 5: Prop Drilling (Grandparent -> Parent -> Child)
class Grandparent extends StatefulWidget {
  const Grandparent({super.key});

  @override
  State<Grandparent> createState() => _GrandparentState();
}

class _GrandparentState extends State<Grandparent> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('Grandparent Counter: $_counter', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Parent(counter: _counter, onIncrement: _incrementCounter),
          ],
        ),
      ),
    );
  }
}

class Parent extends StatelessWidget {
  final int counter;
  final VoidCallback onIncrement;

  const Parent({super.key, required this.counter, required this.onIncrement});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      color: Colors.grey[200],
      child: Column(
        children: [
          Text('Parent passes: $counter'),
          Child(counter: counter, onIncrement: onIncrement),
        ],
      ),
    );
  }
}

class Child extends StatelessWidget {
  final int counter;
  final VoidCallback onIncrement;

  const Child({super.key, required this.counter, required this.onIncrement});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      color: Colors.grey[300],
      child: Column(
        children: [
          Text('Child receives: $counter'),
          ElevatedButton(
            onPressed: onIncrement,
            child: const Text('Increment in Grandparent'),
          ),
        ],
      ),
    );
  }
}