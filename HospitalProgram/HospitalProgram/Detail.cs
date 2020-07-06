using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Globalization;

namespace HospitalProgram
{
    public partial class Detail : Form
    {
        public string data = "";
        public string day = "";
        public string month = "";
        public string year = "";
        SqlConnection conn = new SqlConnection("Data Source = (local);Initial Catalog=proje;Trusted_Connection=True;");
        DateTimeFormatInfo ukDtf = new CultureInfo("en-GB", false).DateTimeFormat;
        public Detail(string type)
        {
            InitializeComponent();
            data = type;
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Close();
            Home form = new Home();
            form.Show();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Application.Exit();

        }

        private void Detail_Load(object sender, EventArgs e)
        {
            
            try
            {
                
                string sqlText = "";
                if (data == "doktor") { sqlText= "SELECT d.NameSurname,d.TCNo,dept.Department, d.Salary FROM Doctors d INNER JOIN Departments dept ON dept.DepartmentID = d.Department"; }
                if (data == "hemsire") { sqlText = "SELECT d.NameSurname,d.TCNo,dept.Department FROM Nurses d INNER JOIN Departments dept ON dept.DepartmentID = d.Department"; }
                if (data == "bolum") { sqlText = "SELECT * FROM Departments"; }
                if (data == "hizmet") { sqlText = "SELECT * FROM Staff"; }
                if (data == "idari") { sqlText = "SELECT d.NameSurname,d.TCNo,dept.Department FROM Managers d INNER JOIN Departments dept ON dept.DepartmentID = d.Department"; }
                if (data == "arac") { sqlText = "SELECT * FROM Ambulance"; }
                if (data == "acil") { sqlText = "SELECT e.Date,d.NameSurname,n.Namesurname FROM EmergencyService e, Doctors d, Nurses n WHERE e.DoctorID = d.TCNo AND n.TCNo = e.NursesID"; }

                SqlDataAdapter da = new SqlDataAdapter(sqlText, conn);
                conn.Open();
                DataSet ds = new DataSet();

                da.Fill(ds, "data");
                dgvData.DataSource = ds;
                dgvData.DataMember = "data";
                conn.Close();
            }
            catch (Exception exc)
            {
                MessageBox.Show(exc.Message, "HATA", MessageBoxButtons.OK, MessageBoxIcon.Error);
                conn.Close();
            }
        }

        private void btn_ekle_Click(object sender, EventArgs e)
        {
            Insert insert = new Insert(data);
            insert.Show();
            this.Hide();
        }

        private void dgvData_UserDeletedRow(object sender, DataGridViewRowEventArgs e)
        {
            

        }

        private void dgvData_UserDeletingRow(object sender, DataGridViewRowCancelEventArgs e)
        {
            

            string sqlText = "";
            if (data == "doktor") { sqlText = "delete from Doctors where TCNo='" + dgvData.Rows[e.Row.Index].Cells[1].Value.ToString().Trim() +"'"; }
            if (data == "hemsire") { sqlText = "delete FROM Nurses where TCNo='" + dgvData.Rows[e.Row.Index].Cells[1].Value.ToString().Trim() +"'"; }
            if (data == "bolum") { sqlText = "DELETE FROM Departments where DepartmentID =" + dgvData.Rows[e.Row.Index].Cells[0].Value.ToString(); }
            if (data == "hizmet") { sqlText = "DELETE FROM Staff where TCNo='" + dgvData.Rows[e.Row.Index].Cells[1].Value.ToString().Trim() + "'"; }
            if (data == "idari") { sqlText = "DELETE FROM Managers where TCNo='" + dgvData.Rows[e.Row.Index].Cells[1].Value.ToString().Trim() + "'"; }
            if (data == "arac") { sqlText = "DELETE FROM Ambulance WHERE Plate ='" + dgvData.Rows[e.Row.Index].Cells[0].Value.ToString().Trim() + "'"; }
            if (data == "acil") 
            {
                day = Convert.ToDateTime(dgvData.Rows[e.Row.Index].Cells[0].Value.ToString().Trim(), ukDtf).Day.ToString();
                month = Convert.ToDateTime(dgvData.Rows[e.Row.Index].Cells[0].Value.ToString().Trim(), ukDtf).Month.ToString();
                year = Convert.ToDateTime(dgvData.Rows[e.Row.Index].Cells[0].Value.ToString().Trim(), ukDtf).Year.ToString();
                  sqlText = "DELETE FROM EmergencyService WHERE Date = '" +year+"-"+month+"-"+day+ "'"; }

            SqlCommand cmd = new SqlCommand(sqlText, conn);
            if (conn.State == ConnectionState.Closed)
                conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
        }

    }
}
