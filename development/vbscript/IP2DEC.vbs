'' Originally from: http://stuart.weenig.com/2011/05/i-mentioned-in-my-previous-post-that-i.html



Public Function IP2DEC(ipaddress As String)
'find the location of the first dot
Dim firstdot As Integer, seconddot As Integer, thirddot As Integer
firstdot = InStr(ipaddress, ".")
seconddot = InStr(firstdot + 1, ipaddress, ".")
thirddot = InStr(seconddot + 1, ipaddress, ".")
'get the strings of each octet
Dim firstoct, secondoct, thirdoct, fourthoct As String
firstoct = Left(ipaddress, firstdot - 1)
secondoct = Mid(ipaddress, firstdot + 1, seconddot - firstdot - 1)
thirdoct = Mid(ipaddress, seconddot + 1, thirddot - seconddot - 1)
fourthoct = Right(ipaddress, Len(ipaddress) - thirddot)
'convert the strings to numbers
Dim dfirstoct, dsecondoct, dthirdoct, dfourthoct As Integer
dfirstoct = Val(firstoct)
dsecondoct = Val(secondoct)
dthirdoct = Val(thirdoct)
dfourthoct = Val(fourthoct)
'calculate & return the result
IP2DEC = (dfirstoct * 2 ^ 24) + (dsecondoct * 2 ^ 16) + (dthirdoct * 2 ^ 8) + dfourthoct
End Function
