lexf←{
    ⎕IO←0
    ⍝ empty case
    0=≢⍵:⍬
    ⍝ generate n-ary encoded indices
    ↓(,⍵)[⍉⍺(⍴⊤⍳⍤*⍨)≢⍵]
}

lexv←{l[(' ',⍵)⍋↑l←⊃,/(⍳⍺)lexf¨⊂⍵]}