﻿var Parameter = []; var counter = 0; var CopyJson = []; var JsonLocation = []; var DataTypeId = 0; var copyColumnJson = []; var otherFieldsCounter = 0; var countercheck = 1; var searchtxt = ''; var LoadData = ''; var ColumnName = [];
var GlobalEntityId = 1; var GlobalCountryId = 1; var dblclickFlag = 0; var dblRowid = 0; var Globalcounter = 1; var EmpCounter = 5; var EmployeeArray = []; var Address = [];
var EmpWareHouse = []; var empId = '';
var empMobile = '';
var Imgpath = '';
var empemailId = '';
var empName = '';
var isemail = 0;
jquery_1_11_3_min_p(document).ready(function () {
 jquery_1_11_3_min_p("#hdnLoad").val(10);
    LoadData = jquery_1_11_3_min_p("#hdnLoad").val();
//    jquery_1_11_3_min_p('#preloader').css('display', 'block');
//    jquery_1_11_3_min_p('#Overlay_Load').css('display', 'block');
    BindOrgDataSetupGrid(searchtxt);

    BindEntity();
    Parameter.push({ value: "0", text: "Select" });
    kendo_all_min_js('#ddlOrgPara').kendoDropDownList({
        filter: "contains",
        dataTextField: "text",
        dataValueField: "value",
        dataSource: Parameter,
        change: function () {
            kendo_all_min_js('#ddlOrgPara').data("kendoDropDownList").span.css('background', 'none');
        }
    });

      jquery_1_11_3_min_p('#btnLoadMore').click(function () {
        LoadData = parseInt(LoadData) + 10;
        jquery_1_11_3_min_p("#hdnLoad").val(LoadData);
//        jquery_1_11_3_min_p('#preloader').css('display', 'block');
//        jquery_1_11_3_min_p('#Overlay_Load').css('display', 'block');
          BindOrgDataSetupGrid(searchtxt);
    });


  $(document).on("dblclick","#TblOrgDataGrid tbody tr",function() {
   var row = jquery_1_11_3_min_p(this);
   $("#TblOrgDataGrid tbody tr").removeClass("selectedRow"); 
    row.addClass("selectedRow");
 dblclickFlag = 1;
   var DataType= row.find('td:nth-child(2)').text().trim();
    var EntityId= row.find('td:nth-child(3)').text().trim();
     var CountryId= row.find('td:nth-child(4)').text().trim();
     var ParameterId= row.find('td:nth-child(5)').text().trim();
      DisplayOrgLocation(DataType, EntityId, CountryId, ParameterId);
      BindEmployee();
    //  BindEmpAddress(GlobalEntityId,GlobalCountryId);
//   DisplayAddressSetupGrid(row.find('td:nth-child(2)').text().trim(), row.find('td:nth-child(5)').text().trim());
//   jquery_1_11_3_min_p('#BindAddress').css('display', 'block');

   });


     jquery_1_11_3_min_p('#btnDeleteLine').on("click", function (event) {
var sel = false;
var ch = jquery_1_11_3_min_p('#' + 'tblOrgFields').find('tbody input[type=checkbox]');
ch.each(function () {
var $this = jquery_1_11_3_min_p(this);
if ($this.is(':checked')) {
sel = true; //set to true if there is/are selected row
}
});
if (!sel) {
swal("No data selected","Please select data first!", "warning")
}
else {
swal({
title: "Are you sure you want to delete?",
text: "",
icon: "warning",
buttons: true,
dangerMode: true,
})
.then((willDelete) => {
if (willDelete) {
var sel = false;
var ch = jquery_1_11_3_min_p('#' + 'tblOrgFields').find('tbody input[type=checkbox]');
ch.each(function () {
var $this = jquery_1_11_3_min_p(this);
if ($this.is(':checked')) {
var DeleteRow = jquery_1_11_3_min_p(this).closest('tr');
sel = true; 
DeleteRow.remove();
}
});
swal("Deleted Successfully","Your data deleted successfully!","success")
            .then((value) => {
            });
}
});
}

});



    jquery_1_11_3_min_p('#btncredentialSubmit').click(function () {
        swal({
            title: "Do you want to Proceed?",
            text: "",
            icon: "warning",
            buttons: true,
            dangerMode: true,
        })
            .then((willDelete) => {
                if (willDelete) {

                    makeCredential();


                }
            });

        

    });
    jquery_1_11_3_min_p('#btnempgrpclose').click(function () {
        $("#imagePopup").modal('hide');

    });
    //====================================== start code for  Submit Button click================================\\

    jquery_1_11_3_min_p('#btnSubmit').click(function () {
       
        if (ValidateHeaderDropDown() == true && ValidateAddress() == true && validateEmpLoyeeForm() == true) {
            if (dblclickFlag == 0) {
                swal({
                    title: "Do you want to Submit?",
                    text: "",
                    icon: "warning",
                    buttons: true,
                    dangerMode: true,
                })
                    .then((willDelete) => {
                        if (willDelete) {
                            MakeAddressJson();
                            SaveLocation();
                            //saveEmployee();


                        }
                    });
            }
            else {
                swal({
                    title: "Do you want to Submit?",
                    text: "",
                    icon: "warning",
                    buttons: true,
                    dangerMode: true,
                })
                    .then((willDelete) => {
                        if (willDelete) {
                            UpdateMakeAddressJson();
                            CreateEmployeeJson();
                            UpdateLocation();
                           

                        }
                    });

            }
        }
    
    });
//====================================== End code for  Submit Button click================================\\
    jquery_1_11_3_min_p('#btnDeleteLineEmp').on("click", function (event) {
        var sel = false;
        var ch = jquery_1_11_3_min_p('#' + 'empTable').find('tbody input[type=checkbox]');
        ch.each(function () {
            var $this = jquery_1_11_3_min_p(this);
            if ($this.is(':checked')) {
                sel = true; //set to true if there is/are selected row
            }
        });
        if (!sel) {
            swal("No data selected", "Please select data first!", "warning")
        }
        else {
            swal({
                title: "Are you sure you want to delete?",
                text: "",
                icon: "warning",
                buttons: true,
                dangerMode: true,
            })
                .then((willDelete) => {
                    if (willDelete) {
                        var sel = false;
                        var ch = jquery_1_11_3_min_p('#' + 'empTable').find('tbody input[type=checkbox]');
                        ch.each(function () {
                            var $this = jquery_1_11_3_min_p(this);
                            if ($this.is(':checked')) {
                                var DeleteRow = jquery_1_11_3_min_p(this).closest('tr');
                                var rownum = DeleteRow.index() + 1;
                                sel = true;
                                DeleteRow.remove();
                            }
                        });
                        swal("Deleted Successfully", "Your data deleted successfully!", "success")
                            .then((value) => {

                            });
                    }
                });
        }
    });


    var _URL = window.URL || window.webkitURL;
    jquery_1_11_3_min_p("#f_UploadImage").on('change', function () {
        var file, img;
        if ((file = this.files[0])) {
            img = new Image();
            img.onload = function () {
                sendFile(file);
            };
            img.onerror = function () {
                alert("Not a valid file:" + file.type);
            };
            img.src = _URL.createObjectURL(file);
        }
    });

    //====================================== start code for add new address================================\\
    jquery_1_11_3_min_p("#btnaddAddress").click(function () {
        if (ValidateAddress() == true) {
            if (counter == 0) {
                counter++;
            }
         
            var RowId = counter + 1;
            jquery_1_11_3_min_p(".addressDiv").append("<div class='col-md-3 mb-1' id='addressdiv_" + RowId + "' ><div class='addressBg' id='AddressDiv'><div id='btnClosr_" + RowId + "' class='closeAddress pull-right' onclick='deleteAddress(this)'><i  class='fa fa-close'></i></div><div class='AllAddress form-group'> <label class='textHeader' id='lbladdress'>Address " + RowId + "</label></div>  <div class='form-group'><label for='Country'>Location Code</label><input type='text'  id='txtLocationCode_"+RowId+"'  autocomplete='off' placeholder='Enter Location Name' class='form-control'/> </div><div class='form-group'><label for='Country'>Location Name</label><input type='text' id='txtLocatuion_"+RowId+"' autocomplete='off' placeholder='Enter Location Name' class='form-control'/> </div><div class='form-group'> <label for='Country'>Location Description</label><input type='text'  id='txtLocDesc_"+RowId+"' autocomplete='off' placeholder='Enter Location Description' class='form-control'/> </div><div id='repeatArea_" + RowId + "'></div></div> </div>");
            counter = RowId;
              var EntityId = kendo_all_min_js('#ddlentity').val();
                var CountryId = kendo_all_min_js('#ddlcountry').val();
           BindAddressFields(EntityId,CountryId);
        }
    });
    //====================================== end code for add new address================================\\


    jquery_1_11_3_min_p('#btnnew').click(function () {
        $("#OrganizationDataForm").css('display', 'block');
        $("#OrganizationDataGrid").css('display', 'none');
        jquery_1_11_3_min_p('#btnSubmit').css('display', 'block');
        jquery_1_11_3_min_p('#btnSubmit').prop('disabled', true);
        jquery_1_11_3_min_p('#btnback').css('display', 'block');
        jquery_1_11_3_min_p('#btnnew').css('display', 'none');

    });

    jquery_1_11_3_min_p("#btnback").click(function () {
        window.location.replace("OrganizationDataSetup.aspx");
    });

});

function BindEntity() {
    jquery_1_11_3_min_p.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "../WebServices/Setup.asmx/BindFieldDetails",
        data: "{}",
        dataType: "json",
        async: false,
        success: function (result) {
            jsonData = eval(result.d);
            Country = [];
            var i = 0;
            // Country.push({ value: "0", text: "Select" });
            jQuery.each(jsonData.Table1, function (rec) {
                Country.push({ value: jsonData.Table1[i].CountryId, text: jsonData.Table1[i].CountryName });
                i++;
            });
            Entity = [];
            var i = 0;
            Entity.push({ value: "0", text: "Select" });
            jQuery.each(jsonData.Table2, function (rec) {
                Entity.push({ value: jsonData.Table2[i].Entityid, text: jsonData.Table2[i].Entityname });
                i++;
            });
        },
        error: function (result) {
        }
    });


    kendo_all_min_js('#ddlcountry').kendoDropDownList({
        filter: "contains",
        dataTextField: "text",
        dataValueField: "value",
        dataSource: Country,
        change: function () {
            kendo_all_min_js('#ddlcountry').data("kendoDropDownList").span.css('background', 'none');
              var EntityId = kendo_all_min_js('#ddlentity').val();
            var CountryId = kendo_all_min_js('#ddlcountry').val();
            BindOrgParaddl(CountryId, EntityId) 
        }
    });

    kendo_all_min_js('#ddlentity').kendoDropDownList({
        filter: "contains",
        dataTextField: "text",
        dataValueField: "value",
        dataSource: Entity,
        change: function () {
            kendo_all_min_js('#ddlentity').data("kendoDropDownList").span.css('background', 'none');
            var EntityId = kendo_all_min_js('#ddlentity').val();
            var CountryId = kendo_all_min_js('#ddlcountry').val();
            BindOrgParaddl(CountryId, EntityId) 
        }
    });
}
function BindOrgParaddl(CountryId,EntityId) {
          var Countryname=kendo_all_min_js("#ddlcountry").data("kendoDropDownList").text();
          var cName=Countryname.split(' ');
           var EntityName=kendo_all_min_js("#ddlentity").data("kendoDropDownList").text();
           var EName=EntityName.split(' ');
        var Tabname='tbl'+EName[0]+'Location'+cName[0];
    jquery_1_11_3_min_p.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "../WebServices/Setup.asmx/BindOrgParaddl",
        data: "{'CountryId':'" + CountryId + "','EntityId':'" + EntityId + "'}",
        dataType: "json",
        async: false,
        success: function (result) {
            jsonData = eval(result.d);
            Parameter = [];
            var i = 0;
            Parameter.push({ value: "0", text: "Select" });
            jQuery.each(jsonData.Table, function (rec) {
                Parameter.push({ value: jsonData.Table[i].fieldId, text: jsonData.Table[i].FieldName });
                i++;
            });
          
        },
        error: function (result) {
        }
    });


    kendo_all_min_js('#ddlOrgPara').kendoDropDownList({
        filter: "contains",
        dataTextField: "text",
        dataValueField: "value",
        dataSource: Parameter,
        change: function () {
            kendo_all_min_js('#ddlOrgPara').data("kendoDropDownList").span.css('background', 'none');
            jquery_1_11_3_min_p('#btnSubmit').prop('disabled', false);
            var Id = kendo_all_min_js('#ddlOrgPara').val();
            NewId = Id.split('_');
            DataTypeId = NewId[1];
            if (DataTypeId == "1") {
                jquery_1_11_3_min_p('#OrgAddressDiv').css('display', 'block');
                jquery_1_11_3_min_p('#OrgFielddiv').css('display', 'none');
                var EntityId = kendo_all_min_js('#ddlentity').val();
                var CountryId = kendo_all_min_js('#ddlcountry').val();
                counter = 0;
                BindAddressFields(EntityId, CountryId);
            }
            else if (DataTypeId == "2") {
                jquery_1_11_3_min_p('#OrgFielddiv').css('display', 'block');
                jquery_1_11_3_min_p('#OrgAddressDiv').css('display', 'none');
                appendColumn();
            }
            else if (kendo_all_min_js('#ddlOrgPara').data("kendoDropDownList").value() == 0) {
                jquery_1_11_3_min_p("#repeatArea_1").empty();
                jquery_1_11_3_min_p('#OrgAddressDiv').css('display', 'none');
              }
             jquery_1_11_3_min_p('.noData').css('display', 'none');
        }
    });
}
function appendColumn() {
   $('#tblOrgFields thead tr').empty();
   $('#tblOrgFields tbody').empty();
    $('#tblFieldValue1 tbody').empty();
    var countercheck = 0;
    var id = "";
//    if (ele > 0) {
//        id = "acr_" + ele;
//    }
//    else {
//        var currentelemnt = ele.split(' ');
//        var ele1 = currentelemnt[0];
//        id = "acr_" + ele1;

//    }
    var Country = jquery_1_11_3_min_p("#ddlcountry").data("kendoDropDownList").text();
    var CountryName = [];
    CountryName = Country.split(' ');
    var entity = jquery_1_11_3_min_p("#ddlentity").data("kendoDropDownList").text();
    var EntityName = [];
    EntityName = entity.split(' ');
    var FieldName = kendo_all_min_js('#ddlOrgPara').data("kendoDropDownList").text();
    TableName = 'tblOrg' + EntityName[0] + CountryName[0] + '_' + FieldName;
    jquery_1_11_3_min_p.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "../WebServices/Setup.asmx/GetOrgFieldName",
        data: "{'TableName':'" + TableName.trim() + "'}",
        dataType: "json",
        success: function (result) {
            var jsonData = result.d;
            copyColumnJson=jsonData;
            var i = 0; var markup = '';
            $('#tblOrgFields thead tr').append(" <th><input type='checkBox' id='chkAll'/>All</th>");
             $('#tblOrgFields tbody').append("<tr><td style='display:none'>1</td><td><input type='checkbox' id='chk_1' class='chk_All'></td> </tr>");
            for (var j = 1; j < jsonData.Table.length - 9; j++) {
                $('#tblOrgFields thead tr').append($('<th />', { text: jsonData.Table[j].COLUMN_NAME }));
                 markup = " <td> <input type='text' onkeyup='RemoveClass(this)' id='txt" + jsonData.Table[j].COLUMN_NAME + "_1' placeholder='Enter Field Name' class='fieldName'  autocomplete='off'></td>";
                $('#tblOrgFields tbody tr').append(markup);
            }
         
        }
    });
}
//====================================== start code for BindAddress Fields================================\\
function BindAddressFields(entityId, countryId) {

//  var url = 'OrganizationDataSetup.aspx';
//  $('.addressDiv').load(url + '.addressDiv'); 

    if (counter == 0) {
        counter++;
    }
    var FieldName = '';
    var entityId = entityId;
    var Data = [];
    var tableCount = 1;
    var countryId = countryId;
    var ColumnName = [];
    var Tables = [];

    jquery_1_11_3_min_p("#repeatArea_" + counter).empty();
    jquery_1_11_3_min_p.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "../WebServices/Customer.asmx/BindPAddressFields",
        data: "{'EntityId':'" + entityId + "','CountryId':'" + countryId + "'}",
        dataType: "json",
        async:false,
        success: function (result) {

            var i = 0;
            var jsonData = result.d;
            CopyJson = jsonData;
            var a = 0;
            

            jQuery.each(jsonData.Table, function (rec) {
                
                var markup = "<div class='form-group'><label id='lbl_" + i + "' for='Address'>" + jsonData.Table[i].FieldName + "</label><input type='text'  id='txt_" + jsonData.Table[i].TxtId + counter + "' autocomplete='off'  class='form-control' onkeypress='RemoveClassAddressDiv(this)' placeholder=' Enter " + jsonData.Table[i].FieldName + "'/></div>";
                jquery_1_11_3_min_p("#repeatArea_" + counter).append(markup);
                if (jsonData.Table[i].FieldDataType == "2") {
                    var TableName = jsonData.Table1[a].TablesName;
                    a = a + 1;
                    var ddlId = jsonData.Table[i].FieldName + counter;
                    BindFieldsddl(TableName, ddlId);

                }
                i++;
            });

        }
    });

}
//====================================== end code for BindAddress Fields================================\\
//====================================== start code for Bind Fields Dropdowns  ================================\\
function BindFieldsddl(TableName, ddlId) {
    var data = [];
    var ColumnName = [];
    jquery_1_11_3_min_p.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "../WebServices/Customer.asmx/BindFieldsddl",
        data: "{'TableName':'" + TableName + "'}",
        dataType: "json",
        async: false,
        success: function (result) {
            jsonData = eval(result.d);
            var i = 0;
            var k = 0;
            if (jsonData.Table.length > 0) {
                var columnsIn = jsonData.Table[0]; for (var key in columnsIn) {
                    ColumnName.push(key);
                }
            }


            var TaxtField = ''; var concatdata = '';
            data = [];
            data.push({ value: "0", text: "Select" });
            var x = 0;
            jQuery.each(jsonData.Table, function (rec) {
                TaxtField = jsonData.Table[x][jsonData.Table1[0].COLUMN_NAME];
                for (var i = 1; i < jsonData.Table1.length - 8; i++) {


                    concatdata += jsonData.Table[x][jsonData.Table1[i].COLUMN_NAME] + '-';


                }
                var TextFields = concatdata.slice(0, -1);
                data.push({ value: TaxtField, text: TextFields });
                concatdata = '';
                x++;

            });
        },
        error: function (result) {
        }
    });



    kendo_all_min_js('#txt_' + ddlId).kendoDropDownList({
        filter: "contains",
        dataTextField: "text",
        dataValueField: "value",
        dataSource: data,
        change: function () {
            kendo_all_min_js('#txt_' + ddlId).data("kendoDropDownList").span.css('background', 'none');
        }
    });
}
//====================================== end code for Bind Fields Dropdowns ================================\\
//====================================== start code for ValidateAddress Box ================================\\
function ValidateAddress() {

    var allow = true;
    var validatecounter = 1;
    if (jquery_1_11_3_min_p("#txtLocationCode_" + validatecounter).val() == "") {
        jquery_1_11_3_min_p("#txtLocationCode_" + validatecounter).addClass('validate');
        jquery_1_11_3_min_p("#txtLocationCode_" + validatecounter).attr("placeholder", "Enter Field value!");
                allow = false;
            }
    if (jquery_1_11_3_min_p("#txtLocatuion_" + validatecounter).val() == "") {
        jquery_1_11_3_min_p("#txtLocatuion_" + validatecounter).addClass('validate');
        jquery_1_11_3_min_p("#txtLocatuion_" + validatecounter).attr("placeholder", "Enter Field value!");
                allow = false;
            }
    if (CopyJson.Table.length > 0) {
       
        var addressdivcount = jquery_1_11_3_min_p(".addressDiv").find('.addressBg').each(function () {
            var i = 0;
            jquery_1_11_3_min_p("#repeatArea_" + validatecounter).find('div').each(function () {
                if (jquery_1_11_3_min_p("#txt_" + CopyJson.Table[i].TxtId + validatecounter).val() == "") {
                    jquery_1_11_3_min_p("#txt_" + CopyJson.Table[i].TxtId + validatecounter).addClass('validate');
                    jquery_1_11_3_min_p("#txt_" + CopyJson.Table[i].TxtId + validatecounter).attr("placeholder", "Enter Field value!");
                    allow = false;
                }
                if (CopyJson.Table[i].FieldDataType == "2") {
                    if (kendo_all_min_js("#txt_" + CopyJson.Table[i].TxtId + validatecounter).val() == 0) {
                        kendo_all_min_js("#txt_" + CopyJson.Table[i].TxtId + validatecounter).data("kendoDropDownList").span.css('background', '#f9e5e5');
                        allow = false;
                    }
                }
                i++;
            });
            validatecounter++;
        });
       
       



    }
    else {
        allow = false;
        swal("Entity doen't not exist in this country");
    }
    return allow;
}
//====================================== end code for ValidateAddress Box ================================\\

//====================================== start code for ValidateAddress Box ================================\\
function ValidateHeaderDropDown() {
    var allow = true;
    var i = 0;
    if (kendo_all_min_js("#ddlcountry").val() == 0) {
        kendo_all_min_js("#ddlcountry").data("kendoDropDownList").span.css('background', '#f9e5e5');
        allow = false;
    }
    if (kendo_all_min_js("#ddlentity").val() == 0) {
        kendo_all_min_js("#ddlentity").data("kendoDropDownList").span.css('background', '#f9e5e5');
        allow = false;
    }
    if (kendo_all_min_js("#ddlOrgPara").val() == 0) {
        kendo_all_min_js("#ddlOrgPara").data("kendoDropDownList").span.css('background', '#f9e5e5');
        allow = false;
    }
   
    return allow;
}
//====================================== end code for ValidateAddress Box ================================\\+
function RemoveClassEmp(a) {
    var id = a.id;
    $("#" + id).removeClass('validate');
}
function isValidEmail(email) {
    return /^[a-z0-9]+([-._][a-z0-9]+)*@([a-z0-9]+(-[a-z0-9]+)*\.)+[a-z]{2,4}$/.test(email)
        && /^(?=.{1,64}@.{4,64}$)(?=.{6,100}$).*/.test(email);
}
function isNumber(evt) {
    evt = (evt) ? evt : window.event;
    var charCode = (evt.which) ? evt.which : evt.keyCode;
    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
        return false;
    }
    return true;
}
function validateEmpLoyeeForm() {
    var allow = true;
    jquery_1_11_3_min_p('#empTable tbody').find('tr').each(function () {
        var row = jquery_1_11_3_min_p(this);
        var rowNumber = row.find('td:nth-child(1)').text().trim();
        if (kendo_all_min_js('#empaddress_' + rowNumber).val() != 0) {
            if (jquery_1_11_3_min_p("#empname_" + rowNumber).val() == "") {
                jquery_1_11_3_min_p("#empname_" + rowNumber).addClass('validate');
                jquery_1_11_3_min_p("#empname_" + rowNumber).attr("placeholder", "enter Name!");
                allow = false;
            }
            if (jquery_1_11_3_min_p("#empmobile_" + rowNumber).val() == "") {
                jquery_1_11_3_min_p("#empmobile_" + rowNumber).addClass('validate');
                jquery_1_11_3_min_p("#empmobile_" + rowNumber).attr("placeholder", "enter mobile!");
                allow = false;
            }
            if (jquery_1_11_3_min_p("#empemail_" + rowNumber).val() == "") {
                jquery_1_11_3_min_p("#empemail_" + rowNumber).addClass('validate');
                jquery_1_11_3_min_p("#empemail_" + rowNumber).attr("placeholder", "enter email!");
                allow = false;
            }

            if (isValidEmail(jquery_1_11_3_min_p("#empemail_" + rowNumber).val()) == false) {
                jquery_1_11_3_min_p("#empemail_" + rowNumber).addClass('validate');
                allow = false;
            }
        }
    });
    return allow;

}
function CreateEmployeeJson() {
   var CreatedBy = jquery_1_11_3_min_p('#ContentPlaceHolder1_lblUserId').text();
  EmployeeArray = [];
  EmpWareHouse = [];
    var partid = 0;
    if (dblclickFlag == 1) {
        partid = kendo_all_min_js("#ddlentity").val();
    } 
    jquery_1_11_3_min_p('#empTable tbody').find('tr').each(function () {
        var row = jquery_1_11_3_min_p(this);
        var rowNumber = row.find('td:nth-child(1)').text().trim();
        if (kendo_all_min_js('#empaddress_' + rowNumber).val() != 0) {
            var EmailId = jquery_1_11_3_min_p("#empemail_" + rowNumber).val();
            var active = 0;
            if ($("#chkisactive_" + rowNumber).is(':checked')) { active = 1; } else { active = 0 }
            EmployeeArray.push({ name: jquery_1_11_3_min_p("#empname_" + rowNumber).val(), MobileNo: jquery_1_11_3_min_p("#empmobile_" + rowNumber).val(), EmailId: EmailId, CountryId: kendo_all_min_js("#ddlcountry").val(), EntityId: kendo_all_min_js("#ddlentity").val(), createdBy: CreatedBy, BusinessId: partid, EmployeeId: jquery_1_11_3_min_p("#empid_" + rowNumber).text(), IsActive: active });
            $(kendo_all_min_js('#empaddress_' + rowNumber).data("kendoDropDownList").dataItems()).each(function () {
                var b = this;
                var c = b.value;
                if ($("#" + rowNumber + "chk_OtherUnit_" + c).prop("checked")) {
                    EmpWareHouse.push({ Emailid: EmailId, Address: c, createdBy: CreatedBy })
                }
            });
        }
    });

}
function saveEmployee() {
   
    var EmpJson = JSON.stringify(EmployeeArray);
    var AddressJson = JSON.stringify(EmpWareHouse);
    jquery_1_11_3_min_p.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "../WebServices/Customer.asmx/SaveEntityEmployee",
        data: "{'Empjson':'" + EmpJson + "','EmpAddressjson':'" + AddressJson + "'}",
        dataType: "json",
        success: function (result) {
            var i = 0;
            var jsonData = eval(result.d);
            if (jsonData.Table.length > 0) {
                swal("Updated Successfully", "Data Updated successfully!", "success")
                    .then((value) => {
                        window.location.replace("OrganizationDataSetup.aspx");
                    });
            }
        }
    });

}
function BindEmployee() {
    BindEmpAddress(GlobalEntityId, GlobalCountryId);
    var partid = 0;
    if (dblclickFlag == 1) {
        partid = kendo_all_min_js("#ddlentity").val();
    } 
    jquery_1_11_3_min_p.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "../WebServices/Customer.asmx/BindEntityEmployee",
        data: "{'EntityId':'" + partid + "','countryId':'" + kendo_all_min_js("#ddlcountry").val() + "','entityId':'" + kendo_all_min_js("#ddlentity").val() + "'}",
        dataType: "json",
        success: function (result) {
            
            var i = 0;
            var jsonData = eval(result.d);
            if (jsonData.Table.length > 0) {
                var a = 1;
                jQuery.each(jsonData.Table, function (rec) {
                    a = i + 1;
                    if (a <= 5) {
                        if (jsonData.Table[i].IsActive == true) {
                            jquery_1_11_3_min_p("#chkisactive_" + a).prop("checked", true);
                        }
                        if (jsonData.Table[i].IsCreadential == "1") {
                            jquery_1_11_3_min_p("#chkcredential_" + a).prop("checked", true);
                        }
                        $('#chkcredential_' + a).prop('disabled', false);
                        jquery_1_11_3_min_p("#isemail_" + a).text(jsonData.Table[i].isemail);
                        jquery_1_11_3_min_p("#empid_" + a).text(jsonData.Table[i].Empid);
                        jquery_1_11_3_min_p("#empemail_" + a).val(jsonData.Table[i].EmpEmailId);
                        jquery_1_11_3_min_p("#empname_" + a).val(jsonData.Table[i].EmpName);
                        jquery_1_11_3_min_p("#empmobile_" + a).val(jsonData.Table[i].EmpMobileNo);
                        var j = 0;
                        jQuery.each(jsonData.Table1, function (rec) {
                            if (jsonData.Table[i].Empid == jsonData.Table1[j].Empid) {
                                kendo_all_min_js('#empaddress_' + a).data("kendoDropDownList").value(jsonData.Table1[j].AddressId);
                                jquery_1_11_3_min_p("#" + a + "chk_OtherUnit_" + jsonData.Table1[j].AddressId).prop("checked", true);


                            }
                            j++;

                        });


                    }
                    else {
                        if (EmpCounter == 5) { EmpCounter++; }
                        var markup = "<tr><td style='display:none'>" + EmpCounter + "</td><td><input type='checkbox' id='chk_" + EmpCounter + "' class='checkbox'/></td><td><label style='display:none' id='empid_" + EmpCounter + "'></label><input type='text' id='empname_" + EmpCounter + "' class='fieldName' onchange='' onkeyup='RemoveClassEmp(this)' autocomplete='off' /></td><td><input type='text' placeholder='' class='fieldName' id='empmobile_" + EmpCounter + "' autocomplete='off' onkeyup='RemoveClassEmp(this)' onkeypress='return isNumber(event)'   /></td><td><input type='text' placeholder='' class='fieldName' id='empemail_" + EmpCounter + "' autocomplete='off' onchange='' onkeypress='' onkeyup='RemoveClassEmp(this)' /></td><td><input type='text' id='empaddress_" + EmpCounter + "' class='fieldName' autocomplete='off' /></td><td><input type='checkbox' id='chkcredential_" + EmpCounter + "'  disabled = 'disabled' onclick='showCredentialpopup(this)' class='checkbox' /></td><td><input type='checkbox' id='chkisactive_" + EmpCounter + "' class='checkbox' /></td></tr>"
                        $("#empTable tbody").append(markup);
                        kendo_all_min_js("#empaddress_" + EmpCounter).kendoDropDownList({
                            filter: "contains",
                            template: "<input type='checkbox' id='" + EmpCounter + "chk_OtherUnit_#=data.value#' class='clsSkillInner' value='#=data.value #' name='OtherUnit' />" + " " + "${ data.text }",
                            dataTextField: "text",
                            dataValueField: "value",
                            dataSource: Address,
                            close: onClose,
                            dataBound: onOtherUnitBound,
                            change: function () {
                                kendo_all_min_js('#empaddress_' + EmpCounter).data("kendoDropDownList").span.css('background', 'none');

                            }
                        });
                        EmpCounter++;
                        if (jsonData.Table[i].IsActive == true) {
                            jquery_1_11_3_min_p("#chkisactive_" + a).prop("checked", true);
                        }
                        if (jsonData.Table[i].IsCreadential == "1") {
                            jquery_1_11_3_min_p("#chkcredential_" + a).prop("checked", true);
                        }
                        $('#chkcredential_' + a).prop('disabled', false);
                        jquery_1_11_3_min_p("#isemail_" + a).text(jsonData.Table[i].isemail);
                        jquery_1_11_3_min_p("#empid_" + a).text(jsonData.Table[i].Empid);
                        jquery_1_11_3_min_p("#empemail_" + a).val(jsonData.Table[i].EmpEmailId);
                        jquery_1_11_3_min_p("#empname_" + a).val(jsonData.Table[i].EmpName);
                        jquery_1_11_3_min_p("#empmobile_" + a).val(jsonData.Table[i].EmpMobileNo);
                        var j = 0;
                        jQuery.each(jsonData.Table1, function (rec) {
                            if (jsonData.Table[i].Empid == jsonData.Table1[j].Empid) {
                                kendo_all_min_js('#empaddress_' + a).data("kendoDropDownList").value(jsonData.Table1[j].AddressId);
                                jquery_1_11_3_min_p("#" + a + "chk_OtherUnit_" + jsonData.Table1[j].AddressId).prop("checked", true);
                            }
                            j++;

                        });

                    }
                    i++;
                });

            }
            else {
                BindEmpAddress(GlobalEntityId, GlobalCountryId);
            }
        }
    });
}
function AddRowEmployee() {
    if (EmpCounter == 5) { EmpCounter++; }
    var markup = "<tr><td style='display:none'>" + EmpCounter + "</td><td><input type='checkbox' id='chk_" + EmpCounter + "' class='checkbox'/></td><td><label style='display:none' id='empid_" + EmpCounter + "'></label><input type='text' id='empname_" + EmpCounter + "' class='fieldName' onchange='' onkeyup='RemoveClassEmp(this)' autocomplete='off' /></td><td><input type='text' placeholder='' class='fieldName' id='empmobile_" + EmpCounter + "' autocomplete='off' onkeyup='RemoveClassEmp(this)' onkeypress='return isNumber(event)'   /></td><td><input type='text' placeholder='' class='fieldName' id='empemail_" + EmpCounter + "' autocomplete='off' onchange='' onkeypress='' onkeyup='RemoveClassEmp(this)' /></td><td><input type='text' id='empaddress_" + EmpCounter + "' class='fieldName' autocomplete='off' /></td><td><input type='checkbox' id='chkcredential_" + EmpCounter + "' class='checkbox' disabled = 'disabled' onclick='showCredentialpopup(this)' /></td><td><input type='checkbox' id='chkisactive_" + EmpCounter + "' class='checkbox' /></td></tr>"
    $("#empTable tbody").append(markup);
    BindEmpAddress(GlobalEntityId, GlobalCountryId);
    EmpCounter++;

}
function RemoveCredential() {
    var CreatedBy = jquery_1_11_3_min_p('#ContentPlaceHolder1_lblUserId').text();
    jquery_1_11_3_min_p.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "../WebServices/Customer.asmx/RemoveCredential",
        data: "{'Empid':'" + empId + "','CreatedBy':'" + CreatedBy + "'}",
        dataType: "json",
        success: function (result) {
            var i = 0;
            var jsonData = eval(result.d);
        }
    });

}
function makeCredential() {
    var CreatedBy = jquery_1_11_3_min_p('#ContentPlaceHolder1_lblUserId').text();
    jquery_1_11_3_min_p.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "../WebServices/Customer.asmx/makeEntityEmpCredential",
        data: "{'Empid':'" + empId + "','ImagePath':'" + Imgpath + "','CreatedBy':'" + CreatedBy + "','empemailId':'" + empemailId + "','UserName':'" + empName + "','IsEmail':'" + isemail + "'}",
        dataType: "json",
        success: function (result) {
            var i = 0;
            var jsonData = eval(result.d);
            //if (jsonData.Table[0].Res == '-1') {
            //    swal("employee already exists");
            //}
            if (jsonData.Res == '3') {
                $('#imagePopup').modal('hide');
                swal("invalid emailid");
            }
            else if (jsonData.Res == '2') {
                $('#imagePopup').modal('hide');
                swal("credential details already exists");
            }
            else {
                $('#imagePopup').modal('hide');
                
                swal("Sent successfully","Email has been sent successfully!","success");
            }
        }
    });

}
function sendFile(file) {
    var formData = new FormData();
    formData.append('file', $('#f_UploadImage')[0].files[0]);
    Imgpath = '';
    $.ajax({
        type: 'post',
        url: '../EntityEmployeeImageUpload.ashx?EmpId=' + empId + '&Mobile=' + empMobile,
        data: formData,
        success: function (status) {
            if (status != 'error') {
                var my_path = '../EntityEmployeeImage/' + status;
                $("#myUploadedImg").attr("src", my_path);
                Imgpath = my_path;
            }
        },
        processData: false,
        contentType: false,
        error: function () {
            alert("Whoops something went wrong!");
        }
    });
}
function showCredentialpopup(Data) {
    var id = [];
    id = Data.id;
    var newid = id.split('_');
    empId = '';
    empMobile = '';
    empemailId = '';
    empName = '';
    isemail = 0;
    if ($("#" + id).is(':checked')) {
        $('#imagePopup').modal('show');
        $("#lblempname").text(jquery_1_11_3_min_p("#empname_" + newid[1]).val());
        empId = jquery_1_11_3_min_p("#empid_" + newid[1]).text();
        empMobile = jquery_1_11_3_min_p("#empmobile_" + newid[1]).val();
        empemailId = jquery_1_11_3_min_p("#empemail_" + newid[1]).val();
        empName = jquery_1_11_3_min_p("#empname_" + newid[1]).val();
        isemail = jquery_1_11_3_min_p("#isemail_" + newid[1]).text();
    }
    else {
        isemail = jquery_1_11_3_min_p("#isemail_" + newid[1]).text();
        empId = jquery_1_11_3_min_p("#empid_" + newid[1]).text();
        if (isemail == "1") {
            RemoveCredential();
        }

        $('#imagePopup').modal('hide');
    }
   
}
//====================================== start code for Delete Address Box ================================\\
function  deleteAddress(ele) { 

    var id = ele.id;
    
var arr=[];
arr=id.split('_');
 swal({
       title: "Do you want to Proceed?",
       text: "",
       icon: "warning",
        buttons: true,
        dangerMode: true,
         })
       .then((willDelete) => {
        if (willDelete) {  
            
            var EntityId = kendo_all_min_js('#ddlentity').val();
            var CountryId = kendo_all_min_js('#ddlcountry').val();
            Deleteaddress(EntityId, CountryId, arr[2], arr[1]);


          }
                 });
}
//====================================== end code for Delete Address Box ================================\\
function Deleteaddress(Entityid, Countryid, Autoid,Deletediv) {
    jquery_1_11_3_min_p.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "../WebServices/Setup.asmx/DisableLocation",
        data: "{'entityid':'" + Entityid + "','CountryId':'" + Countryid + "','Columnid':'" + Autoid + "'}",
        dataType: "json",
        success: function (result) {
           var jsonData = eval(result.d);
            if (jsonData.Table[0].Res == "1") {
                
                swal("Deleted", "Address deleted successfully!", "success")
                    .then((value) => {
                        var divid = 'addressdiv_' + Deletediv;
                        jquery_1_11_3_min_p('#' + divid).remove();
                       
                    });
            }
        }
    });
}
//====================================== start code for Remove validate Class ================================\\
function RemoveClassAddressDiv(data) {
    var id = data.id;
    var arr = id.split('_');
    var id = arr[1]; 
                if (jquery_1_11_3_min_p("#txtLocationCode_" + id).val() != "") {
                jquery_1_11_3_min_p("#txtLocationCode_" + counter).removeClass('validate');

            }
             if (jquery_1_11_3_min_p("#txtLocatuion_" + counter).val() != "") {
                jquery_1_11_3_min_p("#txtLocatuion_" + counter).removeClass('validate'); 
            }
        jquery_1_11_3_min_p("#repeatArea_" + counter).find('div').each(function () {
            if (jquery_1_11_3_min_p("#txt_" +id).val() != "") {
                jquery_1_11_3_min_p("#txt_" +id).removeClass('validate');   
            }
        });
        
}
//====================================== end code for Remove validate Class ================================\\


//====================================== start code for Create Json Of Address Data ================================\\
function MakeAddressJson() {
     var id=counter;
     JsonLocation=[];
     var tempJson="";
    if (CopyJson.Table.length > 0) {
     for(var j=1;j<=counter;j++ )
     {
       
          var  columnName1='';
         var  columnName='';
          var i = 0;
         columnName1 +='[{';
        var LocationCode= jquery_1_11_3_min_p("#txtLocationCode_" +j).val(); 
        var LocationName= jquery_1_11_3_min_p("#txtLocatuion_" +j).val(); 
        var LocationDescription= jquery_1_11_3_min_p("#txtLocDesc_" +j).val(); 
         columnName1 += '"[LocationCode]"' + ':' + '"'+ LocationCode+ '","[LocationName]"' + ':' + '"' +LocationName + '","[LocationDescription]"' + ':' + '"' + LocationDescription + '",';
        jquery_1_11_3_min_p("#repeatArea_" + j).find('div :text').each(function () {
            var fieldValue =$(this).val();
            columnName=jquery_1_11_3_min_p("#lbl_"+i).text();
            columnName1 += '"[' + columnName + ']"' + ':' + '"' + fieldValue + '",';
            i++;   
        });
         var newcol = columnName1.slice(0, -1);
          columnName1 = '';
         columnName1 += newcol + '}]';

         var arrkey=jquery_1_11_3_min_p("#txtLocatuion_"+j).val();
         if(arrkey!=undefined)
          {
         JsonLocation.push(columnName1);
         }
         }
         
    }
}
function UpdateMakeAddressJson() {
    var id = Globalcounter;
    JsonLocation = [];
    var tempJson = "";
    if (CopyJson.Table.length > 0) {
        for (var j = 1; j <= Globalcounter; j++) {

            var columnName1 = '';
            var columnName = '';
            var i = 0;
            columnName1 += '[{';
            var LocationCode = jquery_1_11_3_min_p("#txtLocationCode_" + j).val();
            var LocationName = jquery_1_11_3_min_p("#txtLocatuion_" + j).val();
            var LocationDescription = jquery_1_11_3_min_p("#txtLocDesc_" + j).val();
           var LocationAutoid = jquery_1_11_3_min_p("#lblAutoid_" + j).text();
            columnName1 += '"[LocationCode]"' + ':' + '"' + LocationCode + '","[LocationName]"' + ':' + '"' + LocationName + '","[LocationDescription]"' + ':' + '"' + LocationDescription + '",';

            jquery_1_11_3_min_p("#repeatArea_" + j).find('div :text').each(function () {
                var fieldValue = $(this).val();
                columnName = jquery_1_11_3_min_p("#lbl_" + i).text();
                columnName1 += '"[' + columnName + ']"' + ':' + '"' + fieldValue + '",';
                i++;
            });
            var newcol = columnName1.slice(0, -1);
            columnName1 = '';
            columnName1 += newcol + '}]';
            var arrkey = jquery_1_11_3_min_p("#txtLocatuion_" + j).val();
            if (arrkey != undefined) {
                JsonLocation.push(LocationAutoid+'&'+columnName1);
            }
        }
      
    }
    
}
//====================================== end code for Create Json Of Address Data ================================\\
function SaveLocation(){

    var CreatedBy = jquery_1_11_3_min_p('#ContentPlaceHolder1_lblUserId').text();
     var CountryId=kendo_all_min_js("#ddlcountry").val();
       var entityid=kendo_all_min_js("#ddlentity").val();
        var Countryname=kendo_all_min_js("#ddlcountry").data("kendoDropDownList").text();
          var cName=Countryname.split(' ');
           var EntityName=kendo_all_min_js("#ddlentity").data("kendoDropDownList").text();
           var EName=EntityName.split(' ');
           Tablename='tbl'+EName[0]+'Address'+cName[0];
         //  var ParameterId=jquery_1_11_3_min_p('#ddlOrgPara').value();
   
     var a = JSON.stringify(JsonLocation);
    jquery_1_11_3_min_p.ajax({
    type: "POST",
    contentType: "application/json; charset=utf-8",
    url: "../WebServices/Setup.asmx/SaveLocation",
    data: "{'AddressJson':"+ a+",'CreatedBy':'" + CreatedBy + "','entityid':'" + entityid +"','CountryId':'"+CountryId+"','Tablename':'"+Tablename+"'}",
    dataType: "json",
    success: function (result) {
            var i = 0;
            var jsonData = eval(result.d);
             if (jsonData.Table.length > 0) {

              swal("Saved Successfully","Data Saved successfully!","success")
            .then((value) => {
             window.location.replace("OrganizationDataSetup.aspx");
            });
        }
        }
    });

}
function UpdateLocation() {

    var CreatedBy = jquery_1_11_3_min_p('#ContentPlaceHolder1_lblUserId').text();
    var CountryId = kendo_all_min_js("#ddlcountry").val();
    var entityid = kendo_all_min_js("#ddlentity").val();
    var Countryname = kendo_all_min_js("#ddlcountry").data("kendoDropDownList").text();
    var cName = Countryname.split(' ');
    var EntityName = kendo_all_min_js("#ddlentity").data("kendoDropDownList").text();
    var EName = EntityName.split(' ');
    Tablename = 'tbl' + EName[0] + 'Address' + cName[0];
    //  var ParameterId=jquery_1_11_3_min_p('#ddlOrgPara').value();

    var a = JSON.stringify(JsonLocation);
    jquery_1_11_3_min_p.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "../WebServices/Setup.asmx/UpdateLocation",
        data: "{'AddressJson':" + a + ",'CreatedBy':'" + CreatedBy + "','entityid':'" + entityid + "','CountryId':'" + CountryId + "','Tablename':'" + Tablename + "'}",
        dataType: "json",
        success: function (result) {
            var i = 0;
            var jsonData = eval(result.d);
            if (jsonData.Table.length > 0) {

                if (EmployeeArray.length === 0 && EmpWareHouse.length === 0) {
                    swal("Updated Successfully", "Data Updated successfully!", "success")
                        .then((value) => {
                            window.location.replace("OrganizationDataSetup.aspx");
                        });
                }
                else {
                    saveEmployee();
                }
            }
        }
    });

}
//====================================== end code for Save Partner Record ================================\\
function RemoveClass(data) {
    var id = data.id;
    if (jquery_1_11_3_min_p('#' + id).val() != '') {
        jquery_1_11_3_min_p('#' + id).removeClass('validate');
    } 
}
function AddRow() {

if(otherFieldsCounter==0)
{
otherFieldsCounter=1;
}
var RowId = otherFieldsCounter+1; var markup=''; var flag=0;
     for (var j = 1; j < copyColumnJson.Table.length - 9; j++) {
     if (jquery_1_11_3_min_p("#txt" + copyColumnJson.Table[j].COLUMN_NAME + "_" + otherFieldsCounter).val() != "") {
     flag=0;
   }
   else
   {
   flag=flag+1;
    jquery_1_11_3_min_p("#txt"+ copyColumnJson.Table[j].COLUMN_NAME +"_"+otherFieldsCounter).addClass("validate");
   }

   }
   if(flag==0)
   {
     markup +="<tr><td style='display:none'> "+RowId +" </td><td > <input type='checkbox' id='chk_"+RowId +"' class='chk_All'> </td>";
   for (var j = 1; j < copyColumnJson.Table.length - 9; j++) {
    markup +="<td> <input type='text' onkeypress='RemoveClass(this)' id='txt" + copyColumnJson.Table[j].COLUMN_NAME + "_" + RowId + "' placeholder='Enter Field Name' class='fieldName'  autocomplete='off'></td>";
   }
   markup +="</tr>";
   $('#tblOrgFields tbody').append(markup);
   otherFieldsCounter = RowId;
   }
   

}
function SaveParameterData()
{
   var Country = jquery_1_11_3_min_p("#ddlcountry").data("kendoDropDownList").text();
    var CountryName = [];
    CountryName = Country.split(' ');
    var entity = jquery_1_11_3_min_p("#ddlentity").data("kendoDropDownList").text();
    var EntityName = [];
    EntityName = entity.split(' ');
    var FieldName = kendo_all_min_js('#ddlOrgPara').data("kendoDropDownList").text();
    TableName = 'tblOrg' + EntityName[0] + CountryName[0] + '_' + FieldName;
    

var CreatedBy = jquery_1_11_3_min_p('#ContentPlaceHolder1_lblUserId').text();
var entityid=kendo_all_min_js("#ddlentity").val();
var CountryId=kendo_all_min_js("#ddlcountry").val();
  var FieldItems = [];
    var JsonFieldItems = '';
    var i = 1;
    var str='';
    var cols=[];
    var columnName = '';
    var columnName1 = ''
    var ColName = [];
    var cnt = 0;
    var length=jquery_1_11_3_min_p('#tblOrgFields tbody').find('tr').length;
   columnName1 +='[';
   jquery_1_11_3_min_p('#tblOrgFields tbody').find('tr').each(function () {

       var row = jquery_1_11_3_min_p(this);
       columnName1 +='{';
       for (var j = 1; j <  copyColumnJson.Table.length - 9; j++) {
           var fieldValue = kendo_all_min_js("#txt" +  copyColumnJson.Table[j].COLUMN_NAME + "_" + row.find('td:nth-child(1)').text().trim()).val();
           columnName =  copyColumnJson.Table[j].COLUMN_NAME;
           if(j == copyColumnJson.Table.length - 9)
           {
            columnName1 += '"' + columnName + '"' + ':' + '"' + fieldValue + '"';
           }
           else
           {
           columnName1 += '"' + columnName + '"' + ':' + '"' + fieldValue + '"'+ ',';
           }
           if (cnt == 0) {
               ColName.push(columnName);
           }

       }
       cnt++;
       if(i==length)
       {
       columnName1 +='}';
       }
       else
       {
       columnName1 +='},';
       }
       i++;
  
   });
     var newcol = columnName1.slice(0, -1);
    columnName1 = '';
    columnName1 += newcol+'}]'; 
    JsonFieldItems = columnName1;
    var Column = JSON.stringify(ColName);
    var ParameterId= kendo_all_min_js('#ddlOrgPara').val().split('_');
    
     jquery_1_11_3_min_p.ajax({
    type: "POST",
    contentType: "application/json; charset=utf-8",
    url: "../WebServices/Setup.asmx/SaveParameterData",
    data: "{'JsonFieldItems':'" + JsonFieldItems + "','TableName':'" + TableName + "','entityid':'" + entityid + "','CreatedBy':'" + CreatedBy + "','Column':" + Column + ",'CountryId':'" + CountryId + "','ParameterId':'" + ParameterId[1] + "'}",

    dataType: "json",
    success: function (result) {
            var i = 0;
            var jsonData = eval(result.d);
            if(jsonData.Table[0].Res==0)
            {
             swal("Entity Already Exists!")
            
            }
            else{
       swal("Saved Successfully","Data Saved successfully!","success")
            .then((value) => {
             window.location.replace("AddressDataSetup.aspx");
            });
        }
        }
    });
}
function BindOrgDataSetupGrid(searchtxt) {
 jquery_1_11_3_min_p("#TblOrgDataGrid tbody").empty();
    var wh = jquery_1_11_3_min_p(document).height();
    var gh = wh - 260;
    var Partners = [];

    var SearchValue = searchtxt;

    LoadData = jquery_1_11_3_min_p("#hdnLoad").val();
    jquery_1_11_3_min_p.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "../WebServices/Setup.asmx/BindOrgDataSetupGrid",
        data: "{'LoadData':'" + LoadData + "','SearchValue':'" + SearchValue + "'}",
        dataType: "json",
        success: function (result) {
            jquery_1_11_3_min_p('#preloader').css('display', 'none');
            jquery_1_11_3_min_p('#Overlay_Load').css('display', 'none');
            jquery_1_11_3_min_p('#divGrid').css('display', 'block');
            var i = 0;
            var jsonData = result.d;
            editjsondata= result.d;
            if(jsonData.Table.length>0)
            {
            editjson=result.d;
            jquery_1_11_3_min_p('#btnUpdate').prop("disabled", false);
            }
            else
            {
            jquery_1_11_3_min_p('#btnUpdate').prop("disabled", true);
            }
            
            jQuery.each(jsonData.Table, function (rec) {

                var markup = "<tr> <td style='display:none'> " + jsonData.Table[i].FieldId + "</td> <td style='display:none'> " + jsonData.Table[i].FieldDataType + "</td><td style='display:none'> " + jsonData.Table[i].EntityId + "</td> <td style='display:none'> " + jsonData.Table[i].CountryId + "</td><td style='display:none'> " + jsonData.Table[i].ParameterId + "</td> <td> <input id='chkbox' type='checkbox' class='checkAll'  /></td><td>" + jsonData.Table[i].Entityname + "</td> <td >" + jsonData.Table[i].CountryName + "</td> <td >" + jsonData.Table[i].FieldName + "</td></tr>";

                jquery_1_11_3_min_p("#TblOrgDataGrid tbody").append(markup);

                //=========================== start for PDF===================================

//                var pdftable = "<tr><td>" + jsonData.Table[i].PartnerType + "</td> <td >" + jsonData.Table[i].PartnerName + "</td> <td >" + jsonData.Table[i].ContactNo + "</td></tr>";
//                jquery_1_11_3_min_p("#pdftable tbody").append(pdftable);

                //==============================end for PFD=================================

                i++;
            });
            var k = 0;
            if (jsonData.Table.length > 0) { var columnsIn = jsonData.Table[0]; for (var key in columnsIn) { if (k > 0) { ColumnName.push(key); } k++; } } else {
                ColumnName.push(k); k++;
            }
            var j = 0; jquery_1_11_3_min_p("#DivSearch").empty();
//            var SearchDiv1 = "<div class='dropdown-item'><span class='skin skin-polaris'><input type='checkbox' class='checkAll' id='chk_" + ColumnName[j - 1] + "' onclick='checkAll(this)'><label for='check3' class='coldata'>All</label></span></div>";
//            jquery_1_11_3_min_p("#DivSearch").append(SearchDiv1);
            jquery_1_11_3_min_p('#TblOrgDataGrid thead tr th').each(function () {
                if (j > 1) {

                var id1='chk_'+ ColumnName[j - 2];
                this.id=id1;
                    var SearchDiv = "<div class='dropdown-item'><span class='skin skin-polaris'><input type='checkbox' class='searchcheckAll' id='chk_" + ColumnName[j - 2] + "' onclick='Addclasstocolumn(this)'><label for='check3' class='coldata'>" + $(this).text() + "</label></span></div>";
                    jquery_1_11_3_min_p("#DivSearch").append(SearchDiv);

//                     var table = document.getElementById('tblfields');
//  var i;
//  for (i = 0; i < 1; i++) {
//  var findth = jquery_1_11_3_min_p(table.rows[i].cells[1]).text().trim();
//  alert(findth);
//  }

                }
                j++;

            });
            var Searchfinaldiv="<div class='dropdownBottom'><label class='pull-left' id='selectall' onclick='searchcheckAll()' >Select All</label><label class='pull-right' id='reset' onclick='searchUncheckAll()' >Reset</label></div>";
jquery_1_11_3_min_p("#DivSearch").append(Searchfinaldiv);
            if (jsonData.Table.length >= jsonData.Table1[0].Totalcount) {
                jquery_1_11_3_min_p('#lblRowCount').text(jsonData.Table1[0].Totalcount);
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
function BindEmpAddress(Entityid,countryid) {
    Address = [];
    jquery_1_11_3_min_p.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "../WebServices/Customer.asmx/BindAddressDropDowns",
        data: "{'entityId':'" + Entityid + "','CountryId':'" + countryid + "'}",
        dataType: "json",
        async: false,
        success: function (result) {
            var jsonData = eval(result.d);
            var i = 0;
            Address.push({ value: "0", text: "Select" });
            jQuery.each(jsonData.Table, function (rec) {
                Address.push({ value: jsonData.Table[i].AutoId, text: jsonData.Table[i].ParterAddress });
                i++;
            });
        
            jquery_1_11_3_min_p('#empTable tbody').find('tr').each(function () {
                var row = jquery_1_11_3_min_p(this);
                var rowNumber = row.find('td:nth-child(1)').text().trim();


                kendo_all_min_js("#empaddress_" + rowNumber).kendoDropDownList({
                    filter: "contains",
                    template: "<input type='checkbox' id='" + rowNumber +"chk_OtherUnit_#=data.value#' class='clsSkillInner' value='#=data.value #' name='OtherUnit' />" + " " + "${ data.text }",
                    dataTextField: "text",
                    dataValueField: "value",
                    dataSource: Address,
                    close: onClose,
                    dataBound: onOtherUnitBound,
                    change: function () {
                        kendo_all_min_js('#empaddress_' + rowNumber).data("kendoDropDownList").span.css('background', 'none');
                    }
                });
            });

        }
    });

    
}
function onOtherUnitBound(e) {

    $(".clsSkillInner").on("click", function (e) {
        var obj = this;
        var id = $(obj).attr('id');
        var name = 'OtherUnit';
        var value = $(obj).attr('value');
        var IsChecked = $(obj).is(':checked');
        var hf = $("#hf").get(0);

        if (value != 0) {
            UpdateIdInHiddenField(hf, value, IsChecked);
            var totalchk = $('input[id*="chk_' + name + '"]').not("#chk_" + name + "_0").length;
            var checkedchk = $('input[id*="chk_' + name + '"]:checked').not("#chk_" + name + "_0").length;

            if (totalchk == checkedchk) {
                $("#chk_" + name + "_0").prop("checked", true);
            }
            else {
                $("#chk_" + name + "_0").prop("checked", false);
            }

            SkillCount = $("#hf").val().split(',').length - 1;
            //  }

        }
        else {

        }
        IsItemChecked = true;


    });
    bindSkillChk();

}
function bindSkillChk() {
    var chkInner = $("#hf").val().split(',');
    chkInner = chkInner.filter(a => a != '');
    $.each(chkInner, function (index, data) {
        $('input[id*="chk_OtherUnit_' + data + '"]').prop("checked", true);
    })
}
function onClose(e) {
    var obj = this;
    var id = $(obj).attr('id');
    if (IsItemChecked == true) {
        IsItemChecked = false;
        e.preventDefault();
    }
    else {

        if (dblclickFlag == 0) {
            var Otherunitdata = $("#hf").val().split(',');
            var getlastele = Otherunitdata.length - 2;
            var lastelement = Otherunitdata[getlastele];
            if (lastelement == '' || lastelement == undefined) {
                kendo_all_min_js('#' + id).data("kendoDropDownList").value(0);
            }
            else {
                kendo_all_min_js('#' + id).data("kendoDropDownList").value(lastelement);
            }
        }


    }
}
var IsItemChecked = false;
function UpdateIdInHiddenField(hf, id, IsAdd) {
    if (hf.value == "") {
        hf.value = ",";
    }
    if (IsAdd == true) {
        if (hf.value.indexOf("," + id + ",") == -1) {
            hf.value = hf.value + id + ",";
        }
    }
    else if (IsAdd == false) {
        if (hf.value.indexOf("," + id + ",") >= 0) {
            hf.value = hf.value.replace("," + id + ",", ",");
        }
    }

}  
function DisplayOrgLocation(DataType,EntityId, countryId,ParameterId) {
 jquery_1_11_3_min_p('.noData').css('display', 'none');
var counter=0;
    var DataType =DataType;
    var entityId = EntityId;
    var countryId = countryId;
    jquery_1_11_3_min_p("#BindField1").empty();
    jquery_1_11_3_min_p.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "../WebServices/Setup.asmx/DisplayOrgLocation",
        data: "{'DataType':'" + DataType + "','entityId':'" + entityId + "','countryId':'" + countryId + "'}",
        dataType: "json",
        async:false,
        success: function (result) {
           // var i = 0;
            var jsonData = result.d;
            jquery_1_11_3_min_p('#empDiv').css('display', 'block');
            
           var markup="";
           if(DataType=='2')
           {
                  
               jquery_1_11_3_min_p("#ddlcountry").data("kendoDropDownList").value(jsonData.Table[0].CountryId);
              jquery_1_11_3_min_p("#ddlentity").data("kendoDropDownList").value(jsonData.Table[0].EntityId);
             BindOrgParaddl(jsonData.Table[0].CountryId,jsonData.Table[0].EntityId);
              jquery_1_11_3_min_p('#ddlOrgPara').data("kendoDropDownList").value(ParameterId);
             
                 $("#OrganizationDataForm").css('display', 'block');
                 $("#OrganizationDataGrid").css('display', 'none');
                 jquery_1_11_3_min_p('#OrgFielddiv').css('display', 'block');
                var country=  kendo_all_min_js("#ddlcountry").data("kendoDropDownList").readonly();
                   kendo_all_min_js("#ddlentity").data("kendoDropDownList").readonly();
                    kendo_all_min_js("#ddlOrgPara").data("kendoDropDownList").readonly();
                  $('#tblOrgFields thead tr').append(" <th><input type='checkBox' id='chkAll'/>All</th>");
           
            for (var j = 1; j < jsonData.Table1.length - 9; j++) {
                $('#tblOrgFields thead tr').append($('<th />', { text: jsonData.Table1[j].COLUMN_NAME }));
              
            }
            var i=0;
             jQuery.each(jsonData.Table, function (rec) {
             var RowId=counter+1;
              markup="<tr>";
              markup+= "<td style='display:none'>1</td><td><input type='checkbox' id='chk_1' class='chk_All'></td>";
              for (var j = 1; j < jsonData.Table1.length - 9; j++) {
                markup += " <td> <input type='text' onkeyup='RemoveClass(this)' id='txt" + jsonData.Table1[j].COLUMN_NAME + "_"+RowId+"' placeholder='Enter Field Name' class='fieldName'  autocomplete='off'></td>";
              }
              markup +="</tr>";
              $('#tblOrgFields tbody').append(markup);
               for (var j = 1; j < jsonData.Table1.length - 9; j++) {
               id="txt" + jsonData.Table1[j].COLUMN_NAME + "_"+RowId
               jquery_1_11_3_min_p('#'+id).val(jsonData.Table[i][jsonData.Table1[j].COLUMN_NAME]);
                jquery_1_11_3_min_p('#'+id).attr('disabled', 'disabled');
               }
               counter=RowId;
               i++;
             });
                jquery_1_11_3_min_p('#btnSubmit').css('display', 'block');
               // jquery_1_11_3_min_p('#btnSubmit').prop('disabled', true);
                jquery_1_11_3_min_p('#btnback').css('display', 'block');
               jquery_1_11_3_min_p('#btnnew').css('display', 'none');
              jquery_1_11_3_min_p('#btnDeleteLine').css('display', 'none');
              jquery_1_11_3_min_p('#btnAdd').css('display', 'none');

               
           }
           else
           {

            jquery_1_11_3_min_p('#btnSubmit').css('display', 'block');
               // jquery_1_11_3_min_p('#btnSubmit').prop('disabled', true);

                jquery_1_11_3_min_p('#btnback').css('display', 'block');
               jquery_1_11_3_min_p('#btnnew').css('display', 'none');
              jquery_1_11_3_min_p('#btnDeleteLine').css('display', 'none');
               jquery_1_11_3_min_p('#btnaddAddress').css('display', 'none');
              jquery_1_11_3_min_p('#btnAdd').css('display', 'none');
             $("#OrganizationDataForm").css('display', 'block');
             $("#OrganizationDataGrid").css('display', 'none');
             jquery_1_11_3_min_p('#OrgAddressDiv').css('display', 'block');
               var Country = jquery_1_11_3_min_p("#ddlcountry").data("kendoDropDownList").value(jsonData.Table[0].CountryId);
              var entity = jquery_1_11_3_min_p("#ddlentity").data("kendoDropDownList").value(jsonData.Table[0].EntityId);
             BindOrgParaddl(jsonData.Table[0].CountryId,jsonData.Table[0].EntityId);
              jquery_1_11_3_min_p('#ddlOrgPara').data("kendoDropDownList").value(ParameterId);
                 $("#OrganizationDataForm").css('display', 'block');
                 $("#OrganizationDataGrid").css('display', 'none');
                 jquery_1_11_3_min_p('#OrgFielddiv').css('display', 'block');
                var country=  kendo_all_min_js("#ddlcountry").data("kendoDropDownList").readonly();
                   kendo_all_min_js("#ddlentity").data("kendoDropDownList").readonly();
                    kendo_all_min_js("#ddlOrgPara").data("kendoDropDownList").readonly();
                   var EntityId = kendo_all_min_js('#ddlentity').val();
                   var CountryId = kendo_all_min_js('#ddlcountry').val();
                  counter=0; 
           for(var j=1;j<=jsonData.Table.length;j++ )
           {
              
               if(j==1)
               {
                var EntityId = kendo_all_min_js('#ddlentity').val();
                var CountryId = kendo_all_min_js('#ddlcountry').val();
                BindAddressFields(EntityId,CountryId);
         
        if(counter==0)
      {
      counter++
      }
         jQuery.each(jsonData.Table, function (rec) {
             var LocationCode = jquery_1_11_3_min_p("#txtLocationCode_" + counter).val(jsonData.Table[0].LocationCode); 
             jquery_1_11_3_min_p("#lblAutoid_" + counter).text(jsonData.Table[0].AutoId);
                 var LocationName= jquery_1_11_3_min_p("#txtLocatuion_" +counter).val(jsonData.Table[0].LocationName); 
               var LocationDescription= jquery_1_11_3_min_p("#txtLocDesc_" +counter).val(jsonData.Table[0].LocationDescription); 
                 var l=0
             jquery_1_11_3_min_p("#repeatArea_" + counter).find('div').each(function () {
                 jquery_1_11_3_min_p("#txt_" + CopyJson.Table[l].TxtId + counter).val(jsonData.Table[0][CopyJson.Table[l].FieldName]);
                // jquery_1_11_3_min_p("#lblAutoid").text(jsonData.Table[j].AutoId);
             if (CopyJson.Table[l].FieldDataType == "2") {
                 kendo_all_min_js("#txt_" + CopyJson.Table[l].TxtId+counter).data("kendoDropDownList").value(jsonData.Table[0][CopyJson.Table[l].FieldName]); 
            }
            l++;
        });

        });
               }
               else{

             if (counter == 0) {
                counter++;
            }
         
            var RowId = counter + 1;
                   jquery_1_11_3_min_p(".addressDiv").append("<div class='col-md-3 mb-1' id='addressdiv_" + RowId + "' > <div class='addressBg' id='AddressDiv'><div id='btnClosr_" + RowId + "_" + jsonData.Table[j - 1].AutoId + "' class='closeAddress pull-right' onclick='deleteAddress(this)'><i  class='fa fa-close'></i></div><div class='AllAddress form-group'> <label class='textHeader' id='lbladdress'>Address " + RowId + "</label></div>  <div class='form-group'><label for='Country'>Location Code</label><input type='text'  id='txtLocationCode_" + RowId + "'  autocomplete='off' placeholder='Enter Location Name' class='form-control'/> <label id='lblAutoid_" + RowId+"' style='display: none;' />  </div><div class='form-group'><label for='Country'>Location Name</label><input type='text' id='txtLocatuion_" + RowId + "' autocomplete='off' placeholder='Enter Location Name' class='form-control'/> </div><div class='form-group'> <label for='Country'>Location Description</label><input type='text'  id='txtLocDesc_" + RowId + "' autocomplete='off' placeholder='Enter Location Description' class='form-control'/> </div><div id='repeatArea_" + RowId + "'></div></div> </div>");
                  
            counter = RowId;
              var EntityId = kendo_all_min_js('#ddlentity').val();
             var CountryId = kendo_all_min_js('#ddlcountry').val();
             jquery_1_11_3_min_p("#repeatArea_" + counter).empty();
    jquery_1_11_3_min_p.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "../WebServices/Customer.asmx/BindPAddressFields",
        data: "{'EntityId':'" + EntityId + "','CountryId':'" + CountryId + "'}",
        dataType: "json",
        async:false,
        success: function (result) {
            var i = 0;
            var jsonData = result.d;
            CopyJson = jsonData;
            var a = 0;

            jQuery.each(jsonData.Table, function (rec) {
                var markup = "<div class='form-group'> <label id='lbl_" + i + "' for='Address'>" + jsonData.Table[i].FieldName + "</label><input type='text'  id='txt_" + jsonData.Table[i].TxtId + counter + "' autocomplete='off'  class='form-control' onkeypress='RemoveClassAddressDiv(this)' placeholder=' Enter " + jsonData.Table[i].FieldName + "'/></div>";
                jquery_1_11_3_min_p("#repeatArea_" + counter).append(markup);
                if (jsonData.Table[i].FieldDataType == "2") {
                    var TableName = jsonData.Table1[a].TablesName;
                    a = a + 1;
                    var ddlId = jsonData.Table[i].FieldName + counter;
                    BindFieldsddl(TableName, ddlId);

                }
                i++;
            });

        }
    });

         }
       
         
    }
    if(jsonData.Table.length>1)
    {

      
      var Bindcounter=1;
        var newcounter = 2;
         if(counter==0)
      {
      counter++
        }
        Globalcounter = counter;
        jQuery.each(jsonData.Table, function (rec) {
            if (jsonData.Table.length != Bindcounter) {
                var LocationCode = jquery_1_11_3_min_p("#txtLocationCode_" + newcounter).val(jsonData.Table[Bindcounter].LocationCode);
                jquery_1_11_3_min_p("#lblAutoid_" + newcounter).text(jsonData.Table[Bindcounter].AutoId);
                var LocationName = jquery_1_11_3_min_p("#txtLocatuion_" + newcounter).val(jsonData.Table[Bindcounter].LocationName);
                var LocationDescription = jquery_1_11_3_min_p("#txtLocDesc_" + newcounter).val(jsonData.Table[Bindcounter].LocationDescription);
                var l = 0
                jquery_1_11_3_min_p("#repeatArea_" + newcounter).find('div').each(function () {
                    jquery_1_11_3_min_p("#txt_" + CopyJson.Table[l].TxtId + newcounter).val(jsonData.Table[Bindcounter][CopyJson.Table[l].FieldName]);
                   // jquery_1_11_3_min_p("#lblAutoid").text(jsonData.Table[j - 1].AutoId);
                    if (CopyJson.Table[l].FieldDataType == "2") {
                        kendo_all_min_js("#txt_" + CopyJson.Table[l].TxtId + newcounter).data("kendoDropDownList").value(jsonData.Table[Bindcounter][CopyJson.Table[l].FieldName]);
                    }
                    l++;
                });

                Bindcounter++;
                newcounter++;
            }

         });
     }
          
        } 
      
          }
         
           });
		   
     }
function Findclick() {
    $('#ContentPlaceHolder1_FileUpload').click();
}
function UploadFile() { $('#ContentPlaceHolder1_btnUpload4').click(); }

