⍝ check shape
checkhv←{∨/,⍵(⍷∨⍷∘⍉)⍨⍺⍴1}
checkdg←{∨/,⍵(⍷∨⍷∘⌽)⍨(,⍨⍴1,⍴∘0)⍺}

ValidBoard←{
    ⍝ test shape
    ⍺⍺≢⍴⍵:0
    i←⍳≢⍵⍵
    ⍝ test ship number and size
    ~∧/(z∊0,i),⍵⍵=+/i∘.=z←,⍵:0
    ∧/⍵⍵ checkhv¨i=¨⊂⍵
}

ValidBoard2←{
    ⍺⍺≢⍴⍵:0
    i←⍳≢⍵⍵
    ~∧/(z∊0,i),⍵⍵=+/i∘.=z←,⍵:0
    ⍝ filter out those need diagonal test
    d←(m←~⍵⍵ checkhv¨s)/s←i=¨⊂⍵
    0=≢d:1
    f←m/⍵⍵
    ⍝ diagonal test and conflict test
    ∧/(2>∊+/({2=+/,⍵}⌺2 2)¨d),f checkdg¨d
}