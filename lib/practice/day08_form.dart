import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: Day08Page()));

class Day08Page extends StatefulWidget {
  const Day08Page({super.key});

  @override
  State<Day08Page> createState() => _Day08PageState();
}

class _Day08PageState extends State<Day08Page> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  void _submit() {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    FocusScope.of(context).unfocus();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('欢迎，${_nameController.text.trim()}！')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('08 · 表单与校验')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            TextFormField(
              controller: _nameController,
              textInputAction: TextInputAction.done,
              decoration: const InputDecoration(
                labelText: '昵称',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                final name = value?.trim() ?? '';
                if (name.isEmpty) return '请输入昵称';
                if (name.length < 2) return '昵称至少需要 2 个字符';
                return null;
              },
              onFieldSubmitted: (_) => _submit(),
            ),
            const SizedBox(height: 16),
            FilledButton(onPressed: _submit, child: const Text('提交')),
          ],
        ),
      ),
    );
  }
}
