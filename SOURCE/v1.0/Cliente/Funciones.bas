Attribute VB_Name = "Funciones"
Const CAPTION_FORM1 = "Crazy Horse [MU] v1.0"
Dim Valor1 As Boolean 'Winsock_start_state
Dim Imagen() As Byte 'Variable de la funcion CargarImagen()
Dim Skinsillo() As Byte
Dim Identificador() As String


Public Sub Winsock_Start_State()

    
    If Not Form1.WS(0).State = 2 Or Form1.WS(0).State = 7 Then
    
            Form1.Caption = CAPTION_FORM1 & " Error (0x001)"
            Form1.Text1.Text = "A Ocurrido un error en la Apertura del Puerto Error (0x001)"
            MsgBox "A Ocurrido un error en la Apertura del Puerto Error (0x001)", vbCritical, "Error"
        Else
            Form1.Caption = CAPTION_FORM1 & " Escuchando Correctamente"
            Form1.Text1.Text = "Escuchando Correctamente"
    End If

End Sub

Public Sub Winsock_Listen()
        
    Form1.WS(0).Bind Form1.PuertoActivo
    Form1.WS(0).Listen
    Form1.Text1.Text = "Escuchando Correctamente en el Puerto " & Form1.WS(0).LocalPort
    MsgBox "Escuchando Correctamente en el Puerto" & " " & Form1.WS(0).LocalPort, vbInformation, "Escuchar"
    Form1.Caption = CAPTION_FORM1 & " Escuchando Correctamente"
    

End Sub


Public Sub Winsock_Stop()

        Form1.WS(0).Close
        MsgBox "Puerto Detenido Correctamente", vbInformation, "Detener"
        Form1.Text1.Text = "Puerto Detenido Correctamente"
            Form1.Caption = CAPTION_FORM1
    
End Sub



Public Sub Comando(Llave As String, Datico As String)

Identificador = Split(Form1.LV.ListItems(Val(Llave)).Key, "#")
Form1.WS(Identificador(0)).SendData Datico

End Sub

Public Sub CargarImagen()

Imagen() = LoadResData(101, "SPLASH")
    
    Open Environ("TEMP") & "\Img.CHz" For Binary As #1
        Put #1, , Imagen()
    Close #1
    
        frmSplash.Picture1.Picture = LoadPicture(Environ("TEMP") & "\Img.CHz")
        frmSplash.Width = frmSplash.Picture1.Width
        frmSplash.Height = frmSplash.Picture1.Height
        
Kill Environ("TEMP") & "\Img.CHz"

End Sub

Public Sub CargarSkin()

Skinsillo() = LoadResData(102, "SKIN")

    Open Environ("TEMP") & "\Skn.CHz" For Binary As #1
        Put #1, , Skinsillo()
    Close #1
        
        Form1.Skin.LoadSkin (Environ("TEMP") & "\Skn.CHz")
        Form1.Skin.ApplySkin Form1.hWnd
    Kill Environ("TEMP") & "\Skn.CHz"
        
End Sub

Public Sub LeerPuertoDeINI()

With Form1.INI
    .Archivo = App.Path & "\Settings.CHz"
    .Seccion = "CONEXIONES"
    .Llave = "PUERTO"
    Form1.PuertoActivo = .LeeIni
End With

End Sub

Public Sub Testear_Puerto()

Form1.WS(0).Listen

    If Not Form1.WS(0).State = 2 Then
        MsgBox "A Ocurrido un Error Poniendo en Escucha el Puerto Seleccionado Error (0x002)", vbCritical, "Error"
        Exit Sub
    Else
    
        If Form1.WS(0).State <> o Or Form1.WS(0).State = 2 Then
        
            Form1.WS(0).Close
            Form1.WS(0).LocalPort = Form1.PuertoActivo
            MsgBox "Conexion Exitosa", vbInformation, "Testear"
            
        End If
            
    End If

End Sub
