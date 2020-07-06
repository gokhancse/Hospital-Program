using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace HospitalProgram
{
    public partial class Home : Form
    {
        public Home()
        {
            InitializeComponent();
        }

        private void button8_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Detail detay = new Detail("doktor");
            detay.Show();
            this.Close();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Detail detay = new Detail("hemsire");
            detay.Show();
            this.Close();

        }

        private void button6_Click(object sender, EventArgs e)
        {
            Detail detay = new Detail("bolum");
            detay.Show();
            this.Close();
        }

        private void button5_Click(object sender, EventArgs e)
        {
            Detail detay = new Detail("hizmet");
            detay.Show();
            this.Close();

        }

        private void button3_Click(object sender, EventArgs e)
        {
            Detail detay = new Detail("acil");
            detay.Show();
            this.Close();


        }

        private void button4_Click(object sender, EventArgs e)
        {
            Detail detay = new Detail("idari");
            detay.Show();
            this.Close();
        }

        private void button7_Click(object sender, EventArgs e)
        {
            Detail detay = new Detail("arac");
            detay.Show();
            this.Close();

        }

        private void Home_Load(object sender, EventArgs e)
        {

        }

    }
}
