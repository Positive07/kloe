## Goals
- **Good out of box experience**
- Remove boilerplate
- Use what you need, ignore/remove what you don't
- Don't funnel people into too specific of a workflow
- Enable good game dev practices

## Iterations
- Iteration 1: ✓
	- States and objects
	- Just a template project you can clone
- Iteration 2: ✓
	- Quartizine namespace
	- Baton integration
	- Lume integration
- Iteration 3: ✓
	- Cargo integration
- Iteration 4: ✓
	- Talkback integration
	- Anim8 integration
- Iteration 5: ✓
	- *Very* simple entity pools
- Iteration 6: ✓
	- Organization/naming cleanup
- Iteration 7: ✓
	- Bump worlds
- Iteration 8:
	- World object classes
- Iteration 9:
	- Rename to Kloe
	- Provide classes with a new Sara namespace
		- I like the idea of this, and I think it makes the organization better
		- What things should be classes and what things should not?
		- Should people be extending the base Object class? yeah no shit
		- Should people be extending the World Object classes? most likely
		- Should people be extending the World classes? I'm not as sure on this one
	- (these are temporary names, whatever)
- Iteration 10:
	- Remove Sara
	- Make the world class more library style
- Iteration 11:
	- Add system support to worlds

## Iteration checklist
- Does this provide value?
- Would this interfere with game development?
- Is this technically sound?

## Lua or MoonScript?
- Lua
	- People actually use it
	- Simpler
- MoonScript
	- Hot
	- Has classes built in