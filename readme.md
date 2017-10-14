# Kloe

Kloe is a small wrapper around various libraries for LÖVE with an API that feels similar to LÖVE's own API. The libraries are hand-picked to be useful to most developers and to help start new projects quickly. Think of it as a gentle guide to common game development tools.

## Usage

Kloe is distributed as a basic, already-working LÖVE project. If you want to start from scratch, however, place the "kloe" folder in the base directory of the project, and `require` it in your main.lua:

```lua
kloe = require 'kloe'
```

## API

### kloe.animation

Animation helpers provided by [anim8](https://github.com/kikito/anim8).

| Function                    | Equivalent         |
| --------------------------- | ------------------ |
| kloe.animation.newGrid      | anim8.newGrid      |
| kloe.animation.newAnimation | anim8.newAnimation |

### kloe.assets

Quick asset loading provided by [cargo](https://github.com/bjornbytes/cargo).

| Function         | Equivalent |
| ---------------- | ---------- |
| kloe.assets.load | cargo.init |

### kloe.class

Simple class system provided by [classic](https://github.com/rxi/classic).

| Function            | Equivalent      |
| ------------------- | --------------- |
| kloe.class.newClass | Object:extend() |

### kloe.graphics

`kloe.graphics` is a wrapper around `love.graphics`. It has the same functions as `love.graphics`, but it will automatically unpack vector arguments (created by `kloe.math.newVector`), so you can use numbers and vectors interchangeably in any `kloe.graphics` function.

In the following example, all three function calls do the same thing:

```lua
local position = kloe.math.newVector(300, 300)
local size = kloe.math.newVector(20, 80)

love.graphics.rectangle('fill', position.x, position.y, size.x, size.y)
kloe.graphics.rectangle('fill', position.x, position.y, size.x, size.y)
kloe.graphics.rectangle('fill', position, size)
```

### kloe.input

Input management provided by [baton](https://github.com/tesselode/baton).

| Function             | Equivalent |
| -------------------- | ---------- |
| kloe.input.newPlayer | baton.new  |

### kloe.math

Commonly used math functions and vector support.

| Function            | Library                                                         | Equivalent        |
| ------------------- | --------------------------------------------------------------- | ----------------- |
| kloe.math.clamp     | [lume](https://github.com/rxi/lume)                             | lume.clamp        |
| kloe.math.round     | [lume](https://github.com/rxi/lume)                             | lume.round        |
| kloe.math.sign      | [lume](https://github.com/rxi/lume)                             | lume.sign         |
| kloe.math.lerp      | [lume](https://github.com/rxi/lume)                             | lume.lerp         |
| kloe.math.choose    | [lume](https://github.com/rxi/lume)                             | lume.randomchoice |
| kloe.math.newVector | [hump-vector](http://hump.readthedocs.io/en/latest/vector.html) | vector            |

### kloe.message

Observer pattern with two-way communication provided by [talkback](https://github.com/tesselode/talkback).

| Function              | Equivalent         |
| --------------------- | -------------------|
| kloe.message.listen   | talkback:listen()  |
| kloe.message.say      | talkback:say()     |
| kloe.message.ignore   | talkback:ignore()  |
| kloe.message.reset    | talkback:reset()   |
| kloe.message.newGroup | talkback:newGroup()|

### kloe.state

Simple gamestate management provided by [hump-gamestate](http://hump.readthedocs.io/en/latest/gamestate.html).

| Function                  | Equivalent               |
| ------------------------- | ------------------------ |
| kloe.state.switch         | gamestate.switch         |
| kloe.state.current        | gamestate.current        |
| kloe.state.push           | gamestate.push           |
| kloe.state.pop            | gamestate.pop            |
| kloe.state.[callback]     | gamestate.[callback]     |
| kloe.state.registerEvents | gamestate.registerEvents |

### kloe.table

Useful functions for Lua tables.

| Function               | Library                                              | Equivalent      |
| ---------------------- | ---------------------------------------------------- | ----------------|
| kloe.table.inspect     | [inspect.lua](https://github.com/kikito/inspect.lua) | inspect         |
| kloe.table.remove      | [lume](https://github.com/rxi/lume)                                                     | lume.remove     |
| kloe.table.all         | [lume](https://github.com/rxi/lume)                                                     | lume.all        |
| kloe.table.any         | [lume](https://github.com/rxi/lume)                                                     | lume.any        |
| kloe.table.filter      | [lume](https://github.com/rxi/lume)                                                     | lume.filter     |
| kloe.table.reject      | [lume](https://github.com/rxi/lume)                                                     | lume.reject     |
| kloe.table.match       | [lume](https://github.com/rxi/lume)                                                     | lume.match      |
| kloe.table.serialize   | [lume](https://github.com/rxi/lume)                                                     | lume.serialize  |
| kloe.table.deserialize | [lume](https://github.com/rxi/lume)                                                     | lume.deserialize|
| kloe.table.ripairs     | [lume](https://github.com/rxi/lume)                                                     | lume.ripairs    |

### kloe.timer

Timer instance creation provided by [hump-timer](http://hump.readthedocs.io/en/latest/timer.html).

| Function            | Equivalent         |
| ------------------- | ------------------ |
| kloe.timer.newTimer | timer.new          |

### kloe.world

Entity management with optional ECS support provided by [ochre](https://github.com/tesselode/ochre).

| Function            | Equivalent |
| ------------------- | ---------- |
| kloe.world.newWorld | ochre.new  |