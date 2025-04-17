#  Elm Product Variant Selector

A simple interactive Elm component that allows users to select a product **color** and **size**, with a dynamic preview circle that reflects the current selection

## Features

- Pure Elm implementation using `Browser.sandbox`
- Select a color (Red, Blue, Green)
- Select a size (Small, Medium, Large)
- Live preview circle updates based on current selection
- Unit tests using `elm-test`

## Setup

follow instructions at: https://guide.elm-lang.org/install/elm.html to install elm in your machine

Install nodejs to be able to install other dependencies

```
npm install -g elm-test elm-format
```

I suggest you to use VScode as IDE, with Elm by Elm tooling extension

### To build project
```
elm make src/Main.elm --output=elm.js
```

### To run tests:

```
elm-test
```

### To run project

open `index.html` in your browser


## What is ProductVariant?

The ProductVariant module is a reusable Elm component that models:
- A Model with optional color and size selections
- Messages (Msg) to handle user interactions
- An update function to mutate state immutably
- A view that renders:
  - A preview circle with dynamic styles
  - A list of buttons for selecting color and size
