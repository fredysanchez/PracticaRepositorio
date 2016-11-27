Public Class Form1

    Dim IMAGEN As String

    'Metodo que selecciona una imagen y la carga en un PictureBox'
    Sub cargarImagen()
        Try
            Me.OpenFileDialog1.ShowDialog()
            If Me.OpenFileDialog1.FileName <> "" Then

                IMAGEN = OpenFileDialog1.FileName
                Dim largo As Integer = IMAGEN.Length
                Dim imagen2 As String
                imagen2 = CStr(Microsoft.VisualBasic.Mid(RTrim(IMAGEN), largo - 2, largo))
                If imagen2 <> "gif" And imagen2 <> "bmp" And imagen2 <> "jpg" And imagen2 <> "jpeg" And imagen2 <> "GIF" And imagen2 <> "BMP" And imagen2 <> "JPG" And imagen2 <> "JPEG" Then
                    imagen2 = CStr(Microsoft.VisualBasic.Mid(RTrim(IMAGEN), largo - 3, largo))
                    If imagen2 <> "jpeg" And imagen2 <> "JPEG" And imagen2 <> "log1" Then
                        MsgBox("Formato no valido") : Exit Sub
                        If imagen2 <> "log1" Then Exit Sub
                    End If
                    PictureBox1.Load(IMAGEN)
                End If
            End If
        Catch ex As Exception

        End Try
        PictureBox1.Load(IMAGEN)
    End Sub

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        cargarImagen()
    End Sub

    Private Sub Form1_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        abrir()
        If cantidadImagenes() > 0 Then
            cargarImagenes(cbImagenes)
            cbImagenes.SelectedIndex = 0
        Else
            MsgBox("No Imagenes")
        End If

    End Sub

    Private Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        Dim nombre As String = InputBox("Digite el nombre de la imagen que desea Alamacenar")
        MsgBox(insertarImagen(nombre, IMAGEN))
        cargarImagenes(cbImagenes)
        cbImagenes.SelectedIndex = 0
        PictureBox1.Image = Nothing
    End Sub

    Private Sub cbImagenes_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cbImagenes.SelectedIndexChanged
        Dim ruta As String = consultaRuta(cbImagenes.SelectedItem.ToString)
        PictureBox1.Load(ruta)
    End Sub

    Private Sub OpenFileDialog1_FileOk(sender As System.Object, e As System.ComponentModel.CancelEventArgs) Handles OpenFileDialog1.FileOk

    End Sub
End Class
