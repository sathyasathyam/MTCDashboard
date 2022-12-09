using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MTCDashboard
{
    public partial class Index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                this.BindGrid();
            }
        }
        private void BindGrid()
        {
            string constr = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT * FROM TBL_CALL_DETAILS WHERE VAR_OPTION = 'General Enquires'"))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            grdGeneral.DataSource = dt;
                            grdGeneral.DataBind();
                        }
                    }
                }
            }
        }
        protected void OnPageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdGeneral.PageIndex = e.NewPageIndex;
            this.BindGrid();
        }

        protected void grdGeneral_RowCommand(object sender, GridViewCommandEventArgs e) 
        {
            if (e.CommandName == "Save")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = grdGeneral.Rows[rowIndex];
                string Remarks = (row.FindControl("txtRemarks") as TextBox).Text;
                string SNO = (row.FindControl("lblSNO") as Label).Text;

                string query = "INSERT INTO TBL_CALL_DETAILS (VAR_REMARKS) VALUES(@Remarks) WHERE ID='" + SNO + "'";
                string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
                using (SqlConnection con = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand(query))
                    {
                        cmd.Parameters.AddWithValue("@Remarks", Remarks);
                        cmd.Connection = con;
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                    }
                }

                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Remarks saved successfully');", true);
                this.BindGrid();
            }
        }
    }
}
//commit//