Imports System.Data.Sql
Imports System.Data.SqlClient

Module Conexion

    Public conexiones As SqlConnection
    Public enunciado As SqlCommand
    Public respuesta As SqlDataReader
    Public adaptador As SqlDataAdapter


    'Procedimiento realizado para acceder a una base de datos'
    Sub abrir() 'Se necesita abrir la conexion'
        Try
            conexiones = New SqlConnection("Data Source=YENIER-VENEGAS;Initial Catalog=PracticaImagen;Integrated Security=True")
            conexiones.Open()
            'MsgBox("Conexion exitosa", MsgBoxStyle.Information, "Se ha conectado correctamente")'
        Catch ex As Exception
            MsgBox("Error al realizar la conexion" & ex.Message, MsgBoxStyle.Critical, "Error de conexion")
        End Try
    End Sub

    Sub reconectar()
        conexiones.Close()
        conexiones.Open()
    End Sub

    'Guardar la identificacion y la ruta de la imagen
    Function insertarImagen(ByVal id As String, ByVal ruta As String) As String

        Dim resultado As String = ""
        reconectar()
        Try
            enunciado = New SqlCommand("insert into Imagenes(Id_Foto,foto) values('" & id & "','" & ruta & "')", conexiones)
            enunciado.ExecuteNonQuery()
            resultado = "Se realizo correctamente la insercion"
            conexiones.Close()

        Catch ex As Exception
            resultado = "No se pudo realizar el registro de manera correcta" + ex.ToString
            conexiones.Close()

        End Try
        Return resultado
    End Function

    'Retorna la ruta apartir de la identificacion'
    Function consultaRuta(ByVal identificacion As String) As String
        reconectar()
        Dim resultado As String = ""

        Try
            enunciado = New SqlCommand("select foto from Imagenes where Id_Foto='" & identificacion & "'", conexiones)
            respuesta = enunciado.ExecuteReader()

            While respuesta.Read
                resultado = respuesta.Item("foto")
                respuesta.Close()
            End While


        Catch ex As Exception

        End Try
        Return resultado

    End Function

    'Despliega la lista de imagenes disponibles en el comboBox'
    Sub cargarImagenes(ByVal combo As ComboBox)
        reconectar()
        Dim resultado As String = ""

        Try
            enunciado = New SqlCommand("select Id_Foto from Imagenes", conexiones)
            respuesta = enunciado.ExecuteReader()

            While respuesta.Read
                combo.Items.Add(respuesta.Item("Id_Foto"))
            End While
            respuesta.Close()

        Catch ex As Exception
            MsgBox("Error al cargar las imagenes: " + ex.ToString)
        End Try

    End Sub

    'Retorna la cantidad de imagenes almacenadas en la base'
    Function cantidadImagenes() As Integer
        Dim contador As Integer = 0

        Try
            enunciado = New SqlCommand("select * from Imagenes", conexiones)
            respuesta = enunciado.ExecuteReader()

            While respuesta.Read
                contador += 1
            End While
            respuesta.Close()

        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
        Return contador
    End Function


End Module
