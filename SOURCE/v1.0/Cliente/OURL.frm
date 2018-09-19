VERSION 5.00
Begin VB.Form OURL 
   Caption         =   "Abrir Web"
   ClientHeight    =   2040
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   3615
   BeginProperty Font 
      Name            =   "Palatino Linotype"
      Size            =   9.75
      Charset         =   0
      Weight          =   700
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   LinkTopic       =   "Form2"
   ScaleHeight     =   2040
   ScaleWidth      =   3615
   StartUpPosition =   3  'Windows Default
   Begin VB.OptionButton Option2 
      Caption         =   "Invisible"
      Height          =   435
      Left            =   1875
      TabIndex        =   2
      Top             =   525
      Width           =   1110
   End
   Begin VB.OptionButton Option1 
      Caption         =   "Visible"
      Height          =   450
      Left            =   705
      TabIndex        =   1
      Top             =   510
      Value           =   -1  'True
      Width           =   945
   End
   Begin VB.TextBox Text1 
      Alignment       =   2  'Center
      BeginProperty Font 
         Name            =   "Palatino Linotype"
         Size            =   9
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   360
      Left            =   105
      TabIndex        =   0
      Text            =   "Escriba Aqui la URL"
      Top             =   120
      Width           =   3405
   End
End
Attribute VB_Name = "OURL"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
