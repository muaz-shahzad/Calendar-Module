using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
//using System.Data.SqlClient;


namespace FiverModule
{
    public partial class _Default : Page
    {
        
        //private object dateTimePickerAdv1;

        //SQL CONNECTION
        SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-3CTATRN;Initial Catalog=Calendar_Module;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Visible = false;
            RadioButtonList1.Visible = false;
            Button1.Visible = false;
            if (!Page.IsPostBack)
            {
                Calendar1.TodaysDate = System.DateTime.Now;
               
            }
            
        }
        protected void Calendar1_DayRender(object sender, DayRenderEventArgs e)
        {
            if (e.Day.IsOtherMonth)
            {
                e.Cell.Controls.Clear();
                e.Cell.Text = string.Empty;
            }
            if (e.Day.Date.CompareTo(DateTime.Today) < 0)
            {
                e.Day.IsSelectable = false;
            }
          
        }

        

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            Label1.Text = Calendar1.SelectedDate.ToLongDateString();
           


        }

        protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
        {
           
        }

        
        protected void Button1_Click(object sender, EventArgs e)
        {

            try
            {
                String cTime = "";
                for (int i = 0; i < RadioButtonList1.Items.Count; i++)
                {
                    if (RadioButtonList1.Items[i].Selected)
                    {
                        cTime = RadioButtonList1.Items[i].Text;


                        break;
                    }
                }
              

                String cdate = Label1.Text +" "+ cTime;
                String Datee = Label1.Text;
                con.Open();
                SqlCommand com = new SqlCommand("EXEC ReservedSlot_SP '" + cdate + "'", con);
                SqlCommand dat = new SqlCommand("EXEC DateSlot_SP '" + Datee + "'", con);
                com.ExecuteNonQuery();
                dat.ExecuteNonQuery();
                con.Close();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('successfully inserted');", true);
                Label1.Visible = false;
                RadioButtonList1.Visible = false;
                Button1.Visible = false;
               

            }
            catch (Exception)
            {
             ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Slot Already  Taken');", true);
            }
          
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            
            if (Label1.Text=="")
            {
               
                Label1.Visible = false;
                RadioButtonList1.Visible = false;
                Button1.Visible = false;
            }
            else
            {
                Label1.Visible = true;
                RadioButtonList1.Visible = true;
                Button1.Visible = true;
            }
        }
    }
}