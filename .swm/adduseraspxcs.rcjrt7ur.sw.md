---
title: AddUser.aspx.cs
---
&nbsp;

<SwmSnippet path="/AddUser.aspx.cs" line="1">

---

This code snippet is a partial class AddUser that represents a web page. It contains event handlers for Page_Init and Page_Load. In Page_Init, it checks if the UserLoginID session variable is null and redirects to the login page if it is. Otherwise, it checks if the UserLoginID session variable is equal to 'ADMINIT' or if the IsAdmin session variable is not null and the Division_Id session variable is equal to 13, and sets the visibility of the divMain element accordingly. In Page_Load, it initializes an instance of the TravelBulkImportMgr class, sets the visibility of the divDOBCalendar element to hidden, and adds an onclick event handler to the imgbtnDOBClndr element. It also sets an OnBlur event handler for the txtLoginId element. Then, if the page is not a postback, it populates the ddlSalutation and ddlCustCountry dropdown lists with data from the BindSalutation and BindCountry methods of the TravelBulkImportMgr class respectively.

```c#
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TravelBulkImport.Code;
using BulkImport;
using Skaffold.Utilities;
using Skaffold.Log;
using System.Web.Security;
using System.Data;
using System.Collections;

namespace TDITravel
{
    public partial class AddUser : System.Web.UI.Page
    {
        protected void Page_Init(object sender, EventArgs e)
        {
            if (SessionObject.Get("UserLoginID") == null)
                FormsAuthentication.RedirectToLoginPage();
            else
            {
                if (SessionObject.Get("UserLoginID").ToString().ToUpper() == "ADMINIT" || (Session["IsAdmin"] != null && int.Parse(Session["Division_Id"].ToString()) == 13))
                { divMain.Visible = true; }
                else { divMain.InnerText = "You are not authorized to view this page"; }
            }
        } 

        protected void Page_Load(object sender, EventArgs e)
        {
            TravelBulkImportMgr db = new TravelBulkImportMgr();
            divDOBCalendar.Style.Add("visibility", "hidden");
            imgbtnDOBClndr.Attributes.Add("onclick", "return showhideCalendar('" + divDOBCalendar.ClientID + "');");
            txtLoginId.Attributes.Add("OnBlur", "return validateLogin()");


            if (!Page.IsPostBack)
            {
                ddlSalutation.Items.Clear();
                ddlSalutation.DataTextField = "Name";
                ddlSalutation.DataValueField = "Id";
                ddlSalutation.DataSource = db.BindSalutation();
                ddlSalutation.DataBind();
                ddlSalutation.Items.Insert(0, new ListItem("- Please Select -", "0"));


                ddlCustCountry.Items.Clear();
                ddlCustCountry.DataTextField = "Name";
                ddlCustCountry.DataValueField = "Id";
                ddlCustCountry.DataSource = db.BindCountry();
                ddlCustCountry.DataBind();
                ddlCustCountry.Items.Insert(0, new ListItem("- Please Select -", "0"));

                BindBranch();
            }


        }

        private void BindCity(int countryid, int cityid)
        {
            ddlCustCity.Items.Clear();

            TravelBulkImportMgr db = new TravelBulkImportMgr();
            ddlCustCity.DataTextField = "Name";
            ddlCustCity.DataValueField = "Id";
            ddlCustCity.DataSource = db.BindCity(countryid).OrderBy(p => p.Name);
            ddlCustCity.DataBind();
            ddlCustCity.Items.Insert(0, new ListItem("- Please Select -", "0"));
            if (cityid != 0)
            { ddlCustCity.Items.FindByValue(cityid.ToString()).Selected = true; }
        }

        private void BindArea(int cityid, int areaid)
        {
            ddlCustArea.Items.Clear();

            TravelBulkImportMgr db = new TravelBulkImportMgr();
            ddlCustArea.DataTextField = "Name";
            ddlCustArea.DataValueField = "Id";
            ddlCustArea.DataSource = db.BindArea(cityid).OrderBy(p => p.Name);
            ddlCustArea.DataBind();
            ddlCustArea.Items.Insert(0, new ListItem("- Please Select -", "0"));
            if (areaid != 0)
            { ddlCustArea.Items.FindByValue(areaid.ToString()).Selected = true; }
        }

        private void BindBranch()
        {
            TravelBulkImportMgr db = new TravelBulkImportMgr();
            ddlbranch.Items.Clear();
            ddlbranch.DataTextField = "Name";
            ddlbranch.DataValueField = "Id";
            ddlbranch.DataSource = db.BindSubDivision().Where(p => p.Division_Id == int.Parse(Session["Division_Id"].ToString())).Select(p => new { p.Id, p.Name }); ;
            ddlbranch.DataBind();
            ddlbranch.Items.Insert(0, new ListItem("- Please Select -", "0"));
        }

        
        protected void cldrDOB_MonthChange(object sender, MonthChangedEventArgs e)
        {
            divDOBCalendar.Style.Add("visibility", "visible");
        }

        protected void cldrDOB_SelectionChanged(object sender, EventArgs e)
        {
            inpCustDOB.Text = cldrDOB.SelectedDate.ToShortDateString();
            divDOBCalendar.Style.Add("visibility", "hidden");           
        }

        protected void ddlCustCountry_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindCity(int.Parse(ddlCustCountry.SelectedValue.ToString()), 0);
        }
        protected void ddlCustCity_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindArea(int.Parse(ddlCustCity.SelectedValue.ToString()), 0);
        }

        

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (ValidatePage())
            {
                PolicyClass objPolicyClass = new PolicyClass();
                TravelBulkImportMgr db = new TravelBulkImportMgr(3, Request.ServerVariables["Remote_ADDR"], SessionObject.UserID);

                if (ddlSalutation.SelectedIndex > 0)
                    objPolicyClass.Salutation = ddlSalutation.SelectedItem.Text;
                else
                    objPolicyClass.Salutation = "Mr.";
                objPolicyClass.InsuredName = txtCustName.Text;
                objPolicyClass.InsuredDOB = DateTime.Parse(inpCustDOB.Text);
                objPolicyClass.InsuredAddress = txtCustAddress.Text;
                objPolicyClass.InsuredAddressArea = int.Parse(ddlCustArea.SelectedValue.ToString());
                objPolicyClass.City = ddlCustCity.SelectedItem.Text.ToString();
                objPolicyClass.InsuredMobile = txtCustMobile.Text;
                objPolicyClass.InsuredLandline = txtCustPhone.Text;
                TravelBulkImport.TravelPolicy tp = new TravelBulkImport.TravelPolicy(objPolicyClass);

                UserClass user = new UserClass();
                user.UserName = txtCustName.Text;
                user.LoginId = txtLoginId.Text;
                user.Password = Skaffold.Facade.SecurityFacade.Encrypt(txtPwd.Text); ;
                user.DivisionId = int.Parse(Session["Division_Id"].ToString());
                user.SubDivisionId = int.Parse(ddlbranch.SelectedValue.ToString());

                int result = db.AddUser(tp, user);
                
                if (result == 1)
                { 
                    lblSuccess.Text = "User added successfully"; 
                    lblError.Text = string.Empty;
                    lblLoginError.Text = string.Empty;
                    ClearAllFields();
                }
                else
                {
                    lblSuccess.Text = string.Empty;
                    lblLoginError.Text = string.Empty;
                    lblError.Text = "Error in creating user";
                }
            }

        }

        [System.Web.Services.WebMethod]
        public static bool ValidateLogin(string value)
        {
            TravelBulkImportMgr db = new TravelBulkImportMgr();
            return db.IsLoginIdExist(value);
        }

        private bool ValidatePage()
        {
            bool bFlag = true;

            if (int.Parse(hdnLogin.Value) == 1)
            {
                bFlag = false;
                lblLoginError.Text = "! Login Id already exists";
                lblLoginError.Style.Add("display", "");
            }
            return bFlag;
        }

        private void ClearAllFields()
        {
            ddlSalutation.SelectedValue = "0";
            txtCustName.Text = string.Empty;
            inpCustDOB.Text = string.Empty;
            txtCustAddress.Text = string.Empty;
            ddlCustCountry.SelectedValue = "0";
            ddlCustCity.SelectedValue = "0";
            ddlCustArea.SelectedValue = "0";
            txtCustPhone.Text = string.Empty;
            txtCustMobile.Text = string.Empty;
            txtLoginId.Text = string.Empty;
            txtPwd.Text = string.Empty;
            txtConfirmPwd.Text = string.Empty;
            ddlbranch.SelectedValue = "0";
          
        }

       
    }
}

```

---

</SwmSnippet>

<SwmMeta version="3.0.0" repo-id="Z2l0aHViJTNBJTNBQ3liZXJRdWVzdC1EZWZlbmRlcnMtb2YtdGhlLURpZ2l0YWwtUmVhbG0lM0ElM0Ftc2hhaGVlcnVkZGlu" repo-name="CyberQuest-Defenders-of-the-Digital-Realm"><sup>Powered by [Swimm](https://app.swimm.io/)</sup></SwmMeta>
