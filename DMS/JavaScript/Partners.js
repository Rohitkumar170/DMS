﻿var counter = 0;
var CopyJson = [];
var JsonAddress = [];
var IsDelete = 0;
var Tablename = '';
var Country = [];
var entityId = 1;
var Tax = [];
var Address = [];
var jsonExistingLocdata = "";
var searchtxt = '';
var ColumnName = [];
var dblclickFlag = 0;
var PartnerIddblclick = 0;
var AddressCounter = 0;
var TaxInfoCounter = 0;
var dblclickFlag = 0;
var IsFirstAddress = 0;
var IsFirstTax = 0;
var OldAddressCounter = 0;
var JsonAddressUpdate = [];
var SessionEntityId = 1;
var SessionCountryId = 1;
var SessionEntityName = "Dhiraagu";
var EmployeeArray = [];
var EmpWareHouse = [];
var EmpAddress = [];
var TaxCounter = 0;
var EmpCounter = 5;
var creadentialArray = [];
var empId = '';
var empMobile = '';
var Imgpath = '';
var empemailId = '';
var empName = '';
var isemail = 0;

jquery_1_11_3_min_p(document).ready(function () {
    jquery_1_11_3_min_p('#btntaxGrp').click(function () {
        $("#TaxGroup").modal('show');
        //jquery_1_11_3_min_p("#lblitm").text(dbitemname);
        BindTaxGroup();

    });
    jquery_1_11_3_min_p('#btntaxgrpclose').click(function () {
        $("#TaxGroup").modal('hide');

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
    jquery_1_11_3_min_p('#btnTaxgrpSubmit').click(function () {
        SaveTaxGroup();

    });
    BindddlCountry(SessionEntityId);
    jquery_1_11_3_min_p("#hdnLoad").val(10);
    LoadData = jquery_1_11_3_min_p("#hdnLoad").val();
    jquery_1_11_3_min_p('#ContentPlaceHolder1_preloader').css('display', 'block');
    jquery_1_11_3_min_p('#ContentPlaceHolder1_Overlay_Load').css('display', 'block');
    BindAllPartner(searchtxt);
    jquery_1_11_3_min_p('#btnLoadMore').click(function () {
        LoadData = parseInt(LoadData) + 10;
        jquery_1_11_3_min_p("#hdnLoad").val(LoadData);
        jquery_1_11_3_min_p('#ContentPlaceHolder1_preloader').css('display', 'block');
        jquery_1_11_3_min_p('#ContentPlaceHolder1_Overlay_Load').css('display', 'block');
        BindAllPartner(searchtxt);
    });


    //     jquery_1_11_3_min_p("#TaxDiv").css('display', 'block');
    //====================================== start code for add new address================================\\
    jquery_1_11_3_min_p("#btnaddAddress").click(function () {
        if (IsFirstAddress == 0) {
            if (dblclickFlag == 1) {
                counter = AddressCounter;
                IsFirstAddress++;
            }
        }
        if (ValidateAddress() == true) {
            if (counter == 0) {
                counter++;
            }
            var RowId = counter + 1;
            jquery_1_11_3_min_p(".addressDiv").append("<label id='lblAutoId_" + RowId + "' style='display:none'></label><div class='col-md-3 mb-1' id='addressdiv_" + RowId + "' ><div class='addressBg' id='AddressDiv'><div id='btnClosr_" + RowId + "' class='closeAddress pull-right' onclick='deleteAddress(this)'><i  class='fa fa-close'></i></div><div class='AllAddress form-group'> <label class='textHeader' id='lbladdress'>Address " + RowId + "</label></div><div class='form-group'> <label for='Country'>Country</label><input type='text' id='ddlCountry_" + RowId + "' autocomplete='off'  class='form-control'/> </div> <div class='form-group'> <label for='Country'>Location Name</label><input type='text'  id='txtLocation_" + RowId + "' onkeypress='RemoveClass(this)' autocomplete='off' placeholder='Location Name' class='form-control'/> </div> <div class='form-group'> <label for='Country'>Location Code</label> <input type='text'  id='txtLocationCode_" + RowId + "' autocomplete='off' placeholder='Location Code' class='form-control' onkeypress='RemoveClass(this)'/> </div><div id='repeatArea_" + RowId + "'></div></div> </div>");

            counter = RowId;
            BindddlCountry(entityId);
        }
    });
    //====================================== end code for add new address================================\\

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

    //====================================== start code for  New Button click================================\\

    jquery_1_11_3_min_p("#btnNew").click(function () {
        jquery_1_11_3_min_p("#btnNew").css('display', 'none');
        jquery_1_11_3_min_p("#btnBack").css('display', 'block');
        $("#partnerForm").css('display', 'block');
        $("#PartnerGrid").css('display', 'none');
        jquery_1_11_3_min_p('#btnupload').css('display', 'block');
        jquery_1_11_3_min_p('#btnuploadAddress').css('display', 'block');
        jquery_1_11_3_min_p('#btnuploadLegalField').css('display', 'block');
        jquery_1_11_3_min_p("#TaxDiv").css('display', 'block');
        BindPartnerCode();
        //EmpAddress.push({ value: "0", text: "Select" });
        //jquery_1_11_3_min_p('#empTable tbody').find('tr').each(function () {
        //    var row = jquery_1_11_3_min_p(this);
        //    var rowNumber = row.find('td:nth-child(1)').text().trim();
        //    kendo_all_min_js("#empaddress_" + rowNumber).kendoDropDownList({
        //        filter: "contains",
        //        template: "<input type='checkbox' id='" + rowNumber + "chk_OtherUnit_#=data.value#' class='clsSkillInner' value='#=data.value #' name='OtherUnit' />" + " " + "${ data.text }",
        //        dataTextField: "text",
        //        dataValueField: "value",
        //        dataSource: EmpAddress,
        //        close: onClose,
        //        dataBound: onOtherUnitBound,
        //        change: function () {
        //            kendo_all_min_js('#empaddress_' + rowNumber).data("kendoDropDownList").span.css('background', 'none');
        //        }
        //    });
        //});
    });
    //====================================== end code for  New Button click================================\\


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

    //====================================== start code for  Back Button click================================\\
    jquery_1_11_3_min_p('#btnBack').click(function () {
        window.location.replace("Partner.aspx");
    });
    //====================================== end code for  new Button click================================\\

    //====================================== start code for  Submit Button click================================\\btnProceedLegal

    jquery_1_11_3_min_p('#btnProceedLegal').click(function () {
        if (ValidateTaxGrid() == true) {
            swal({
                title: "Do you want to proceed?",
                text: "",
                icon: "warning",
                buttons: true,
                dangerMode: true,
            })
                .then((willDelete) => {
                    if (willDelete) {
                        SaveTaxInfo();

                    }
                });
        }
    });
    jquery_1_11_3_min_p('#btnSubmit').click(function () {
        //if (ValidateTaxGrid() == true) {
        //    swal({
        //        title: "Do you want to Submit?",
        //        text: "",
        //        icon: "warning",
        //        buttons: true,
        //        dangerMode: true,
        //    })
        //        .then((willDelete) => {
        //            if (willDelete) {
        //                SaveTaxInfo();

        //            }
        //        });
        //}
        if (validateEmpLoyeeForm() == true) {
            swal({
                title: "Do you want to Submit?",
                text: "",
                icon: "warning",
                buttons: true,
                dangerMode: true,
            })
                .then((willDelete) => {
                    if (willDelete) {
                        
                        saveEmployee();

                    }
                });
        }
    });
    //====================================== End code for  Submit Button click================================\\


    $(document).on("dblclick", "#partners tbody tr", function () {
        var row = jquery_1_11_3_min_p(this);
        $("#partners tbody tr").removeClass("selectedRow");
        row.addClass("selectedRow");
        PartnerIddblclick = row.find('td:nth-child(1)').text().trim();
        dblclickFlag = 1;
        BindPartnerOndblClick(PartnerIddblclick);
        $("#btntaxGrp").css("display", "block");
        BindEmpAddress();
        
    });

    //====================================== start code for  Proceed Button click================================\\

    jquery_1_11_3_min_p('#btnProceed').click(function () {
        if (ValidateOnProceed() == true) {
            if (dblclickFlag != 1) {
                swal({
                    title: "Do you want to proceed?",
                    text: "",
                    icon: "warning",
                    buttons: true,
                    dangerMode: true,
                })
                    .then((willDelete) => {
                        if (willDelete) {
                            if ($('.checkLocation').prop("checked") == true && $('.ExistingCheck').prop("checked") == false) {
                                MakeAddressJson();
                                SaveRecord();
                            }
                            if ($('.checkLocation').prop("checked") == false && $('.ExistingCheck').prop("checked") == true) {
                                getExistingAddress()
                                SaveRecord();
                            }
                            if ($('.checkLocation').prop("checked") == true && $('.ExistingCheck').prop("checked") == true) {
                                MakeAddressJson();
                                getExistingAddress()
                                SaveRecord();

                            }
                        }
                    });
            }
            else {

                swal({
                    title: "Do you want to update record?",
                    text: "",
                    icon: "warning",
                    buttons: true,
                    dangerMode: true,
                })
                    .then((willDelete) => {
                        if (willDelete) {
                            if ($('.checkLocation').prop("checked") == true && $('.ExistingCheck').prop("checked") == false) {
                                MakeAddressJsonUpdate();
                                UpdatePartner();

                            }
                            if ($('.checkLocation').prop("checked") == false && $('.ExistingCheck').prop("checked") == true) {
                                // getExistingAddress()
                                //  SaveRecord();       
                            }
                            if ($('.checkLocation').prop("checked") == true && $('.ExistingCheck').prop("checked") == true) {
                                MakeAddressJsonUpdate();
                                // getExistingAddress()
                                UpdatePartner();



                            }


                        }
                    });


            }

        }

    });
    //====================================== End code for  Proceed Button click================================\\

});//===========end for ready function=============

//====================================== start code for BindAddress Fields================================\\
function BindAddressFields(entityId, countryId) {

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
        async: false,
        success: function (result) {

            var i = 0;
            var jsonData = result.d;
            CopyJson = jsonData;
            var a = 0;

            jQuery.each(jsonData.Table, function (rec) {
                var markup = "<div class='form-group'> <label id='lbl" + counter + "_" + i + "' for='Address'>" + jsonData.Table[i].FieldName + "</label><input type='text'  id='txt_" + jsonData.Table[i].TxtId + counter + "' autocomplete='off'  class='form-control' onkeypress='RemoveClass(this)' placeholder=' Enter " + jsonData.Table[i].FieldName + "'/></div>";
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

//====================================== start code for Bind All Dropdowns  ================================\\
function BindddlCountry(entityId) {
    if (counter == 0) {
        counter++;
    }

    var Entity = [];
    var PGroup = [];
    var PType = [];
    var PStatus = [];

    jquery_1_11_3_min_p.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "../WebServices/Customer.asmx/BindCountry",
        data: "{'entity':'" + entityId + "'}",
        dataType: "json",
        async: false,
        success: function (result) {
            jsonData = eval(result.d);

            Country = [];
            var i = 0;
            Country.push({ value: "0", text: "Select" });
            jQuery.each(jsonData.Table, function (rec) {
                Country.push({ value: jsonData.Table[i].CountryId, text: jsonData.Table[i].CountryName });
                i++;
            });

            var i = 0;
            PGroup.push({ value: "0", text: "Select" });
            jQuery.each(jsonData.Table2, function (rec) {
                PGroup.push({ value: jsonData.Table2[i].Groupid, text: jsonData.Table2[i].GroupName });
                i++;
            });
            var i = 0;
            PType.push({ value: "0", text: "Select" });
            jQuery.each(jsonData.Table3, function (rec) {
                PType.push({ value: jsonData.Table3[i].PartnerTypeId, text: jsonData.Table3[i].PartnerType });
                i++;
            });
            var i = 0;
            //  PStatus.push({ value: "0", text: "Select" });
            jQuery.each(jsonData.Table4, function (rec) {
                PStatus.push({ value: jsonData.Table4[i].StatusId, text: jsonData.Table4[i].Status });
                i++;
            });

        },
        error: function (result) {
        }
    });


    kendo_all_min_js('#ddlCountry_' + counter).kendoDropDownList({
        filter: "contains",
        dataTextField: "text",
        dataValueField: "value",
        dataSource: Country,
        change: function () {
            var entityId = SessionEntityId;
            var countryId = kendo_all_min_js('#ddlCountry_' + counter).val();
            kendo_all_min_js('#ddlCountry_' + counter).data("kendoDropDownList").span.css('background', 'none');
            BindAddressFields(entityId, countryId);
        }
    });

    kendo_all_min_js('#ddlCountryExsingAdd').kendoDropDownList({
        filter: "contains",
        dataTextField: "text",
        dataValueField: "value",
        dataSource: Country,
        change: function () {
            var entityId = SessionEntityId;
            var countryId = kendo_all_min_js('#ddlCountryExsingAdd').val();
            kendo_all_min_js('#ddlCountryExsingAdd').data("kendoDropDownList").span.css('background', 'none');
            BindExistingLocation(entityId, countryId);
        }
    });
    kendo_all_min_js('#ddlPartnergroup').kendoDropDownList({
        filter: "contains",
        dataTextField: "text",
        dataValueField: "value",
        dataSource: PGroup,
        change: function () {
            kendo_all_min_js('#ddlPartnergroup').data("kendoDropDownList").span.css('background', 'none');

        }
    });
    kendo_all_min_js('#ddlPartnerType').kendoDropDownList({
        filter: "contains",
        dataTextField: "text",
        dataValueField: "value",
        dataSource: PType,
        change: function () {
            kendo_all_min_js('#ddlPartnerType').data("kendoDropDownList").span.css('background', 'none');

        }
    });
    kendo_all_min_js('#ddlPartnerStatus').kendoDropDownList({
        filter: "contains",
        dataTextField: "text",
        dataValueField: "value",
        dataSource: PStatus,
        change: function () {
            kendo_all_min_js('#ddlPartnerStatus').data("kendoDropDownList").span.css('background', 'none');

        }
    });
}
//====================================== end code for Bind All Dropdowns ================================\\
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
    var i = 0;
    if (kendo_all_min_js("#ddlCountry_" + counter).val() == 0) {
        kendo_all_min_js("#ddlCountry_" + counter).data("kendoDropDownList").span.css('background', '#f9e5e5');
        allow = false;
    }
    if (jquery_1_11_3_min_p("#txtLocation_" + counter).val() == "") {
        jquery_1_11_3_min_p("#txtLocation_" + counter).addClass('validate');
        jquery_1_11_3_min_p("#txtLocation_" + counter).attr("placeholder", "Location Name!");
        allow = false;
    }
    if (jquery_1_11_3_min_p("#txtLocationCode_" + counter).val() == "") {
        jquery_1_11_3_min_p("#txtLocationCode_" + counter).addClass('validate');
        jquery_1_11_3_min_p("#txtLocationCode_" + counter).attr("placeholder", "Location Code!");
        allow = false;
    }
    if (CopyJson.Table.length > 0) {
        jquery_1_11_3_min_p("#repeatArea_" + counter).find('div').each(function () {
            if (jquery_1_11_3_min_p("#txt_" + CopyJson.Table[i].TxtId + counter).val() == "") {
                jquery_1_11_3_min_p("#txt_" + CopyJson.Table[i].TxtId + counter).addClass('validate');
                jquery_1_11_3_min_p("#txt_" + CopyJson.Table[i].TxtId + counter).attr("placeholder", "Enter Field value!");
                allow = false;
            }
            if (CopyJson.Table[i].FieldDataType == "2") {
                if (kendo_all_min_js("#txt_" + CopyJson.Table[i].TxtId + counter).val() == 0) {
                    kendo_all_min_js("#txt_" + CopyJson.Table[i].TxtId + counter).data("kendoDropDownList").span.css('background', '#f9e5e5');
                    allow = false;
                }
            }
            i++;
        });
    }
    else {
        allow = false;
        swal("Entity Not Exist In This Country");
    }
    return allow;
}

//====================================== end code for ValidateAddress Box ================================\\
//====================================== start code for ValidateForm ================================\\
function ValidateForm() {
    var allow = true;
    var i = 0;
    if (jquery_1_11_3_min_p("#txtPname").val() == "") {
        jquery_1_11_3_min_p("#txtPname").addClass('validate');
        jquery_1_11_3_min_p("#txtPname").attr("placeholder", "Enter Partner Name!");
        allow = false;
    }
    if (jquery_1_11_3_min_p("#ddlPartnergroup").val() == 0) {
        jquery_1_11_3_min_p("#ddlPartnergroup").data("kendoDropDownList").span.css('background', '#f9e5e5');
        allow = false;
    }
    if (jquery_1_11_3_min_p("#ddlPartnerType").val() == 0) {
        jquery_1_11_3_min_p("#ddlPartnerType").data("kendoDropDownList").span.css('background', '#f9e5e5');
        allow = false;
    }
    if (jquery_1_11_3_min_p("#txtdesc").val() == "") {
        jquery_1_11_3_min_p("#txtdesc").addClass('validate');
        jquery_1_11_3_min_p("#txtdesc").attr("placeholder", "Enter Description!");
        allow = false;
    }
    if (jquery_1_11_3_min_p("#txtrepresentative").val() == "") {
        jquery_1_11_3_min_p("#txtrepresentative").addClass('validate');
        jquery_1_11_3_min_p("#txtrepresentative").attr("placeholder", "Enter Description!");
        allow = false;
    }
    if (jquery_1_11_3_min_p("#ddlPartnerStatus").val() == 0) {
        jquery_1_11_3_min_p("#ddlPartnerStatus").data("kendoDropDownList").span.css('background', '#f9e5e5');
        allow = false;
    }



    return allow;
}
//====================================== end code for ValidateForm ================================\\

//====================================== start code for Delete Address Box ================================\\
function deleteAddress(ele) {

    var id = ele.id;
    var arr = [];
    arr = id.split('_');
    swal({
        title: "Do you want to Delete?",
        text: "",
        icon: "warning",
        buttons: true,
        dangerMode: true,
    })
        .then((willDelete) => {
            if (willDelete) {
                jquery_1_11_3_min_p("#addressdiv_" + arr[1]).remove();
                IsDelete++;

            }
        });
}
//====================================== end code for Delete Address Box ================================\\
//====================================== start code for BindPartnerCode ================================\\
function BindPartnerCode() {

    jquery_1_11_3_min_p.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "../WebServices/Customer.asmx/BindPartnerCode",
        data: "{}",
        dataType: "json",
        success: function (result) {
            var i = 0;
            var Pcode = eval(result.d);
            jQuery.each(Pcode.Table, function (rec) {
                jquery_1_11_3_min_p('#txtPartnerCode').val(Pcode.Table[i].PartnerCode);
                jquery_1_11_3_min_p('#txtPartnerCode').prop("disabled", true);
            });
        }
    });
}

//====================================== end code for BindPartnerCode ================================\\

//====================================== start code for Remove validate Class ================================\\
function RemoveClass(data) {
    var id = data.id;
    var arr = id.split('_');
    var id = arr[1];

    if (jquery_1_11_3_min_p("#txtPname").val() != "") {
        jquery_1_11_3_min_p("#txtPname").removeClass('validate');
    }
    if (jquery_1_11_3_min_p("#txtdesc").val() != "") {
        jquery_1_11_3_min_p("#txtdesc").removeClass('validate');
    }
    if (jquery_1_11_3_min_p("#txtrepresentative").val() != "") {
        jquery_1_11_3_min_p("#txtrepresentative").removeClass('validate');
    }
    if (jquery_1_11_3_min_p("#txtLocation_" + counter).val() != "") {
        jquery_1_11_3_min_p("#txtLocation_" + counter).removeClass('validate');
    }
    if (jquery_1_11_3_min_p("#txtLocationCode_" + counter).val() != "") {
        jquery_1_11_3_min_p("#txtLocationCode_" + counter).removeClass('validate');
    }

    jquery_1_11_3_min_p("#repeatArea_" + counter).find('div').each(function () {
        if (jquery_1_11_3_min_p("#txt_" + id).val() != "") {
            jquery_1_11_3_min_p("#txt_" + id).removeClass('validate');
        }
    });

}

//====================================== end code for Remove validate Class ================================\\


//====================================== start code for Create Json Of Address Data ================================\\
function MakeAddressJson() {

    var id = counter;
    var AddressData = [];
    JsonAddress = [];
    var tempJson = "";
    if (CopyJson.Table.length > 0) {
        for (var j = 1; j <= counter; j++) {

            var columnName1 = '';
            var columnName = '';
            var i = 0;
            columnName1 += '[{';
            var LocationName = jquery_1_11_3_min_p("#txtLocation_" + j).val();
            var LocationCode = jquery_1_11_3_min_p("#txtLocationCode_" + j).val();
            var LocationDescription = "";

            columnName1 += '"[LocationCode]"' + ':' + '"' + LocationCode + '","[LocationName]"' + ':' + '"' + LocationName + '","[LocationDescription]"'+':' + '"' + LocationDescription + '",';

            jquery_1_11_3_min_p("#repeatArea_" + j).find('div :text').each(function () {
                var fieldValue = $(this).val();
                columnName = jquery_1_11_3_min_p("#lbl" + j + "_" + i).text();
                columnName1 += '"[' + columnName + ']"' + ':' + '"' + fieldValue + '",';
                i++;
            });
            var newcol = columnName1.slice(0, -1);
            columnName1 = '';
            columnName1 += newcol + '}]';
            var arrkey = kendo_all_min_js("#ddlCountry_" + j).val();
            var Countryname = kendo_all_min_js("#ddlCountry_" + j).data("kendoDropDownList").text();
            var cName = Countryname.split(' ');
            var EntityName = SessionEntityName;
            var EName = EntityName.split(' ');
            Tablename = 'tbl' + EName[0] + 'Address' + cName[0];
            //           
            if (arrkey != undefined) {
                JsonAddress.push(Tablename + ' ' + arrkey + '&' + columnName1);
            }
        }
    }
}
//====================================== end code for Create Json Of Address Data ================================\\



function MakeAddressJsonUpdate() {
    var IsFirstCheck = 0;
    if (counter > OldAddressCounter) {

        var id = counter;
        var AddressData = [];
        JsonAddress = [];
        var tempJson = "";
        if (CopyJson.Table.length > 0) {
            for (var j = OldAddressCounter + 1; j <= counter; j++) {

                var columnName1 = '';
                var columnName = '';
                var i = 0;
                columnName1 += '[{';
                var LocationName = jquery_1_11_3_min_p("#txtLocation_" + j).val();
                var LocationCode = jquery_1_11_3_min_p("#txtLocationCode_" + j).val();
                var LocationDescription = "";

                columnName1 += '"[LocationCode]"' + ':' + '"' + LocationCode + '","[LocationName]"' + ':' + '"' + LocationName + '","[LocationDescription]"' + ':' + '"' + LocationDescription + '",';

                jquery_1_11_3_min_p("#repeatArea_" + j).find('div :text').each(function () {
                    var fieldValue = $(this).val();
                    columnName = jquery_1_11_3_min_p("#lbl" + j + "_" + i).text();
                   // columnName1 += '"' + columnName + '"' + ':' + '"' + fieldValue + '",';
                    columnName1 += '"[' + columnName + ']"' + ':' + '"' + fieldValue + '",';
                    i++;
                });
                var newcol = columnName1.slice(0, -1);
                columnName1 = '';
                columnName1 += newcol + '}]';
                var arrkey = kendo_all_min_js("#ddlCountry_" + j).val();
                var Countryname = kendo_all_min_js("#ddlCountry_" + j).data("kendoDropDownList").text();
                var cName = Countryname.split(' ');
                var EntityName = SessionEntityName;
                var EName = EntityName.split(' ');
                Tablename = 'tbl' + EName[0] + 'Address' + cName[0];
                //           
                if (arrkey != undefined) {
                    JsonAddress.push(Tablename + ' ' + arrkey + '&' + columnName1);
                }
            }
        }
    }
   // else if (counter == OldAddressCounter)
    else if (counter == 1) {
        IsFirstCheck = 1;
        var id = counter;
        var AddressData = [];
        JsonAddress = [];
        var tempJson = "";
        if (CopyJson.Table.length > 0) {
            for (var j =1; j <= counter; j++) {

                var columnName1 = '';
                var columnName = '';
                var i = 0;
                columnName1 += '[{';
                var LocationName = jquery_1_11_3_min_p("#txtLocation_" + j).val();
                var LocationCode = jquery_1_11_3_min_p("#txtLocationCode_" + j).val();
                var LocationDescription = "";

                columnName1 += '"[LocationCode]"' + ':' + '"' + LocationCode + '","[LocationName]"' + ':' + '"' + LocationName + '","[LocationDescription]"' + ':' + '"' + LocationDescription + '",';

                jquery_1_11_3_min_p("#repeatArea_" + j).find('div :text').each(function () {
                    var fieldValue = $(this).val();
                    columnName = jquery_1_11_3_min_p("#lbl" + j + "_" + i).text();
                    //columnName1 += '"' + columnName + '"' + ':' + '"' + fieldValue + '",';
                    columnName1 += '"[' + columnName + ']"' + ':' + '"' + fieldValue + '",';
                    i++;
                });
                var newcol = columnName1.slice(0, -1);
                columnName1 = '';
                columnName1 += newcol + '}]';
                var arrkey = kendo_all_min_js("#ddlCountry_" + j).val();
                var Countryname = kendo_all_min_js("#ddlCountry_" + j).data("kendoDropDownList").text();
                var cName = Countryname.split(' ');
                var EntityName = SessionEntityName;
                var EName = EntityName.split(' ');
                Tablename = 'tbl' + EName[0] + 'Address' + cName[0];
                //           
                if (arrkey != undefined) {
                    JsonAddress.push(Tablename + ' ' + arrkey + '&' + columnName1);
                }
            }
        }
    }
    // for old address json
    if (IsFirstCheck != 1) {
        counter = OldAddressCounter;
        var id = counter;
        var AddressDataUpdate = [];
        JsonAddressUpdate = [];
        var tempJsonUpdate = "";
        if (CopyJson.Table.length > 0) {
            for (var j = 1; j <= counter; j++) {

                var columnName1 = '';
                var columnName = '';
                var i = 0;
                columnName1 += '[{';
                var LocationName = jquery_1_11_3_min_p("#txtLocation_" + j).val();
                var LocationCode = jquery_1_11_3_min_p("#txtLocationCode_" + j).val();
                var AutiId = jquery_1_11_3_min_p("#lblAutoId_" + j).text();

                var LocationDescription = "";

                columnName1 += '"[LocationCode]"' + ':' + '"' + LocationCode + '","[LocationName]"' + ':' + '"' + LocationName + '","[LocationDescription]"' + ':' + '"' + LocationDescription + '",';

                jquery_1_11_3_min_p("#repeatArea_" + j).find('div :text').each(function () {
                    var fieldValue = $(this).val();
                    columnName = jquery_1_11_3_min_p("#lbl" + j + "_" + i).text();
                   // columnName1 += '"' + columnName + '"' + ':' + '"' + fieldValue + '",';
                    columnName1 += '"['+ columnName +']"' + ':' + '"' + fieldValue + '",';
                    i++;
                });
                var newcol = columnName1.slice(0, -1);
                columnName1 = '';
                columnName1 += newcol + '}]';
                var arrkey = kendo_all_min_js("#ddlCountry_" + j).val();
                var Countryname = kendo_all_min_js("#ddlCountry_" + j).data("kendoDropDownList").text();
                var cName = Countryname.split(' ');
                var EntityName = SessionEntityName;
                var EName = EntityName.split(' ');
                Tablename = 'tbl' + EName[0] + 'Address' + cName[0];
                if (arrkey != undefined) {
                    if (dblclickFlag != 1) {
                        JsonAddressUpdate.push(Tablename + ' ' + arrkey + '&' + columnName1);
                    }
                    else {
                        JsonAddressUpdate.push(Tablename + ' ' + arrkey + '&' + columnName1 + '#' + AutiId);
                    }
                }
            }
        }
    }


}

//====================================== start code for Save Partner Record ================================\\
function SaveRecord() {

    var CreatedBy = jquery_1_11_3_min_p('#ContentPlaceHolder1_lblUserId').text();
    var entityid = SessionEntityId;
    var PCode = jquery_1_11_3_min_p("#txtPartnerCode").val();
    var PName = jquery_1_11_3_min_p("#txtPname").val();
    var PGroup = kendo_all_min_js("#ddlPartnergroup").data("kendoDropDownList").value();
    var PType = kendo_all_min_js("#ddlPartnerType").data("kendoDropDownList").value();
    var PDescription = jquery_1_11_3_min_p("#txtdesc").val();
    var Status = kendo_all_min_js("#ddlPartnerStatus").data("kendoDropDownList").value();
    var PRepresetative = jquery_1_11_3_min_p("#txtrepresentative").val();
    var CountryId = SessionCountryId;
    var a = JSON.stringify(JsonAddress);
    jquery_1_11_3_min_p.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "../WebServices/Customer.asmx/SavePartner",
        data: "{'AddressJson':" + a + ",'PGroup':'" + PGroup + "','PType':'" + PType + "','PDescription':'" + PDescription + "','Status':'" + Status + "','CreatedBy':'" + CreatedBy + "','entityid':'" + entityid + "','PCode':'" + PCode + "','PName':'" + PName + "','PRepresetative':'" + PRepresetative + "','EntityCountryId':'" + CountryId + "','jsonExistingLocdata':'" + jsonExistingLocdata + "'}",
        dataType: "json",
        success: function (result) {
            var i = 0;
            var jsonData = eval(result.d);
            if (jsonData.Table.length > 0) {
                jquery_1_11_3_min_p("#pCode").css('display', 'inline-block');
                jquery_1_11_3_min_p("#pName").css('display', 'inline-block');
                jquery_1_11_3_min_p("#lblPartnerId").text(jsonData.Table[0].PartnerId);
                jquery_1_11_3_min_p("#lblPCode").text(jsonData.Table[0].PartnerCode);
                jquery_1_11_3_min_p("#lblPName").text(jsonData.Table[0].PartnerName);
                jquery_1_11_3_min_p('#btnaddAddress').css('display', 'none');
                jquery_1_11_3_min_p('#btnProceed').css('display', 'none');
                jquery_1_11_3_min_p("#TaxDiv").css('display', 'block');
                jquery_1_11_3_min_p("#heading13").css('pointer-events', 'all');
                jquery_1_11_3_min_p("#heading14").css('pointer-events', 'all');
              
                counter = 0;
                jquery_1_11_3_min_p("#btnSubmit").css('display', 'block');
                jquery_1_11_3_min_p('.ExistingCheck').prop('disabled', true);
                jquery_1_11_3_min_p('.checkLocation').prop('disabled', true);
                BindCountryforTax();
                BindEmpAddress();
              
            }
        }
    });

}

//====================================== end code for Save Partner Record ================================\\

function UpdatePartner() {
    var Partnerid = PartnerIddblclick;
    var CreatedBy = jquery_1_11_3_min_p('#ContentPlaceHolder1_lblUserId').text();
    var entityid = SessionEntityId;
    var PCode = jquery_1_11_3_min_p("#txtPartnerCode").val();
    var PName = jquery_1_11_3_min_p("#txtPname").val();
    var PGroup = kendo_all_min_js("#ddlPartnergroup").data("kendoDropDownList").value();
    var PType = kendo_all_min_js("#ddlPartnerType").data("kendoDropDownList").value();
    var PDescription = jquery_1_11_3_min_p("#txtdesc").val();
    var Status = kendo_all_min_js("#ddlPartnerStatus").data("kendoDropDownList").value();
    var PRepresetative = jquery_1_11_3_min_p("#txtrepresentative").val();
    var CountryId = SessionCountryId;;
    var a = JSON.stringify(JsonAddress);
    var b = JSON.stringify(JsonAddressUpdate);
    jquery_1_11_3_min_p.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "../WebServices/Customer.asmx/UpdatePartner",
        data: "{'AddressJson':" + a + ",'AddressJsonUpdate':" + b + ",'PGroup':'" + PGroup + "','PType':'" + PType + "','PDescription':'" + PDescription + "','Status':'" + Status + "','CreatedBy':'" + CreatedBy + "','entityid':'" + entityid + "','PCode':'" + PCode + "','PName':'" + PName + "','PRepresetative':'" + PRepresetative + "','EntityCountryId':'" + CountryId + "','jsonExistingLocdata':'" + jsonExistingLocdata + "','PartnerId':'" + PartnerIddblclick + "'}",
        dataType: "json",
        success: function (result) {
            var i = 0;
            var jsonData = eval(result.d);
            if (jsonData.Table.length > 0) {
                //          jquery_1_11_3_min_p("#pCode").css('display', 'block');
                //          jquery_1_11_3_min_p("#pName").css('display', 'block');
                //           jquery_1_11_3_min_p("#lblPartnerId").text(jsonData.Table[0].PartnerId);
                //          jquery_1_11_3_min_p("#lblPCode").text(jsonData.Table[0].PartnerCode);
                //          jquery_1_11_3_min_p("#lblPName").text(jsonData.Table[0].PartnerName);
                //          jquery_1_11_3_min_p('#btnaddAddress').css('display', 'none');
                jquery_1_11_3_min_p('#btnProceed').css('display', 'none');
                //          jquery_1_11_3_min_p("#TaxDiv").css('display', 'block');
                //           counter=0;
                //            jquery_1_11_3_min_p("#btnSubmit").css('display', 'block');
                //              jquery_1_11_3_min_p('.ExistingCheck').prop('disabled', true);
                //          jquery_1_11_3_min_p('.checkLocation').prop('disabled', true);
                //           BindCountryforTax();

            }
        }
    });

}



function AddRow() {

    if (IsFirstTax == 0) {
        if (dblclickFlag == 1) {
            counter = TaxInfoCounter;
            IsFirstTax++;
        }
    }
    if (counter == 0) {
        counter++;
    }
    if (kendo_all_min_js("#ddlTaxCountry_" + counter).val() != "0" && kendo_all_min_js("#ddlTax_" + counter).val() != "0" && kendo_all_min_js("#ddlAddress_" + counter).val() != "0" && jquery_1_11_3_min_p("#txtamt_" + counter).val() != "") {
        var rowID = counter + 1;
        var markup = "<tr><td style='display:none'>" + rowID + "</td><td><input type='checkbox' id='cb_" + rowID + "' class='checkbox'/></td><td ><label style='display: none' id='lblTaxTypeid_" + rowID +"'></label><input type='text' id='ddlTaxCountry_" + rowID + "' class='fieldName' onchange=''  onkeyup='' autocomplete='off'/></td><td ><input type='text' placeholder='' class='fieldName' id='ddlTax_" + rowID + "' autocomplete='off' onchange='' onkeypress='' onkeyup='' /></td><td ><input type='text' id='ddlAddress_" + rowID + "' class='fieldName'  onkeyup='' autocomplete='off'/></td><td><input type='text' id='txtamt_" + rowID + "' class='fieldName' onchange=''   autocomplete='off'/></td></tr>";
        jquery_1_11_3_min_p("#tblTaxInfo tbody").append(markup);
        counter = rowID;
        TaxCounter = counter;
        BindCountryforTax();




        //            var dataSource  =  jquery_1_11_3_min_p('#'+kendoid).data("kendoDropDownList");
        //            dataSource.readonly();
        //            jquery_1_11_3_min_p("#txtpriorityorder_" + parseInt(counter-1)).attr('disabled', 'disabled');

        //            Parentfiled.push({ value: jquery_1_11_3_min_p('#'+kendoid).data("kendoDropDownList").value(), text: jquery_1_11_3_min_p('#'+kendoid).data("kendoDropDownList").text()});
        //             BindDropdown();
    }
    else {
        if (kendo_all_min_js("#ddlTaxCountry_" + counter).val() == "0") {
            kendo_all_min_js("#ddlTaxCountry_" + counter).data("kendoDropDownList").span.css('background', '#f9e5e5');
        }
        if (kendo_all_min_js("#ddlTax_" + counter).val() == "0") {
            kendo_all_min_js("#ddlTax_" + counter).data("kendoDropDownList").span.css('background', '#f9e5e5');
        }
        if (kendo_all_min_js("#ddlAddress_" + counter).val() == "0") {
            kendo_all_min_js("#ddlAddress_" + counter).data("kendoDropDownList").span.css('background', '#f9e5e5');
        }
        if ((jquery_1_11_3_min_p("#txtamt_" + counter).val() == "")) {
            jquery_1_11_3_min_p("#txtamt_" + counter).addClass("validate");
            jquery_1_11_3_min_p("#txtamt_" + counter).attr("placeholder", "Enter Amount!");
        }
    }
}


//function BindEntity() {

//    var Entity = [];
//    jquery_1_11_3_min_p.ajax({
//        type: "POST",
//        contentType: "application/json; charset=utf-8",
//        url: "../WebServices/Customer.asmx/BindEntity",
//        data: "{}",
//        dataType: "json",
//        async: false,
//        success: function (result) {
//            jsonData = eval(result.d);

//            var i = 0;
//            // Entity.push({ value: "0", text: "Select" });
//            jQuery.each(jsonData.Table, function (rec) {
//                Entity.push({ value: jsonData.Table[i].Entityid, text: jsonData.Table[i].Entityname });
//                i++;
//            });


//        },
//        error: function (result) {
//        }
//    });
//    kendo_all_min_js('#ddlentity').kendoDropDownList({
//        filter: "contains",
//        dataTextField: "text",
//        dataValueField: "value",
//        dataSource: Entity,
//        change: function () {
//            kendo_all_min_js('#ddlentity').data("kendoDropDownList").span.css('background', 'none');
//            var entity = kendo_all_min_js('#ddlentity').val();
//            Country = [];
//            kendo_all_min_js('#ddlCountryExsingAdd').kendoDropDownList({
//                filter: "contains",
//                dataTextField: "text",
//                dataValueField: "value",
//                dataSource: Country,
//                change: function () {

//                }
//            });
//            BindddlCountry(entity);
//            //  BindCountryExistingAddress();

//        }
//    });
//}

function BindCountryforTax() {
    if (counter == 0) {
        counter++;
    }
    kendo_all_min_js('#ddlTaxCountry_' + counter).kendoDropDownList({
        filter: "contains",
        dataTextField: "text",
        dataValueField: "value",
        dataSource: Country,
        change: function () {
            if (TaxCounter == 0) { TaxCounter++; }
            counter = TaxCounter;
            kendo_all_min_js('#ddlTaxCountry_' + counter).data("kendoDropDownList").span.css('background', 'none');
            var entity = SessionEntityId;
            var countryId = kendo_all_min_js('#ddlTaxCountry_' + counter).val();
            BindTaxDropDowns(entity, countryId);
        }
    });

    Tax.push({ value: "0", text: "Select" });
    kendo_all_min_js('#ddlTax_' + counter).kendoDropDownList({
        filter: "contains",
        dataTextField: "text",
        dataValueField: "value",
        dataSource: Tax,
        change: function () {
            if (TaxCounter == 0) { TaxCounter++; }
            counter = TaxCounter;
            kendo_all_min_js('#ddlTax_' + counter).data("kendoDropDownList").span.css('background', 'none');
        }
    });
    Address.push({ value: "0", text: "Select" });
    kendo_all_min_js("#ddlAddress_" + counter).kendoDropDownList({
        filter: "contains",
        dataTextField: "text",
        dataValueField: "value",
        dataSource: Address,
        change: function () {
            if (TaxCounter == 0) { TaxCounter++; }
            counter = TaxCounter;
            kendo_all_min_js('#ddlAddress_' + counter).data("kendoDropDownList").span.css('background', 'none');
        }
    });



}


function BindTaxDropDowns(entityId, CountryId) {
    if (counter == 0) {
        counter++;
    }
    var PartnerId = 0;
    if (dblclickFlag == 1) {
        PartnerId = PartnerIddblclick;
    } else {
        PartnerId = jquery_1_11_3_min_p("#lblPartnerId").text();
    }
    Tax = [];
    Address = [];
    jquery_1_11_3_min_p.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "../WebServices/Customer.asmx/BindTaxDropDowns",
        data: "{'entityId':'" + entityId + "','CountryId':'" + CountryId + "','PartnerId':'" + PartnerId + "'}",
        dataType: "json",
        async: false,
        success: function (result) {
            jsonData = eval(result.d);

            var i = 0;
            Tax.push({ value: "0", text: "Select" });
            jQuery.each(jsonData.Table, function (rec) {
                Tax.push({ value: jsonData.Table[i].TaxSetupInfoId, text: jsonData.Table[i].FieldName });
                i++;
            });
            var i = 0;
            Address.push({ value: "0", text: "Select" });
            jQuery.each(jsonData.Table1, function (rec) {
                Address.push({ value: jsonData.Table1[i].AutoId, text: jsonData.Table1[i].ParterAddress });
                i++;
            });
        },
        error: function (result) {
        }
    });
    kendo_all_min_js('#ddlTax_' + counter).kendoDropDownList({
        filter: "contains",
        dataTextField: "text",
        dataValueField: "value",
        dataSource: Tax,
        change: function () {

            kendo_all_min_js('#ddlTax_' + counter).data("kendoDropDownList").span.css('background', 'none');
        }
    });
    kendo_all_min_js("#ddlAddress_" + counter).kendoDropDownList({
        filter: "contains",
        dataTextField: "text",
        dataValueField: "value",
        dataSource: Address,
        change: function () {
            kendo_all_min_js('#ddlAddress_' + counter).data("kendoDropDownList").span.css('background', 'none');
        }
    });
}


function SaveTaxInfo() {

    var CreatedBy = jquery_1_11_3_min_p('#ContentPlaceHolder1_lblUserId').text().trim();
    var PartnerId = jquery_1_11_3_min_p("#lblPartnerId").text();
    var entityid = SessionEntityId;
    var Status = 1;
    var tax = [];
    var TaxData = '';
    var i = 1;
    jquery_1_11_3_min_p('#tblTaxInfo tbody').find('tr').each(function () {
        var row = jquery_1_11_3_min_p(this);
        var CountryId = kendo_all_min_js("#ddlTaxCountry_" + row.find('td:nth-child(1)').text().trim()).val();
        var TaxType = jquery_1_11_3_min_p("#ddlTax_" + row.find('td:nth-child(1)').text().trim()).val();
        var Address = jquery_1_11_3_min_p("#ddlAddress_" + row.find('td:nth-child(1)').text().trim()).val();
        var TaxPercent = jquery_1_11_3_min_p("#txtamt_" + row.find('td:nth-child(1)').text().trim()).val();
        var LegalId = jquery_1_11_3_min_p("#lblTaxTypeid_" + row.find('td:nth-child(1)').text().trim()).text();
        if (dblclickFlag != 0) {
            tax.push({ CountryId: CountryId, TaxType: TaxType, Address: Address, CreatedBy: CreatedBy, PartnerId: PartnerIddblclick, entityid: entityid, TaxPercent: TaxPercent, TaxTypeId: LegalId });
        }
        else {
            tax.push({ CountryId: CountryId, TaxType: TaxType, Address: Address, CreatedBy: CreatedBy, PartnerId: PartnerId, entityid: entityid, TaxPercent: TaxPercent, TaxTypeId: LegalId });
        }
        i++;
    });
    TaxData = JSON.stringify(tax);
    jquery_1_11_3_min_p.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "../WebServices/Customer.asmx/saveTaxInfo",
        data: "{'TaxData':'" + TaxData + "'}",
        dataType: "json",
        success: function (result) {

            var i = 0;
            var jsonData = eval(result.d);

            if (jsonData.Table[0].Res == "1") {

                swal("Saved Successfully", "Your data Saved successfully!", "success")
                    .then((value) => {
                        $("#proceedDiveLegafield").css("display", "none");
                        $("#btnSubmit").css("display", "block");
                       // window.location.replace("Partner.aspx");
                    });
            }

        }
    });

}


function ValidateTaxGrid() {
    var allow = true;
    var i = 1;
    jquery_1_11_3_min_p('#tblTaxInfo tbody').find('tr').each(function () {
        var row = jquery_1_11_3_min_p(this);
        if (kendo_all_min_js("#ddlTaxCountry_" + counter).val() == "0") {
            kendo_all_min_js("#ddlTaxCountry_" + counter).data("kendoDropDownList").span.css('background', '#f9e5e5');
            allow = false;
        }
        if (kendo_all_min_js("#ddlTax_" + counter).val() == "0") {
            kendo_all_min_js("#ddlTax_" + counter).data("kendoDropDownList").span.css('background', '#f9e5e5');
            allow = false;
        }
        if (kendo_all_min_js("#ddlAddress_" + counter).val() == "0") {
            kendo_all_min_js("#ddlAddress_" + counter).data("kendoDropDownList").span.css('background', '#f9e5e5');
            allow = false;
        }
        if (jquery_1_11_3_min_p("#txtField_" + counter).val() == "") {
            jquery_1_11_3_min_p("#txtField_" + counter).addClass("validate");
            jquery_1_11_3_min_p("#txtField_" + counter).attr("placeholder", "Enter Field!");
            allow = false;
        }

        i++;
    });
    return allow;
}



function valueChanged() {
    jquery_1_11_3_min_p("#AppendLocations").removeClass('LocationDiv pt-1');
    if ($('.ExistingCheck').is(":checked")) {
        $("#newLocations").show();
        $("#proceedDiv").show();
        jquery_1_11_3_min_p("#AppendLocations").empty();
        kendo_all_min_js('#ddlCountryExsingAdd').data("kendoDropDownList").value(0);
    }
    else {
        $("#newLocations").hide();
        $("#proceedDiv").hide();
        if ($('.checkLocation').is(":checked")) {
            $("#proceedDiv").show();
        }
    }
}

function ExistingLocation() {
    if ($('.checkLocation').is(":checked")) {
        $("#existingAddress").show();
        $("#proceedDiv").show();
    }
    else {
        $("#existingAddress").hide();
        $("#proceedDiv").hide();
        if ($('.ExistingCheck').is(":checked")) {
            $("#proceedDiv").show();
        }

    }
}


function BindExistingLocation(entityId, CountryId) {
    var counter = 0;
    jquery_1_11_3_min_p("#AppendLocations").empty();
    var Entity = entityId;
    jquery_1_11_3_min_p.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "../WebServices/Customer.asmx/BindExistingLocation",
        data: "{'Entity':'" + Entity + "','Country':'" + CountryId + "'}",
        dataType: "json",
        async: false,
        success: function (result) {
            jsonData = eval(result.d);

            if (jsonData.Table.length > 0) {
                jquery_1_11_3_min_p("#AppendLocations").addClass('LocationDiv pt-1');
            }
            else {
                jquery_1_11_3_min_p("#AppendLocations").removeClass('LocationDiv pt-1');
            }
            var i = 0;
            var markup = "";
            jQuery.each(jsonData.Table, function (rec) {
                var id = counter + 1;
                markup = "<div class='col-md-3'><div class='form-group'><input type='checkbox'  class='Location' id='chkLoc_" + id + "' ><label id='lbloc_" + id + "' for='Self'>" + jsonData.Table[i].EntityAddress + "</label><label id='lblId_" + id + "' for='Self' style='display:none'>" + jsonData.Table[i].AutoId + "</label><label id='lblECID_" + id + "' for='Self' style='display:none'>" + jsonData.Table[i].ECID + "</label></div></div>";
                jquery_1_11_3_min_p("#AppendLocations").append(markup);
                counter = id;
                i++;
            });
        }
    });
    counter = 0;
}

function getExistingAddress() {
    var CreatedBy = jquery_1_11_3_min_p('#ContentPlaceHolder1_lblUserId').text().trim();
    var jsonArray = [];
    jsonExistingLocdata = "";
    var i = 1;
    jquery_1_11_3_min_p("#AppendLocations").find('div :checkbox').each(function () {
        var fieldValue = $(this).val();
        if ($(this).is(":checked")) {
            var LocationId = $("#lblId_" + i).text();
            var ECId = $("#lblECID_" + i).text();
            var ids = ECId.split('-');
            var EntityId = ids[0];
            var countryid = ids[1];
            jsonArray.push({ LocationId: LocationId, EntityId: EntityId, countryid: countryid, CreatedBy: CreatedBy })
        }
        i++;
    });
    jsonExistingLocdata = JSON.stringify(jsonArray);

}

function getExistingAddressValidation() {
    var allow = false;
    if (kendo_all_min_js('#ddlCountryExsingAdd').data("kendoDropDownList").value() == "0") {
        allow = false;
        kendo_all_min_js("#ddlCountryExsingAdd").data("kendoDropDownList").span.css('background', '#f9e5e5');
    }
    jquery_1_11_3_min_p("#AppendLocations").find('div :checkbox').each(function () {
        if ($(this).is(":checked")) {
            allow = true;
        }
        if (allow == false) {
            alert("Check Value");
        }
    });
    return allow;
}


function ValidateOnProceed() {
    var allow = false;
    if ($('.checkLocation').prop("checked") == true && $('.ExistingCheck').prop("checked") == false) {
        if (ValidateForm() == true && ValidateAddress() == true) {
            allow = true;
        }
    }
    if ($('.checkLocation').prop("checked") == false && $('.ExistingCheck').prop("checked") == true) {
        if (ValidateForm() == true && getExistingAddressValidation() == true) {
            allow = true;
        }
    }
    if ($('.checkLocation').prop("checked") == true && $('.ExistingCheck').prop("checked") == true) {
        if (ValidateForm() == true && ValidateAddress() == true && getExistingAddressValidation() == true) {
            allow = true;
        }
    }

    return allow;
}


function BindAllPartner(searchtxt) {
    jquery_1_11_3_min_p("#partners tbody").empty();
    var wh = jquery_1_11_3_min_p(document).height();
    var gh = wh - 260;
    var FieldGroup = [];

    var SearchValue = searchtxt;

    LoadData = jquery_1_11_3_min_p("#hdnLoad").val();
    jquery_1_11_3_min_p.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "../WebServices/Customer.asmx/BindPartner",
        data: "{'LoadData':'" + LoadData + "','SearchValue':'" + SearchValue + "'}",
        dataType: "json",
        success: function (result) {
            jquery_1_11_3_min_p('#ContentPlaceHolder1_preloader').css('display', 'none');
            jquery_1_11_3_min_p('#ContentPlaceHolder1_Overlay_Load').css('display', 'none');
            //jquery_1_11_3_min_p('#divGrid').css('display', 'block');
            var i = 0;
            var jsonData = result.d;
            editjsondata = result.d;
            var checkcount = 1;
            jQuery.each(jsonData.Table, function (rec) {
                var markup = "<tr><td style='display:none'>" + jsonData.Table[i].PartnerId + "</td><td><input type='checkbox' class='chk_All' id='chk_" + checkcount + "'></td><td>" + jsonData.Table[i].PartnerName + "</td><td> " + jsonData.Table[i].PartnerCode + "</td><td> " + jsonData.Table[i].PGroup + "</td><td> " + jsonData.Table[i].PType + "</td> </tr>";

                jquery_1_11_3_min_p("#partners tbody").append(markup);

                //=========================== start for PDF===================================

                //                var pdftable = "<tr><td>" + jsonData.Table[i].PartnerType + "</td> <td >" + jsonData.Table[i].PartnerName + "</td> <td >" + jsonData.Table[i].ContactNo + "</td></tr>";
                //                jquery_1_11_3_min_p("#pdftable tbody").append(pdftable);

                //==============================end for PFD=================================
                checkcount++;
                i++;
            });
            var k = 0;
            if (jsonData.Table.length > 0) { var columnsIn = jsonData.Table[0]; for (var key in columnsIn) { if (k > 0) { ColumnName.push(key); } k++; } } else {
                ColumnName.push(k); k++;
            }
            var j = 0; jquery_1_11_3_min_p("#DivSearch").empty();
            jquery_1_11_3_min_p('#partnersgrid thead tr th').each(function () {
                if (j > 0) {

                    var id1 = 'chk_' + ColumnName[j - 1];
                    this.id = id1;
                    var SearchDiv = "<div class='dropdown-item'><span class='skin skin-polaris'><input type='checkbox' class='searchcheckAll' id='chk_" + ColumnName[j - 1] + "' onclick='Addclasstocolumn(this)'><label for='check3' class='coldata'>" + $(this).text() + "</label></span></div>";
                    jquery_1_11_3_min_p("#DivSearch").append(SearchDiv);
                }
                j++;

            });
            var Searchfinaldiv = "<div class='dropdownBottom'><label class='pull-left' id='selectall' onclick='searchcheckAll()' >Select All</label><label class='pull-right' id='reset' onclick='searchUncheckAll()' >Reset</label></div>";
            jquery_1_11_3_min_p("#DivSearch").append(Searchfinaldiv);
            if (jsonData.Table.length >= jsonData.Table1[0].Totalcount) {
                jquery_1_11_3_min_p('#lblRowCount').text(jsonData.Table1[0].length);
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

function BindPartnerOndblClick(PartnerId) {
    dblclickFlag = 1;
    var Tabs = [];
    jquery_1_11_3_min_p.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "../WebServices/Customer.asmx/BindPartnerOndblClick",
        data: "{'PartnerId':'" + PartnerId + "'}",
        dataType: "json",
        async: false,
        success: function (result) {

            var i = 0;
            var jsonData = eval(result.d);
            $.each(result.d, function (index, value) {
                Tabs.push(index);
            });
            jquery_1_11_3_min_p("#heading13").css('pointer-events', 'all');
            jquery_1_11_3_min_p("#heading14").css('pointer-events', 'all');
            jquery_1_11_3_min_p("#btnNew").css('display', 'none');
            jquery_1_11_3_min_p("#btnBack").css('display', 'block');
            $("#partnerForm").css('display', 'block');
            $("#PartnerGrid").css('display', 'none');
            if (jsonData.Table.length > 0) {
               // kendo_all_min_js('#ddlentity').data("kendoDropDownList").value(jsonData.Table[0].EntityId);
               BindddlCountry(jsonData.Table[0].EntityId);
               // kendo_all_min_js('#ddlEntityCountry').data("kendoDropDownList").value(jsonData.Table[0].CountryId);
                jquery_1_11_3_min_p("#txtPartnerCode").val(jsonData.Table[0].PartnerCode);
                jquery_1_11_3_min_p("#txtPname").val(jsonData.Table[0].PartnerName);
                kendo_all_min_js('#ddlPartnergroup').data("kendoDropDownList").value(jsonData.Table[0].PartnerGroup);
                kendo_all_min_js('#ddlPartnerType').data("kendoDropDownList").value(jsonData.Table[0].PartnerType);
                jquery_1_11_3_min_p("#txtdesc").val(jsonData.Table[0].Description);
                jquery_1_11_3_min_p("#txtrepresentative").val(jsonData.Table[0].PartnerRepresentative);
                kendo_all_min_js('#ddlPartnerStatus').data("kendoDropDownList").value(jsonData.Table[0].PartnerStatus);
            }
            var TabsCount = Object.keys(jsonData).length;
            var Counterflag = 0;
            for (var j = 2; j < TabsCount; j++) {
                if (jsonData[Tabs[j]].length > 0) {
                    var i = 0;
                    var id = 1;
                    jQuery.each(jsonData[Tabs[j]], function (rec) {
                        if (jsonData[Tabs[j]][i].LocationFlag == "2") {
                            $('.checkLocation').prop("checked", true)
                            $("#existingAddress").show();
                            $("#proceedDiv").show();
                            Counterflag++;
                            if (Counterflag == 1) {
                                kendo_all_min_js('#ddlCountry_' + Counterflag).data("kendoDropDownList").value(jsonData[Tabs[j]][i].CountryId);
                                jquery_1_11_3_min_p("#txtLocation_" + Counterflag).val(jsonData[Tabs[j]][i].LocationName);
                                jquery_1_11_3_min_p("#txtLocationCode_" + Counterflag).val(jsonData[Tabs[j]][i].LocationCode);
                                jquery_1_11_3_min_p("#lblAutoId_" + Counterflag).text(jsonData[Tabs[j]][i].AutoId);
                                var EntityId = SessionEntityId;
                                var CountryId = kendo_all_min_js('#ddlCountry_' + Counterflag).val();
                                BindAddressFields(EntityId, CountryId);
                                if (CopyJson.Table.length > 0) {
                                    var l = 0
                                    jquery_1_11_3_min_p("#repeatArea_" + counter).find('div').each(function () {
                                        jquery_1_11_3_min_p("#txt_" + CopyJson.Table[l].TxtId + Counterflag).val(jsonData[Tabs[j]][i][CopyJson.Table[l].FieldName]);
                                        if (CopyJson.Table[l].FieldDataType == "2") {
                                            //  kendo_all_min_js("#txt_" + CopyJson.Table[i].FieldName + counter).val()
                                            kendo_all_min_js("#txt_" + CopyJson.Table[l].TxtId + Counterflag).data("kendoDropDownList").value(jsonData[Tabs[j]][i][CopyJson.Table[l].FieldName]);
                                        }
                                        l++;
                                    });
                                }

                            }
                            else {
                                if (counter == 0) {
                                    counter++;
                                }

                                var RowId = counter + 1;
                                jquery_1_11_3_min_p(".addressDiv").append("<label id='lblAutoId_" + RowId + "' style='display:none'></label> <div class='col-md-3 mb-1' id='addressdiv_" + RowId + "' ><div class='addressBg' id='AddressDiv'><div id='btnClosr_" + RowId + "' class='closeAddress pull-right' onclick='deleteAddress(this)'><i  class='fa fa-close'></i></div><div class='AllAddress form-group'> <label class='textHeader' id='lbladdress'>Address " + RowId + "</label></div><div class='form-group'> <label for='Country'>Country</label><input type='text' id='ddlCountry_" + RowId + "' autocomplete='off'  class='form-control'/> </div> <div class='form-group'> <label for='Country'>Location Name</label><input type='text'  id='txtLocation_" + RowId + "' autocomplete='off' placeholder='Location Name' class='form-control'/> </div> <div class='form-group'> <label for='Country'>Location Code</label> <input type='text'  id='txtLocationCode_" + RowId + "' autocomplete='off' placeholder='Location Code' class='form-control'/> </div><div id='repeatArea_" + RowId + "'></div></div> </div>");
                                var EntityId = SessionEntityId;
                                counter = RowId;
                                // flag for dblclick
                                AddressCounter = counter;
                               BindddlCountry(EntityId);
                                kendo_all_min_js('#ddlCountry_' + counter).data("kendoDropDownList").value(jsonData[Tabs[j]][i].CountryId);
                                var CountryId = kendo_all_min_js('#ddlCountry_' + counter).val();
                                BindAddressFields(EntityId, CountryId);
                                jquery_1_11_3_min_p("#txtLocation_" + counter).val(jsonData[Tabs[j]][i].LocationName);
                                jquery_1_11_3_min_p("#txtLocationCode_" + counter).val(jsonData[Tabs[j]][i].LocationCode);
                                jquery_1_11_3_min_p("#lblAutoId_" + counter).text(jsonData[Tabs[j]][i].AutoId);

                                if (CopyJson.Table.length > 0) {
                                    var l = 0
                                    jquery_1_11_3_min_p("#repeatArea_" + counter).find('div').each(function () {
                                        jquery_1_11_3_min_p("#txt_" + CopyJson.Table[l].TxtId + counter).val(jsonData[Tabs[j]][i][CopyJson.Table[l].FieldName]);
                                        if (CopyJson.Table[l].FieldDataType == "2") {
                                            kendo_all_min_js("#txt_" + CopyJson.Table[l].TxtId + counter).data("kendoDropDownList").value(jsonData[Tabs[j]][i][CopyJson.Table[l].FieldName]);
                                        }
                                        l++;
                                    });
                                }

                            }
                        }
                        //=====================code for bind existing Location==========================
                        if (jsonData[Tabs[j]][i].LocationFlag == "1") {
                            jquery_1_11_3_min_p("#AppendLocations").addClass('LocationDiv pt-1');
                            $('.ExistingCheck').prop("checked", true)
                            $("#newLocations").show();
                            $("#proceedDiv").show();
                            kendo_all_min_js('#ddlCountryExsingAdd').data("kendoDropDownList").value(jsonData[Tabs[j]][i].CountryId);

                            markup = "<div class='col-md-3'><div class='form-group'><input type='checkbox'  class='Location' id='chkLoc_" + id + "' ><label id='lbloc_" + id + "' for='Self'>" + jsonData[Tabs[j]][i].ParterAddress + "</label><label id='lblId_" + id + "' for='Self' style='display:none'>" + jsonData[Tabs[j]][i].Auto + "</label><label id='lblECID_" + id + "' for='Self' style='display:none'>" + jsonData[Tabs[j]][i].CountryId + "</label></div></div>";
                            jquery_1_11_3_min_p("#AppendLocations").append(markup);
                            $('#chkLoc_' + id).prop("checked", true)

                        }
                        i++;
                        id++;
                    });
                }

            }

            OldAddressCounter = counter;

            //=====================code for bind Tax Information==========================
            if (jsonData.Table1.length > 0) {
                counter = 0;
                jquery_1_11_3_min_p("#TaxDiv").css('display', 'block');
                jquery_1_11_3_min_p("#btnSubmit").css('display', 'block');
                var i = 0;
                var a = 1;
                jQuery.each(jsonData.Table1, function (rec) {
                    a = i + 1;
                    if (a == 1) {
                        BindCountryforTax();
                        var entity = SessionEntityId;
                        kendo_all_min_js('#ddlTaxCountry_' + a).data("kendoDropDownList").value(jsonData.Table1[i].Countryid);
                        var countryId = kendo_all_min_js('#ddlTaxCountry_' + a).val();
                        BindTaxDropDowns(entity, countryId);
                        kendo_all_min_js('#ddlTax_' + a).data("kendoDropDownList").value(jsonData.Table1[i].TaxTypeId);
                        kendo_all_min_js('#ddlAddress_' + a).data("kendoDropDownList").value(jsonData.Table1[i].AddressId);
                        jquery_1_11_3_min_p("#txtamt_" + a).val(jsonData.Table1[i].TaxPercent);
                        jquery_1_11_3_min_p("#lblTaxTypeid_" + a).text(jsonData.Table1[i].PartnerTaxId);

                    }
                    else {
                        var markup = "<tr><td style='display:none'>" + a + "</td><td><input type='checkbox' id='cb_" + a + "' class='checkbox'/></td><td ><label style='display: none' id='lblTaxTypeid_"+a+"'></label><input type='text' id='ddlTaxCountry_" + a + "' class='fieldName' onchange=''  onkeyup='' autocomplete='off'/></td><td ><input type='text' placeholder='' class='fieldName' id='ddlTax_" + a + "' autocomplete='off' onchange='' onkeypress='' onkeyup='' /></td><td ><input type='text' id='ddlAddress_" + a + "' class='fieldName'  onkeyup='' autocomplete='off'/></td><td><input type='text' id='txtamt_" + a + "' class='fieldName' onchange=''   autocomplete='off'/></td></tr>";
                        jquery_1_11_3_min_p("#tblTaxInfo tbody").append(markup);
                        counter = a;
                        TaxInfoCounter = counter;
                        BindCountryforTax();

                        kendo_all_min_js('#ddlTaxCountry_' + a).data("kendoDropDownList").value(jsonData.Table1[i].Countryid);
                        var entity = SessionEntityId;
                        var countryId = kendo_all_min_js('#ddlTaxCountry_' + a).val();
                        BindTaxDropDowns(entity, countryId);
                        kendo_all_min_js('#ddlTax_' + a).data("kendoDropDownList").value(jsonData.Table1[i].TaxTypeId);
                        kendo_all_min_js('#ddlAddress_' + a).data("kendoDropDownList").value(jsonData.Table1[i].AddressId);
                        jquery_1_11_3_min_p("#txtamt_" + a).val(jsonData.Table1[i].TaxPercent);
                        jquery_1_11_3_min_p("#lblTaxTypeid_" + a).text(jsonData.Table1[i].PartnerTaxId);

                    }
                    i++
                });

            }
            else {
                jquery_1_11_3_min_p("#TaxDiv").css('display', 'block');
                jquery_1_11_3_min_p("#btnSubmit").css('display', 'block');
                counter = 0;
                BindCountryforTax();
            }
        }
    });
    BindEmployee();
   
    TaxCounter = counter;
    counter = OldAddressCounter;
}

function AllowNumeric(Data) {
    var val = Data.value;
    var re = /^([0-9]+[\.]?[0-9]?[0-9]?[0-9]?|[0-9]+)$/g;
    var re1 = /^([0-9]+[\.]?[0-9]?[0-9]?[0-9]?|[0-9]+)/g;
    if (val > 0) {
        if (re1.test(val)) {
        } else {
            val = re1.exec(val);
            if (val) {
                jquery_1_11_3_min_p('#' + Data.id).val(val[0]);
            } else {
                jquery_1_11_3_min_p('#' + Data.id).val('');
            }
        }
    }
    else {
        jquery_1_11_3_min_p('#' + Data.id).val('');
    }
}

    
function BindTaxGroup() {
    var countryid = SessionCountryId;
    var entityid = SessionEntityId;
    jquery_1_11_3_min_p("#divTaxGroup").empty();
    jquery_1_11_3_min_p.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "../WebServices/Customer.asmx/BindTaxGroup",
        data: "{'EntityId':'" + entityid + "','CountryId':'" + countryid + "','PartnerId':'" + PartnerIddblclick + "'}",
        dataType: "json",
        async: false,
        success: function (result) {
            var i = 0;
            var jsonData = eval(result.d);
            jQuery.each(jsonData.Table, function (rec) {
                var markup = "<div class='col-md-4 '><div class='taxGroup'><input type='checkbox' id='chkTaxgrp_" + jsonData.Table[i].TaxGroupId + "' ><label id='lblTaxgrp_" + jsonData.Table[i].TaxGroupId + "' class=''>" + jsonData.Table[i].TaxGroupName + "</label></div></div>";
                jquery_1_11_3_min_p("#divTaxGroup").append(markup);
                i++;
            });
            var ch = jquery_1_11_3_min_p('#' + 'divTaxGroup').find('input[type=checkbox]');
            ch.each(function () {
                var check = jquery_1_11_3_min_p(this);
                id = check.attr("id");
                var grpId = id.split("_");
                var TaxGroupId = grpId[1];
                var j = 0;
                jQuery.each(jsonData.Table1, function (rec) {
                    if (TaxGroupId == jsonData.Table1[j].TaxGroupId) {
                        $("#" + id).prop("checked", true);
                    }
                    j++;
                });
            });

        }
    });
}


function SaveTaxGroup() {
    var CreatedBy = jquery_1_11_3_min_p('#ContentPlaceHolder1_lblUserId').text().trim();
    var countryid = SessionCountryId;
    var entityid = SessionEntityId;
    var TaxGrp = [];
    var ch = jquery_1_11_3_min_p('#' + 'divTaxGroup').find('input[type=checkbox]');
    var validateFlag = 0;
    ch.each(function () {
        var check = jquery_1_11_3_min_p(this);
        if (check.is(':checked')) {
            validateFlag = 1;
            id = check.attr("id");
            var grpId = id.split("_");
            var TaxGroupId = grpId[1];
            var ItemCode = $("#txtitemcode").val();
            TaxGrp.push({ PartnerId: PartnerIddblclick, AssignGrpTypeFlag: "2", TaxGrpId: TaxGroupId, CountryId: countryid, EntityId: entityid, CreatedBy: CreatedBy })

        }
    });
    if (validateFlag == 1) {
        var TaxGrpjson = JSON.stringify(TaxGrp);

        jquery_1_11_3_min_p.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: "../WebServices/Customer.asmx/SaveTaxGroup",
            data: "{'TaxGrpjson':'" + TaxGrpjson + "'}",
            dataType: "json",
            async: false,
            success: function (result) {
                var i = 0;
                var jsonData = eval(result.d);
                $("#TaxGroup").modal('hide');
            }
        });

    }
    else {
        alert("select TaxGroup");
    }
}

function UploadFile() { $('#ContentPlaceHolder1_btnUpload').click(); }
function Findclick() {
    $('#ContentPlaceHolder1_FileUpload').click();
}
function FindclickEmp() {
    $('#ContentPlaceHolder1_FileUploadEmp').click();
}
function UploadFileEmp() { $('#ContentPlaceHolder1_btnUploademp').click(); }
function UploadFileAddress() { $('#ContentPlaceHolder1_btnUploadAddress').click(); }
function FindclickAddress() {
    $('#ContentPlaceHolder1_FileUploadAddress').click();
}
function UploadFileLegalField() { $('#ContentPlaceHolder1_btnUploadLegalField').click(); }
function FindclickLegalField() {
    $('#ContentPlaceHolder1_FileUploadLegalField').click();
}

function showrejectedPopup() {
    $("#RejectedData").modal('show');
}


function BindEmpAddress() {
    var PartnerId = 0;
    if (dblclickFlag == 1) {
        PartnerId = PartnerIddblclick;
    } else {
        PartnerId = jquery_1_11_3_min_p("#lblPartnerId").text();
    }
   
    EmpAddress = [];
    jquery_1_11_3_min_p.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "../WebServices/Customer.asmx/BindEmpAddressddl",
        data: "{'entityId':'" + SessionEntityId + "','CountryId':'" + SessionCountryId + "','PartnerId':'" + PartnerId + "'}",
        dataType: "json",
        async: false,
        success: function (result) {
            jsonData = eval(result.d);
            var i = 0;
            EmpAddress.push({ value: "0", text: "Select" });
            jQuery.each(jsonData.Table, function (rec) {
                EmpAddress.push({ value: jsonData.Table[i].AutoId, text: jsonData.Table[i].ParterAddress });
                i++;
            });
        }
    });

    jquery_1_11_3_min_p('#empTable tbody').find('tr').each(function () {
        var row = jquery_1_11_3_min_p(this);
        var rowNumber = row.find('td:nth-child(1)').text().trim();
        kendo_all_min_js("#empaddress_" + rowNumber).kendoDropDownList({
       filter: "contains",
            template: "<input type='checkbox' id='" + rowNumber+"chk_OtherUnit_#=data.value#' class='clsSkillInner' value='#=data.value #' name='OtherUnit' />" + " " + "${ data.text }",
        dataTextField: "text",
        dataValueField: "value",
            dataSource: EmpAddress,
          close: onClose,
         dataBound: onOtherUnitBound,
        change: function () {
            kendo_all_min_js('#empaddress_' + rowNumber).data("kendoDropDownList").span.css('background', 'none');
        }
        });
    });

}

function isValidEmail(email) {
    return /^[a-z0-9]+([-._][a-z0-9]+)*@([a-z0-9]+(-[a-z0-9]+)*\.)+[a-z]{2,4}$/.test(email)
        && /^(?=.{1,64}@.{4,64}$)(?=.{6,100}$).*/.test(email);
}
function RemoveClassEmp(a) {
    var id = a.id;
    $("#" + id).removeClass('validate');
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
//function CreateEmployeeJson() {
//    CreatedBy = jquery_1_11_3_min_p('#ContentPlaceHolder1_lblUserId').text();
//    EmployeeArray = [];
//    EmpWareHouse = [];
//    var partid = 0;
//    if (dblclickFlag == 1) {
//        partid = PartnerIddblclick;
//    } else {
//        partid = jquery_1_11_3_min_p("#lblPartnerId").text();
//    }
//    jquery_1_11_3_min_p('#empTable tbody').find('tr').each(function () {
//        var row = jquery_1_11_3_min_p(this);
//        var rowNumber = row.find('td:nth-child(1)').text().trim();
//        if (kendo_all_min_js('#empaddress_' + rowNumber).val() != 0) {
//            var EmailId = jquery_1_11_3_min_p("#empemail_" + rowNumber).val();
//            EmployeeArray.push({ name: jquery_1_11_3_min_p("#empname_" + rowNumber).val(), MobileNo: jquery_1_11_3_min_p("#empmobile_" + rowNumber).val(), EmailId: EmailId, CountryId: SessionCountryId, EntityId: SessionEntityId, createdBy: CreatedBy, PartnerId: partid });
//            $(kendo_all_min_js('#empaddress_' + rowNumber).data("kendoDropDownList").dataItems()).each(function () {
//                var b = this;
//                var c = b.value;
//                if ($("#" + rowNumber + "chk_OtherUnit_" + c).prop("checked")) {
//                    EmpWareHouse.push({ Emailid: EmailId, Address: c, createdBy:CreatedBy})  
//                }
//            });
//        }
//    });
//}

function CreateEmployeeJson() {
    CreatedBy = jquery_1_11_3_min_p('#ContentPlaceHolder1_lblUserId').text();
    EmployeeArray = [];
    EmpWareHouse = [];
    var partid = 0;
    if (dblclickFlag == 1) {
        partid = PartnerIddblclick;
    } else {
        partid = jquery_1_11_3_min_p("#lblPartnerId").text();
    }
    jquery_1_11_3_min_p('#empTable tbody').find('tr').each(function () {
        var row = jquery_1_11_3_min_p(this);
        var rowNumber = row.find('td:nth-child(1)').text().trim();
        if (kendo_all_min_js('#empaddress_' + rowNumber).val() != 0) {
            var EmailId = jquery_1_11_3_min_p("#empemail_" + rowNumber).val();
            var active = 0;
            if ($("#chkisactive_" + rowNumber).is(':checked')) { active = 1; } else { active = 0 }
            EmployeeArray.push({ name: jquery_1_11_3_min_p("#empname_" + rowNumber).val(), MobileNo: jquery_1_11_3_min_p("#empmobile_" + rowNumber).val(), EmailId: EmailId, CountryId: SessionCountryId, EntityId: SessionEntityId, createdBy: CreatedBy, PartnerId: partid, EmployeeId: jquery_1_11_3_min_p("#empid_" + rowNumber).text(), IsActive: active });
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
    CreateEmployeeJson();
    var EmpJson = JSON.stringify(EmployeeArray);
    var AddressJson = JSON.stringify(EmpWareHouse);
    jquery_1_11_3_min_p.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "../WebServices/Customer.asmx/SaveEmployee",
        data: "{'Empjson':'" + EmpJson + "','EmpAddressjson':'" + AddressJson + "'}",
        dataType: "json",
        success: function (result) {
            var i = 0;
            var jsonData = eval(result.d);
            if (jsonData.Table.length > 0) {  

                swal("Saved Successfully", "Your data Saved successfully!", "success")
                    .then((value) => {

                         window.location.replace("Partner.aspx");
                    });
               
            }
        }
    });

}

function BindEmployee() {
    var partid = 0;
    if (dblclickFlag == 1) {
        partid = PartnerIddblclick;
    } else {
        partid = jquery_1_11_3_min_p("#lblPartnerId").text();
    }
    jquery_1_11_3_min_p.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "../WebServices/Customer.asmx/BindPartnerEmployee",
        data: "{'partnerId':'" + partid + "','countryId':'" + SessionCountryId + "','entityId':'" + SessionEntityId + "'}",
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
                            jquery_1_11_3_min_p("#chkisactive_" +a).prop("checked", true);
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
                        var markup = "<tr><td style='display:none'>" + EmpCounter + "</td><td><input type='checkbox' id='chk_" + EmpCounter + "' class='checkbox'/></td><td><label style='display:none' id='empid_" + EmpCounter + "'></label><label id='isemail_" + EmpCounter + "' style='display:none'></label><input type='text' id='empname_" + EmpCounter + "' class='fieldName' onchange='' onkeyup='RemoveClassEmp(this)' autocomplete='off' /></td><td><input type='text' placeholder='' class='fieldName' id='empmobile_" + EmpCounter + "' autocomplete='off' onkeyup='RemoveClassEmp(this)' onkeypress='return isNumber(event)'   /></td><td><input type='text' placeholder='' class='fieldName' id='empemail_" + EmpCounter + "' autocomplete='off' onchange='' onkeypress='' onkeyup='RemoveClassEmp(this)' /></td><td><input type='text' id='empaddress_" + EmpCounter + "' class='fieldName' autocomplete='off' /></td><td><input type='checkbox' id='chkcredential_" + EmpCounter + "'  disabled = 'disabled' onclick='showCredentialpopup(this)' class='checkbox' /></td><td><input type='checkbox' id='chkisactive_" + EmpCounter + "' class='checkbox' /></td></tr>"
                        $("#empTable tbody").append(markup);
                        kendo_all_min_js("#empaddress_" + EmpCounter).kendoDropDownList({
                            filter: "contains",
                            template: "<input type='checkbox' id='" + EmpCounter + "chk_OtherUnit_#=data.value#' class='clsSkillInner' value='#=data.value #' name='OtherUnit' />" + " " + "${ data.text }",
                            dataTextField: "text",
                            dataValueField: "value",
                            dataSource: EmpAddress,
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

        

            //if (dblclickFlag == 0) {
            //    var Otherunitdata = $("#hf").val().split(',');
            //    var getlastele = Otherunitdata.length - 2;
            //    var lastelement = Otherunitdata[getlastele];
            //    if (lastelement == '' || lastelement == undefined) {
            //        kendo_all_min_js('#' + id).data("kendoDropDownList").value(0);
            //    }
            //    else {
            //        kendo_all_min_js('#' + id).data("kendoDropDownList").value(lastelement);
            //    }
            //}
        
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
function isNumber(evt) {
    evt = (evt) ? evt : window.event;
    var charCode = (evt.which) ? evt.which : evt.keyCode;
    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
        return false;
    }
    return true;
}
  
function AddRowEmployee() {
    if (EmpCounter == 5) { EmpCounter++; }
    var markup = "<tr><td style='display:none'>" + EmpCounter + "</td><td><input type='checkbox' id='chk_" + EmpCounter + "' class='checkbox'/></td><td><label style='display:none' id='empid_" + EmpCounter + "'></label><label id='isemail_" + EmpCounter + "' style='display:none'></label><input type='text' id='empname_" + EmpCounter + "' class='fieldName' onchange='' onkeyup='RemoveClassEmp(this)' autocomplete='off' /></td><td><input type='text' placeholder='' class='fieldName' id='empmobile_" + EmpCounter + "' autocomplete='off' onkeyup='RemoveClassEmp(this)' onkeypress='return isNumber(event)'   /></td><td><input type='text' placeholder='' class='fieldName' id='empemail_" + EmpCounter + "' autocomplete='off' onchange='' onkeypress='' onkeyup='RemoveClassEmp(this)' /></td><td><input type='text' id='empaddress_" + EmpCounter + "' class='fieldName' autocomplete='off' /></td><td><input type='checkbox' id='chkcredential_" + EmpCounter + "' class='checkbox' disabled = 'disabled' onclick='showCredentialpopup(this)' /></td><td><input type='checkbox' id='chkisactive_" + EmpCounter + "' class='checkbox' /></td></tr>"
    $("#empTable tbody").append(markup);
    BindEmpAddress();
    EmpCounter++;

}

function showCredentialpopup(Data) {
    // creadentialArray = [];
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
        else
       {
           isemail = jquery_1_11_3_min_p("#isemail_" + newid[1]).text();
           empId = jquery_1_11_3_min_p("#empid_" + newid[1]).text();
           if (isemail == "1") {
               RemoveCredential();
           }
          
        $('#imagePopup').modal('hide');
        }
    //jquery_1_11_3_min_p('#empTable tbody').find('tr').each(function () {
    //var row = jquery_1_11_3_min_p(this);
    //var rowNumber = row.find('td:nth-child(1)').text().trim();
    //    if ($("#chkcredential_" + rowNumber).is(':checked')) {
    //        $('#imagePopup').modal('show');
    //        $("#lblempname").text(jquery_1_11_3_min_p("#empname_" + rowNumber).val());
    //       // creadentialArray.push({ EmployeeId: jquery_1_11_3_min_p("#empid_" + rowNumber).text(),createdBy: CreatedBy })
    //        empId = jquery_1_11_3_min_p("#empid_" + rowNumber).text();
    //        empMobile = jquery_1_11_3_min_p("#empmobile_" + rowNumber).val();
    //        empemailId = jquery_1_11_3_min_p("#empemail_" + rowNumber).val();
    //        empName = jquery_1_11_3_min_p("#empname_" + rowNumber).val();
    //    }
    //    else
    //    {
    //        if (!$("#chkcredential_" + rowNumber).is(':checked')) {
    //            alert("hii");
    //            $('#imagePopup').modal('hide');
    //        }
    //    }
    //});
}

function makeCredential() {
    var CreatedBy = jquery_1_11_3_min_p('#ContentPlaceHolder1_lblUserId').text();
    jquery_1_11_3_min_p.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "../WebServices/Customer.asmx/makeCredential",
        data: "{'Empid':'" + empId + "','ImagePath':'" + Imgpath + "','CreatedBy':'" + CreatedBy + "','empemailId':'" + empemailId + "','UserName':'" + empName + "','IsEmail':'" + isemail + "'}",
        dataType: "json",
        success: function (result) {
            var i = 0;
            var jsonData = eval(result.d);
            //if (jsonData.Table[0].Res == '-1') {
            //    swal("employee already exists");
            //}
            if (jsonData.Res == '3')
            {
                $('#imagePopup').modal('hide');
                swal("invalid emailid");
            }
            else if (jsonData.Res == '2') {
                $('#imagePopup').modal('hide');
                swal("credential details already exists");
            }
            else {
                $('#imagePopup').modal('hide');
            }
        }
    });
   
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

function sendFile(file) {
    var formData = new FormData();
    formData.append('file', $('#f_UploadImage')[0].files[0]);
    Imgpath = '';
    $.ajax({
        type: 'post',
        url: '../fileUploader.ashx?EmpId=' + empId + '&Mobile=' + empMobile, 
        data: formData,
        success: function (status) {
            if (status != 'error') {
                var my_path = '../EmployeeImage/' + status;
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
