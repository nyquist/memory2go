'Originally from http://serverfault.com/questions/69632/subnet-calculator-for-ms-excel

Public Function IPSubnetCalc(intFn%, IPandMaskInput$)

' PROGRAM:
' IP Subnet Calculator by Marcus Mansfield
'
' CHANGES:
' Date: 2010-10-06
' Author: Rui Sousa (ruib.sousa@gmail)
' Change: Add funtion 6 to return number os hosts
'
' INPUTS:
' Input Expected xx.xx.xx.xx/yy
' Where xx = decimal IPv4 Octet
'       yy = BitMask Value ( 0 - 32 ex.31 )
'
'
' FUNCTIONS:
' 1 - Return Subnet Mask in dotted decimal
' 2 - Return Subnet Address in Dot. Dec.
' 3 - Return Broadcast Address in Dot. Dec.
' 4 - Return Lowest Client IP in Dot. Dec.
' 5 - Return Highest Client IP in Dot. Dec.
' 6 - Return Total Number of Host in the Network.
'


Dim IPAddress$, BitMask%
Dim IPOctet1%, IPOctet2%, IPOctet3%, IPOctet4%
Dim MaskOctet1%, MaskOctet2%, MaskOctet3%, MaskOctet4%
Dim Dot1%, Dot2%, Dot3%, Slash1%
Dim IPNetwork1BIN$, IPNetwork2BIN$, IPNetwork3BIN$, IPNetwork4BIN$


On Error Resume Next

Dot1 = InStr(1, IPandMaskInput, ".")
Dot2 = InStr(Dot1 + 1, IPandMaskInput, ".")
Dot3 = InStr(Dot2 + 1, IPandMaskInput, ".")
Slash1 = InStr(1, IPandMaskInput, "/")

'Check Basic Format
If Dot1 = 0 Or Dot2 = 0 Or Dot3 = 0 Or Slash1 = 0 Then
    IPSubnetCalc = "Incorrect Format"
    Exit Function
End If

'Split IP into 8bit Octets
IPOctet1 = Mid(IPandMaskInput, 1, Dot1 - 1)
IPOctet2 = Mid(IPandMaskInput, Dot1 + 1, Dot2 - Dot1 - 1)
IPOctet3 = Mid(IPandMaskInput, Dot2 + 1, Dot3 - Dot2 - 1)
IPOctet4 = Mid(IPandMaskInput, Dot3 + 1, Slash1 - Dot3 - 1)
BitMask = Right(IPandMaskInput, Len(IPandMaskInput) - Slash1)

If IPOctet1 > 255 Or IPOctet2 > 255 Or IPOctet3 > 255 Or IPOctet4 > 255 Then
    IPSubnetCalc = "Value Error, Octet > 255"
    Exit Function
End If
If IPOctet1 < 0 Or IPOctet2 < 0 Or IPOctet3 < 0 Or IPOctet4 < 0 Then
    IPSubnetCalc = "Value Error, Octet < 0"
    Exit Function
End If
If BitMask < 8 Or BitMask > 32 Or BitMask = 31 Then
    IPSubnetCalc = "Bitmask Error : Range 8 - 32, Excl. 31"
    Exit Function
End If

Select Case intFn
Case 1 'Subnet Mask Dot. Dec.
    BuildBIN = ""
    For iCounter = 1 To 32
        If iCounter <= BitMask Then
            BuildBIN = BuildBIN & "1"
        Else
            BuildBIN = BuildBIN & "0"
        End If
    Next
    MaskOctet1 = Application.WorksheetFunction.Bin2Dec(Mid(BuildBIN, 1, 8))
    MaskOctet2 = Application.WorksheetFunction.Bin2Dec(Mid(BuildBIN, 9, 8))
    MaskOctet3 = Application.WorksheetFunction.Bin2Dec(Mid(BuildBIN, 17, 8))
    MaskOctet4 = Application.WorksheetFunction.Bin2Dec(Mid(BuildBIN, 25, 8))
    IPSubnetCalc = MaskOctet1 & "." & MaskOctet2 & "." & MaskOctet3 & "." & MaskOctet4


Case 2 'Subnet Dot. Dec.
    BuildBIN = ""
    For iCounter = 1 To 32
        If iCounter <= BitMask Then
            BuildBIN = BuildBIN & "1"
        Else
            BuildBIN = BuildBIN & "0"
        End If
    Next
    MaskOctet1BIN = Mid(BuildBIN, 1, 8)
    MaskOctet2BIN = Mid(BuildBIN, 9, 8)
    MaskOctet3BIN = Mid(BuildBIN, 17, 8)
    MaskOctet4BIN = Mid(BuildBIN, 25, 8)

    IPOctet1BIN = Application.WorksheetFunction.Dec2Bin(IPOctet1, 8)
    IPOctet2BIN = Application.WorksheetFunction.Dec2Bin(IPOctet2, 8)
    IPOctet3BIN = Application.WorksheetFunction.Dec2Bin(IPOctet3, 8)
    IPOctet4BIN = Application.WorksheetFunction.Dec2Bin(IPOctet4, 8)

'AND Binary Expressions.

    IPNetwork1BIN = ""
    IPNetwork2BIN = ""
    IPNetwork3BIN = ""
    IPNetwork4BIN = ""

    For iCounter = 1 To 8

        If Mid(MaskOctet1BIN, iCounter, 1) And Mid(IPOctet1BIN, iCounter, 1) Then
            IPNetwork1BIN = IPNetwork1BIN & "1"
        Else
            IPNetwork1BIN = IPNetwork1BIN & "0"
        End If

        If Mid(MaskOctet2BIN, iCounter, 1) And Mid(IPOctet2BIN, iCounter, 1) Then
            IPNetwork2BIN = IPNetwork2BIN & "1"
        Else
            IPNetwork2BIN = IPNetwork2BIN & "0"
        End If

        If Mid(MaskOctet3BIN, iCounter, 1) And Mid(IPOctet3BIN, iCounter, 1) Then
            IPNetwork3BIN = IPNetwork3BIN & "1"
        Else
            IPNetwork3BIN = IPNetwork3BIN & "0"
        End If

        If Mid(MaskOctet4BIN, iCounter, 1) And Mid(IPOctet4BIN, iCounter, 1) Then
            IPNetwork4BIN = IPNetwork4BIN & "1"
        Else
            IPNetwork4BIN = IPNetwork4BIN & "0"
        End If

    Next

    MaskOctet1 = Application.WorksheetFunction.Bin2Dec(IPNetwork1BIN)
    MaskOctet2 = Application.WorksheetFunction.Bin2Dec(IPNetwork2BIN)
    MaskOctet3 = Application.WorksheetFunction.Bin2Dec(IPNetwork3BIN)
    MaskOctet4 = Application.WorksheetFunction.Bin2Dec(IPNetwork4BIN)

    IPSubnetCalc = MaskOctet1 & "." & MaskOctet2 & "." & MaskOctet3 & "." & MaskOctet4


Case 3 'Broadcast Dot. Dec.
    BuildBIN = ""
    For iCounter = 1 To 32
        If iCounter <= BitMask Then
            BuildBIN = BuildBIN & "1"
        Else
            BuildBIN = BuildBIN & "0"
        End If
    Next
    MaskOctet1BIN = Mid(BuildBIN, 1, 8)
    MaskOctet2BIN = Mid(BuildBIN, 9, 8)
    MaskOctet3BIN = Mid(BuildBIN, 17, 8)
    MaskOctet4BIN = Mid(BuildBIN, 25, 8)

    IPOctet1BIN = Application.WorksheetFunction.Dec2Bin(IPOctet1, 8)
    IPOctet2BIN = Application.WorksheetFunction.Dec2Bin(IPOctet2, 8)
    IPOctet3BIN = Application.WorksheetFunction.Dec2Bin(IPOctet3, 8)
    IPOctet4BIN = Application.WorksheetFunction.Dec2Bin(IPOctet4, 8)

'Create Full IP as Binary

    IPFullBIN = IPOctet1BIN & IPOctet2BIN & IPOctet3BIN & IPOctet4BIN

    BuildBIN = ""

    For iCounter = 1 To 32
        If iCounter <= BitMask Then
            BuildBIN = BuildBIN & Mid(IPFullBIN, iCounter, 1)
        Else
            BuildBIN = BuildBIN & "1"
        End If
    Next


    MaskOctet1 = Application.WorksheetFunction.Bin2Dec(Mid(BuildBIN, 1, 8))
    MaskOctet2 = Application.WorksheetFunction.Bin2Dec(Mid(BuildBIN, 9, 8))
    MaskOctet3 = Application.WorksheetFunction.Bin2Dec(Mid(BuildBIN, 17, 8))
    MaskOctet4 = Application.WorksheetFunction.Bin2Dec(Mid(BuildBIN, 25, 8))

    IPSubnetCalc = MaskOctet1 & "." & MaskOctet2 & "." & MaskOctet3 & "." & MaskOctet4


Case 4 'Low IP Dot Dec

    BuildBIN = ""
    For iCounter = 1 To 32
        If iCounter <= BitMask Then
            BuildBIN = BuildBIN & "1"
        Else
            BuildBIN = BuildBIN & "0"
        End If
    Next
    MaskOctet1BIN = Mid(BuildBIN, 1, 8)
    MaskOctet2BIN = Mid(BuildBIN, 9, 8)
    MaskOctet3BIN = Mid(BuildBIN, 17, 8)
    MaskOctet4BIN = Mid(BuildBIN, 25, 8)

    IPOctet1BIN = Application.WorksheetFunction.Dec2Bin(IPOctet1, 8)
    IPOctet2BIN = Application.WorksheetFunction.Dec2Bin(IPOctet2, 8)
    IPOctet3BIN = Application.WorksheetFunction.Dec2Bin(IPOctet3, 8)
    IPOctet4BIN = Application.WorksheetFunction.Dec2Bin(IPOctet4, 8)

'AND Binary Expressions.

    IPNetwork1BIN = ""
    IPNetwork2BIN = ""
    IPNetwork3BIN = ""
    IPNetwork4BIN = ""

    For iCounter = 1 To 8

        If Mid(MaskOctet1BIN, iCounter, 1) And Mid(IPOctet1BIN, iCounter, 1) Then
            IPNetwork1BIN = IPNetwork1BIN & "1"
        Else
            IPNetwork1BIN = IPNetwork1BIN & "0"
        End If

        If Mid(MaskOctet2BIN, iCounter, 1) And Mid(IPOctet2BIN, iCounter, 1) Then
            IPNetwork2BIN = IPNetwork2BIN & "1"
        Else
            IPNetwork2BIN = IPNetwork2BIN & "0"
        End If

        If Mid(MaskOctet3BIN, iCounter, 1) And Mid(IPOctet3BIN, iCounter, 1) Then
            IPNetwork3BIN = IPNetwork3BIN & "1"
        Else
            IPNetwork3BIN = IPNetwork3BIN & "0"
        End If

        If Mid(MaskOctet4BIN, iCounter, 1) And Mid(IPOctet4BIN, iCounter, 1) Then
            IPNetwork4BIN = IPNetwork4BIN & "1"
        Else
            If iCounter = 8 Then
                IPNetwork4BIN = IPNetwork4BIN & "1"
            Else
                IPNetwork4BIN = IPNetwork4BIN & "0"
            End If
        End If

    Next

    MaskOctet1 = Application.WorksheetFunction.Bin2Dec(IPNetwork1BIN)
    MaskOctet2 = Application.WorksheetFunction.Bin2Dec(IPNetwork2BIN)
    MaskOctet3 = Application.WorksheetFunction.Bin2Dec(IPNetwork3BIN)
    MaskOctet4 = Application.WorksheetFunction.Bin2Dec(IPNetwork4BIN)

    IPSubnetCalc = MaskOctet1 & "." & MaskOctet2 & "." & MaskOctet3 & "." & MaskOctet4



Case 5 'High IP Dot Dec
    BuildBIN = ""
    For iCounter = 1 To 32
        If iCounter <= BitMask Then
            BuildBIN = BuildBIN & "1"
        Else
            BuildBIN = BuildBIN & "0"
        End If
    Next
    MaskOctet1BIN = Mid(BuildBIN, 1, 8)
    MaskOctet2BIN = Mid(BuildBIN, 9, 8)
    MaskOctet3BIN = Mid(BuildBIN, 17, 8)
    MaskOctet4BIN = Mid(BuildBIN, 25, 8)

    IPOctet1BIN = Application.WorksheetFunction.Dec2Bin(IPOctet1, 8)
    IPOctet2BIN = Application.WorksheetFunction.Dec2Bin(IPOctet2, 8)
    IPOctet3BIN = Application.WorksheetFunction.Dec2Bin(IPOctet3, 8)
    IPOctet4BIN = Application.WorksheetFunction.Dec2Bin(IPOctet4, 8)

'Create Full IP as Binary

    IPFullBIN = IPOctet1BIN & IPOctet2BIN & IPOctet3BIN & IPOctet4BIN

    BuildBIN = ""

    For iCounter = 1 To 32
        If iCounter <= BitMask Then
            BuildBIN = BuildBIN & Mid(IPFullBIN, iCounter, 1)
        Else
            If iCounter = 32 Then
                BuildBIN = BuildBIN & "0"
            Else
                BuildBIN = BuildBIN & "1"
            End If
        End If
    Next


    MaskOctet1 = Application.WorksheetFunction.Bin2Dec(Mid(BuildBIN, 1, 8))
    MaskOctet2 = Application.WorksheetFunction.Bin2Dec(Mid(BuildBIN, 9, 8))
    MaskOctet3 = Application.WorksheetFunction.Bin2Dec(Mid(BuildBIN, 17, 8))
    MaskOctet4 = Application.WorksheetFunction.Bin2Dec(Mid(BuildBIN, 25, 8))

    IPSubnetCalc = MaskOctet1 & "." & MaskOctet2 & "." & MaskOctet3 & "." & MaskOctet4


Case 6 'Number of Hosts/Net

    iZeroCounter = 0
    For iCounter = 1 To 32
        If iCounter > BitMask Then
            iZeroCounter = iZeroCounter + 1
        End If
    Next

    IPSubnetCalc = (2 ^ iZeroCounter) - 2



Case Else 'Incorrect Selection
    IPSubnetCalc = "Incorrect Function"
End Select

End Function
