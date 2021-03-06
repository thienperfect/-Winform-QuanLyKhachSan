﻿using System.Collections;
using System.Windows.Forms;
namespace QuanLyKhachSan
{
    partial class fBatDau
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(fBatDau));
            this.label1 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.cbxDVGiaMin = new System.Windows.Forms.ComboBox();
            this.cbxDVSao = new System.Windows.Forms.ComboBox();
            this.label4 = new System.Windows.Forms.Label();
            this.cbxDVTp = new System.Windows.Forms.ComboBox();
            this.panel1 = new System.Windows.Forms.Panel();
            this.label2 = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.label6 = new System.Windows.Forms.Label();
            this.cbxDVGiaMax = new System.Windows.Forms.ComboBox();
            this.btnDVTimKiem = new System.Windows.Forms.Button();
            this.panel301 = new System.Windows.Forms.Panel();
            this.label201 = new System.Windows.Forms.Label();
            this.pictureBox101 = new System.Windows.Forms.PictureBox();
            this.panelDV = new System.Windows.Forms.Panel();
            this.txbTenKH = new System.Windows.Forms.TextBox();
            this.btnDVDxuat = new System.Windows.Forms.Button();
            this.btnDVDnhap = new System.Windows.Forms.Button();
            this.btnDVDki = new System.Windows.Forms.Button();
            this.dtgvTimKiemKhachSan = new System.Windows.Forms.DataGridView();
            this.labelChuY = new System.Windows.Forms.Label();
            this.btnDVLoad = new System.Windows.Forms.Button();
            this.label7 = new System.Windows.Forms.Label();
            this.panel1.SuspendLayout();
            this.panel301.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox101)).BeginInit();
            this.panelDV.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dtgvTimKiemKhachSan)).BeginInit();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.BackColor = System.Drawing.SystemColors.ButtonHighlight;
            this.label1.Font = new System.Drawing.Font("Segoe UI", 36F, ((System.Drawing.FontStyle)((System.Drawing.FontStyle.Bold | System.Drawing.FontStyle.Italic))), System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.ForeColor = System.Drawing.Color.DeepSkyBlue;
            this.label1.Location = new System.Drawing.Point(235, 67);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(322, 65);
            this.label1.TabIndex = 2;
            this.label1.Text = "Dịch vụ Ivivu";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("Segoe UI Black", 16F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label3.ForeColor = System.Drawing.Color.DeepSkyBlue;
            this.label3.Location = new System.Drawing.Point(247, 13);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(114, 30);
            this.label3.TabIndex = 4;
            this.label3.Text = "Hạng sao";
            // 
            // cbxDVGiaMin
            // 
            this.cbxDVGiaMin.BackColor = System.Drawing.SystemColors.InactiveBorder;
            this.cbxDVGiaMin.DisplayMember = "--Chọn giá";
            this.cbxDVGiaMin.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.cbxDVGiaMin.FormattingEnabled = true;
            this.cbxDVGiaMin.Items.AddRange(new object[] {
            "--Chọn giá",
            "0",
            "100000",
            "200000",
            "300000",
            "400000",
            "500000"});
            this.cbxDVGiaMin.Location = new System.Drawing.Point(99, 53);
            this.cbxDVGiaMin.Name = "cbxDVGiaMin";
            this.cbxDVGiaMin.Size = new System.Drawing.Size(107, 21);
            this.cbxDVGiaMin.TabIndex = 1;
            this.cbxDVGiaMin.Text = "--Chọn giá";
            // 
            // cbxDVSao
            // 
            this.cbxDVSao.BackColor = System.Drawing.SystemColors.InactiveBorder;
            this.cbxDVSao.DisplayMember = "--Chọn sao";
            this.cbxDVSao.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.cbxDVSao.FormattingEnabled = true;
            this.cbxDVSao.Items.AddRange(new object[] {
            "--Chọn hạng sao",
            "1",
            "2",
            "3",
            "4",
            "5"});
            this.cbxDVSao.Location = new System.Drawing.Point(254, 53);
            this.cbxDVSao.Name = "cbxDVSao";
            this.cbxDVSao.Size = new System.Drawing.Size(107, 21);
            this.cbxDVSao.TabIndex = 2;
            this.cbxDVSao.Text = "--Chọn hạng sao";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Font = new System.Drawing.Font("Segoe UI Black", 16F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label4.ForeColor = System.Drawing.Color.DeepSkyBlue;
            this.label4.Location = new System.Drawing.Point(399, 13);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(129, 30);
            this.label4.TabIndex = 8;
            this.label4.Text = "Thành phố";
            // 
            // cbxDVTp
            // 
            this.cbxDVTp.BackColor = System.Drawing.SystemColors.InactiveBorder;
            this.cbxDVTp.DisplayMember = "--Chọn thành phố";
            this.cbxDVTp.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.cbxDVTp.FormattingEnabled = true;
            this.cbxDVTp.Items.AddRange(new object[] {
            "--Chọn thành phố",
            "An Giang",
            "Bà Rịa-Vũng Tàu",
            "Bạc Liêu",
            "Bắc Kạn",
            "Bắc Giang",
            "Bắc Ninh",
            "Bến Tre",
            "Bình Dương",
            "Bình Định",
            "Bình Phước",
            "Bình Thuận",
            "Cà Mau",
            "Cao Bằng",
            "Cần Thơ ",
            "Đà Nẵng ",
            "Đắk Lắk",
            "Đắk Nông",
            "Điện Biên",
            "Đồng Nai",
            "Đồng Tháp",
            "Gia Lai",
            "Hà Giang",
            "Hà Nam",
            "Hà Nội ",
            "Hà Tây",
            "Hà Tĩnh",
            "Hải Dương",
            "Hải Phòng ",
            "Hòa Bình",
            "Hồ Chí Minh",
            "Hậu Giang",
            "Hưng Yên",
            "Khánh Hòa",
            "Kiên Giang",
            "Kon Tum",
            "Lai Châu",
            "Lào Cai",
            "Lạng Sơn",
            "Lâm Đồng",
            "Long An",
            "Nam Định",
            "Nghệ An",
            "Ninh Bình",
            "Ninh Thuận",
            "Phú Thọ",
            "Phú Yên",
            "Quảng Bình",
            "Quảng Nam",
            "Quảng Ngãi",
            "Quảng Ninh",
            "Quảng Trị",
            "Sóc Trăng",
            "Sơn La",
            "Tây Ninh",
            "Thái Bình",
            "Thái Nguyên",
            "Thanh Hóa",
            "Thừa Thiên - Huế",
            "Tiền Giang",
            "Trà Vinh",
            "Tuyên Quang",
            "Vĩnh Long",
            "Vĩnh Phúc",
            "Yên Bái"});
            this.cbxDVTp.Location = new System.Drawing.Point(404, 53);
            this.cbxDVTp.Name = "cbxDVTp";
            this.cbxDVTp.Size = new System.Drawing.Size(118, 21);
            this.cbxDVTp.TabIndex = 3;
            this.cbxDVTp.Text = "--Chọn thành phố";
            this.cbxDVTp.ValueMember = "--Chọn thành phố";
            // 
            // panel1
            // 
            this.panel1.Controls.Add(this.label2);
            this.panel1.Controls.Add(this.label5);
            this.panel1.Controls.Add(this.label6);
            this.panel1.Controls.Add(this.cbxDVGiaMax);
            this.panel1.Controls.Add(this.label3);
            this.panel1.Controls.Add(this.btnDVTimKiem);
            this.panel1.Controls.Add(this.cbxDVTp);
            this.panel1.Controls.Add(this.label4);
            this.panel1.Controls.Add(this.cbxDVGiaMin);
            this.panel1.Controls.Add(this.cbxDVSao);
            this.panel1.Location = new System.Drawing.Point(7, 175);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(691, 114);
            this.panel1.TabIndex = 10;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Segoe UI Black", 16F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.ForeColor = System.Drawing.Color.DeepSkyBlue;
            this.label2.Location = new System.Drawing.Point(39, 48);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(43, 30);
            this.label2.TabIndex = 12;
            this.label2.Text = "Từ";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Font = new System.Drawing.Font("Segoe UI Black", 16F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label5.ForeColor = System.Drawing.Color.DeepSkyBlue;
            this.label5.Location = new System.Drawing.Point(13, 13);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(196, 30);
            this.label5.TabIndex = 13;
            this.label5.Text = "Giá TB khách sạn";
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Font = new System.Drawing.Font("Segoe UI Black", 16F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label6.ForeColor = System.Drawing.Color.DeepSkyBlue;
            this.label6.Location = new System.Drawing.Point(26, 83);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(56, 30);
            this.label6.TabIndex = 11;
            this.label6.Text = "Đến";
            // 
            // cbxDVGiaMax
            // 
            this.cbxDVGiaMax.BackColor = System.Drawing.SystemColors.InactiveBorder;
            this.cbxDVGiaMax.DisplayMember = "--Chọn giá";
            this.cbxDVGiaMax.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.cbxDVGiaMax.FormattingEnabled = true;
            this.cbxDVGiaMax.Items.AddRange(new object[] {
            "--Chọn giá",
            "100000",
            "200000",
            "300000",
            "400000",
            "500000"});
            this.cbxDVGiaMax.Location = new System.Drawing.Point(99, 89);
            this.cbxDVGiaMax.Name = "cbxDVGiaMax";
            this.cbxDVGiaMax.Size = new System.Drawing.Size(107, 21);
            this.cbxDVGiaMax.TabIndex = 9;
            this.cbxDVGiaMax.Text = "--Chọn giá";
            // 
            // btnDVTimKiem
            // 
            this.btnDVTimKiem.BackColor = System.Drawing.Color.DeepSkyBlue;
            this.btnDVTimKiem.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnDVTimKiem.FlatAppearance.BorderSize = 0;
            this.btnDVTimKiem.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnDVTimKiem.Font = new System.Drawing.Font("Microsoft Sans Serif", 8F, System.Drawing.FontStyle.Bold);
            this.btnDVTimKiem.ForeColor = System.Drawing.SystemColors.ControlLightLight;
            this.btnDVTimKiem.Image = ((System.Drawing.Image)(resources.GetObject("btnDVTimKiem.Image")));
            this.btnDVTimKiem.ImageAlign = System.Drawing.ContentAlignment.TopLeft;
            this.btnDVTimKiem.Location = new System.Drawing.Point(564, 40);
            this.btnDVTimKiem.Name = "btnDVTimKiem";
            this.btnDVTimKiem.Size = new System.Drawing.Size(108, 34);
            this.btnDVTimKiem.TabIndex = 5;
            this.btnDVTimKiem.Text = "    TÌM KIẾM";
            this.btnDVTimKiem.UseVisualStyleBackColor = false;
            this.btnDVTimKiem.Click += new System.EventHandler(this.btnDVTimKiem_Click);
            // 
            // panel301
            // 
            this.panel301.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(192)))), ((int)(((byte)(192)))), ((int)(((byte)(255)))));
            this.panel301.Controls.Add(this.label201);
            this.panel301.Controls.Add(this.pictureBox101);
            this.panel301.Location = new System.Drawing.Point(64, 0);
            this.panel301.Name = "panel301";
            this.panel301.Size = new System.Drawing.Size(102, 137);
            this.panel301.TabIndex = 11;
            // 
            // label201
            // 
            this.label201.AutoSize = true;
            this.label201.Font = new System.Drawing.Font("Century Gothic", 14F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label201.ForeColor = System.Drawing.Color.DodgerBlue;
            this.label201.Location = new System.Drawing.Point(24, 94);
            this.label201.Name = "label201";
            this.label201.Size = new System.Drawing.Size(59, 23);
            this.label201.TabIndex = 3;
            this.label201.Text = "IVIVU";
            // 
            // pictureBox101
            // 
            this.pictureBox101.Image = ((System.Drawing.Image)(resources.GetObject("pictureBox101.Image")));
            this.pictureBox101.Location = new System.Drawing.Point(18, 16);
            this.pictureBox101.Name = "pictureBox101";
            this.pictureBox101.Size = new System.Drawing.Size(67, 63);
            this.pictureBox101.SizeMode = System.Windows.Forms.PictureBoxSizeMode.Zoom;
            this.pictureBox101.TabIndex = 4;
            this.pictureBox101.TabStop = false;
            // 
            // panelDV
            // 
            this.panelDV.Controls.Add(this.txbTenKH);
            this.panelDV.Controls.Add(this.btnDVDxuat);
            this.panelDV.Controls.Add(this.btnDVDnhap);
            this.panelDV.Controls.Add(this.btnDVDki);
            this.panelDV.Location = new System.Drawing.Point(336, 5);
            this.panelDV.Name = "panelDV";
            this.panelDV.Size = new System.Drawing.Size(367, 62);
            this.panelDV.TabIndex = 13;
            // 
            // txbTenKH
            // 
            this.txbTenKH.BackColor = System.Drawing.SystemColors.ButtonHighlight;
            this.txbTenKH.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.txbTenKH.Cursor = System.Windows.Forms.Cursors.Arrow;
            this.txbTenKH.Font = new System.Drawing.Font("Segoe UI", 16F, ((System.Drawing.FontStyle)((System.Drawing.FontStyle.Bold | System.Drawing.FontStyle.Italic))), System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txbTenKH.ForeColor = System.Drawing.Color.Indigo;
            this.txbTenKH.Location = new System.Drawing.Point(-162, 2);
            this.txbTenKH.Name = "txbTenKH";
            this.txbTenKH.Size = new System.Drawing.Size(524, 29);
            this.txbTenKH.TabIndex = 17;
            this.txbTenKH.Text = "Xin chào ";
            this.txbTenKH.TextAlign = System.Windows.Forms.HorizontalAlignment.Right;
            // 
            // btnDVDxuat
            // 
            this.btnDVDxuat.BackColor = System.Drawing.Color.DarkRed;
            this.btnDVDxuat.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnDVDxuat.FlatAppearance.BorderSize = 0;
            this.btnDVDxuat.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnDVDxuat.Font = new System.Drawing.Font("Microsoft Sans Serif", 8F, System.Drawing.FontStyle.Bold);
            this.btnDVDxuat.ForeColor = System.Drawing.SystemColors.ControlLightLight;
            this.btnDVDxuat.Image = global::QuanLyKhachSan.Properties.Resources.sign_out_option;
            this.btnDVDxuat.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnDVDxuat.Location = new System.Drawing.Point(251, 36);
            this.btnDVDxuat.Name = "btnDVDxuat";
            this.btnDVDxuat.Size = new System.Drawing.Size(111, 23);
            this.btnDVDxuat.TabIndex = 13;
            this.btnDVDxuat.Tag = "";
            this.btnDVDxuat.Text = "     ĐĂNG XUẤT";
            this.btnDVDxuat.UseVisualStyleBackColor = false;
            this.btnDVDxuat.Click += new System.EventHandler(this.btnDVDxuat_Click);
            // 
            // btnDVDnhap
            // 
            this.btnDVDnhap.BackColor = System.Drawing.Color.DarkRed;
            this.btnDVDnhap.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnDVDnhap.FlatAppearance.BorderSize = 0;
            this.btnDVDnhap.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnDVDnhap.Font = new System.Drawing.Font("Microsoft Sans Serif", 8F, System.Drawing.FontStyle.Bold);
            this.btnDVDnhap.ForeColor = System.Drawing.SystemColors.ControlLightLight;
            this.btnDVDnhap.Image = global::QuanLyKhachSan.Properties.Resources.man_user;
            this.btnDVDnhap.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnDVDnhap.Location = new System.Drawing.Point(154, 7);
            this.btnDVDnhap.Name = "btnDVDnhap";
            this.btnDVDnhap.Size = new System.Drawing.Size(111, 23);
            this.btnDVDnhap.TabIndex = 10;
            this.btnDVDnhap.Tag = "";
            this.btnDVDnhap.Text = "     ĐĂNG NHẬP";
            this.btnDVDnhap.UseVisualStyleBackColor = false;
            this.btnDVDnhap.Click += new System.EventHandler(this.btnDnhap_Click);
            // 
            // btnDVDki
            // 
            this.btnDVDki.BackColor = System.Drawing.Color.DarkRed;
            this.btnDVDki.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnDVDki.FlatAppearance.BorderSize = 0;
            this.btnDVDki.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnDVDki.Font = new System.Drawing.Font("Microsoft Sans Serif", 8F, System.Drawing.FontStyle.Bold);
            this.btnDVDki.ForeColor = System.Drawing.SystemColors.ControlLightLight;
            this.btnDVDki.Image = global::QuanLyKhachSan.Properties.Resources.pencil_edit_button;
            this.btnDVDki.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnDVDki.Location = new System.Drawing.Point(271, 7);
            this.btnDVDki.Name = "btnDVDki";
            this.btnDVDki.Size = new System.Drawing.Size(91, 23);
            this.btnDVDki.TabIndex = 12;
            this.btnDVDki.Tag = "";
            this.btnDVDki.Text = "     ĐĂNG KÍ";
            this.btnDVDki.UseVisualStyleBackColor = false;
            this.btnDVDki.Click += new System.EventHandler(this.btnDki_Click);
            // 
            // dtgvTimKiemKhachSan
            // 
            this.dtgvTimKiemKhachSan.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dtgvTimKiemKhachSan.BackgroundColor = System.Drawing.SystemColors.ButtonHighlight;
            this.dtgvTimKiemKhachSan.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.dtgvTimKiemKhachSan.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dtgvTimKiemKhachSan.Cursor = System.Windows.Forms.Cursors.Hand;
            this.dtgvTimKiemKhachSan.GridColor = System.Drawing.SystemColors.GradientActiveCaption;
            this.dtgvTimKiemKhachSan.Location = new System.Drawing.Point(36, 339);
            this.dtgvTimKiemKhachSan.Name = "dtgvTimKiemKhachSan";
            this.dtgvTimKiemKhachSan.Size = new System.Drawing.Size(641, 297);
            this.dtgvTimKiemKhachSan.TabIndex = 14;
            this.dtgvTimKiemKhachSan.CellClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dataGridView1_CellClick);
            // 
            // labelChuY
            // 
            this.labelChuY.AutoSize = true;
            this.labelChuY.Font = new System.Drawing.Font("Segoe UI Semibold", 11.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.labelChuY.ForeColor = System.Drawing.Color.DarkRed;
            this.labelChuY.Location = new System.Drawing.Point(32, 640);
            this.labelChuY.Name = "labelChuY";
            this.labelChuY.Size = new System.Drawing.Size(336, 20);
            this.labelChuY.TabIndex = 15;
            this.labelChuY.Text = "*Click vào dòng có phòng cần đặt để đặt phòng\r\n";
            // 
            // btnDVLoad
            // 
            this.btnDVLoad.BackColor = System.Drawing.SystemColors.ButtonHighlight;
            this.btnDVLoad.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnDVLoad.FlatAppearance.BorderSize = 0;
            this.btnDVLoad.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnDVLoad.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Bold);
            this.btnDVLoad.ForeColor = System.Drawing.Color.DeepSkyBlue;
            this.btnDVLoad.Image = ((System.Drawing.Image)(resources.GetObject("btnDVLoad.Image")));
            this.btnDVLoad.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnDVLoad.Location = new System.Drawing.Point(567, 300);
            this.btnDVLoad.Name = "btnDVLoad";
            this.btnDVLoad.Size = new System.Drawing.Size(110, 39);
            this.btnDVLoad.TabIndex = 9;
            this.btnDVLoad.Text = "       Refresh";
            this.btnDVLoad.UseVisualStyleBackColor = false;
            this.btnDVLoad.Click += new System.EventHandler(this.btnDVLoad_Click);
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Font = new System.Drawing.Font("Segoe UI Semibold", 11.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label7.ForeColor = System.Drawing.Color.DarkRed;
            this.label7.Location = new System.Drawing.Point(32, 312);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(197, 20);
            this.label7.TabIndex = 16;
            this.label7.Text = "Danh sách các phòng trống";
            // 
            // fBatDau
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.SystemColors.ButtonHighlight;
            this.ClientSize = new System.Drawing.Size(707, 689);
            this.Controls.Add(this.label7);
            this.Controls.Add(this.btnDVLoad);
            this.Controls.Add(this.labelChuY);
            this.Controls.Add(this.dtgvTimKiemKhachSan);
            this.Controls.Add(this.panelDV);
            this.Controls.Add(this.panel301);
            this.Controls.Add(this.panel1);
            this.Controls.Add(this.label1);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.MaximizeBox = false;
            this.Name = "fBatDau";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Ivivu";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.fBatDau_FormClosing);
            this.FormClosed += new System.Windows.Forms.FormClosedEventHandler(this.fBatDau_FormClosed);
            this.Load += new System.EventHandler(this.fBatDau_Load);
            this.panel1.ResumeLayout(false);
            this.panel1.PerformLayout();
            this.panel301.ResumeLayout(false);
            this.panel301.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox101)).EndInit();
            this.panelDV.ResumeLayout(false);
            this.panelDV.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dtgvTimKiemKhachSan)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }



        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Button btnDVTimKiem;
        private System.Windows.Forms.ComboBox cbxDVGiaMin;
        private System.Windows.Forms.ComboBox cbxDVSao;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.ComboBox cbxDVTp;
        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.Panel panel301;
        private System.Windows.Forms.Label label201;
        private System.Windows.Forms.PictureBox pictureBox101;
        private System.Windows.Forms.Button btnDVDnhap;
        private System.Windows.Forms.Button btnDVDki;
        private System.Windows.Forms.Panel panelDV;
        private System.Windows.Forms.DataGridView dtgvTimKiemKhachSan;
        private Label labelChuY;
        private Button btnDVDxuat;
        private Button btnDVLoad;
        private ComboBox cbxDVGiaMax;
        private Label label6;
        private Label label2;
        private Label label5;
        private Label label7;
        private TextBox txbTenKH;
        
    }
}

