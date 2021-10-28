# The 3x3x3 Dice Problem

This appeared as a problem of the week that I could do for extra credit in my math class. The problem is summed up very well [on the official archive page](https://naumathstat.github.io/problem-of-the-week/files/2021-10-27/).

I created this repository to help with my explaination for my answer, but I am not done playing this the problem yet. Please use freely, and share what you learn with me.

## About the Code

### Setup

Just clone this repository, and open up the newly cloned folder using [Processing 4](https://processing.org/download). Hit the run button, and have fun.

### Code Editing

The first (and potentially only) thing worth editing is the `orientDie` function in the Collection Class. This is the sole function responsible for the generation of the orientation of all die.

## About the Math

If you consider the center cube of the 3x3x3, and then consider attaching a cube to all of its sides, then the resulting ends of each "axes" are opposite of the face of that side of the center cube, facing in the same direction. For this reason, we can know that on a 3x3x3 cube, each face will have a different number of pips on center die of the face facing outward. For this reason, we can describe the faces of each Configuration using a table indexed by the number on the center cube for each face.

For example, here is the table for our one known solution, the Ethonian Collection:

| face  | 1     | 2     | 3     | 4     | 5     | 6     | total |
| :---: | ----- | ----- | ----- | ----- | ----- | ----- | :---: |
| 1     | 2     | 2     | -     | -     | 1     | 4     | 35    |
| 2     | 2     | 3     | -     | -     | 3     | 1     | 29    |
| 3     | -     | -     | 9     | -     | -     | -     | 27    |
| 4     | -     | -     | -     | 9     | -     | -     | 36    |
| 5     | 1     | 3     | -     | -     | 3     | 2     | 34    |
| 6     | 4     | 1     | -     | -     | 2     | 2     | 28    |
| total | 9     | 9     | 9     | 9     | 9     | 9     |__189__|

All of the middle columns indicate how many times that number shows up on that face. For example, in the configuration described by the table above, the 1 face has one '5' showing, and four '6.'

### Unanswered Questions

Is it possible to get a configuration in which each side of the die is not showing nine times?

Is there a pattern for the total number of pips shown on the outside as this moves into larger and larger dimensions? (eg 5x5x5)

What is the needed pattern for making a configuration that fits the specifications? Right now I have one known solution, but I am looking for an algorithm that can generate many working configurations.

What would this problem look like if expanded into 4 dimensions? I believe I will need to answer some of the other questions before moving on to this one.
