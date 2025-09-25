import 'package:flutter/material.dart';

void lab5Main() {
  runApp(const Lab5CompleteApp());
}

class Lab5CompleteApp extends StatelessWidget {
  const Lab5CompleteApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lab 5 Complete',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Lab5HomePage(),
    );
  }
}

class Lab5HomePage extends StatelessWidget {
  const Lab5HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lab 5: Complete Widget Practice'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('1. Container Widget Tasks'),
            _buildContainerTasks(),
            
            const SizedBox(height: 30),
            _buildSectionTitle('2. Column & Row Widget Tasks'),
            _buildColumnRowTasks(),
            
            const SizedBox(height: 30),
            _buildSectionTitle('3. TextField Widget Tasks'),
            _buildTextFieldTasks(),
            
            const SizedBox(height: 30),
            _buildSectionTitle('4. Advanced Layout (Expanded, Flex, Spacer)'),
            _buildAdvancedLayoutTasks(),
            
            const SizedBox(height: 30),
            _buildSectionTitle('5. Widget Tree Challenges'),
            _buildWidgetTreeChallenges(),
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

  Widget _buildContainerTasks() {
    return Column(
      children: [
        // Task 1 & 2: Changed color and height, replaced Text with Icon
        Container(
          padding: const EdgeInsets.all(16.0),
          color: Colors.redAccent,
          height: 150,
          width: 100,
          child: const Icon(Icons.home, color: Colors.white),
        ),
        
        const SizedBox(height: 20),
        
        // Task 3: Using decoration with rounded corners
        Container(
          margin: const EdgeInsets.all(20.0),
          padding: const EdgeInsets.all(16.0),
          height: 150,
          width: 150,
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: const Icon(Icons.star, color: Colors.white, size: 40),
        ),
      ],
    );
  }

  Widget _buildColumnRowTasks() {
    return Column(
      children: [
        // Column with crossAxisAlignment.start
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const <Widget>[
              Icon(Icons.star, size: 50, color: Colors.amber),
              Icon(Icons.star, size: 50, color: Colors.amber),
              Icon(Icons.star, size: 50, color: Colors.amber),
              Icon(Icons.favorite, size: 50, color: Colors.red),
              Icon(Icons.thumb_up, size: 50, color: Colors.blue),
            ],
          ),
        ),
        
        const SizedBox(height: 20),
        
        // Row with spaceEvenly
        Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const <Widget>[
              Icon(Icons.star, size: 50, color: Colors.amber),
              Icon(Icons.star, size: 50, color: Colors.amber),
              Icon(Icons.star, size: 50, color: Colors.amber),
              Icon(Icons.favorite, size: 50, color: Colors.red),
              Icon(Icons.thumb_up, size: 50, color: Colors.blue),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTextFieldTasks() {
    return Column(
      children: [
        // Task 1 & 2: Password field with obscureText
        const TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Enter your password',
          ),
          obscureText: true,
        ),
        
        const SizedBox(height: 20),
        
        // Task 3: TextField with icon
        const TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Enter your name',
            icon: Icon(Icons.person),
          ),
        ),
        
        const SizedBox(height: 20),
        
        // Task 4: TextField with controller
        TextFieldWithController(),
      ],
    );
  }

  Widget _buildAdvancedLayoutTasks() {
    return Column(
      children: [
        // Expanded example with flex
        Container(
          height: 100,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  height: 100,
                  color: Colors.red,
                  child: const Center(child: Text('Flex: 1', style: TextStyle(color: Colors.white))),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  height: 100,
                  color: Colors.green,
                  child: const Center(child: Text('Flex: 2', style: TextStyle(color: Colors.white))),
                ),
              ),
            ],
          ),
        ),
        
        const SizedBox(height: 20),
        
        // Column with Expanded
        Container(
          height: 200,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  width: double.infinity,
                  color: Colors.purple,
                  child: const Center(child: Text('Expanded in Column', style: TextStyle(color: Colors.white))),
                ),
              ),
              Container(
                width: double.infinity,
                height: 50,
                color: Colors.orange,
                child: const Center(child: Text('Fixed Height', style: TextStyle(color: Colors.white))),
              ),
            ],
          ),
        ),
        
        const SizedBox(height: 20),
        
        // Spacer example
        Container(
          height: 80,
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Row(
            children: <Widget>[
              Container(
                width: 80,
                height: 60,
                color: Colors.blue,
                child: const Center(child: Text('Left', style: TextStyle(color: Colors.white))),
              ),
              const Spacer(),
              Container(
                width: 80,
                height: 60,
                color: Colors.red,
                child: const Center(child: Text('Right', style: TextStyle(color: Colors.white))),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildWidgetTreeChallenges() {
    return Column(
      children: [
        const Text(
          'Challenge 1: User Profile Card',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        _buildUserProfileCard(),
        
        const SizedBox(height: 30),
        
        const Text(
          'Challenge 2: Product List Item',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        _buildProductListItem(),
      ],
    );
  }

  Widget _buildUserProfileCard() {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        children: [
          Row(
            children: [
              const CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text('A', style: TextStyle(color: Colors.white, fontSize: 20)),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'User Name',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '@username',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Text(
            'A short bio about the user goes here. This is where users can describe themselves and share interesting information.',
            style: TextStyle(fontSize: 14),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: const Text('Follow'),
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Message'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProductListItem() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 100,
            height: 100,
            child: Image.network(
              'https://via.placeholder.com/100x100/FF5733/FFFFFF?text=Product',
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: Colors.grey[300],
                  child: const Icon(Icons.image, size: 50, color: Colors.grey),
                );
              },
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Product Title',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'A brief description of the item that explains its features and benefits.',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  '\$99.99',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Separate widget for TextField with controller
class TextFieldWithController extends StatefulWidget {
  @override
  _TextFieldWithControllerState createState() => _TextFieldWithControllerState();
}

class _TextFieldWithControllerState extends State<TextFieldWithController> {
  final TextEditingController _controller = TextEditingController();
  String _displayText = '';

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _controller,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Type something...',
            suffixIcon: Icon(Icons.edit),
          ),
          onChanged: (value) {
            setState(() {
              _displayText = value;
            });
          },
        ),
        const SizedBox(height: 10),
        Text(
          'You typed: $_displayText',
          style: const TextStyle(fontStyle: FontStyle.italic),
        ),
      ],
    );
  }
}