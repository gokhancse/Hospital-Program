using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace HospitalProgram
{
    public partial class AcilEkle : Form
    {
        public string doctorID = "1";
        public string nursersID = "1";
        SqlConnection conn = new SqlConnection("Data Source = (local);Initial Catalog=proje;Trusted_Connection=True;");
        public AcilEkle()
        {
            InitializeComponent();
        }

        private void AcilEkle_Load(object sender, EventArgs e)
        {
            string sqlText ="select Namesurname from Nurses";
            SqlCommand cmd = new SqlCommand(sqlText, conn);
            conn.Open();
            SqlDataReader dr = null;
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                comboBox2.Items.Add(dr["Namesurname"].ToString().Trim());
            }

            conn.Close();

            SqlCommand cmd1 = new SqlCommand("select NameSurname from Doctors", conn);
            conn.Open();
            dr = null;
            dr = cmd1.ExecuteReader();
            while (dr.Read())
            {
                comboBox1.Items.Add(dr["Namesurname"].ToString().Trim());
            }
            conn.Close();
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("select TCNo from Doctors where Namesurname LIKE '%"+comboBox1.SelectedItem.ToString().Trim()+"%'",conn);
            if (conn.State == ConnectionState.Closed)
                conn.Open();
            SqlDataReader dr = null;
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                doctorID = dr["TCNo"].ToString().Trim();
            }
            conn.Close();
        }

        private void comboBox2_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("select TCNo from Nurses where Namesurname LIKE '%" + comboBox2.SelectedItem.ToString().Trim() + "%'", conn);
            if (conn.State == ConnectionState.Closed)
                conn.Open();
            SqlDataReader dr = null;
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                nursersID = dr["TCNo"].ToString().Trim();
            }
            conn.Close();

        }

        private void button1_Click(object sender, EventArgs e)
        {
            Detail detay = new Detail("acil");
            detay.Show();
            this.Hide();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void btn_save_Click(object sender, EventArgs e)
        {
            string sqltext = "INSERT INTO EmergencyService(Date,DoctorID,NursesID)VALUES('" + textBox1.Text.Trim() + "'," + doctorID + "," + nursersID + ")";
            SqlCommand cmd = new SqlCommand(sqltext, conn);
            if (conn.State == ConnectionState.Closed)
                conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
        }
    }
}
