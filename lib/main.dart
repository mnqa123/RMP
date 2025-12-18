import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Туристическое приложение',
      theme: ThemeData(
        primarySwatch: Colors.green, // Основной зеленый цвет
        fontFamily: 'Roboto', // Используем стандартный шрифт
      ),
      home: const LoginScreen(), // Стартовый экран - логин
    );
  }
}

// ЭКРАН АВТОРИЗАЦИИ (ЛОГИН)
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Контроллеры для полей ввода
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Переменная для скрытия/отображения пароля
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          // Позволяет экрану скроллиться, если клавиатура перекрывает поля
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Заголовок и подзаголовок
                const SizedBox(height: 40),
                const Icon(
                  Icons.flight_takeoff, // Иконка самолета
                  size: 60,
                  color: Colors.green,
                ),
                const SizedBox(height: 20),
                Text(
                  'Добро пожаловать!',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.green[800],
                      ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Войдите в свой аккаунт, чтобы продолжить',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Colors.grey[600],
                      ),
                ),
                const SizedBox(height: 40),

                // Поле для Email
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    prefixIcon: const Icon(Icons.email_outlined),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.green),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 20),

                // Поле для Пароля
                TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Пароль',
                    prefixIcon: const Icon(Icons.lock_outline),
                    suffixIcon: IconButton(
                      icon: Icon(_obscurePassword
                          ? Icons.visibility_off
                          : Icons.visibility),
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.green),
                    ),
                  ),
                  obscureText: _obscurePassword,
                ),
                const SizedBox(height: 10),

                // Забыли пароль?
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      // Действие при нажатии "Забыли пароль?"
                    },
                    child: const Text('Забыли пароль?'),
                  ),
                ),
                const SizedBox(height: 30),

                // Кнопка Входа
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: () {
                      // Действие при нажатии "Войти"
                      // Здесь обычно проверяются данные и происходит вход
                      final email = _emailController.text;
                      final password = _passwordController.text;
                      print('Email: $email, Password: $password');
                      // Например: AuthService.signIn(email, password);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green, // Цвет кнопки
                      foregroundColor: Colors.white, // Цвет текста
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Войти',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                const SizedBox(height: 30),

                // Разделитель ИЛИ
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: Colors.grey[400],
                        thickness: 1,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        'ИЛИ',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.grey[400],
                        thickness: 1,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),

                // Ссылка на Регистрацию
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Еще нет аккаунта?'),
                    TextButton(
                      onPressed: () {
                        // Переход на экран регистрации
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RegisterScreen()),
                        );
                      },
                      child: const Text(
                        'Зарегистрируйтесь',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.green),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ЭКРАН РЕГИСТРАЦИИ
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Регистрация'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Возврат на экран логина
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                const Icon(
                  Icons.person_add_alt_1, // Иконка для регистрации
                  size: 50,
                  color: Colors.green,
                ),
                const SizedBox(height: 20),
                Text(
                  'Создайте аккаунт',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.green[800],
                      ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Заполните данные, чтобы создать аккаунт',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Colors.grey[600],
                      ),
                ),
                const SizedBox(height: 40),

                // Поле для Полного имени
                TextField(
                  controller: _fullNameController,
                  decoration: InputDecoration(
                    labelText: 'Полное имя',
                    prefixIcon: const Icon(Icons.person_outline),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.green),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Поле для Email
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    prefixIcon: const Icon(Icons.email_outlined),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.green),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 20),

                // Поле для Пароля
                TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Пароль',
                    prefixIcon: const Icon(Icons.lock_outline),
                    suffixIcon: IconButton(
                      icon: Icon(_obscurePassword
                          ? Icons.visibility_off
                          : Icons.visibility),
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.green),
                    ),
                  ),
                  obscureText: _obscurePassword,
                ),
                const SizedBox(height: 20),

                // Поле для Подтверждения пароля
                TextField(
                  controller: _confirmPasswordController,
                  decoration: InputDecoration(
                    labelText: 'Подтвердите пароль',
                    prefixIcon: const Icon(Icons.lock_outline),
                    suffixIcon: IconButton(
                      icon: Icon(_obscureConfirmPassword
                          ? Icons.visibility_off
                          : Icons.visibility),
                      onPressed: () {
                        setState(() {
                          _obscureConfirmPassword = !_obscureConfirmPassword;
                        });
                      },
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.green),
                    ),
                  ),
                  obscureText: _obscureConfirmPassword,
                ),
                const SizedBox(height: 40),

                // Кнопка Регистрации
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: () {
                      // Действие при нажатии "Зарегистрироваться"
                      final fullName = _fullNameController.text;
                      final email = _emailController.text;
                      final password = _passwordController.text;
                      final confirmPassword = _confirmPasswordController.text;

                      // Базовая проверка совпадения паролей
                      if (password != confirmPassword) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Пароли не совпадают!'),
                            backgroundColor: Colors.red,
                          ),
                        );
                        return;
                      }

                      print(
                          'Name: $fullName, Email: $email, Password: $password');
                      // Например: AuthService.signUp(fullName, email, password);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Зарегистрироваться',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                const SizedBox(height: 30),

                // Ссылка на Вход (если пользователь уже зарегистрирован)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Уже есть аккаунт?'),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context); // Возврат на экран логина
                      },
                      child: const Text(
                        'Войдите',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.green),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}