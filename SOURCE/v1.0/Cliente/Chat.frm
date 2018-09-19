VERSION 5.00
Object = "{3B732244-5157-4C60-8558-25D80C14CB88}#1.0#0"; "Boton2007.ocx"
Begin VB.Form FrmChat 
   BackColor       =   &H80000007&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Chat"
   ClientHeight    =   7395
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   10695
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
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   7395
   ScaleWidth      =   10695
   StartUpPosition =   2  'CenterScreen
   Begin VB.Frame Frame1 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      Caption         =   "Funciones"
      ForeColor       =   &H80000004&
      Height          =   615
      Left            =   3600
      TabIndex        =   2
      Top             =   6120
      Width           =   2535
      Begin VB.OptionButton Option2 
         BackColor       =   &H80000007&
         Caption         =   "Reiniciar"
         ForeColor       =   &H00FFFFFF&
         Height          =   270
         Left            =   1200
         TabIndex        =   4
         Top             =   240
         Width           =   1215
      End
      Begin VB.OptionButton Option1 
         BackColor       =   &H80000007&
         Caption         =   "Cerrar"
         ForeColor       =   &H00FFFFFF&
         Height          =   270
         Left            =   120
         TabIndex        =   3
         Top             =   240
         Width           =   1215
      End
   End
   Begin VB.TextBox Text2 
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      ForeColor       =   &H00000000&
      Height          =   390
      Left            =   120
      TabIndex        =   1
      Text            =   "Escribe Aqui y Presiona Enter Para Enviar Tu Mensaje...!!"
      Top             =   6840
      Width           =   9495
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
      Width           =   10455
   End
   Begin Boton2007.Boton Command1 
      Height          =   435
      Left            =   9720
      TabIndex        =   5
      Top             =   6810
      Width           =   900
      _ExtentX        =   2646
      _ExtentY        =   556
      Tipo_de_Boton   =   17
      Color_de_Letra  =   0
      Texto           =   "Enviar"
      BeginProperty Tipo_de_Letra {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Times New Roman"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Titulo_ToolTipText=   "Listen"
      Icono_Tooltiptext=   0
      Tipo_de_ToolTipText=   1
      Color_Letra_Tooltip=   0
   End
   Begin Boton2007.Boton Command2 
      Height          =   435
      Left            =   6240
      TabIndex        =   6
      Top             =   6270
      Width           =   900
      _ExtentX        =   2646
      _ExtentY        =   556
      Tipo_de_Boton   =   17
      Color_de_Letra  =   0
      Texto           =   "Enviar"
      BeginProperty Tipo_de_Letra {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Times New Roman"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Titulo_ToolTipText=   "Listen"
      Icono_Tooltiptext=   0
      Tipo_de_ToolTipText=   1
      Color_Letra_Tooltip=   0
   End
End
Attribute VB_Name = "FrmChat"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Command1_Click()

    Form1.B = "CHAT" & "#" & "TALK" & Text2.Text
    Call Funciones.Comando(Val(Form1.A) - 1, Form1.B)
    Text1.Text = Text1.Text & vbCrLf & Form1.InputNickName & " Dice: " & Text2.Text
    Text2.Text = ""
            
End Sub

Private Sub Command2_Click()

If Option1.Value = True Then
    Form1.B = "CHATCLOSE"
    Call Funciones.Comando(Form1.A, Form1.B)
End If

If Option2.Value = True Then
    Form1.B = "CHATRESET"
    Call Funciones.Comando(Form1.A, Form1.B)
End If

End Sub


Private Sub Form_Load()

Form1.Skin.ApplySkin Me.hWnd
    
End Sub


Private Sub Text2_Click()

If Text2.Text = "Escribe Aqui y Presiona Enter Para Enviar Tu Mensaje...!!" Then
    Text2.Text = ""
End If

End Sub

Private Sub Text2_KeyPress(KeyAscii As Integer)

If KeyAscii = 13 Then

Call Command1_Click

End If

End Sub
