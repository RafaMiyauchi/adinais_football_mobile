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

This was a really important concept. The main difference is all about **memory** (or "state"). A **`StatelessWidget`** has no memory; it just takes in data and builds itself. My `ItemCard` is a perfect example—it just *shows* info and can't change on its own. A **`StatefulWidget`** is the opposite; it has a memory (a `State` object) and *can* change over time. For example, a checkbox needs to *remember* if it's checked. When its internal state changes, I'd have to call `setState()` to tell Flutter to rebuild it. I think the general rule of thumb now is to always start with `Stateless` and only "upgrade" it to `Stateful` if I really need it to remember something internally.


## 5. What is `BuildContext`?

Related to the `context`, the `BuildContext`, is directly related to this. The way I understand it, `BuildContext` is just the widget's "address" in the tree. It tells the widget where it lives. This was super important for this assignment because it's how I was able to show my `SnackBar`. When I wrote `ScaffoldMessenger.of(context)`, I was basically telling Flutter, "Starting from my current address (the `context`), go up the tree and find the `ScaffoldMessenger` service so I can use it." It's how widgets find their parent services.

## 6. Hot Reload vs. Hot Restart

And honestly, the best features for *doing* all this work are Hot Reload and Hot Restart. **Hot Reload** is the magic feature I use 99% of the time. It injects my code changes in like a second *without* resetting my app. This is perfect for fixing UI, because my app's state is preserved (like if I had a counter, it would stay at 10). **Hot Restart** is what I use when Hot Reload doesn't work (like if I change something deep, like a constructor). It resets the entire app state, so my app goes back to the home screen as if I just launched it, but it's still way faster than a full stop and re-run.