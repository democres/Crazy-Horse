VERSION 5.00
Begin VB.Form FrmChat 
   BackColor       =   &H80000007&
   BorderStyle     =   0  'None
   Caption         =   "Chat"
   ClientHeight    =   6645
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   9525
   BeginProperty Font 
      Name            =   "Palatino Linotype"
      Size            =   9.75
      Charset         =   0
      Weight          =   700
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   LinkTopic       =   "Form1"
   Moveable        =   0   'False
   ScaleHeight     =   6645
   ScaleWidth      =   9525
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton Command2 
      Appearance      =   0  'Flat
      BackColor       =   &H000080FF&
      Caption         =   "Enviar"
      Height          =   375
      Left            =   8400
      MaskColor       =   &H00808080&
      Style           =   1  'Graphical
      TabIndex        =   2
      Top             =   6120
      Width           =   975
   End
   Begin VB.TextBox Text2 
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      ForeColor       =   &H00000000&
      Height          =   390
      Left            =   120
      TabIndex        =   1
      Text            =   "Escribe Aqui y Presiona Enter Para Enviar Tu Mensaje...!!"
      Top             =   6120
      Width           =   8175
   End
   Begin VB.TextBox Text1 
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      ForeColor       =   &H00000000&
      Height          =   5895
      Left            =   120
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   0
      Top             =   120
      Width           =   9255
   End
End
Attribute VB_Name = "FrmChat"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Dim B As String

Private Sub Command2_Click()

If CASITA1.SM.State = sckConnected Then
    B = "CHAT" & "#" & "TALK" & Text2.Text
    CASITA1.SM.SendData B
    Text1.Text = Text1.Text & vbCrLf & "Servidor Dice: " & Text2.Text
    Text2.Text = ""
Else
    CASITA1.SM.Connect CASITA1.Text1.Text, CASITA1.Text2.Text
End If

End Sub

Private Sub Form_Load()

B = "CHATEXITOSO" & "#"
CASITA1.SM.SendData B
FrmChat.Text1.Text = FrmChat.Text1 & "Servidor a Iniciado Sesión..."

End Sub


Private Sub Form_Unload(Cancel As Integer)

B = "CHATDESCONECTADO" & "#"
CASITA1.SM.SendData B

End Sub

Private Sub Text2_Click()

If Text2.Text = "Escribe Aqui y Presiona Enter Para Enviar Tu Mensaje...!!" Then
    Text2.Text = ""
End If

End Sub

Private Sub Text2_KeyPress(KeyAscii As Integer)


If KeyAscii = 13 Then
Call Command2_Click
End If

End Sub

