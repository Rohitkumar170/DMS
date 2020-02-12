var searchtxt=''; var LoadData=0;var dblUserId=0; var dblclickFlag=0;
jquery_1_11_3_min_p(document).ready(function () {

 jquery_1_11_3_min_p("#hdnLoad").val(10);
    LoadData = jquery_1_11_3_min_p("#hdnLoad").val();
    jquery_1_11_3_min_p('#preloader').css('display', 'block');
    jquery_1_11_3_min_p('#Overlay_Load').css('display', 'block');
    BindUserGrid(searchtxt);
 

     jquery_1_11_3_min_p('#btnLoadMore').click(function () {
        LoadData = parseInt(LoadData) + 10;
        jquery_1_11_3_min_p("#hdnLoad").val(LoadData);
        jquery_1_11_3_min_p('#preloader').css('display', 'block');
        jquery_1_11_3_min_p('#Overlay_Load').css('display', 'block');
         BindUserGrid(searchtxt);
    });

    $(document).on("dblclick", "#userGrid tbody tr", function () {
        var row = jquery_1_11_3_min_p(this);
        dblUserId = row.find('td:nth-child(1)').text().trim();
        var IsActive = row.find('td:nth-child(3)').text().trim();
        BindRole();
        kendo_all_min_js('#ddlpartner').data("kendoDropDownList").value(row.find('td:nth-child(2)').text().trim());
        jquery_1_11_3_min_p("#txtusername").val(row.find('td:nth-child(5)').text().trim());
        jquery_1_11_3_min_p("#txtmobile").val(row.find('td:nth-child(7)').text().trim());
        jquery_1_11_3_min_p("#txtemail").val(row.find('td:nth-child(6)').text().trim());
        if (IsActive == "true") { jquery_1_11_3_min_p("#chkIsActive").prop("checked", true); }
        else { jquery_1_11_3_min_p("#chkIsActive").prop("checked", false); }
     jquery_1_11_3_min_p("#createusserForm").show();
        jquery_1_11_3_min_p("#createusserGrid").hide();
        jquery_1_11_3_min_p("#btnnew").css("display", "none");
        jquery_1_11_3_min_p("#btnback").css("display", "block");
    dblclickFlag=1;
    });
     jquery_1_11_3_min_p("#btnsubmit").click(function () {
      if (FormValidation()==true ) {
 if(dblclickFlag==1)
      {
      swal({
                 title: "Do you want to update?",
                 text: "",
                 icon: "warning",
                 buttons: true,
                 dangerMode: true,
                 })
                 .then((willDelete) => {
                 if (willDelete) {
                 UpdateUser();

            }
                 });
      }
      else{
         swal({
                 title: "Do you want to Submit?",
                 text: "",
                 icon: "warning",
                 buttons: true,
                 dangerMode: true,
                 })
                 .then((willDelete) => {
                 if (willDelete) {
             SaveUser();

            }
                 });
        }


        }
     });
    
    jquery_1_11_3_min_p("#btnnew").click(function () {
        jquery_1_11_3_min_p("#createusserForm").show();
        jquery_1_11_3_min_p("#createusserGrid").hide();
        jquery_1_11_3_min_p("#btnnew").css("display", "none");
        jquery_1_11_3_min_p("#btnback").css("display", "block");
      BindRole();

    });

    jquery_1_11_3_min_p("#txtmobile").keypress(function () {
        jquery_1_11_3_min_p('#txtmobile').removeClass('validate');
        var $this = jquery_1_11_3_min_p(this);
        if ((event.which != 46 || $this.val().indexOf('.') != -1) &&
            ((event.which < 48 || event.which > 57) &&
                (event.which != 0 && event.which != 8))) {
            event.preventDefault();
        }
        var text = jquery_1_11_3_min_p(this).val();
        if ((event.which == 46) && (text.indexOf('.') == -1)) {
            setTimeout(function () {
                if ($this.val().substring($this.val().indexOf('.')).length > 3) {
                    $this.val($this.val().substring(0, $this.val().indexOf('.') + 3));
                }
            }, 1);
        }

        if ((text.indexOf('.') != -1) &&
            (text.substring(text.indexOf('.')).length > 3) &&
            (event.which != 0 && event.which != 8) &&
            ($(this)[0].selectionStart >= text.length - 3)) {
            event.preventDefault();
        }
    });

    jquery_1_11_3_min_p("#btnback").click(function () {

        window.location.replace("Users.aspx");
    });
});
function BindRole() {
   var  ParArray = []; 
    jquery_1_11_3_min_p.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "../WebServices/CreateUser.asmx/BindRole",
        data: "{}",
        dataType: "json",
        async: false,
        success: function (result) {
            jsonData = eval(result.d);
            var i = 0;
            ParArray.push({ value: "0", text: "Select" });
            jQuery.each(jsonData.Table, function (rec) {
                ParArray.push({ value: jsonData.Table[i].IdField, text: jsonData.Table[i].NameField });
                i++;
            });
          
        },
        error: function (result) {
        }
    });

    kendo_all_min_js('#ddlpartner').kendoDropDownList({
        filter: "contains",
        dataTextField: "text",
        dataValueField: "value",
        dataSource: ParArray,
        change: function () {
            kendo_all_min_js('#ddlpartner').data("kendoDropDownList").span.css('background', 'none');
            var PartId = kendo_all_min_js('#ddlpartner').data("kendoDropDownList").value();
          
        }
    });

}

function SaveUser() {
var UserData=[];
var UserDataJson='';
 var CreatedBy = jquery_1_11_3_min_p('#ContentPlaceHolder1_lblUserId').text().trim();
  var countryid=1;
  var EntityId=1;
   var PartId = kendo_all_min_js('#ddlpartner').data("kendoDropDownList").value();
  var userName=jquery_1_11_3_min_p("#txtusername").val();
  var Mobile=jquery_1_11_3_min_p("#txtmobile").val();
   var Emailid=jquery_1_11_3_min_p("#txtemail").val();
    var PassWord=jquery_1_11_3_min_p("#txtpassword").val();
    UserData.push({ userName: userName, countryid: countryid, Mobile: Mobile, Emailid: Emailid, CreatedBy: CreatedBy, EntityId: EntityId, UserRole:PartId})
var UserDataJson=JSON.stringify(UserData);
    var Isactive;
    if (jquery_1_11_3_min_p('#chkIsActive').is(":checked")) {
        Isactive = 1;
    }
    else {
        Isactive = 0;
    }
  jquery_1_11_3_min_p.ajax({
    type: "POST",
    contentType: "application/json; charset=utf-8",
    url: "../WebServices/CreateUser.asmx/SaveUser",
      data: "{'UserDataJson':'" + UserDataJson + "','Password':'" + PassWord + "','IsActive':'" + Isactive + "'}",
    dataType: "json",
    async: false,
    success: function (result) {
            var i = 0;
            var jsonData = eval(result.d);
            if(jsonData.Table[0].Response=="-1")
            {
            swal("EmailId already exists");

            }
            //else if(jsonData.Table[0].Response=="-2")
            //{
            //swal("Partner already exists");

            //}
            else{
              swal("Saved Successfully","Your data Saved successfully!","success")
            .then((value) => {
             window.location.replace("Users.aspx");
            });
            }
        }
    });
}

function UpdateUser() {
var UserData=[];
var UserDataJson='';
 var CreatedBy = jquery_1_11_3_min_p('#ContentPlaceHolder1_lblUserId').text().trim();
  var countryid=1;
  var EntityId=1;
   var PartId = kendo_all_min_js('#ddlpartner').data("kendoDropDownList").value();
  var userName=jquery_1_11_3_min_p("#txtusername").val();
  var Mobile=jquery_1_11_3_min_p("#txtmobile").val();
   var Emailid=jquery_1_11_3_min_p("#txtemail").val();
    var PassWord=jquery_1_11_3_min_p("#txtpassword").val();
    UserData.push({ userName: userName, countryid: countryid, Mobile: Mobile, Emailid: Emailid, CreatedBy: CreatedBy, EntityId: EntityId, UserRole:PartId,UserId:dblUserId})
var UserDataJson=JSON.stringify(UserData);
    var Isactive;
    if (jquery_1_11_3_min_p('#chkIsActive').is(":checked")) {
        Isactive = 1;
    }
    else {
        Isactive = 0;
    }
  jquery_1_11_3_min_p.ajax({
    type: "POST",
    contentType: "application/json; charset=utf-8",
    url: "../WebServices/CreateUser.asmx/UpdateUser",
      data: "{'UserDataJson':'" + UserDataJson + "','Password':'" + PassWord + "','IsActive':'" + Isactive + "'}",
    dataType: "json",
    async: false,
    success: function (result) {
            var i = 0;
            var jsonData = eval(result.d);
              swal("Updated Successfully","Your data Updated successfully!","success")
            .then((value) => {
             window.location.replace("Users.aspx");
            });
        }
    });
}






function FormValidation() {
    var allow = true;
    var i = 0;
   
    if (kendo_all_min_js("#ddlpartner").val() == 0) {
        kendo_all_min_js("#ddlpartner").data("kendoDropDownList").span.css('background', '#f9e5e5');
        allow = false;
    }
    //if (kendo_all_min_js("#ddladdress").val() == 0) {
    //    kendo_all_min_js("#ddladdress").data("kendoDropDownList").span.css('background', '#f9e5e5');
    //        allow = false;
    //    }
 
    if (jquery_1_11_3_min_p("#txtusername").val() == "") {
        jquery_1_11_3_min_p("#txtusername").addClass('validate');
        jquery_1_11_3_min_p("#txtusername").attr("placeholder", "Enter UserName");
        allow = false;
    }
    if (jquery_1_11_3_min_p("#txtmobile").val() == '') {
        jquery_1_11_3_min_p("#txtmobile").addClass('validate');
        jquery_1_11_3_min_p("#txtmobile").attr("placeholder", "Enter Mobile No");
        allow = false;
    }

    if (jquery_1_11_3_min_p('#chkIsActive').is(":checked")) {
       
    }
    else {
        jquery_1_11_3_min_p('#chkIsActive').addClass('validate');
    }


    if (jquery_1_11_3_min_p("#txtemail").val() == "") {
        jquery_1_11_3_min_p("#txtemail").addClass('validate');
        jquery_1_11_3_min_p("#txtemail").attr("placeholder", "Enter EmailId");
                    allow = false;
        }
        var email=jquery_1_11_3_min_p("#txtemail").val();
        if(isEmail(email))
        {}
        else{
        jquery_1_11_3_min_p("#txtemail").addClass('validate');
        jquery_1_11_3_min_p("#txtemail").attr("placeholder", "Enter Valid EmailId");
                    allow = false;
        }
    if (jquery_1_11_3_min_p("#txtpassword").val() == "") {
      jquery_1_11_3_min_p("#txtpassword").addClass('validate');
      jquery_1_11_3_min_p("#txtpassword").attr("placeholder", "Enter Password");
       allow = false;
        }
   if (jquery_1_11_3_min_p("#txtconfirmpwd").val() == "") {
   jquery_1_11_3_min_p("#txtconfirmpwd").addClass('validate');
   jquery_1_11_3_min_p("#txtconfirmpwd").attr("placeholder", "enter Confirm Pwd");
        allow = false;
    }
      if (jquery_1_11_3_min_p("#txtpassword").val() != jquery_1_11_3_min_p("#txtconfirmpwd").val()) {
      swal("Confirm password does not match");
       allow = false;
                }

    return allow;
}

function RemoveClass()
{
           if (jquery_1_11_3_min_p("#txtusername").val() != "") {
                jquery_1_11_3_min_p("#txtusername").removeClass('validate');
               
            }
    if (jquery_1_11_3_min_p("#txtmobile").val() != 0) {
        jquery_1_11_3_min_p("#txtmobile").removeClass('validate');
                
            }
            if (jquery_1_11_3_min_p("#txtemail").val() != "") {
                jquery_1_11_3_min_p("#txtemail").removeClass('validate');
                
            }
             if (jquery_1_11_3_min_p("#txtpassword").val() != "") {
                jquery_1_11_3_min_p("#txtpassword").removeClass('validate');
                
            }
            if (jquery_1_11_3_min_p("#txtconfirmpwd").val() != "") {
                jquery_1_11_3_min_p("#txtconfirmpwd").removeClass('validate');
               
              }
           if (jquery_1_11_3_min_p('#chkIsActive').is(":checked")) {
               jquery_1_11_3_min_p('#chkIsActive').removeClass('validate');
                  }
             else {
             
                 }
             
}

function isEmail(email) {
  var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
  return regex.test(email);
}
function BindUserGrid(searchtxt) {
 jquery_1_11_3_min_p("#userGrid tbody").empty();
    var wh = jquery_1_11_3_min_p(document).height();
    var gh = wh - 260;
   // var Entity = [];
    var SearchValue = searchtxt;
    LoadData = jquery_1_11_3_min_p("#hdnLoad").val();
    jquery_1_11_3_min_p.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "../WebServices/CreateUser.asmx/BindUserGrid",
        data: "{'LoadData':'" + LoadData + "','SearchValue':'" + SearchValue + "'}",
        dataType: "json",
        success: function (result) {
            jquery_1_11_3_min_p('#preloader').css('display', 'none');
            jquery_1_11_3_min_p('#Overlay_Load').css('display', 'none');
            jquery_1_11_3_min_p('#divGrid').css('display', 'block');
            var i = 0;
            var jsonData = result.d;
           
            jQuery.each(jsonData.Table, function (rec) {
                var markup = "<tr> <td style='display:none'> " + jsonData.Table[i].UserId + "</td><td style='display:none'> " + jsonData.Table[i].USERROLEid + "</td><td style='display:none'> " + jsonData.Table[i].IsActive + "</td><td> <input id='chkbox' type='checkbox' class='checkAll'  /></td><td>" + jsonData.Table[i].UserName + "</td> <td >" + jsonData.Table[i].EmailId + "</td> <td >" + jsonData.Table[i].MobileNo + "</td><td >" + jsonData.Table[i].USERROLE + "</td><td><a href='#' class='userActive'>Logout</a></td></tr>";

                jquery_1_11_3_min_p("#userGrid tbody").append(markup);

                //=========================== start for PDF===================================

//                var pdftable = "<tr><td>" + jsonData.Table[i].PartnerType + "</td> <td >" + jsonData.Table[i].PartnerName + "</td> <td >" + jsonData.Table[i].ContactNo + "</td></tr>";
//                jquery_1_11_3_min_p("#pdftable tbody").append(pdftable);

                //==============================end for PFD=================================

                i++;
            });
//            var k = 0;
//            if (jsonData.Table.length > 0) { var columnsIn = jsonData.Table[0]; for (var key in columnsIn) { if (k > 0) { ColumnName.push(key); } k++; } } else {
//                ColumnName.push(k); k++;
//            }
//            var j = 0; jquery_1_11_3_min_p("#DivSearch").empty();
//            var SearchDiv1 = "<div class='dropdown-item'><span class='skin skin-polaris'><input type='checkbox' class='checkAll' id='chk_" + ColumnName[j - 1] + "' onclick='checkAll(this)'><label for='check3' class='coldata'>All</label></span></div>";
//            jquery_1_11_3_min_p("#DivSearch").append(SearchDiv1);
//            jquery_1_11_3_min_p('#tblFieldGrid thead tr th').each(function () {
//                if (j > 1) {

//                var id1='chk_'+ ColumnName[j - 2];
//                this.id=id1;
//                    var SearchDiv = "<div class='dropdown-item'><span class='skin skin-polaris'><input type='checkbox' class='searchcheckAll' id='chk_" + ColumnName[j - 2] + "' onclick='Addclasstocolumn(this)'><label for='check3' class='coldata'>" + $(this).text() + "</label></span></div>";
//                    jquery_1_11_3_min_p("#DivSearch").append(SearchDiv);

//                     var table = document.getElementById('tblfields');
//  var i;
//  for (i = 0; i < 1; i++) {
//  var findth = jquery_1_11_3_min_p(table.rows[i].cells[1]).text().trim();
//  alert(findth);
//  }

//                }
//                j++;

//            });
            var Searchfinaldiv="<div class='dropdownBottom'><label class='pull-left' id='selectall' onclick='searchcheckAll()' >Select All</label><label class='pull-right' id='reset' onclick='searchUncheckAll()' >Reset</label></div>";
jquery_1_11_3_min_p("#DivSearch").append(Searchfinaldiv);
            if (jsonData.Table.length >= jsonData.Table1[0].Totalcount) {
                jquery_1_11_3_min_p('#lblRowCount').text(jsonData.Table.length);
                jquery_1_11_3_min_p('#lblTotalCount').text(jsonData.Table1[0].Totalcount);
                jquery_1_11_3_min_p('#btnLoadMore').css('visibility', 'hidden');
            }
            else {
                jquery_1_11_3_min_p('#lblRowCount').text(jsonData.Table.length);
                jquery_1_11_3_min_p('#lblTotalCount').text(jsonData.Table1[0].Totalcount);
                jquery_1_11_3_min_p('#btnLoadMore').css('visibility', 'visible');
            }


        }


    });



}