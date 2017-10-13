## Modules

### kloe.animation

Provides access to [anim8](https://github.com/kikito/anim8).

#### `kloe.animation.newGrid(frameWidth, frameHeight, imageWidth, imageHeight, left, top, border)`

Identical to [`anim8.newGrid`](https://github.com/kikito/anim8#grids).

#### `kloe.animation.newAnimation(frames, durations, onLoop)`

Identical to [`anim8.newAnimation`](https://github.com/kikito/anim8#animations).

### kloe.assets

Provides access to [cargo](https://github.com/bjornbytes/cargo).

#### `kloe.assets.load(options)`

Identical to [cargo.init](https://github.com/bjornbytes/cargo#cargo).

### kloe.graphics

`kloe.graphics` is a wrapper around `love.graphics`. It has the same functions as `love.graphics`, but it will automatically unpack vector arguments, so you can use numbers and vectors interchangeably in any `kloe.graphics` function.

In the following example, all three function calls do the same thing:

```lua
local position = kloe.math.newVector(300, 300)
local size = kloe.math.newVector(20, 80)

love.graphics.rectangle('fill', position.x, position.y, size.x, size.y)
kloe.graphics.rectangle('fill', position.x, position.y, size.x, size.y)
kloe.graphics.rectangle('fill', position, size)
```

### kloe.input

Provides access to [baton](https://github.com/tesselode/baton).

#### `kloe.input.newPlayer(options)`

Identical to [`baton.new`](https://github.com/tesselode/baton#players).

### kloe.math

#### `kloe.math.clamp(x, min, max)`

Identical to [`lume.clamp`](https://github.com/rxi/lume#lumeclampx-min-max).

etc...