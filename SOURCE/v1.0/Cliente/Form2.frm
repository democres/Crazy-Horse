VERSION 5.00
Object = "{90F3D7B3-92E7-44BA-B444-6A8E2A3BC375}#1.0#0"; "Actskin4.ocx"
Object = "{3B732244-5157-4C60-8558-25D80C14CB88}#1.0#0"; "Boton2007.ocx"
Begin VB.Form Form2 
   Caption         =   "Listen"
   ClientHeight    =   1110
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   3375
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   ScaleHeight     =   1110
   ScaleWidth      =   3375
   StartUpPosition =   3  'Windows Default
   Begin Boton2007.Boton Boton1 
      Height          =   435
      Left            =   1800
      TabIndex        =   2
      Top             =   600
      Width           =   900
      _ExtentX        =   2646
      _ExtentY        =   556
      Tipo_de_Boton   =   17
      Color_de_Letra  =   0
      Texto           =   "Escuchar"
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
      Height          =   285
      Left            =   2400
      MaxLength       =   5
      TabIndex        =   0
      Top             =   120
      Width           =   855
   End
   Begin ACTIVESKINLibCtl.SkinLabel SkinLabel1 
      Height          =   255
      Left            =   120
      OleObjectBlob   =   "Form2.frx":0000
      TabIndex        =   1
      Top             =   120
      Width           =   2295
   End
   Begin Boton2007.Boton Boton2 
      Height          =   435
      Left            =   600
      TabIndex        =   3
      Top             =   600
      Width           =   900
      _ExtentX        =   2646
      _ExtentY        =   556
      Tipo_de_Boton   =   17
      Color_de_Letra  =   0
      Texto           =   "Testear"
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
Attribute VB_Name = "Form2"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim Distinto As Boolean 'Variable que determina si el Puerto que se escribio es distinto al que esta en el INI
Dim Z As Byte 'Variable que almacena el resultado de el MsgboxYesno
Private Sub Boton1_Click()

If Not IsNumeric(Text1.Text) Then
MsgBox "No a Escrito un Puerto Valido", vbCritical, "Error 0x0008"
Exit Sub
End If

    With Form1.INI
        .Archivo = App.Path & "\Settings.CHz"
        .Seccion = "CONEXIONES"
        .Llave = "PUERTO"
        Form1.PuertoActivo = .LeeIni
            If Not Text1.Text = Form1.PuertoActivo Then
                Z = MsgBox("Al Cambiar el Puerto Activo Las Conexiones Activas No Seran Visibles" & vbCrLf & "¿Desea Continuar?", vbYesNo, "Escuchar")
                    If Z = 6 Then
                    Form1.PuertoActivo = Text1.Text
                        Form1.WS(0).LocalPort = Form1.PuertoActivo
                            Call Funciones.Winsock_Listen
                            With Form1.INI
                                .Archivo = App.Path & "\Settings.CHz"
                                .Seccion = "CONEXIONES"
                                .Llave = "PUERTO"
                                .Valor = Form1.PuertoActivo
                                .GrabaIni
                            End With
                    End If
            Else
                Exit Sub
            End If
     End With
    

End Sub

Private Sub Boton2_Click()

Call Funciones.Testear_Puerto

End Sub

Private Sub Form_Load()

Form1.Skin.ApplySkin Me.hWnd

End Sub

Private Sub Form_Unload(Cancel As Integer)

Form1.Enabled = True

End Sub

