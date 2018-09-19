VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "ComDlg32.OCX"
Begin VB.Form Form4 
   Caption         =   "Upload"
   ClientHeight    =   870
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   5175
   LinkTopic       =   "Form4"
   ScaleHeight     =   870
   ScaleWidth      =   5175
   StartUpPosition =   3  'Windows Default
   Begin VB.CheckBox Chk 
      Appearance      =   0  'Flat
      Caption         =   "Ejecutar"
      BeginProperty Font 
         Name            =   "Comic Sans MS"
         Size            =   9
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Left            =   120
      TabIndex        =   2
      Top             =   600
      Width           =   1215
   End
   Begin VB.CommandButton Command1 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      BeginProperty Font 
         Name            =   "Arial Black"
         Size            =   11.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   4200
      MaskColor       =   &H0000C000&
      Style           =   1  'Graphical
      TabIndex        =   1
      Top             =   120
      UseMaskColor    =   -1  'True
      Width           =   855
   End
   Begin VB.TextBox Text2 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   11.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000004&
      Height          =   405
      Left            =   120
      TabIndex        =   0
      Text            =   "Doble Click..."
      Top             =   120
      Width           =   3975
   End
   Begin MSComDlg.CommonDialog CD 
      Left            =   3480
      Top             =   240
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
End
Attribute VB_Name = "Form4"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Dim Archiviño() As Byte
Dim Identificador() As String
Dim NArchi As String
Dim Zixe As Long


Public Sub MANDANDOSELO()

Open CD.FileName For Binary As #1
Zixe = LOF(1)
ReDim Archiviño(Zixe - 1)
Identificador = Split(Form1.LV.ListItems(Val(Form1.A)).Key, "#")
While Not EOF(1)
    Get #1, , Archiviño
    Form1.WS(Identificador(0)).SendData Archiviño
Wend
DoEvents

Close #1


End Sub

Private Sub Command1_Click()

Dim ruta, Mensaje As String
On Error Resume Next

NArchi = Right(Text2.Text, Len(Text2.Text) - InStrRev(Text2.Text, "\"))
ruta = Form3.Combo1.Text & "\" & Form3.LVA.SelectedItem.Text
If ruta = "" Then
ruta = "ALTERNATIVA"
End If
'               0                       1                          2            3           4
Mensaje = "ARCHIISCOMING" & "#" & FileLen(CD.FileName) & "#" & NArchi & "#" & ruta & "#" & Chk.Value

Call Funciones.Comando(Form1.A, Mensaje)

End Sub


Private Sub Form_Load()
Form1.Skin.ApplySkin Me.hWnd
End Sub



Private Sub Form_Unload(Cancel As Integer)
Unload Me
End Sub

Private Sub Text2_DblClick()
Command1.BackColor = vbBlack
Command1.Caption = ""
With CD
       .DialogTitle = "Seleccione el Archivo a Subir"
       .Filter = "Todos Los Archivos|*.*"
       .ShowOpen
End With

If Not CD.FileName = vbNullString Then
Text2.Text = CD.FileName
MsgBox "A Seleccionado Correctamente Su Archivo", vbInformation, "Upload"
MsgBox FileLen(CD.FileName) & " Bytes Seran Transferidos", vbInformation, "Upload"
End If

End Sub
