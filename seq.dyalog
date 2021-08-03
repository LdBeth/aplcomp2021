scanl←{c←⊃⍵ ⋄ (1↑⍵),⍺⍺{c⊢←c ⍺⍺ ⍵}¨1↓⍵}

sseq←{
    0=≢⍵:1 ⍬
    ⍝ generate the permutation
    m←(0~⍨⊢)¨↓(⍳≢⍺)(×⍤1)⍵∘.=⍺
    ⍝ find the increasing permutation
    r←{⍵/⍨⍵>⊃⍺}scanl m
    0∊≢¨r:0 ⍬
    1(⊃¨r)
}

∇r←s lcsq t;m;c;i;j;⎕IO
 r←''
 ⍝ compare
 c←((-1+⍴)↑⊢)s∘.=t
 ⍝ compute the length matrix
 m←↑({⍺⌈⌈\⍵×1+0,¯1↓⍺}scanl)↓c
 i j←¯1+⍴m
 c←~c
 ⎕IO←0
 ⍝ now walk the matrix
 ⍝ end if reaching first column/row
loop:→(∨/0=i j)/0
 ⍝ if s[i] = t[j]
 →c[i;j]/cmp
 r←s[i-1],r
 i j-←1
 →loop
 ⍝ go to the larger direction
cmp:
 i j+←(⌽⍣(m[i-1;j]>m[i;j-1]))0 ¯1
 →loop
∇
