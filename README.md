# Sudoku Solver

The goal of this sudoku solver is to define various strategies that I've been learning about [here](https://hodoku.sourceforge.net/en/tech_intro.php).

The strategies that this sudoku solver supports can be found in [Strategies.res](src/Strategies.res).

The input to the program (i.e. the unsolved sudoku) is hard coded in [Solver.res](src/Solver.res). Sudukus are represented by a flat array of numbers, where `0` represents the absence of a number.

To customize the strategies being applied when solving, edit [Solver.res](src/Solver.res).

```
sudoku
->easyStrategies
->mediumStrategies
->hardStrategies
->Utilities.toRows
->Js.log
```

## Installation

```sh
npm install
```

## Build

- Build: `npm run res:build`
- Clean: `npm run res:clean`
- Build & watch: `npm run res:dev`

## Run

```sh
npm run solve
```

## Front end

This is a Vite-based browser app with following setup:

- [ReScript](https://rescript-lang.org) 12.0 with @rescript/react, [Core](https://github.com/rescript-association/rescript-core) and JSX v4
- ES6 modules (ReScript code compiled to `.res.mjs` files)
- Vite 6 with React Plugin (Fast Refresh)
- Tailwind 4

## Development

Run ReScript in dev mode:

```sh
npm run res:dev
```

In another tab, run the Vite dev server:

```sh
npm run dev
```
