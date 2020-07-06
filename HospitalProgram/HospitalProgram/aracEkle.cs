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
    public partial class aracEkle : Form
    {
        SqlConnection conn = new SqlConnection("Data Source = (local);Initial Catalog=proje;Trusted_Connection=True;");
        public aracEkle()
        {
            InitializeComponent();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            Detail detay = new Detail("arac");
            detay.Show();
            this.Close();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void btn_save_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand();
            string sqltext = "INSERT INTO Ambulance(Plate,Driver,CarModel)VALUES('" + textBox1.Text.Trim() +"','"+textBox2.Text.Trim()+"','"+textBox3.Text.Trim()+"')";
            cmd.CommandText = sqltext;
            cmd.Connection = conn;
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();

        }
    }
}
