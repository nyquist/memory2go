'' Originally from http://stuart.weenig.com/2011/05/i-mentioned-in-my-previous-post-that-i.html


Public Function DEC2IP(ByVal LongIP As Double) As String
'
'This function returns an IP address from a long (integer) IP address
'
Dim i As Integer, num As Double
For i = 1 To 4
num = Int(LongIP / 256 ^ (4 - i))
LongIP = LongIP - (num * 256 ^ (4 - i))
If i = 1 Then 'if that's all return the result
DEC2IP = num
Else 'if that's not all add the current octet to the result and continue
DEC2IP = DEC2IP & "." & num
End If
Next
End Function
