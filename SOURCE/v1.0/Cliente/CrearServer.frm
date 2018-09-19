VERSION 5.00
Object = "{90F3D7B3-92E7-44BA-B444-6A8E2A3BC375}#1.0#0"; "Actskin4.ocx"
Object = "{3B732244-5157-4C60-8558-25D80C14CB88}#1.0#0"; "Boton2007.ocx"
Begin VB.Form Form5 
   Caption         =   "Form5"
   ClientHeight    =   2190
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   4680
   LinkTopic       =   "Form5"
   ScaleHeight     =   2190
   ScaleWidth      =   4680
   StartUpPosition =   3  'Windows Default
   Begin ACTIVESKINLibCtl.SkinLabel SkinLabel1 
      Height          =   255
      Left            =   120
      OleObjectBlob   =   "CrearServer.frx":0000
      TabIndex        =   5
      Top             =   120
      Width           =   615
   End
   Begin VB.OptionButton Option2 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "Invisible"
      ForeColor       =   &H80000008&
      Height          =   255
      Left            =   1320
      TabIndex        =   4
      Top             =   1080
      Width           =   975
   End
   Begin VB.OptionButton Option1 
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      Caption         =   "Visible"
      ForeColor       =   &H80000008&
      Height          =   255
      Left            =   120
      TabIndex        =   3
      Top             =   1080
      Width           =   975
   End
   Begin VB.TextBox Text2 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000004&
      Height          =   405
      Left            =   3000
      MaxLength       =   5
      TabIndex        =   2
      Top             =   480
      Width           =   975
   End
   Begin VB.TextBox Text1 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000004&
      Height          =   405
      Left            =   120
      MaxLength       =   5
      TabIndex        =   0
      Top             =   480
      Width           =   2655
   End
   Begin Boton2007.Boton Boton2 
      Height          =   435
      Left            =   120
      TabIndex        =   1
      Top             =   1560
      Width           =   900
      _ExtentX        =   2646
      _ExtentY        =   556
      Tipo_de_Boton   =   17
      Color_de_Letra  =   0
      Texto           =   "CREAR"
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
   Begin ACTIVESKINLibCtl.SkinLabel SkinLabel2 
      Height          =   375
      Left            =   3000
      OleObjectBlob   =   "CrearServer.frx":0066
      TabIndex        =   6
      Top             =   120
      Width           =   735
   End
End
Attribute VB_Name = "Form5"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_Load()
Form1.Skin.ApplySkin Me.hWnd
End Sub

