VERSION 5.00
Object = "{DA729E34-689F-49EA-A856-B57046630B73}#1.0#0"; "Progressbar-xp.ocx"
Begin VB.Form frmSplash 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   9600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   12000
   LinkTopic       =   "Form2"
   ScaleHeight     =   9600
   ScaleWidth      =   12000
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.PictureBox Picture1 
      AutoSize        =   -1  'True
      BorderStyle     =   0  'None
      Height          =   9000
      Left            =   0
      ScaleHeight     =   9000
      ScaleWidth      =   12000
      TabIndex        =   0
      Top             =   0
      Width           =   12000
      Begin VB.Timer Timer1 
         Interval        =   100
         Left            =   5880
         Top             =   1680
      End
      Begin Proyecto2.XP_ProgressBar ProgressBar 
         Height          =   255
         Left            =   120
         TabIndex        =   1
         Top             =   8520
         Width           =   2775
         _ExtentX        =   4895
         _ExtentY        =   450
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         BrushStyle      =   0
         Color           =   16776960
         Min             =   1
         Scrolling       =   6
         Value           =   9
      End
      Begin VB.Label Label1 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Crazy Horse [MU] v1.0"
         BeginProperty Font 
            Name            =   "Times New Roman"
            Size            =   12
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00C0C0C0&
         Height          =   285
         Left            =   120
         TabIndex        =   2
         Top             =   8160
         Width           =   2355
      End
   End
End
Attribute VB_Name = "frmSplash"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False


'###################################################################################################################################################################################
Dim Iniciado2 As String
Dim Tiempo As Integer

Private Sub Form_Load()

Call Funciones.CargarImagen

Iniciado2 = GetSetting("CrazyHorse[MU] v1.0", "HKLM", "Iniciado")

    If Not Iniciado = "1" Then
        SaveSetting "CrazyHorse[MU] v1.0", "HKLM", "Iniciado", "1"
    End If
ProgressBar.Value = 1
Tiempo = 1
End Sub


Private Sub Picture1_Click()

Unload frmSplash
Form1.Show

End Sub

Private Sub Timer1_Timer()

Tiempo = Val(Tiempo) + 1
ProgressBar.Value = Val(ProgressBar.Value) + 1

Select Case Tiempo
    Case Is = 10
        Label1.Caption = "Loading Libraries..."
    Case Is = 20
        Label1.Caption = "Loading the Graphical Interface..."
    Case Is = 25
        Label1.Caption = "Starting Protocols..."
    Case Is = 30
        Label1.Caption = "--By Democres--"
            Timer1.Interval = 150
    Case Is = 35
        Label1.Caption = "--Democres@hotmail.es--"
    Case Is = 45
        Unload frmSplash
        Form1.Show
End Select

End Sub
