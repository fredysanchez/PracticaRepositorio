﻿namespace epn.inventarios.presentation
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
            this.ListaComponentes_BS = new System.Windows.Forms.BindingSource(this.components);
            this.cmdAgreagarComponente = new System.Windows.Forms.Button();
            this.dataGridView1 = new System.Windows.Forms.DataGridView();
            this.textoComponenteDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.descripcionDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.IdEquipo = new System.Windows.Forms.DataGridViewTextBoxColumn();
            idEstadoLabel = new System.Windows.Forms.Label();
            idProveedorLabel = new System.Windows.Forms.Label();
            idTipoEquipoLabel = new System.Windows.Forms.Label();
            marcaLabel = new System.Windows.Forms.Label();
            modeloLabel = new System.Windows.Forms.Label();
            valorCompraLabel = new System.Windows.Forms.Label();
            label1 = new System.Windows.Forms.Label();
            label2 = new System.Windows.Forms.Label();
            label3 = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.Estado_BS)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.Equipo_BS)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.Proveedores_BS)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.TipoEquipo_BS)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.ListaComponentes_BS)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).BeginInit();
            this.SuspendLayout();
            // 
            // idEstadoLabel
            // 
            idEstadoLabel.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            idEstadoLabel.AutoSize = true;
            idEstadoLabel.ForeColor = System.Drawing.Color.White;
            idEstadoLabel.Location = new System.Drawing.Point(60, 103);
            idEstadoLabel.Name = "idEstadoLabel";
            idEstadoLabel.Size = new System.Drawing.Size(43, 13);
            idEstadoLabel.TabIndex = 0;
            idEstadoLabel.Text = "Estado:";
            // 
            // idProveedorLabel
            // 
            idProveedorLabel.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            idProveedorLabel.AutoSize = true;
            idProveedorLabel.ForeColor = System.Drawing.Color.White;
            idProveedorLabel.Location = new System.Drawing.Point(44, 130);
            idProveedorLabel.Name = "idProveedorLabel";
            idProveedorLabel.Size = new System.Drawing.Size(59, 13);
            idProveedorLabel.TabIndex = 2;
            idProveedorLabel.Text = "Proveedor:";
            // 
            // idTipoEquipoLabel
            // 
            idTipoEquipoLabel.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            idTipoEquipoLabel.AutoSize = true;
            idTipoEquipoLabel.ForeColor = System.Drawing.Color.White;
            idTipoEquipoLabel.Location = new System.Drawing.Point(37, 75);
            idTipoEquipoLabel.Name = "idTipoEquipoLabel";
            idTipoEquipoLabel.Size = new System.Drawing.Size(67, 13);
            idTipoEquipoLabel.TabIndex = 4;
            idTipoEquipoLabel.Text = "Tipo Equipo:";
            // 
            // marcaLabel
            // 
            marcaLabel.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            marcaLabel.AutoSize = true;
            marcaLabel.ForeColor = System.Drawing.Color.White;
            marcaLabel.Location = new System.Drawing.Point(63, 158);
            marcaLabel.Name = "marcaLabel";
            marcaLabel.Size = new System.Drawing.Size(40, 13);
            marcaLabel.TabIndex = 6;
            marcaLabel.Text = "Marca:";
            // 
            // modeloLabel
            // 
            modeloLabel.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            modeloLabel.AutoSize = true;
            modeloLabel.ForeColor = System.Drawing.Color.White;
            modeloLabel.Location = new System.Drawing.Point(58, 184);
            modeloLabel.Name = "modeloLabel";
            modeloLabel.Size = new System.Drawing.Size(45, 13);
            modeloLabel.TabIndex = 8;
            modeloLabel.Text = "Modelo:";
            // 
            // valorCompraLabel
            // 
            valorCompraLabel.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            valorCompraLabel.AutoSize = true;
            valorCompraLabel.ForeColor = System.Drawing.Color.White;
            valorCompraLabel.Location = new System.Drawing.Point(30, 210);
            valorCompraLabel.Name = "valorCompraLabel";
            valorCompraLabel.Size = new System.Drawing.Size(73, 13);
            valorCompraLabel.TabIndex = 10;
            valorCompraLabel.Text = "Valor Compra:";
            // 
            // label1
            // 
            label1.AutoSize = true;
            label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 20.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            label1.ForeColor = System.Drawing.Color.White;
            label1.Location = new System.Drawing.Point(17, 9);
            label1.Name = "label1";
            label1.Size = new System.Drawing.Size(212, 31);
            label1.TabIndex = 13;
            label1.Text = "Registro Activos";
            // 
            // label2
            // 
            label2.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            label2.AutoSize = true;
            label2.ForeColor = System.Drawing.Color.White;
            label2.Location = new System.Drawing.Point(27, 49);
            label2.Name = "label2";
            label2.Size = new System.Drawing.Size(76, 13);
            label2.TabIndex = 15;
            label2.Text = "Código Activo:";
            // 
            // label3
            // 
            label3.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            label3.AutoSize = true;
            label3.ForeColor = System.Drawing.Color.White;
            label3.Location = new System.Drawing.Point(9, 253);
            label3.Name = "label3";
            label3.Size = new System.Drawing.Size(75, 13);
            label3.TabIndex = 19;
            label3.Text = "Componentes:";
            // 
            // Estado_BS
            // 
            this.Estado_BS.DataSource = typeof(epn.inventarios.message.ItemCombo);
            // 
            // idProveedorComboBox
            // 
            this.idProveedorComboBox.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.idProveedorComboBox.DataBindings.Add(new System.Windows.Forms.Binding("SelectedValue", this.Equipo_BS, "IdProveedor", true));
            this.idProveedorComboBox.DataSource = this.Proveedores_BS;
            this.idProveedorComboBox.DisplayMember = "Nombre";
            this.idProveedorComboBox.FormattingEnabled = true;
            this.idProveedorComboBox.Location = new System.Drawing.Point(109, 127);
            this.idProveedorComboBox.Name = "idProveedorComboBox";
            this.idProveedorComboBox.Size = new System.Drawing.Size(517, 21);
            this.idProveedorComboBox.TabIndex = 3;
            this.idProveedorComboBox.ValueMember = "Id";
            // 
            // Equipo_BS
            // 
            this.Equipo_BS.DataSource = typeof(epn.inventarios.message.EquipoMsg);
            // 
            // Proveedores_BS
            // 
            this.Proveedores_BS.DataSource = typeof(epn.inventarios.message.ItemCombo);
            // 
            // idTipoEquipoComboBox
            // 
            this.idTipoEquipoComboBox.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.idTipoEquipoComboBox.DataBindings.Add(new System.Windows.Forms.Binding("SelectedValue", this.Equipo_BS, "IdTipoEquipo", true));
            this.idTipoEquipoComboBox.DataSource = this.TipoEquipo_BS;
            this.idTipoEquipoComboBox.DisplayMember = "Nombre";
            this.idTipoEquipoComboBox.FormattingEnabled = true;
            this.idTipoEquipoComboBox.Location = new System.Drawing.Point(110, 72);
            this.idTipoEquipoComboBox.Name = "idTipoEquipoComboBox";
            this.idTipoEquipoComboBox.Size = new System.Drawing.Size(517, 21);
            this.idTipoEquipoComboBox.TabIndex = 1;
            this.idTipoEquipoComboBox.ValueMember = "Id";
            // 
            // TipoEquipo_BS
            // 
            this.TipoEquipo_BS.DataSource = typeof(epn.inventarios.message.ItemCombo);
            // 
            // marcaTextBox
            // 
            this.marcaTextBox.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.marcaTextBox.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.Equipo_BS, "Marca", true));
            this.marcaTextBox.Location = new System.Drawing.Point(109, 155);
            this.marcaTextBox.Name = "marcaTextBox";
            this.marcaTextBox.Size = new System.Drawing.Size(517, 20);
            this.marcaTextBox.TabIndex = 4;
            // 
            // modeloTextBox
            // 
            this.modeloTextBox.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.modeloTextBox.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.Equipo_BS, "Modelo", true));
            this.modeloTextBox.Location = new System.Drawing.Point(109, 181);
            this.modeloTextBox.Name = "modeloTextBox";
            this.modeloTextBox.Size = new System.Drawing.Size(517, 20);
            this.modeloTextBox.TabIndex = 5;
            // 
            // valorCompraTextBox
            // 
            this.valorCompraTextBox.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.valorCompraTextBox.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.Equipo_BS, "ValorCompra", true));
            this.valorCompraTextBox.Location = new System.Drawing.Point(109, 207);
            this.valorCompraTextBox.Name = "valorCompraTextBox";
            this.valorCompraTextBox.Size = new System.Drawing.Size(517, 20);
            this.valorCompraTextBox.TabIndex = 6;
            // 
            // cmdGuardar
            // 
            this.cmdGuardar.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.cmdGuardar.Location = new System.Drawing.Point(535, 418);
            this.cmdGuardar.Name = "cmdGuardar";
            this.cmdGuardar.Size = new System.Drawing.Size(92, 23);
            this.cmdGuardar.TabIndex = 9;
            this.cmdGuardar.Text = "Guardar";
            this.cmdGuardar.UseVisualStyleBackColor = true;
            this.cmdGuardar.Click += new System.EventHandler(this.cmdInsert_Click);
            // 
            // comboBox1
            // 
            this.comboBox1.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.comboBox1.DataBindings.Add(new System.Windows.Forms.Binding("SelectedValue", this.Equipo_BS, "IdEstado", true));
            this.comboBox1.DataSource = this.Estado_BS;
            this.comboBox1.DisplayMember = "Nombre";
            this.comboBox1.FormattingEnabled = true;
            this.comboBox1.Location = new System.Drawing.Point(109, 99);
            this.comboBox1.Name = "comboBox1";
            this.comboBox1.Size = new System.Drawing.Size(517, 21);
            this.comboBox1.TabIndex = 2;
            this.comboBox1.ValueMember = "Id";
            // 
            // txtCodigoEquipo
            // 
            this.txtCodigoEquipo.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.txtCodigoEquipo.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.Equipo_BS, "CodigoActivo", true));
            this.txtCodigoEquipo.Enabled = false;
            this.txtCodigoEquipo.Location = new System.Drawing.Point(110, 46);
            this.txtCodigoEquipo.Name = "txtCodigoEquipo";
            this.txtCodigoEquipo.Size = new System.Drawing.Size(517, 20);
            this.txtCodigoEquipo.TabIndex = 0;
            this.txtCodigoEquipo.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.txtCodigoEquipo_KeyPress);
            // 
            // cmdConsultar
            // 
            this.cmdConsultar.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.cmdConsultar.Location = new System.Drawing.Point(420, 418);
            this.cmdConsultar.Name = "cmdConsultar";
            this.cmdConsultar.Size = new System.Drawing.Size(92, 23);
            this.cmdConsultar.TabIndex = 17;
            this.cmdConsultar.Text = "Consultar";
            this.cmdConsultar.UseVisualStyleBackColor = true;
            this.cmdConsultar.Visible = false;
            this.cmdConsultar.Click += new System.EventHandler(this.cmdConsultar_Click);
            // 
            // cmdHabilitarConsulta
            // 
            this.cmdHabilitarConsulta.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.cmdHabilitarConsulta.Location = new System.Drawing.Point(420, 418);
            this.cmdHabilitarConsulta.Name = "cmdHabilitarConsulta";
            this.cmdHabilitarConsulta.Size = new System.Drawing.Size(92, 23);
            this.cmdHabilitarConsulta.TabIndex = 8;
            this.cmdHabilitarConsulta.Text = "Habilitar Consulta";
            this.cmdHabilitarConsulta.UseVisualStyleBackColor = true;
            this.cmdHabilitarConsulta.Click += new System.EventHandler(this.cmdHabilitarConsulta_Click);
            // 
            // ListaComponentes_BS
            // 
            this.ListaComponentes_BS.DataSource = typeof(epn.inventarios.message.ComponenteMsg);
            this.ListaComponentes_BS.CurrentChanged += new System.EventHandler(this.ListaComponentes_BS_CurrentChanged);
            // 
            // cmdAgreagarComponente
            // 
            this.cmdAgreagarComponente.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.cmdAgreagarComponente.Location = new System.Drawing.Point(630, 268);
            this.cmdAgreagarComponente.Name = "cmdAgreagarComponente";
            this.cmdAgreagarComponente.Size = new System.Drawing.Size(25, 23);
            this.cmdAgreagarComponente.TabIndex = 20;
            this.cmdAgreagarComponente.Text = "+";
            this.cmdAgreagarComponente.UseVisualStyleBackColor = true;
            this.cmdAgreagarComponente.Click += new System.EventHandler(this.AgregarComponente_Click);
            // 
            // dataGridView1
            // 
            this.dataGridView1.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.dataGridView1.AutoGenerateColumns = false;
            this.dataGridView1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView1.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.textoComponenteDataGridViewTextBoxColumn,
            this.descripcionDataGridViewTextBoxColumn,
            this.IdEquipo});
            this.dataGridView1.DataSource = this.ListaComponentes_BS;
            this.dataGridView1.Location = new System.Drawing.Point(12, 269);
            this.dataGridView1.Name = "dataGridView1";
            this.dataGridView1.Size = new System.Drawing.Size(615, 112);
            this.dataGridView1.TabIndex = 21;
            // 
            // textoComponenteDataGridViewTextBoxColumn
            // 
            this.textoComponenteDataGridViewTextBoxColumn.DataPropertyName = "TextoComponente";
            this.textoComponenteDataGridViewTextBoxColumn.HeaderText = "Componente";
            this.textoComponenteDataGridViewTextBoxColumn.Name = "textoComponenteDataGridViewTextBoxColumn";
            // 
            // descripcionDataGridViewTextBoxColumn
            // 
            this.descripcionDataGridViewTextBoxColumn.DataPropertyName = "Descripcion";
            this.descripcionDataGridViewTextBoxColumn.HeaderText = "Descripción";
            this.descripcionDataGridViewTextBoxColumn.Name = "descripcionDataGridViewTextBoxColumn";
            this.descripcionDataGridViewTextBoxColumn.Width = 200;
            // 
            // IdEquipo
            // 
            this.IdEquipo.DataPropertyName = "IdEquipo";
            this.IdEquipo.HeaderText = "IdEquipo";
            this.IdEquipo.Name = "IdEquipo";
            // 
            // FrmRegistro
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.SystemColors.GrayText;
            this.ClientSize = new System.Drawing.Size(656, 453);
            this.Controls.Add(this.dataGridView1);
            this.Controls.Add(this.cmdAgreagarComponente);
            this.Controls.Add(label3);
            this.Controls.Add(this.cmdHabilitarConsulta);
            this.Controls.Add(this.cmdConsultar);
            this.Controls.Add(label2);
            this.Controls.Add(this.txtCodigoEquipo);
            this.Controls.Add(this.comboBox1);
            this.Controls.Add(label1);
            this.Controls.Add(this.cmdGuardar);
            this.Controls.Add(valorCompraLabel);
            this.Controls.Add(this.valorCompraTextBox);
            this.Controls.Add(modeloLabel);
            this.Controls.Add(this.modeloTextBox);
            this.Controls.Add(marcaLabel);
            this.Controls.Add(this.marcaTextBox);
            this.Controls.Add(idTipoEquipoLabel);
            this.Controls.Add(this.idTipoEquipoComboBox);
            this.Controls.Add(idProveedorLabel);
            this.Controls.Add(this.idProveedorComboBox);
            this.Controls.Add(idEstadoLabel);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "FrmRegistro";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Load += new System.EventHandler(this.FrmRegistro_Load);
            ((System.ComponentModel.ISupportInitialize)(this.Estado_BS)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.Equipo_BS)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.Proveedores_BS)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.TipoEquipo_BS)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.ListaComponentes_BS)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).EndInit();
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
        private System.Windows.Forms.Button cmdAgreagarComponente;
        private System.Windows.Forms.BindingSource ListaComponentes_BS;
        private System.Windows.Forms.DataGridView dataGridView1;
        private System.Windows.Forms.DataGridViewTextBoxColumn textoComponenteDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn descripcionDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn IdEquipo;

    }
}

