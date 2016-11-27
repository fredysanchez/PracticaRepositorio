namespace epn.inventarios.presentation
{
    partial class FrmMantenimientos
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            System.Windows.Forms.Label fechaMantenimientoLabel;
            System.Windows.Forms.Label idTecnicoLabel;
            System.Windows.Forms.Label idTipoMantenimientoLabel;
            System.Windows.Forms.Label idComponenteReeplazadoLabel;
            System.Windows.Forms.Label observacionesLabel;
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(FrmMantenimientos));
            this.Mantenimiento_BS = new System.Windows.Forms.BindingSource(this.components);
            this.fechaMantenimientoDateTimePicker = new System.Windows.Forms.DateTimePicker();
            this.idTecnicoComboBox = new System.Windows.Forms.ComboBox();
            this.Tecnico_BS = new System.Windows.Forms.BindingSource(this.components);
            this.idTipoMantenimientoComboBox = new System.Windows.Forms.ComboBox();
            this.TipoMantenimineto_BS = new System.Windows.Forms.BindingSource(this.components);
            this.checkBox1 = new System.Windows.Forms.CheckBox();
            this.panel1 = new System.Windows.Forms.Panel();
            this.idComponenteReeplazadoComboBox = new System.Windows.Forms.ComboBox();
            this.ReemplazoComponentes_BS = new System.Windows.Forms.BindingSource(this.components);
            this.Componente_BS = new System.Windows.Forms.BindingSource(this.components);
            this.TipoComponente_BS = new System.Windows.Forms.BindingSource(this.components);
            this.observacionesTextBox = new System.Windows.Forms.TextBox();
            this.btnregresar = new System.Windows.Forms.Button();
            fechaMantenimientoLabel = new System.Windows.Forms.Label();
            idTecnicoLabel = new System.Windows.Forms.Label();
            idTipoMantenimientoLabel = new System.Windows.Forms.Label();
            idComponenteReeplazadoLabel = new System.Windows.Forms.Label();
            observacionesLabel = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.Mantenimiento_BS)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.Tecnico_BS)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.TipoMantenimineto_BS)).BeginInit();
            this.panel1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.ReemplazoComponentes_BS)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.Componente_BS)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.TipoComponente_BS)).BeginInit();
            this.SuspendLayout();
            // 
            // fechaMantenimientoLabel
            // 
            fechaMantenimientoLabel.AutoSize = true;
            fechaMantenimientoLabel.Location = new System.Drawing.Point(28, 27);
            fechaMantenimientoLabel.Name = "fechaMantenimientoLabel";
            fechaMantenimientoLabel.Size = new System.Drawing.Size(112, 13);
            fechaMantenimientoLabel.TabIndex = 0;
            fechaMantenimientoLabel.Text = "Fecha Mantenimiento:";
            // 
            // idTecnicoLabel
            // 
            idTecnicoLabel.AutoSize = true;
            idTecnicoLabel.Location = new System.Drawing.Point(28, 70);
            idTecnicoLabel.Name = "idTecnicoLabel";
            idTecnicoLabel.Size = new System.Drawing.Size(49, 13);
            idTecnicoLabel.TabIndex = 6;
            idTecnicoLabel.Text = "Técnico:";
            // 
            // idTipoMantenimientoLabel
            // 
            idTipoMantenimientoLabel.AutoSize = true;
            idTipoMantenimientoLabel.Location = new System.Drawing.Point(28, 97);
            idTipoMantenimientoLabel.Name = "idTipoMantenimientoLabel";
            idTipoMantenimientoLabel.Size = new System.Drawing.Size(103, 13);
            idTipoMantenimientoLabel.TabIndex = 8;
            idTipoMantenimientoLabel.Text = "Tipo Mantenimiento:";
            // 
            // idComponenteReeplazadoLabel
            // 
            idComponenteReeplazadoLabel.AutoSize = true;
            idComponenteReeplazadoLabel.Location = new System.Drawing.Point(11, 15);
            idComponenteReeplazadoLabel.Name = "idComponenteReeplazadoLabel";
            idComponenteReeplazadoLabel.Size = new System.Drawing.Size(130, 13);
            idComponenteReeplazadoLabel.TabIndex = 0;
            idComponenteReeplazadoLabel.Text = "Componente Reeplazado:";
            // 
            // observacionesLabel
            // 
            observacionesLabel.AutoSize = true;
            observacionesLabel.Location = new System.Drawing.Point(19, 40);
            observacionesLabel.Name = "observacionesLabel";
            observacionesLabel.Size = new System.Drawing.Size(81, 13);
            observacionesLabel.TabIndex = 4;
            observacionesLabel.Text = "Observaciones:";
            // 
            // Mantenimiento_BS
            // 
            this.Mantenimiento_BS.DataSource = typeof(epn.inventarios.message.MantenimientoMSg);
            // 
            // fechaMantenimientoDateTimePicker
            // 
            this.fechaMantenimientoDateTimePicker.DataBindings.Add(new System.Windows.Forms.Binding("Value", this.Mantenimiento_BS, "FechaMantenimiento", true));
            this.fechaMantenimientoDateTimePicker.Location = new System.Drawing.Point(149, 23);
            this.fechaMantenimientoDateTimePicker.Name = "fechaMantenimientoDateTimePicker";
            this.fechaMantenimientoDateTimePicker.Size = new System.Drawing.Size(200, 20);
            this.fechaMantenimientoDateTimePicker.TabIndex = 1;
            // 
            // idTecnicoComboBox
            // 
            this.idTecnicoComboBox.DataBindings.Add(new System.Windows.Forms.Binding("SelectedValue", this.Mantenimiento_BS, "IdTecnico", true));
            this.idTecnicoComboBox.DataSource = this.Tecnico_BS;
            this.idTecnicoComboBox.DisplayMember = "Nombre";
            this.idTecnicoComboBox.FormattingEnabled = true;
            this.idTecnicoComboBox.Location = new System.Drawing.Point(149, 67);
            this.idTecnicoComboBox.Name = "idTecnicoComboBox";
            this.idTecnicoComboBox.Size = new System.Drawing.Size(200, 21);
            this.idTecnicoComboBox.TabIndex = 7;
            this.idTecnicoComboBox.ValueMember = "Id";
            // 
            // Tecnico_BS
            // 
            this.Tecnico_BS.DataSource = typeof(epn.inventarios.message.ItemCombo);
            // 
            // idTipoMantenimientoComboBox
            // 
            this.idTipoMantenimientoComboBox.DataBindings.Add(new System.Windows.Forms.Binding("SelectedValue", this.Mantenimiento_BS, "IdTipoMantenimiento", true));
            this.idTipoMantenimientoComboBox.DataSource = this.TipoMantenimineto_BS;
            this.idTipoMantenimientoComboBox.DisplayMember = "Nombre";
            this.idTipoMantenimientoComboBox.FormattingEnabled = true;
            this.idTipoMantenimientoComboBox.Location = new System.Drawing.Point(149, 94);
            this.idTipoMantenimientoComboBox.Name = "idTipoMantenimientoComboBox";
            this.idTipoMantenimientoComboBox.Size = new System.Drawing.Size(200, 21);
            this.idTipoMantenimientoComboBox.TabIndex = 9;
            this.idTipoMantenimientoComboBox.ValueMember = "Id";
            // 
            // TipoMantenimineto_BS
            // 
            this.TipoMantenimineto_BS.DataSource = typeof(epn.inventarios.message.ItemCombo);
            // 
            // checkBox1
            // 
            this.checkBox1.AutoSize = true;
            this.checkBox1.Location = new System.Drawing.Point(31, 143);
            this.checkBox1.Name = "checkBox1";
            this.checkBox1.Size = new System.Drawing.Size(184, 17);
            this.checkBox1.TabIndex = 10;
            this.checkBox1.Text = "Se Reemplazaron Componentes?";
            this.checkBox1.UseVisualStyleBackColor = true;
            // 
            // panel1
            // 
            this.panel1.Controls.Add(idComponenteReeplazadoLabel);
            this.panel1.Controls.Add(this.idComponenteReeplazadoComboBox);
            this.panel1.Controls.Add(observacionesLabel);
            this.panel1.Controls.Add(this.observacionesTextBox);
            this.panel1.Location = new System.Drawing.Point(31, 166);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(351, 128);
            this.panel1.TabIndex = 11;
            // 
            // idComponenteReeplazadoComboBox
            // 
            this.idComponenteReeplazadoComboBox.DataBindings.Add(new System.Windows.Forms.Binding("SelectedValue", this.Componente_BS, "IdTipoComponente", true));
            this.idComponenteReeplazadoComboBox.DataSource = this.TipoComponente_BS;
            this.idComponenteReeplazadoComboBox.DisplayMember = "Nombre";
            this.idComponenteReeplazadoComboBox.FormattingEnabled = true;
            this.idComponenteReeplazadoComboBox.Location = new System.Drawing.Point(159, 12);
            this.idComponenteReeplazadoComboBox.Name = "idComponenteReeplazadoComboBox";
            this.idComponenteReeplazadoComboBox.Size = new System.Drawing.Size(159, 21);
            this.idComponenteReeplazadoComboBox.TabIndex = 1;
            this.idComponenteReeplazadoComboBox.ValueMember = "Id";
            // 
            // ReemplazoComponentes_BS
            // 
            this.ReemplazoComponentes_BS.DataSource = typeof(epn.inventarios.message.MantenimientoReemplazoComponentesMsg);
            // 
            // Componente_BS
            // 
            this.Componente_BS.DataSource = typeof(epn.inventarios.message.ComponenteMsg);
            // 
            // TipoComponente_BS
            // 
            this.TipoComponente_BS.DataSource = typeof(epn.inventarios.message.ItemCombo);
            // 
            // observacionesTextBox
            // 
            this.observacionesTextBox.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.ReemplazoComponentes_BS, "Observaciones", true));
            this.observacionesTextBox.Location = new System.Drawing.Point(22, 56);
            this.observacionesTextBox.Multiline = true;
            this.observacionesTextBox.Name = "observacionesTextBox";
            this.observacionesTextBox.Size = new System.Drawing.Size(296, 57);
            this.observacionesTextBox.TabIndex = 5;
            // 
            // btnregresar
            // 
            this.btnregresar.ForeColor = System.Drawing.SystemColors.ActiveCaptionText;
            this.btnregresar.Location = new System.Drawing.Point(307, 322);
            this.btnregresar.Name = "btnregresar";
            this.btnregresar.Size = new System.Drawing.Size(75, 23);
            this.btnregresar.TabIndex = 12;
            this.btnregresar.Text = "<< Regresar";
            this.btnregresar.UseVisualStyleBackColor = true;
            this.btnregresar.Click += new System.EventHandler(this.btnregresar_Click);
            // 
            // FrmMantenimientos
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.SystemColors.ControlDarkDark;
            this.ClientSize = new System.Drawing.Size(431, 357);
            this.Controls.Add(this.btnregresar);
            this.Controls.Add(this.panel1);
            this.Controls.Add(this.checkBox1);
            this.Controls.Add(fechaMantenimientoLabel);
            this.Controls.Add(this.fechaMantenimientoDateTimePicker);
            this.Controls.Add(idTecnicoLabel);
            this.Controls.Add(this.idTecnicoComboBox);
            this.Controls.Add(idTipoMantenimientoLabel);
            this.Controls.Add(this.idTipoMantenimientoComboBox);
            this.ForeColor = System.Drawing.SystemColors.ButtonHighlight;
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "FrmMantenimientos";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "FrmMantenimientos";
            ((System.ComponentModel.ISupportInitialize)(this.Mantenimiento_BS)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.Tecnico_BS)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.TipoMantenimineto_BS)).EndInit();
            this.panel1.ResumeLayout(false);
            this.panel1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.ReemplazoComponentes_BS)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.Componente_BS)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.TipoComponente_BS)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.BindingSource Mantenimiento_BS;
        private System.Windows.Forms.DateTimePicker fechaMantenimientoDateTimePicker;
        private System.Windows.Forms.ComboBox idTecnicoComboBox;
        private System.Windows.Forms.ComboBox idTipoMantenimientoComboBox;
        private System.Windows.Forms.CheckBox checkBox1;
        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.ComboBox idComponenteReeplazadoComboBox;
        private System.Windows.Forms.BindingSource ReemplazoComponentes_BS;
        private System.Windows.Forms.TextBox observacionesTextBox;
        private System.Windows.Forms.BindingSource Tecnico_BS;
        private System.Windows.Forms.BindingSource TipoMantenimineto_BS;
        private System.Windows.Forms.BindingSource TipoComponente_BS;
        private System.Windows.Forms.BindingSource Componente_BS;
        private System.Windows.Forms.Button btnregresar;
    }
}