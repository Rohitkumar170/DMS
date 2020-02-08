using System;
using BusinessLibrary;
using System.Text;
using DMS.Entity;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using DMS.Models.LoginClass;
namespace DMS
{
    
    public partial class login : System.Web.UI.Page
       
    {
         DMSNEWEntities context = new DMSNEWEntities();
       
        //CommonManger CommonManger = new CommonManger();
        [System.Web.Services.WebMethod()]
        [System.Web.Script.Services.ScriptMethod()]

        public static string Encryptdata(string password)
        {
            string strmsg = string.Empty;
            byte[] encode = new byte[password.Length];
            encode = Encoding.UTF8.GetBytes(password);
           return strmsg;
        }
        //   [System.Web.Services.WebMethod]
        public string Decryptdata(string encryptpwd)
        {
            string decryptpwd = string.Empty;
            UTF8Encoding encodepwd = new UTF8Encoding();
            Decoder Decode = encodepwd.GetDecoder();
            byte[] todecode_byte = Convert.FromBase64String(encryptpwd);
            int charCount = Decode.GetCharCount(todecode_byte, 0, todecode_byte.Length);
            char[] decoded_char = new char[charCount];
            Decode.GetChars(todecode_byte, 0, todecode_byte.Length, decoded_char, 0);
            decryptpwd = new String(decoded_char);
            return decryptpwd;
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
               
            }
        }

       
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {

                lblDispMessage.Text = "";
                lblDispMessage.Visible = false;
                string strErrMessage = string.Empty;
                #region Check conditions
                if (txtUserName.Value == "" && txtpassword.Value == "")
                {


                    lblDispMessage.Text = "Please enter a user name and valid password";
                    lblDispMessage.Style.Add("color", "red");
                    lblDispMessage.Visible = true;
                    return;
                }
                else
                {

                    lblDispMessage.Text = "";
                    lblDispMessage.Visible = false;
                }

                if (txtUserName.Value == "")
                {


                    lblDispMessage.Text = "Please enter a user name";
                    lblDispMessage.Style.Add("color", "red");
                    lblDispMessage.Visible = true;
                    return;
                }
                else
                {

                    lblDispMessage.Text = "";
                    lblDispMessage.Visible = false;
                }


                if (txtpassword.Value == "")
                {

                    lblDispMessage.Text = "Please enter Password";
                    lblDispMessage.Style.Add("color", "red");
                    lblDispMessage.Visible = true;
                    return;
                }
                else
                {

                    lblDispMessage.Text = "";
                    lblDispMessage.Visible = false;
                }

                #endregion
                if (txtpassword.Value != "" && txtUserName.Value != "")
                {
                    //DataSet dsUser = new DataSet();
                    //dsUser = Iace.User.User.GetUser(txtUserName.Value);
                    var results = context.MultipleResults("[dbo].[DMS_Login]").With<Logindetails>()
                           .Execute("@QueryType", "@Emailid", "UserAccess", txtUserName.Value);
                    foreach (List<Logindetails> cust in results)
                    {
                        if (cust.Count > 0)
                        {
                            if (cust.FirstOrDefault().EmailId == "0")
                            {
                                lblDispMessage.Text = "User is InActive!!";
                                lblDispMessage.Style.Add("color", "red");
                                lblDispMessage.Visible = true;
                            }
                            else if (cust.FirstOrDefault().EmailId == "-1")
                            {
                                lblDispMessage.Text = "Invalid User!!";
                                lblDispMessage.Style.Add("color", "red");
                                lblDispMessage.Visible = true;
                            }
                            else
                            {
                                string strDbPassword = DbSecurity.Decrypt(cust.FirstOrDefault().Password, cust.FirstOrDefault().PasswordKey);
                                if (strDbPassword != txtpassword.Value.Trim())
                                {
                                    lblDispMessage.Text = "Wrong  Password!!";
                                    lblDispMessage.Style.Add("color", "red");
                                    lblDispMessage.Visible = true;
                                }
                                else
                                {
                                    if (Convert.ToString(cust.FirstOrDefault().UserType) == "1")
                                    {
                                        Session["UserId"] = Convert.ToString(cust.FirstOrDefault().UserId);
                                        Session["EmailId"] = Convert.ToString(cust.FirstOrDefault().EmailId);
                                        Session["UserName"] = Convert.ToString(cust.FirstOrDefault().UserName);
                                        Session["WareHouseId"] = Convert.ToString(cust.FirstOrDefault().WareHouseId);
                                        Session["AccountNo"] = Convert.ToString(cust.FirstOrDefault().AccountNo);

                                        ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Only alert Message');", true);
                                        txtpassword.Value = "";
                                        txtUserName.Value = "";
                                        Response.Redirect("\\Home\\Dashboard.aspx");
                                    }
                                    else
                                    {

                                    }
                                }
                            }
                        }
                        else
                        {
                            txtUserName.Value = "";
                            lblDispMessage.Text = "Invalid User!!";
                            lblDispMessage.Style.Add("color", "red");
                            lblDispMessage.Visible = true;
                        }

                    }


                }

            }
            catch (Exception ex)
            {

            }
        }



    }
}