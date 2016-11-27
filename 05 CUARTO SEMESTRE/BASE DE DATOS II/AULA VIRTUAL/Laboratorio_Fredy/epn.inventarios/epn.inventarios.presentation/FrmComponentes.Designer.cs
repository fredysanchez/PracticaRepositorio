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
            System.Windows.Forms.Label label2;
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(FrmComponentes));
            this.label1 = new System.Windows.Forms.Label();
            this.button1 = new System.Windows.Forms.Button();
            this.Componente_BS = new System.Windows.Forms.BindingSource(this.components);
            this.cmbComponente = new System.Windows.Forms.ComboBox();
            this.EQ_Componentes_BS = new System.Windows.Forms.BindingSource(this.components);
            this.btmGuar = new System.Windows.Forms.Button();
            this.textBox1 = new System.Windows.Forms.TextBox();
            this.Descripcion = new System.Windows.Forms.GroupBox();
            this.textBox2 = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            label2 = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.Componente_BS)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.EQ_Componentes_BS)).BeginInit();
            this.Descripcion.SuspendLayout();
            this.SuspendLayout();
            // 
            // label2
            // 
            label2.AutoSize = true;
            label2.Font = new System.Drawing.Font("Microsoft YaHei UI", 20.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            label2.ForeColor = System.Drawing.Color.Black;
            label2.Location = new System.Drawing.Point(69, 9);
            label2.Name = "label2";
            label2.Size = new System.Drawing.Size(328, 35);
            label2.TabIndex = 14;
            label2.Text = "Registro Componentes";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(43, 64);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(133, 16);
            this.label1.TabIndex = 0;
            this.label1.Text = "Tipo componente:";
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(242, 151);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(158, 23);
            this.button1.TabIndex = 2;
            this.button1.Text = "Retornar";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // Componente_BS
            // 
            this.Componente_BS.DataSource = typeof(epn.inventarios.message.ItemCombo);
            // 
            // cmbComponente
            // 
            this.cmbComponente.DataBindings.Add(new System.Windows.Forms.Binding("SelectedValue", this.EQ_Componentes_BS, "Id", true));
            this.cmbComponente.DataSource = this.Componente_BS;
            this.cmbComponente.DisplayMember = "Nombre";
            this.cmbComponente.FormattingEnabled = true;
            this.cmbComponente.Location = new System.Drawing.Point(173, 64);
            this.cmbComponente.Name = "cmbComponente";
            this.cmbComponente.Size = new System.Drawing.Size(260, 21);
            this.cmbComponente.TabIndex = 3;
            this.cmbComponente.ValueMember = "Id";
            // 
            // EQ_Componentes_BS
            // 
            this.EQ_Componentes_BS.DataSource = typeof(epn.inventarios.message.ComponenteMsg);
            // 
            // btmGuar
            // 
            this.btmGuar.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btmGuar.Location = new System.Drawing.Point(275, 131);
            this.btmGuar.Name = "btmGuar";
            this.btmGuar.Size = new System.Drawing.Size(158, 23);
            this.btmGuar.TabIndex = 4;
            this.btmGuar.Text = "Guardar";
            this.btmGuar.UseVisualStyleBackColor = true;
            this.btmGuar.Click += new System.EventHandler(this.btmGuar_Click);
            // 
            // textBox1
            // 
            this.textBox1.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.textBox1.Location = new System.Drawing.Point(6, 19);
            this.textBox1.Multiline = true;
            this.textBox1.Name = "textBox1";
            this.textBox1.Size = new System.Drawing.Size(394, 126);
            this.textBox1.TabIndex = 5;
            // 
            // Descripcion
            // 
            this.Descripcion.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Center;
            this.Descripcion.Controls.Add(this.textBox1);
            this.Descripcion.Controls.Add(this.button1);
            this.Descripcion.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Descripcion.Location = new System.Drawing.Point(27, 162);
            this.Descripcion.Name = "Descripcion";
            this.Descripcion.Size = new System.Drawing.Size(406, 188);
            this.Descripcion.TabIndex = 6;
            this.Descripcion.TabStop = false;
            this.Descripcion.Text = "Descripcion";
            // 
            // textBox2
            // 
            this.textBox2.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.EQ_Componentes_BS, "Nombre", true));
            this.textBox2.Location = new System.Drawing.Point(173, 105);
            this.textBox2.Name = "textBox2";
            this.textBox2.Size = new System.Drawing.Size(260, 20);
            this.textBox2.TabIndex = 6;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label3.Location = new System.Drawing.Point(116, 106);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(57, 16);
            this.label3.TabIndex = 15;
            this.label3.Text = "Nuevo:";
            // 
            // FrmComponentes
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(445, 392);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.textBox2);
            this.Controls.Add(this.btmGuar);
            this.Controls.Add(label2);
            this.Controls.Add(this.Descripcion);
            this.Controls.Add(this.cmbComponente);
            this.Controls.Add(this.label1);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "FrmComponentes";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Load += new System.EventHandler(this.FrmComponentes_Load);
            ((System.ComponentModel.ISupportInitialize)(this.Componente_BS)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.EQ_Componentes_BS)).EndInit();
            this.Descripcion.ResumeLayout(false);
            this.Descripcion.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.BindingSource Componente_BS;
        private System.Windows.Forms.ComboBox cmbComponente;
        private System.Windows.Forms.BindingSource EQ_Componentes_BS;
        private System.Windows.Forms.Button btmGuar;
        private System.Windows.Forms.TextBox textBox1;
        private System.Windows.Forms.GroupBox Descripcion;
        private System.Windows.Forms.TextBox textBox2;
        private System.Windows.Forms.Label label3;
    }
}