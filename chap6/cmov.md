## Conditional move instructions

A set of move instructions which only move data if a certain flag is set.

They're preferable to branching especially in simple cases.

**common cmov instructions**
|instruction|effect                            |
|-----------|----------------------------------|
|cmovz      |move if ZF is set                 |
|cmovnz     |move if ZF is not set             |
|cmovl      |move if SF is set                 |
|cmovle     |move if SF or ZF is set           |
|cmovg      |move if SF is not set             |
|cmovge     |move if SF is not set or ZF is set|