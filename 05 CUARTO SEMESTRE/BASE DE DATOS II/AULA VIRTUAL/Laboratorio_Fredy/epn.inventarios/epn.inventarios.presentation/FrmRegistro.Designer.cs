namespace epn.inventarios.presentation
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
            System.Windows.Forms.Label idEstadoLabel;
            System.Windows.Forms.Label idProveedorLabel;
            System.Windows.Forms.Label idTipoEquipoLabel;
            System.Windows.Forms.Label marcaLabel;
            System.Windows.Forms.Label modeloLabel;
            System.Windows.Forms.Label valorCompraLabel;
            System.Windows.Forms.Label label1;
            System.Windows.Forms.Label label2;
            System.Windows.Forms.Label label3;
            System.Windows.Forms.Label label4;
            System.Windows.Forms.Label label5;
            System.Windows.Forms.Label label6;
            System.Windows.Forms.Label label7;
            System.Windows.Forms.Label label8;
            System.Windows.Forms.Label label9;
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(FrmRegistro));
            this.Estado_BS = new System.Windows.Forms.BindingSource(this.components);
            this.idProveedorComboBox = new System.Windows.Forms.ComboBox();
            this.Equipo_BS = new System.Windows.Forms.BindingSource(this.components);
            this.Proveedores_BS = new System.Windows.Forms.BindingSource(this.components);
            this.idTipoEquipoComboBox = new System.Windows.Forms.ComboBox();
            this.TipoEquipo_BS = new System.Windows.Forms.BindingSource(this.components);
            this.marcaTextBox = new System.Windows.Forms.TextBox();
            this.modeloTextBox = new System.Windows.Forms.TextBox();
            this.valorCompraTextBox = new System.Windows.Forms.TextBox();
            this.cmdGuardar = new System.Windows.Forms.Button();
            this.comboBox1 = new System.Windows.Forms.ComboBox();
            this.txtCodigoEquipo = new System.Windows.Forms.TextBox();
            this.cmdConsultar = new System.Windows.Forms.Button();
            this.cmdHabilitarConsulta = new System.Windows.Forms.Button();
            this.groupBox2 = new System.Windows.Forms.GroupBox();
            this.button1 = new System.Windows.Forms.Button();
            idEstadoLabel = new System.Windows.Forms.Label();
            idProveedorLabel = new System.Windows.Forms.Label();
            idTipoEquipoLabel = new System.Windows.Forms.Label();
            marcaLabel = new System.Windows.Forms.Label();
            modeloLabel = new System.Windows.Forms.Label();
            valorCompraLabel = new System.Windows.Forms.Label();
            label1 = new System.Windows.Forms.Label();
            label2 = new System.Windows.Forms.Label();
            label3 = new System.Windows.Forms.Label();
            label4 = new System.Windows.Forms.Label();
            label5 = new System.Windows.Forms.Label();
            label6 = new System.Windows.Forms.Label();
            label7 = new System.Windows.Forms.Label();
            label8 = new System.Windows.Forms.Label();
            label9 = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.Estado_BS)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.Equipo_BS)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.Proveedores_BS)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.TipoEquipo_BS)).BeginInit();
            this.groupBox2.SuspendLayout();
            this.SuspendLayout();
            // 
            // idEstadoLabel
            // 
            idEstadoLabel.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            idEstadoLabel.AutoSize = true;
            idEstadoLabel.ForeColor = System.Drawing.Color.Black;
            idEstadoLabel.Location = new System.Drawing.Point(66, 115);
            idEstadoLabel.Name = "idEstadoLabel";
            idEstadoLabel.Size = new System.Drawing.Size(43, 13);
            idEstadoLabel.TabIndex = 0;
            idEstadoLabel.Text = "Estado:";
            // 
            // idProveedorLabel
            // 
            idProveedorLabel.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            idProveedorLabel.AutoSize = true;
            idProveedorLabel.ForeColor = System.Drawing.Color.Black;
            idProveedorLabel.Location = new System.Drawing.Point(50, 142);
            idProveedorLabel.Name = "idProveedorLabel";
            idProveedorLabel.Size = new System.Drawing.Size(59, 13);
            idProveedorLabel.TabIndex = 2;
            idProveedorLabel.Text = "Proveedor:";
            // 
            // idTipoEquipoLabel
            // 
            idTipoEquipoLabel.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            idTipoEquipoLabel.AutoSize = true;
            idTipoEquipoLabel.ForeColor = System.Drawing.Color.Black;
            idTipoEquipoLabel.Location = new System.Drawing.Point(43, 87);
            idTipoEquipoLabel.Name = "idTipoEquipoLabel";
            idTipoEquipoLabel.Size = new System.Drawing.Size(67, 13);
            idTipoEquipoLabel.TabIndex = 4;
            idTipoEquipoLabel.Text = "Tipo Equipo:";
            // 
            // marcaLabel
            // 
            marcaLabel.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            marcaLabel.AutoSize = true;
            marcaLabel.ForeColor = System.Drawing.Color.Black;
            marcaLabel.Location = new System.Drawing.Point(69, 170);
            marcaLabel.Name = "marcaLabel";
            marcaLabel.Size = new System.Drawing.Size(40, 13);
            marcaLabel.TabIndex = 6;
            marcaLabel.Text = "Marca:";
            // 
            // modeloLabel
            // 
            modeloLabel.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            modeloLabel.AutoSize = true;
            modeloLabel.ForeColor = System.Drawing.Color.Black;
            modeloLabel.Location = new System.Drawing.Point(64, 196);
            modeloLabel.Name = "modeloLabel";
            modeloLabel.Size = new System.Drawing.Size(45, 13);
            modeloLabel.TabIndex = 8;
            modeloLabel.Text = "Modelo:";
            // 
            // valorCompraLabel
            // 
            valorCompraLabel.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            valorCompraLabel.AutoSize = true;
            valorCompraLabel.ForeColor = System.Drawing.Color.Black;
            valorCompraLabel.Location = new System.Drawing.Point(36, 222);
            valorCompraLabel.Name = "valorCompraLabel";
            valorCompraLabel.Size = new System.Drawing.Size(73, 13);
            valorCompraLabel.TabIndex = 10;
            valorCompraLabel.Text = "Valor Compra:";
            // 
            // label1
            // 
            label1.AutoSize = true;
            label1.Font = new System.Drawing.Font("Microsoft YaHei UI", 20.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            label1.ForeColor = System.Drawing.Color.Black;
            label1.Location = new System.Drawing.Point(143, 9);
            label1.Name = "label1";
            label1.Size = new System.Drawing.Size(237, 35);
            label1.TabIndex = 13;
            label1.Text = "Registro Activos";
            label1.Click += new System.EventHandler(this.label1_Click);
            // 
            // label2
            // 
            label2.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            label2.AutoSize = true;
            label2.ForeColor = System.Drawing.Color.Black;
            label2.Location = new System.Drawing.Point(33, 61);
            label2.Name = "label2";
            label2.Size = new System.Drawing.Size(76, 13);
            label2.TabIndex = 15;
            label2.Text = "Código Activo:";
            // 
            // Estado_BS
            // 
            this.Estado_BS.DataSource = typeof(epn.inventarios.message.ItemCombo);
            // 
            // idProveedorComboBox
            // 
            this.idProveedorComboBox.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.idProveedorComboBox.DataBindings.Add(new System.Windows.Forms.Binding("SelectedValue", this.Equipo_BS, "IdProveedor", true));
            this.idProveedorComboBox.DataSource = this.Proveedores_BS;
            this.idProveedorComboBox.DisplayMember = "Nombre";
            this.idProveedorComboBox.FormattingEnabled = true;
            this.idProveedorComboBox.Location = new System.Drawing.Point(125, 139);
            this.idProveedorComboBox.Name = "idProveedorComboBox";
            this.idProveedorComboBox.Size = new System.Drawing.Size(358, 21);
            this.idProveedorComboBox.TabIndex = 3;
            this.idProveedorComboBox.ValueMember = "Id";
            // 
            // Equipo_BS
            // 
            this.Equipo_BS.DataSource = typeof(epn.inventarios.message.EquipoMsg);
            this.Equipo_BS.CurrentChanged += new System.EventHandler(this.Equipo_BS_CurrentChanged);
            // 
            // Proveedores_BS
            // 
            this.Proveedores_BS.DataSource = typeof(epn.inventarios.message.ItemCombo);
            // 
            // idTipoEquipoComboBox
            // 
            this.idTipoEquipoComboBox.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.idTipoEquipoComboBox.DataBindings.Add(new System.Windows.Forms.Binding("SelectedValue", this.Equipo_BS, "IdTipoEquipo", true));
            this.idTipoEquipoComboBox.DataSource = this.TipoEquipo_BS;
            this.idTipoEquipoComboBox.DisplayMember = "Nombre";
            this.idTipoEquipoComboBox.FormattingEnabled = true;
            this.idTipoEquipoComboBox.Location = new System.Drawing.Point(125, 84);
            this.idTipoEquipoComboBox.Name = "idTipoEquipoComboBox";
            this.idTipoEquipoComboBox.Size = new System.Drawing.Size(359, 21);
            this.idTipoEquipoComboBox.TabIndex = 1;
            this.idTipoEquipoComboBox.ValueMember = "Id";
            this.idTipoEquipoComboBox.SelectedIndexChanged += new System.EventHandler(this.idTipoEquipoComboBox_SelectedIndexChanged);
            // 
            // TipoEquipo_BS
            // 
            this.TipoEquipo_BS.DataSource = typeof(epn.inventarios.message.ItemCombo);
            // 
            // marcaTextBox
            // 
            this.marcaTextBox.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.marcaTextBox.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.Equipo_BS, "Marca", true));
            this.marcaTextBox.Location = new System.Drawing.Point(125, 167);
            this.marcaTextBox.Name = "marcaTextBox";
            this.marcaTextBox.Size = new System.Drawing.Size(358, 20);
            this.marcaTextBox.TabIndex = 4;
            // 
            // modeloTextBox
            // 
            this.modeloTextBox.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.modeloTextBox.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.Equipo_BS, "Modelo", true));
            this.modeloTextBox.Location = new System.Drawing.Point(125, 193);
            this.modeloTextBox.Name = "modeloTextBox";
            this.modeloTextBox.Size = new System.Drawing.Size(358, 20);
            this.modeloTextBox.TabIndex = 5;
            // 
            // valorCompraTextBox
            // 
            this.valorCompraTextBox.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.valorCompraTextBox.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.Equipo_BS, "ValorCompra", true));
            this.valorCompraTextBox.Location = new System.Drawing.Point(125, 219);
            this.valorCompraTextBox.Name = "valorCompraTextBox";
            this.valorCompraTextBox.Size = new System.Drawing.Size(358, 20);
            this.valorCompraTextBox.TabIndex = 6;
            // 
            // cmdGuardar
            // 
            this.cmdGuardar.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.cmdGuardar.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cmdGuardar.ForeColor = System.Drawing.SystemColors.ActiveCaptionText;
            this.cmdGuardar.Location = new System.Drawing.Point(353, 255);
            this.cmdGuardar.Name = "cmdGuardar";
            this.cmdGuardar.Size = new System.Drawing.Size(131, 23);
            this.cmdGuardar.TabIndex = 9;
            this.cmdGuardar.Text = "Guardar";
            this.cmdGuardar.UseVisualStyleBackColor = true;
            this.cmdGuardar.Click += new System.EventHandler(this.cmdInsert_Click);
            // 
            // comboBox1
            // 
            this.comboBox1.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.comboBox1.DataBindings.Add(new System.Windows.Forms.Binding("SelectedValue", this.Equipo_BS, "IdEstado", true));
            this.comboBox1.DataSource = this.Estado_BS;
            this.comboBox1.DisplayMember = "Nombre";
            this.comboBox1.FormattingEnabled = true;
            this.comboBox1.Location = new System.Drawing.Point(125, 111);
            this.comboBox1.Name = "comboBox1";
            this.comboBox1.Size = new System.Drawing.Size(358, 21);
            this.comboBox1.TabIndex = 2;
            this.comboBox1.ValueMember = "Id";
            this.comboBox1.SelectedIndexChanged += new System.EventHandler(this.comboBox1_SelectedIndexChanged);
            // 
            // txtCodigoEquipo
            // 
            this.txtCodigoEquipo.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.txtCodigoEquipo.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.Equipo_BS, "CodigoActivo", true));
            this.txtCodigoEquipo.Enabled = false;
            this.txtCodigoEquipo.Location = new System.Drawing.Point(125, 58);
            this.txtCodigoEquipo.Name = "txtCodigoEquipo";
            this.txtCodigoEquipo.Size = new System.Drawing.Size(359, 20);
            this.txtCodigoEquipo.TabIndex = 0;
            this.txtCodigoEquipo.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.txtCodigoEquipo_KeyPress);
            // 
            // cmdConsultar
            // 
            this.cmdConsultar.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.cmdConsultar.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cmdConsultar.ForeColor = System.Drawing.SystemColors.ActiveCaptionText;
            this.cmdConsultar.Location = new System.Drawing.Point(226, 255);
            this.cmdConsultar.Name = "cmdConsultar";
            this.cmdConsultar.Size = new System.Drawing.Size(121, 23);
            this.cmdConsultar.TabIndex = 17;
            this.cmdConsultar.Text = "Consultar";
            this.cmdConsultar.UseVisualStyleBackColor = true;
            this.cmdConsultar.Visible = false;
            this.cmdConsultar.Click += new System.EventHandler(this.cmdConsultar_Click);
            // 
            // cmdHabilitarConsulta
            // 
            this.cmdHabilitarConsulta.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.cmdHabilitarConsulta.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cmdHabilitarConsulta.ForeColor = System.Drawing.SystemColors.ActiveCaptionText;
            this.cmdHabilitarConsulta.Location = new System.Drawing.Point(226, 255);
            this.cmdHabilitarConsulta.Name = "cmdHabilitarConsulta";
            this.cmdHabilitarConsulta.Size = new System.Drawing.Size(121, 23);
            this.cmdHabilitarConsulta.TabIndex = 8;
            this.cmdHabilitarConsulta.Text = "Habilitar Consulta";
            this.cmdHabilitarConsulta.UseVisualStyleBackColor = true;
            this.cmdHabilitarConsulta.Click += new System.EventHandler(this.cmdHabilitarConsulta_Click);
            // 
            // label3
            // 
            label3.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            label3.AutoSize = true;
            label3.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold);
            label3.ForeColor = System.Drawing.Color.Black;
            label3.Location = new System.Drawing.Point(59, 115);
            label3.Name = "label3";
            label3.Size = new System.Drawing.Size(61, 16);
            label3.TabIndex = 0;
            label3.Text = "Estado:";
            // 
            // label4
            // 
            label4.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            label4.AutoSize = true;
            label4.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold);
            label4.ForeColor = System.Drawing.Color.Black;
            label4.Location = new System.Drawing.Point(36, 139);
            label4.Name = "label4";
            label4.Size = new System.Drawing.Size(85, 16);
            label4.TabIndex = 2;
            label4.Text = "Proveedor:";
            // 
            // label5
            // 
            label5.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            label5.AutoSize = true;
            label5.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold);
            label5.ForeColor = System.Drawing.Color.Black;
            label5.Location = new System.Drawing.Point(22, 84);
            label5.Name = "label5";
            label5.Size = new System.Drawing.Size(97, 16);
            label5.TabIndex = 4;
            label5.Text = "Tipo Equipo:";
            // 
            // label6
            // 
            label6.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            label6.AutoSize = true;
            label6.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold);
            label6.ForeColor = System.Drawing.Color.Black;
            label6.Location = new System.Drawing.Point(61, 166);
            label6.Name = "label6";
            label6.Size = new System.Drawing.Size(55, 16);
            label6.TabIndex = 6;
            label6.Text = "Marca:";
            // 
            // label7
            // 
            label7.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            label7.AutoSize = true;
            label7.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold);
            label7.ForeColor = System.Drawing.Color.Black;
            label7.Location = new System.Drawing.Point(52, 193);
            label7.Name = "label7";
            label7.Size = new System.Drawing.Size(64, 16);
            label7.TabIndex = 8;
            label7.Text = "Modelo:";
            // 
            // label8
            // 
            label8.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            label8.AutoSize = true;
            label8.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold);
            label8.ForeColor = System.Drawing.Color.Black;
            label8.Location = new System.Drawing.Point(10, 219);
            label8.Name = "label8";
            label8.Size = new System.Drawing.Size(107, 16);
            label8.TabIndex = 10;
            label8.Text = "Valor Compra:";
            // 
            // label9
            // 
            label9.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            label9.AutoSize = true;
            label9.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold);
            label9.ForeColor = System.Drawing.Color.Black;
            label9.Location = new System.Drawing.Point(12, 58);
            label9.Name = "label9";
            label9.Size = new System.Drawing.Size(109, 16);
            label9.TabIndex = 15;
            label9.Text = "Código Activo:";
            // 
            // groupBox2
            // 
            this.groupBox2.Controls.Add(this.button1);
            this.groupBox2.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.groupBox2.Location = new System.Drawing.Point(25, 294);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.Size = new System.Drawing.Size(470, 215);
            this.groupBox2.TabIndex = 19;
            this.groupBox2.TabStop = false;
            this.groupBox2.Text = "Componentes";
            // 
            // button1
            // 
            this.button1.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.button1.ForeColor = System.Drawing.SystemColors.ActiveCaptionText;
            this.button1.Location = new System.Drawing.Point(328, 21);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(131, 27);
            this.button1.TabIndex = 18;
            this.button1.Text = "Agregar";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.btmagregar_Click);
            // 
            // FrmRegistro
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.SystemColors.Menu;
            this.ClientSize = new System.Drawing.Size(507, 539);
            this.Controls.Add(this.groupBox2);
            this.Controls.Add(this.cmdHabilitarConsulta);
            this.Controls.Add(label9);
            this.Controls.Add(this.cmdConsultar);
            this.Controls.Add(label2);
            this.Controls.Add(this.txtCodigoEquipo);
            this.Controls.Add(this.comboBox1);
            this.Controls.Add(label1);
            this.Controls.Add(label8);
            this.Controls.Add(this.cmdGuardar);
            this.Controls.Add(valorCompraLabel);
            this.Controls.Add(label7);
            this.Controls.Add(this.valorCompraTextBox);
            this.Controls.Add(modeloLabel);
            this.Controls.Add(label6);
            this.Controls.Add(this.modeloTextBox);
            this.Controls.Add(marcaLabel);
            this.Controls.Add(label5);
            this.Controls.Add(this.marcaTextBox);
            this.Controls.Add(idTipoEquipoLabel);
            this.Controls.Add(label4);
            this.Controls.Add(this.idTipoEquipoComboBox);
            this.Controls.Add(idProveedorLabel);
            this.Controls.Add(label3);
            this.Controls.Add(this.idProveedorComboBox);
            this.Controls.Add(idEstadoLabel);
            this.ForeColor = System.Drawing.SystemColors.ButtonHighlight;
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "FrmRegistro";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Load += new System.EventHandler(this.FrmRegistro_Load);
            ((System.ComponentModel.ISupportInitialize)(this.Estado_BS)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.Equipo_BS)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.Proveedores_BS)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.TipoEquipo_BS)).EndInit();
            this.groupBox2.ResumeLayout(false);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.ComboBox idProveedorComboBox;
        private System.Windows.Forms.ComboBox idTipoEquipoComboBox;
        private System.Windows.Forms.TextBox marcaTextBox;
        private System.Windows.Forms.TextBox modeloTextBox;
        private System.Windows.Forms.TextBox valorCompraTextBox;
        private System.Windows.Forms.BindingSource Estado_BS;
        private System.Windows.Forms.BindingSource Proveedores_BS;
        private System.Windows.Forms.BindingSource TipoEquipo_BS;
        private System.Windows.Forms.Button cmdGuardar;
        private System.Windows.Forms.ComboBox comboBox1;
        private System.Windows.Forms.BindingSource Equipo_BS;
        private System.Windows.Forms.TextBox txtCodigoEquipo;
        private System.Windows.Forms.Button cmdConsultar;
        private System.Windows.Forms.Button cmdHabilitarConsulta;
        private System.Windows.Forms.GroupBox groupBox2;
        private System.Windows.Forms.Button button1;

    }
}

