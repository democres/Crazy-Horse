Attribute VB_Name = "Comunicacion"
Dim SM As CSocketMaster

Public Sub EnviarMensajeCHAT()

Set SM = New CSocketMaster

    B = "CHAT" & "¬¬" & "TALK" & FrmChat.Text2.Text
    SM.SendData B
    CASITA1.Timer3.Enabled = False
            
End Sub
