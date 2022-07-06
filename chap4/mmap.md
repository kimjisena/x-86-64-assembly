## Memory Mapping in 64-bit mode

|bits| 63 - 48 | 47 - 39 | 38 - 30 | 29 - 21 | 20 - 12 | 11 - 0 |
|----|---------|---------|---------|---------|---------|--------|
| use|unused|PML4 index|PDTP index|PD index|PT index|page offset|

- PML4 - page map level 4
- PDTP - page directory table pointer
- PD - page directory
- PT - page table