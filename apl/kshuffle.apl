∇S ← SHUFFLE1 V
S ← V[(⍴ V) ? ⍴ V]
∇

∇S ← SHUFFLE2 V;I;J
I ← ⍴ V
→ (3,7)[1 + I ≤ 1]
J ← ? I
V[I,J] ← V[J,I]
I ← I - 1
→ 2
S ← V
∇

∇RUN1;I
I ← 60000
SHUFFLE1 1 2 3
I ← I - 1
→ 2 × I > 0
∇

∇RUN2;I
I ← 60000
SHUFFLE2 1 2 3
I ← I - 1
→ 2 × I > 0
∇
