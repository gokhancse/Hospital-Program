using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace HospitalProgram
{
    public partial class Insert : Form
    {
        public string data = "";
        public string departmentID = "1";
        public string workingFloor = "1";
        SqlConnection conn = new SqlConnection("Data Source = (local);Initial Catalog=proje;Trusted_Connection=True;");
        
        public Insert(string dataType)
        {
            InitializeComponent();
            data = dataType;
        }

        private void Insert_Load(object sender, EventArgs e)
        {
            SqlDataAdapter da = new SqlDataAdapter("select Department from Departments", conn);
            conn.Open();
            DataSet ds = new DataSet();
            da.Fill(ds, "Data");

            for(int i =0;i<ds.Tables["Data"].Rows.Count;i++)
                comboBox1.Items.Add(ds.Tables["Data"].Rows[i]["Department"].ToString().Trim());
            conn.Close();
            if (data == "arac") { aracEkle arac = new aracEkle(); arac.Show(); this.Close(); }
            if (data == "acil") { AcilEkle form = new AcilEkle(); form.Show(); this.Close(); }
            if (data == "bolum") { departmanEkle dept = new departmanEkle(); dept.Show(); this.Close(); }


                       
        }

        private void btn_save_Click(object sender, EventArgs e)
        {

            try
            {
                

                string sqlText = "";
                if (data == "doktor") { sqlText = "INSERT INTO Doctors(NameSurname,TCNo,Department,StartingDate,Salary)VALUES('" + txtName.Text.Trim() + "','" + txtTC.Text.Trim() + "'," + departmentID + ",'" + txtDate.Text.Trim() + "'," + txtSalary.Text.Trim() + ")"; }
                if (data == "hemsire") { sqlText = "INSERT INTO Nurses(NameSurname,TCNo,Department,StartingDate,Salary)VALUES('" + txtName.Text.Trim() + "','" + txtTC.Text.Trim() + "'," + departmentID + ",'" + txtDate.Text.Trim() + "'," + txtSalary.Text.Trim() + ")"; }
                if (data == "hizmet") { sqlText = "INSERT INTO Staff(NameSurname,TCNo,Department,StartingDate,Salary)VALUES('" + txtName.Text.Trim() + "','" + txtTC.Text.Trim() + "'," +  workingFloor.Trim()+ ",'" + txtDate.Text.Trim() + "'," + txtSalary.Text.Trim() + ")"; }
                if (data == "idari") { sqlText = "INSERT INTO Managers(NameSurname,TCNo,Department,StartingDate,Salary)VALUES('" + txtName.Text.Trim() + "','" + txtTC.Text.Trim() + "'," + departmentID + ",'" + txtDate.Text.Trim() + "'," + txtSalary.Text.Trim() + ")"; }



                conn.Open();
                SqlCommand cmd = new SqlCommand(sqlText, conn);
                cmd.ExecuteNonQuery();

                conn.Close();
            }
            catch (Exception exc)
            {
                MessageBox.Show(exc.Message, "HATA", MessageBoxButtons.OK, MessageBoxIcon.Error);
                conn.Close();
            }
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string sqlText = "select DepartmentID, Place from Departments where Department LIKE '%"+comboBox1.SelectedItem.ToString().Trim()+"%'";
            SqlCommand cmd = new SqlCommand(sqlText, conn);
            if(conn.State == ConnectionState.Closed)
                conn.Open();
            SqlDataReader dr = null;
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                departmentID = dr["DepartmentID"].ToString().Trim();
                workingFloor = dr["Place"].ToString().Trim();
            }
            conn.Close();

        }

        private void button2_Click(object sender, EventArgs e)
        {
            Application.Exit();

        }

        private void button1_Click(object sender, EventArgs e)
        {
            Detail detay = new Detail(data);
            detay.Show();
            this.Hide();
        }
    }
}
