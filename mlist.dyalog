 MakeList←{
     exec←{
         0=≢⍵:⍬
         ⍝ simple case
         ∧/(1↓⍵)∊⎕D:⍎⍵
         ⍝ else parse the interval
         a b←⍎¨(1,2≤/'-'≠⍵)⊆⍵
         ⍝ iotag
         a+0,+\(|⍴×)b-a
     }
     ∊exec¨(','∘≠⊆,)⍵
 }