namespace epn_inventarios.presentation
{
    partial class FrmRegistro
    {
        /// <summary>
        /// Variable del diseñador requerida.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Limpiar los recursos que se estén utilizando.
        /// </summary>
        /// <param name="disposing">true si los recursos administrados se deben eliminar; false en caso contrario, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Código generado por el Diseñador de Windows Forms

        /// <summary>
        /// Método necesario para admitir el Diseñador. No se puede modificar
        /// el contenido del método con el editor de código.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            System.Windows.Forms.Label etado;
            System.Windows.Forms.Label proveedor;
            System.Windows.Forms.Label tipoequipo;
            System.Windows.Forms.Label marcaLabel;
            System.Windows.Forms.Label modeloLabel;
            System.Windows.Forms.Label valorCompraLabel;
            this.idEstadoComboBox = new System.Windows.Forms.ComboBox();
            this.idProveedorComboBox = new System.Windows.Forms.ComboBox();
            this.idTipoEquipoComboBox = new System.Windows.Forms.ComboBox();
            this.marcaTextBox = new System.Windows.Forms.TextBox();
            this.modeloTextBox = new System.Windows.Forms.TextBox();
            this.valorCompraTextBox = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.equipoMensajeBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.EstadoBS = new System.Windows.Forms.BindingSource(this.components);
            etado = new System.Windows.Forms.Label();
            proveedor = new System.Windows.Forms.Label();
            tipoequipo = new System.Windows.Forms.Label();
            marcaLabel = new System.Windows.Forms.Label();
            modeloLabel = new System.Windows.Forms.Label();
            valorCompraLabel = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.equipoMensajeBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.EstadoBS)).BeginInit();
            this.SuspendLayout();
            // 
            // etado
            // 
            etado.AutoSize = true;
            etado.Location = new System.Drawing.Point(71, 60);
            etado.Name = "etado";
            etado.Size = new System.Drawing.Size(55, 13);
            etado.TabIndex = 0;
            etado.Text = "Id Estado:";
            // 
            // idEstadoComboBox
            // 
            this.idEstadoComboBox.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.equipoMensajeBindingSource, "IdEstado", true));
            this.idEstadoComboBox.DataSource = this.EstadoBS;
            this.idEstadoComboBox.DisplayMember = "Nombre";
            this.idEstadoComboBox.FormattingEnabled = true;
            this.idEstadoComboBox.Location = new System.Drawing.Point(132, 60);
            this.idEstadoComboBox.Name = "idEstadoComboBox";
            this.idEstadoComboBox.Size = new System.Drawing.Size(121, 21);
            this.idEstadoComboBox.TabIndex = 1;
            this.idEstadoComboBox.ValueMember = "Id";
            // 
            // proveedor
            // 
            proveedor.AutoSize = true;
            proveedor.Location = new System.Drawing.Point(55, 98);
            proveedor.Name = "proveedor";
            proveedor.Size = new System.Drawing.Size(71, 13);
            proveedor.TabIndex = 2;
            proveedor.Text = "Id Proveedor:";
            // 
            // idProveedorComboBox
            // 
            this.idProveedorComboBox.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.equipoMensajeBindingSource, "IdProveedor", true));
            this.idProveedorComboBox.FormattingEnabled = true;
            this.idProveedorComboBox.Location = new System.Drawing.Point(132, 95);
            this.idProveedorComboBox.Name = "idProveedorComboBox";
            this.idProveedorComboBox.Size = new System.Drawing.Size(121, 21);
            this.idProveedorComboBox.TabIndex = 3;
            // 
            // tipoequipo
            // 
            tipoequipo.AutoSize = true;
            tipoequipo.Location = new System.Drawing.Point(55, 134);
            tipoequipo.Name = "tipoequipo";
            tipoequipo.Size = new System.Drawing.Size(79, 13);
            tipoequipo.TabIndex = 4;
            tipoequipo.Text = "Id Tipo Equipo:";
            // 
            // idTipoEquipoComboBox
            // 
            this.idTipoEquipoComboBox.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.equipoMensajeBindingSource, "IdTipoEquipo", true));
            this.idTipoEquipoComboBox.FormattingEnabled = true;
            this.idTipoEquipoComboBox.Location = new System.Drawing.Point(134, 134);
            this.idTipoEquipoComboBox.Name = "idTipoEquipoComboBox";
            this.idTipoEquipoComboBox.Size = new System.Drawing.Size(121, 21);
            this.idTipoEquipoComboBox.TabIndex = 5;
            // 
            // marcaLabel
            // 
            marcaLabel.AutoSize = true;
            marcaLabel.Location = new System.Drawing.Point(86, 168);
            marcaLabel.Name = "marcaLabel";
            marcaLabel.Size = new System.Drawing.Size(40, 13);
            marcaLabel.TabIndex = 6;
            marcaLabel.Text = "Marca:";
            // 
            // marcaTextBox
            // 
            this.marcaTextBox.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.equipoMensajeBindingSource, "Marca", true));
            this.marcaTextBox.Location = new System.Drawing.Point(134, 168);
            this.marcaTextBox.Name = "marcaTextBox";
            this.marcaTextBox.Size = new System.Drawing.Size(119, 20);
            this.marcaTextBox.TabIndex = 7;
            // 
            // modeloLabel
            // 
            modeloLabel.AutoSize = true;
            modeloLabel.Location = new System.Drawing.Point(86, 198);
            modeloLabel.Name = "modeloLabel";
            modeloLabel.Size = new System.Drawing.Size(45, 13);
            modeloLabel.TabIndex = 8;
            modeloLabel.Text = "Modelo:";
            // 
            // modeloTextBox
            // 
            this.modeloTextBox.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.equipoMensajeBindingSource, "Modelo", true));
            this.modeloTextBox.Location = new System.Drawing.Point(134, 198);
            this.modeloTextBox.Name = "modeloTextBox";
            this.modeloTextBox.Size = new System.Drawing.Size(119, 20);
            this.modeloTextBox.TabIndex = 9;
            // 
            // valorCompraLabel
            // 
            valorCompraLabel.AutoSize = true;
            valorCompraLabel.Location = new System.Drawing.Point(55, 232);
            valorCompraLabel.Name = "valorCompraLabel";
            valorCompraLabel.Size = new System.Drawing.Size(73, 13);
            valorCompraLabel.TabIndex = 10;
            valorCompraLabel.Text = "Valor Compra:";
            // 
            // valorCompraTextBox
            // 
            this.valorCompraTextBox.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.equipoMensajeBindingSource, "ValorCompra", true));
            this.valorCompraTextBox.Location = new System.Drawing.Point(134, 225);
            this.valorCompraTextBox.Name = "valorCompraTextBox";
            this.valorCompraTextBox.Size = new System.Drawing.Size(119, 20);
            this.valorCompraTextBox.TabIndex = 11;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(86, 9);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(97, 13);
            this.label1.TabIndex = 12;
            this.label1.Text = "Ingreso de equipos";
            // 
            // equipoMensajeBindingSource
            // 
            this.equipoMensajeBindingSource.DataSource = typeof(epn_inventarios.messaje.EquipoMensaje);
            // 
            // EstadoBS
            // 
            this.EstadoBS.DataSource = typeof(epn_inventarios.messaje.ItemCombo);
            // 
            // FrmRegistro
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(273, 265);
            this.Controls.Add(this.label1);
            this.Controls.Add(valorCompraLabel);
            this.Controls.Add(this.valorCompraTextBox);
            this.Controls.Add(modeloLabel);
            this.Controls.Add(this.modeloTextBox);
            this.Controls.Add(marcaLabel);
            this.Controls.Add(this.marcaTextBox);
            this.Controls.Add(tipoequipo);
            this.Controls.Add(this.idTipoEquipoComboBox);
            this.Controls.Add(proveedor);
            this.Controls.Add(this.idProveedorComboBox);
            this.Controls.Add(etado);
            this.Controls.Add(this.idEstadoComboBox);
            this.Name = "FrmRegistro";
            this.Text = "EQUIPOS";
            ((System.ComponentModel.ISupportInitialize)(this.equipoMensajeBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.EstadoBS)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.BindingSource equipoMensajeBindingSource;
        private System.Windows.Forms.ComboBox idEstadoComboBox;
        private System.Windows.Forms.ComboBox idProveedorComboBox;
        private System.Windows.Forms.ComboBox idTipoEquipoComboBox;
        private System.Windows.Forms.TextBox marcaTextBox;
        private System.Windows.Forms.TextBox modeloTextBox;
        private System.Windows.Forms.TextBox valorCompraTextBox;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.BindingSource EstadoBS;

    }
}

