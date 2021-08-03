Divvy←{
    ⍝ decompose ≢⍵ to (×/a)+×/b
    a←(s-⍺×d-1),d←⌈⍺÷⍨s←≢⍵
    b←(s-⍨⍺×d),|d-1
    (a⍴⍵)(,⍥↓)b⍴(×/a)↓,⍵
}