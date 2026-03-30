# Push Swap

Sort integers on two stacks with a limited set of operations. The goal is to do it with as few moves as possible.

## What's this about?

You get two stacks (a and b), stack a starts full with random integers, stack b is empty. You can only use four operations:
- `sa` / `sb` / `ss` - swap the top two elements
- `pa` / `pb` - push top of one stack onto the other
- `ra` / `rb` / `rr` - rotate (move top to bottom)
- `rra` / `rrb` / `rrr` - reverse rotate (move bottom to top)

Goal: sort stack a in ascending order.

## The algorithm

This implementation uses a chunking-based approach with an adaptive chunk size calculated using a polynomial formula:

```
chunk = 0.000000053 * n² + 0.03 * n + 14.5
```

The algorithm works in phases:
1. **Pre-sorting phase** - Divide stack a into chunks and push elements to stack b based on their position relative to chunk boundaries
2. **Final sorting phase** - Bring elements from stack b back to stack a in sorted order
3. **Small stack handling** - Special case optimization for stacks with 3 or fewer elements

The chunk size formula is derived from optimization research and gives good results for various input sizes without needing separate handling for different ranges.

## Usage

```bash
make
./push_swap <numbers>
./checker_bonus <numbers>
```

Examples:
```bash
./push_swap 3 2 5 1 4
./push_swap 1 2 3
echo "ra pb" | ./checker_bonus 3 2 5 1 4
```

## Bonus

The `checker_bonus` program validates a sequence of operations, checking if they correctly sort the given integers.

## Project specs

- Written in C (42 school subject)
- Uses a custom libft
- Circular doubly-linked lists for stack management
- No malloc crashes on invalid input


#### Testers resources 
- https://github.com/gemartin99/Push-Swap-Tester
- https://github.com/SimonCROS/push_swap_tester
