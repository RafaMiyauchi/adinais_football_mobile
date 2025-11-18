# Assignment 7
## 1. What is a widget tree in Flutter?

The way I think about the **widget tree** is that it's just a big "family tree" for my app's UI. At the very top, I have my "root" widget (like `MaterialApp`), and every other widget is nested inside it as a "child." This **parent-child relationship** is how I built my layout. For example, I used a `Column` as a parent to hold a list of "children" (my `Row` and `GridView`), and its job was just to stack them vertically. Every single thing on my screen is part of this tree.

## 2. Widgets Used in This Project

I used a bunch of widgets to get this page built. Here’s a quick rundown of the main ones:

* **`MaterialApp`**: This was the main "frame" for my entire app. It's what let me use Material Design and set my app's theme.
* **`Scaffold`**: This was my blueprint for the screen. It gave me the white background and let me add the `AppBar` at the top and a `body` for all my content.
* **`Column`**: I used this as my main layout widget to stack my user info `Row` and my button `GridView` on top of each other.
* **`Row`**: I used this just to line up the three `InfoCard`s (NPM, Name, Class) horizontally.
* **`GridView`**: This was for creating that 3-column grid for my buttons.
* **`Card`**: I used this for my `InfoCard` to get that nice, clean look with the rounded corners and shadow.
* **`Material` & `InkWell`**: This was for making the buttons. `Material` was the "canvas" that I set the color and rounded corners on, and `InkWell` was the magic that made it "tappable" and gave it the ripple effect.
* **`ScaffoldMessenger` & `SnackBar`**: This is how I got the pop-up messages to work. `ScaffoldMessenger` is the manager that *shows* the `SnackBar` (the little black box with text).
* **The Basics**:
    * **`Text`**: Just for showing all the text.
    * **`Icon`**: For putting the icons in my buttons.
    * **`SizedBox` / `Padding`**: I used these to add empty space so things didn't look so cramped.
    * **`Container`**: A handy box I used inside `InfoCard` to control its width.
* **My Custom Widgets**: `MyApp`, `MyHomePage`, `InfoCard`, and `ItemCard`. I made these myself to keep my code clean and organized!

## 3. What is the function of the `MaterialApp` widget?

The `MaterialApp` widget is basically the "boss" of my whole app. It's the top-level wrapper that I used to set up all the Material Design stuff, like my app's theme (which is why my `AppBar` turned blue automatically). It also handles all the navigation. I learned that it has to be the root widget, sitting at the top of the tree, so that any other widget in my app, no matter how deep, can access these core services like the theme.

## 4. `StatelessWidget` vs. `StatefulWidget`

This was a really important concept. The main difference is all about **memory** (or "state"). A **`StatelessWidget`** has no memory; it just takes in data and builds itself. My `ItemCard` is a perfect example of this, it just *shows* info and can't change on its own. A **`StatefulWidget`** is the opposite; it has a memory (a `State` object) and *can* change over time. For example, a checkbox needs to *remember* if it's checked. When its internal state changes, I'd have to call `setState()` to tell Flutter to rebuild it. I think the general rule of thumb now is to always start with `Stateless` and only "upgrade" it to `Stateful` if I really need it to remember something internally.


## 5. What is `BuildContext`?

Related to the `context`, the `BuildContext`, is directly related to this. The way I understand it, `BuildContext` is just the widget's "address" in the tree. It tells the widget where it lives. This was super important for this assignment because it's how I was able to show my `SnackBar`. When I wrote `ScaffoldMessenger.of(context)`, I was basically telling Flutter, "Starting from my current address (the `context`), go up the tree and find the `ScaffoldMessenger` service so I can use it." It's how widgets find their parent services.

## 6. Hot Reload vs. Hot Restart

And honestly, the best features for *doing* all this work are Hot Reload and Hot Restart. **Hot Reload** is the magic feature I use 99% of the time. It injects my code changes in like a second *without* resetting my app. This is perfect for fixing UI, because my app's state is preserved (like if I had a counter, it would stay at 10). **Hot Restart** is what I use when Hot Reload doesn't work (like if I change something deep, like a constructor). It resets the entire app state, so my app goes back to the home screen as if I just launched it, but it's still way faster than a full stop and re-run.

# Assignment 8

## 1 `Navigator.push()` vs. `Navigator.pushReplacement()`

`Navigator.push()` is like adding a new page on top of the stack of pages. The old page is still underneath. I used this for the "Add Product" button (both on the main page and in the drawer) because I want the user to be able to hit the back arrow and return to the main menu. It's like a temporary new screen.

`Navigator.pushReplacement()`, on the other hand, replaces the current page with a new one. The old page is thrown away. I used this in my drawer for the "Home" button. When I'm on the "Add Product" page and click "Home," it replaces the form page. This is good because it means the user can't hit the back arrow to accidentally go back to the form they just left. It's a more permanent move.

## 2. Using `Scaffold`, `AppBar`, and `Drawer` for Structure

I used this widget hierarchy to make my app look and feel consistent. The `Scaffold` is my main "blueprint" for every page; it's the base that holds the `AppBar` and the `body`. By putting an `AppBar` inside the `Scaffold` on both my `menu.dart` and `product_form.dart` pages, I guaranteed that the top bar always looks the same (same title style, same green color). Most importantly, I added the same `drawer: const LeftDrawer()` to the `Scaffold` of both pages. This is how I made sure my navigation menu is identical on every screen. It's super efficient and makes the app feel connected.

## 3. Advantages of Layout Widgets in My Form

There are three essential elements regarding this, which are;
- `Padding`: I used Padding around all my `TextFormFields`. This was purely for design and to make the form usable. Without it, the form fields would be jammed right against the edge of the screen. It just adds breathing room and makes the whole page look cleaner.

- `SingleChildScrollView`: This was the fix for the "bottom overflow" error. As soon as the keyboard popped up on my phone, it covered the "Description" field and the "Save" button. By wrapping my whole `Column` of form fields in a `SingleChildScrollView`, the user can now just scroll the page to see all the fields, even when the keyboard is open.

- `ListView`: I actually used `ListView` in my `LeftDrawer`. It's what lets my drawer options ("Home" and "Add Product") stack vertically. For a form, `ListView` could be used instead of `Column` + `SingleChildScrollView`, and it's especially good if you have a really long or dynamic list of form elements.

## 4. Setting the "Football Shop" Color Theme
I wanted to set a clear visual identity with that bright green color (`rgb(163, 255, 0)`). For this assignment, I set it manually on each page that needed it. In my AppBar (on both `menu.dart` and `product_form.dart`), I set the `backgroundColor: const Color.fromARGB(255, 163, 255, 0)`.

This immediately created a problem: the white text was hard to read. So, I also had to set the `foregroundColor: Colors.black`, which automatically changed the title text and the hamburger menu icon to black. I did the exact same thing for my `DrawerHeader` in `left_drawer.dart` so that when the menu slides out, the brand color and style are consistent. For a bigger app, I'd probably set this up in the main `ThemeData` in `main.dart`, but for this, setting it manually worked well.

## Assignment 9

### 1. Why do we need to create a Dart model?
I created a `Product` model class because working directly with raw JSON (`Map<String, dynamic>`) in Flutter is risky. By creating a model class:
* **Type Safety:** I can treat `price` as an actual `int` and `name` as a `String` instead of guessing.
* **Less Bugs:** If I make a typo (like typing `product.nam` instead of `product.name`), the compiler yells at me immediately. With a Map, I wouldn't know until the app crashed.
* **Clarity:** It makes the code much easier to read. `product.name` is way clearer than `product['name']`.

### 2. Role of `http` vs. `CookieRequest`
* **`http` library:** This is the basic tool for making network requests (GET, POST, etc.). It sends the data but doesn't remember anything about the "session" by default.
* **`CookieRequest`:** This (from the `pbp_django_auth` package) is a wrapper around `http` that is specifically designed to handle **cookies**. When I log in to Django, the server sends back a session ID in a cookie. `CookieRequest` automatically saves that cookie and sends it back with every subsequent request. Without it, Django would forget who I am on every new page load, and I'd have to log in constantly.

### 3. Why share `CookieRequest` across all components?
I need to share the *same instance* of `CookieRequest` because that single instance holds my login state (the session cookies). If I created a new `CookieRequest` on every screen, the new instance would be empty (no cookies), and the app would treat me as a logged-out guest. By using `Provider` at the root (`main.dart`), I ensure the entire app shares that one "logged-in" state.

### 4. Connectivity Configuration (10.0.2.2, CORS, etc.)
* **`10.0.2.2`**: This is a special IP address used by the Android Emulator to talk to my computer's `localhost`. If I used `127.0.0.1` inside the emulator, it would try to connect to *itself* (the phone), not my laptop where Django is running.
* **CORS (Cross-Origin Resource Sharing)**: Browsers (and sometimes apps) block requests between different origins for security. Since my Flutter app is a different "origin" than my Django server, I had to install `django-cors-headers` and enable `CORS_ALLOW_ALL_ORIGINS` to let them talk.
* **INTERNET Permission**: Android blocks internet access by default. I had to add the `<uses-permission...>` line to `AndroidManifest.xml` or the app would just crash when trying to fetch data.

### 5. Data Transmission Mechanism (Input -> Flutter Display)
The flow works like this:
1.  **Input:** I type "Jersey" and "50000" into the Flutter form (`TextFormField`).
2.  **Send:** When I click "Save," the `CookieRequest` sends a **POST** request to Django containing that data as JSON.
3.  **Process:** Django receives the JSON, validates it, and saves a new `Product` object to the PostgreSQL/SQLite database.
4.  **Fetch:** On the "Product List" page, Flutter sends a **GET** request to the JSON endpoint.
5.  **Display:** Django sends back a list of products in JSON format. Flutter takes that JSON, converts it into a list of `Product` objects (using my model), and displays them in a `ListView` or `GridView`.

### 6. Authentication Mechanism
* **Login:** I enter my username/password. Flutter sends a POST request to `/login/`. Django checks the database. If valid, Django creates a session and sends a session ID cookie back. `CookieRequest` saves this cookie.
* **Register:** I enter new details. Flutter sends a POST to `/register/`. Django creates a new User entry in the database.
* **Logout:** I click logout. Flutter sends a request to `/logout/`. Django deletes the session on the server. On the Flutter side, `CookieRequest` discards the cookie, effectively logging me out locally too.

### 7. How I Implemented the Checklist (Step-by-Step)
1.  **Django Setup:** First, I installed `django-cors-headers` and added it to `INSTALLED_APPS` and `MIDDLEWARE` in `settings.py`. I also added `10.0.2.2` and `localhost` to `ALLOWED_HOSTS` to allow the emulator/browser to connect.
2.  **Model Creation:** I used Quicktype (or wrote it manually) to convert my Django JSON structure into a Dart `Product` class in `lib/models/product.dart` so I could handle data safely.
3.  **Provider Setup:** I wrapped my `MaterialApp` in `main.dart` with a `Provider` that creates a single `CookieRequest` instance to manage sessions app-wide.
4.  **Auth Screens:** I created `login.dart` and `register.dart` pages that use `request.login` and `request.post` to talk to my existing Django authentication views.
5.  **Product List:** I made a `list_product.dart` page that fetches the JSON data using `request.get`, converts it to a list of `Product` objects, and displays them using a `ListView.builder`.
6.  **Product Detail:** I created a `detail_product.dart` page that receives a specific `Product` object and displays all its details (brand, rating, etc.) when a user taps a card in the list.
7.  **Form Integration:** I updated my `product_form.dart` to send the input data to Django via `request.postJson` instead of just showing a local popup.
8.  **Filtering:** I updated the Django view to filter products by `request.user` so users only see their own items (optional/depending on requirement).