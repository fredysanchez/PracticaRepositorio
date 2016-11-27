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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(FrmRegistro));
            this.idEstadoComboBox = new System.Windows.Forms.ComboBox();
            this.EquipoBS = new System.Windows.Forms.BindingSource(this.components);
            this.EstadoBS = new System.Windows.Forms.BindingSource(this.components);
            this.idProveedorComboBox = new System.Windows.Forms.ComboBox();
            this.ProveedorBS = new System.Windows.Forms.BindingSource(this.components);
            this.idTipoEquipoComboBox = new System.Windows.Forms.ComboBox();
            this.TipoEquipoBS = new System.Windows.Forms.BindingSource(this.components);
            this.marcaTextBox = new System.Windows.Forms.TextBox();
            this.modeloTextBox = new System.Windows.Forms.TextBox();
            this.valorCompraTextBox = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.btminsertar = new System.Windows.Forms.Button();
            etado = new System.Windows.Forms.Label();
            proveedor = new System.Windows.Forms.Label();
            tipoequipo = new System.Windows.Forms.Label();
            marcaLabel = new System.Windows.Forms.Label();
            modeloLabel = new System.Windows.Forms.Label();
            valorCompraLabel = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.EquipoBS)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.EstadoBS)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.ProveedorBS)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.TipoEquipoBS)).BeginInit();
            this.SuspendLayout();
            // 
            // etado
            // 
            etado.AutoSize = true;
            etado.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            etado.Location = new System.Drawing.Point(59, 64);
            etado.Name = "etado";
            etado.Size = new System.Drawing.Size(68, 16);
            etado.TabIndex = 0;
            etado.Text = "Id Estado:";
            etado.Click += new System.EventHandler(this.etado_Click);
            // 
            // proveedor
            // 
            proveedor.AutoSize = true;
            proveedor.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            proveedor.Location = new System.Drawing.Point(40, 94);
            proveedor.Name = "proveedor";
            proveedor.Size = new System.Drawing.Size(89, 16);
            proveedor.TabIndex = 2;
            proveedor.Text = "Id Proveedor:";
            // 
            // tipoequipo
            // 
            tipoequipo.AutoSize = true;
            tipoequipo.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            tipoequipo.Location = new System.Drawing.Point(28, 125);
            tipoequipo.Name = "tipoequipo";
            tipoequipo.Size = new System.Drawing.Size(99, 16);
            tipoequipo.TabIndex = 4;
            tipoequipo.Text = "Id Tipo Equipo:";
            // 
            // marcaLabel
            // 
            marcaLabel.AutoSize = true;
            marcaLabel.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            marcaLabel.Location = new System.Drawing.Point(79, 156);
            marcaLabel.Name = "marcaLabel";
            marcaLabel.Size = new System.Drawing.Size(49, 16);
            marcaLabel.TabIndex = 6;
            marcaLabel.Text = "Marca:";
            // 
            // modeloLabel
            // 
            modeloLabel.AutoSize = true;
            modeloLabel.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            modeloLabel.Location = new System.Drawing.Point(70, 186);
            modeloLabel.Name = "modeloLabel";
            modeloLabel.Size = new System.Drawing.Size(57, 16);
            modeloLabel.TabIndex = 8;
            modeloLabel.Text = "Modelo:";
            // 
            // valorCompraLabel
            // 
            valorCompraLabel.AutoSize = true;
            valorCompraLabel.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            valorCompraLabel.Location = new System.Drawing.Point(34, 216);
            valorCompraLabel.Name = "valorCompraLabel";
            valorCompraLabel.Size = new System.Drawing.Size(94, 16);
            valorCompraLabel.TabIndex = 10;
            valorCompraLabel.Text = "Valor Compra:";
            // 
            // idEstadoComboBox
            // 
            this.idEstadoComboBox.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.idEstadoComboBox.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.EquipoBS, "IdEstado", true));
            this.idEstadoComboBox.DataBindings.Add(new System.Windows.Forms.Binding("SelectedValue", this.EquipoBS, "IdEstado", true));
            this.idEstadoComboBox.DataSource = this.EstadoBS;
            this.idEstadoComboBox.DisplayMember = "Nombre";
            this.idEstadoComboBox.FormattingEnabled = true;
            this.idEstadoComboBox.Location = new System.Drawing.Point(147, 64);
            this.idEstadoComboBox.Name = "idEstadoComboBox";
            this.idEstadoComboBox.Size = new System.Drawing.Size(204, 21);
            this.idEstadoComboBox.TabIndex = 1;
            this.idEstadoComboBox.ValueMember = "Id";
            // 
            // EquipoBS
            // 
            this.EquipoBS.DataSource = typeof(epn_inventarios.messaje.EquipoMensaje);
            // 
            // EstadoBS
            // 
            this.EstadoBS.DataSource = typeof(epn_inventarios.messaje.ItemCombo);
            // 
            // idProveedorComboBox
            // 
            this.idProveedorComboBox.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.idProveedorComboBox.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.EquipoBS, "IdProveedor", true));
            this.idProveedorComboBox.DataBindings.Add(new System.Windows.Forms.Binding("SelectedValue", this.EquipoBS, "IdProveedor", true));
            this.idProveedorComboBox.DataSource = this.ProveedorBS;
            this.idProveedorComboBox.DisplayMember = "Nombre";
            this.idProveedorComboBox.FormattingEnabled = true;
            this.idProveedorComboBox.Location = new System.Drawing.Point(147, 94);
            this.idProveedorComboBox.Name = "idProveedorComboBox";
            this.idProveedorComboBox.Size = new System.Drawing.Size(204, 21);
            this.idProveedorComboBox.TabIndex = 3;
            this.idProveedorComboBox.ValueMember = "Id";
            // 
            // ProveedorBS
            // 
            this.ProveedorBS.DataSource = typeof(epn_inventarios.messaje.ItemCombo);
            this.ProveedorBS.CurrentChanged += new System.EventHandler(this.ProveedorBS_CurrentChanged);
            // 
            // idTipoEquipoComboBox
            // 
            this.idTipoEquipoComboBox.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.idTipoEquipoComboBox.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.EquipoBS, "IdTipoEquipo", true));
            this.idTipoEquipoComboBox.DataBindings.Add(new System.Windows.Forms.Binding("SelectedValue", this.EquipoBS, "IdTipoEquipo", true));
            this.idTipoEquipoComboBox.DataSource = this.TipoEquipoBS;
            this.idTipoEquipoComboBox.DisplayMember = "Nombre";
            this.idTipoEquipoComboBox.FormattingEnabled = true;
            this.idTipoEquipoComboBox.Location = new System.Drawing.Point(149, 125);
            this.idTipoEquipoComboBox.Name = "idTipoEquipoComboBox";
            this.idTipoEquipoComboBox.Size = new System.Drawing.Size(202, 21);
            this.idTipoEquipoComboBox.TabIndex = 5;
            this.idTipoEquipoComboBox.ValueMember = "Id";
            // 
            // TipoEquipoBS
            // 
            this.TipoEquipoBS.DataSource = typeof(epn_inventarios.messaje.ItemCombo);
            // 
            // marcaTextBox
            // 
            this.marcaTextBox.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.marcaTextBox.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.EquipoBS, "Marca", true));
            this.marcaTextBox.Location = new System.Drawing.Point(149, 156);
            this.marcaTextBox.Name = "marcaTextBox";
            this.marcaTextBox.Size = new System.Drawing.Size(202, 20);
            this.marcaTextBox.TabIndex = 7;
            // 
            // modeloTextBox
            // 
            this.modeloTextBox.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.modeloTextBox.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.EquipoBS, "Modelo", true));
            this.modeloTextBox.Location = new System.Drawing.Point(149, 186);
            this.modeloTextBox.Name = "modeloTextBox";
            this.modeloTextBox.Size = new System.Drawing.Size(202, 20);
            this.modeloTextBox.TabIndex = 9;
            // 
            // valorCompraTextBox
            // 
            this.valorCompraTextBox.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.valorCompraTextBox.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.EquipoBS, "ValorCompra", true));
            this.valorCompraTextBox.Location = new System.Drawing.Point(149, 216);
            this.valorCompraTextBox.Name = "valorCompraTextBox";
            this.valorCompraTextBox.Size = new System.Drawing.Size(202, 20);
            this.valorCompraTextBox.TabIndex = 11;
            // 
            // label1
            // 
            this.label1.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Left | System.Windows.Forms.AnchorStyles.Right)));
            this.label1.AutoSize = true;
            this.label1.BackColor = System.Drawing.Color.White;
            this.label1.Font = new System.Drawing.Font("Papyrus", 14.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(31, 9);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(325, 30);
            this.label1.TabIndex = 16;
            this.label1.Text = "REGISTRO DE EQUIPOS\r\n";
            this.label1.TextAlign = System.Drawing.ContentAlignment.TopCenter;
            this.label1.Click += new System.EventHandler(this.label1_Click);
            // 
            // btminsertar
            // 
            this.btminsertar.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.btminsertar.Font = new System.Drawing.Font("Comic Sans MS", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btminsertar.Location = new System.Drawing.Point(149, 263);
            this.btminsertar.Name = "btminsertar";
            this.btminsertar.Size = new System.Drawing.Size(202, 34);
            this.btminsertar.TabIndex = 13;
            this.btminsertar.Text = "Insertar";
            this.btminsertar.UseVisualStyleBackColor = true;
            this.btminsertar.Click += new System.EventHandler(this.btminsertar_Click);
            // 
            // FrmRegistro
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(96F, 96F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Dpi;
            this.BackColor = System.Drawing.SystemColors.Window;
            this.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("$this.BackgroundImage")));
            this.ClientSize = new System.Drawing.Size(379, 309);
            this.Controls.Add(this.btminsertar);
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
            this.Cursor = System.Windows.Forms.Cursors.Hand;
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Location = new System.Drawing.Point(50, 50);
            this.Name = "FrmRegistro";
            this.Text = "EQUIPOS";
            this.Load += new System.EventHandler(this.FrmRegistro_Load);
            ((System.ComponentModel.ISupportInitialize)(this.EquipoBS)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.EstadoBS)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.ProveedorBS)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.TipoEquipoBS)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.BindingSource EquipoBS;
        private System.Windows.Forms.ComboBox idEstadoComboBox;
        private System.Windows.Forms.ComboBox idProveedorComboBox;
        private System.Windows.Forms.ComboBox idTipoEquipoComboBox;
        private System.Windows.Forms.TextBox marcaTextBox;
        private System.Windows.Forms.TextBox modeloTextBox;
        private System.Windows.Forms.TextBox valorCompraTextBox;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.BindingSource EstadoBS;
        private System.Windows.Forms.BindingSource ProveedorBS;
        private System.Windows.Forms.BindingSource TipoEquipoBS;
        private System.Windows.Forms.Button btminsertar;

    }
}

