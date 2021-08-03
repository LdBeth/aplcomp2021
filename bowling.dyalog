ValidGame←{
    ⍝ check is vector
    ⍝ and if chars are valid
    ~∧/(1=⍴⍴⍵),⍵∊'X-/',1↓⎕D:0
    ⍝ expand strikes except
    ⍝ for last two rolls
    base←'0'@(=∘'-')(1+(≢⍵)↑¯2↓'X'=⍵)/⍵
    ⍝ check for frame numbers
    20>≢base:0
    testframe←{
        ⍝ test if strike/spare
        ⍝ is at valid position
        ('/'=2⌷⍵)∨'X'≡1⌷⍵:0
        ⍝ if not clear, the score
        ⍝ should be less than 10
        ⍝ it also handles invalid
        ⍝ position of '/X'
        10≤+/¯1+⎕D⍳⍵
    }
    ∨/testframe¨↓10 2⍴base:0
    bonus←(20-≢base)↑⍵
    (≢bonus)≠2⊥'X/'=¯1↑20↑base:0
    1=≢bonus:'/'≢bonus
    2=≢bonus:~testframe bonus
    1 ⍝ 0=≢bonus
}

BowlingScore←{
    ⎕IO←0
    ⍝ preprocess input
    in←'0'@(=∘'-')⍵
    stkscore←{
        '/'=1⌷⍵:20
        +/10,⎕D⍳⍵
    }
    +\⍬{
        (≢⍺)=10:⍺
        ⍝ strike
        'X'=0⌷⍵:(⍺,+/stkscore 1↓3↑⍵)∇ 1↓⍵
        ⍝ spare
        '/'=1⌷⍵:(⍺,+/10+⎕D⍳2⌷⍵)∇ 2↓⍵
        ⍝ else
        (⍺,+/⎕D⍳2↑⍵)∇ 2↓⍵
    }in
}
