MinMax←{
    1≥≢⍵:⍬
    ⍝ a pair of vectors that
    ⍝ indicates the location of
    ⍝ increase and decrease
    in←⍸¨↓1 ¯1∘.=2(×-)/,⍵
    ⍝ if any is ⍬
    ∨/0=≢¨in:⍬
    idx←{2÷⍨1+⍺+⍵}⍥⊃
    ⍬ {
        ⍝ let a has smaller ⊃a
        a b←(⌽⍣(>/⊃¨⍵))⍵
        ⍝ terminate case
        1=≢a:⍺,a idx b
        (2⌷a)>⊃b:(⍺,a idx b)∇(1↓a) b
        ⍺∇(1↓a) b
    } in
}
