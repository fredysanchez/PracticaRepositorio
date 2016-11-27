namespace epn.inventarios.presentation
{
    partial class FrmComponentes
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
            System.Windows.Forms.Label label1;
            System.Windows.Forms.Label descripcionLabel;
            System.Windows.Forms.Label idTipoComponenteLabel;
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(FrmComponentes));
            this.componenteMsg_BS = new System.Windows.Forms.BindingSource(this.components);
            this.descripcionTextBox = new System.Windows.Forms.TextBox();
            this.TipoComponente_BS = new System.Windows.Forms.BindingSource(this.components);
            this.cmdRegresar = new System.Windows.Forms.Button();
            this.comboBoxTipoComponente = new System.Windows.Forms.ComboBox();
            label1 = new System.Windows.Forms.Label();
            descripcionLabel = new System.Windows.Forms.Label();
            idTipoComponenteLabel = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.componenteMsg_BS)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.TipoComponente_BS)).BeginInit();
            this.SuspendLayout();
            // 
            // label1
            // 
            label1.AutoSize = true;
            label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 20.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            label1.ForeColor = System.Drawing.Color.White;
            label1.Location = new System.Drawing.Point(12, 9);
            label1.Name = "label1";
            label1.Size = new System.Drawing.Size(183, 31);
            label1.TabIndex = 14;
            label1.Text = "Componentes";
            // 
            // descripcionLabel
            // 
            descripcionLabel.AutoSize = true;
            descripcionLabel.ForeColor = System.Drawing.Color.White;
            descripcionLabel.Location = new System.Drawing.Point(15, 82);
            descripcionLabel.Name = "descripcionLabel";
            descripcionLabel.Size = new System.Drawing.Size(66, 13);
            descripcionLabel.TabIndex = 15;
            descripcionLabel.Text = "Descripción:";
            // 
            // idTipoComponenteLabel
            // 
            idTipoComponenteLabel.AutoSize = true;
            idTipoComponenteLabel.ForeColor = System.Drawing.Color.White;
            idTipoComponenteLabel.Location = new System.Drawing.Point(15, 57);
            idTipoComponenteLabel.Name = "idTipoComponenteLabel";
            idTipoComponenteLabel.Size = new System.Drawing.Size(94, 13);
            idTipoComponenteLabel.TabIndex = 21;
            idTipoComponenteLabel.Text = "Tipo Componente:";
            // 
            // componenteMsg_BS
            // 
            this.componenteMsg_BS.DataSource = typeof(epn.inventarios.message.ComponenteMsg);
            // 
            // descripcionTextBox
            // 
            this.descripcionTextBox.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)
                        | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.descripcionTextBox.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.componenteMsg_BS, "Descripcion", true));
            this.descripcionTextBox.Location = new System.Drawing.Point(18, 98);
            this.descripcionTextBox.Multiline = true;
            this.descripcionTextBox.Name = "descripcionTextBox";
            this.descripcionTextBox.Size = new System.Drawing.Size(572, 192);
            this.descripcionTextBox.TabIndex = 16;
            // 
            // TipoComponente_BS
            // 
            this.TipoComponente_BS.DataSource = typeof(epn.inventarios.message.ItemCombo);
            // 
            // cmdRegresar
            // 
            this.cmdRegresar.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.cmdRegresar.Location = new System.Drawing.Point(515, 308);
            this.cmdRegresar.Name = "cmdRegresar";
            this.cmdRegresar.Size = new System.Drawing.Size(75, 23);
            this.cmdRegresar.TabIndex = 23;
            this.cmdRegresar.Text = "<- Regresar";
            this.cmdRegresar.UseVisualStyleBackColor = true;
            this.cmdRegresar.Click += new System.EventHandler(this.cmdRegresar_Click);
            // 
            // comboBoxTipoComponente
            // 
            this.comboBoxTipoComponente.DataBindings.Add(new System.Windows.Forms.Binding("SelectedValue", this.componenteMsg_BS, "IdTipoComponente", true));
            this.comboBoxTipoComponente.DataSource = this.TipoComponente_BS;
            this.comboBoxTipoComponente.DisplayMember = "Nombre";
            this.comboBoxTipoComponente.FormattingEnabled = true;
            this.comboBoxTipoComponente.Location = new System.Drawing.Point(115, 57);
            this.comboBoxTipoComponente.Name = "comboBoxTipoComponente";
            this.comboBoxTipoComponente.Size = new System.Drawing.Size(475, 21);
            this.comboBoxTipoComponente.TabIndex = 24;
            this.comboBoxTipoComponente.ValueMember = "Id";
            // 
            // FrmComponentes
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.SystemColors.GrayText;
            this.ClientSize = new System.Drawing.Size(607, 349);
            this.Controls.Add(this.comboBoxTipoComponente);
            this.Controls.Add(this.cmdRegresar);
            this.Controls.Add(descripcionLabel);
            this.Controls.Add(this.descripcionTextBox);
            this.Controls.Add(idTipoComponenteLabel);
            this.Controls.Add(label1);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "FrmComponentes";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "FrmComponentes";
            ((System.ComponentModel.ISupportInitialize)(this.componenteMsg_BS)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.TipoComponente_BS)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.BindingSource componenteMsg_BS;
        private System.Windows.Forms.TextBox descripcionTextBox;
        private System.Windows.Forms.BindingSource TipoComponente_BS;
        private System.Windows.Forms.Button cmdRegresar;
        private System.Windows.Forms.ComboBox comboBoxTipoComponente;
    }
}