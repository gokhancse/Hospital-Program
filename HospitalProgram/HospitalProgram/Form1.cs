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
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            if (txtPassword.Text == "" || txtUser.Text == "")
            {
                MessageBox.Show("Kullanıcı adı ve Şifre boş geçilemez!!", "HATA", MessageBoxButtons.OK, MessageBoxIcon.Error);
                txtPassword.Focus();
            }
            else
            {
                try
                {
                    string userName = "ADMIN";
                    string password = "12345";
                    if (txtPassword.Text.Trim().ToUpperInvariant() == password && txtUser.Text.Trim().ToUpperInvariant() == userName)
                    {
                        Form1 form = new Form1();
                        Home home = new Home();
                        home.Show();
                        form.Hide();
                    }
                    else
                    {
                        MessageBox.Show("Kullanıcı adı ve Şifre yanlış!!", "HATA", MessageBoxButtons.OK, MessageBoxIcon.Error);
                        txtPassword.Focus();
                    }

                }
                catch (Exception exc)
                {

                }
            }
        }
    }
}
