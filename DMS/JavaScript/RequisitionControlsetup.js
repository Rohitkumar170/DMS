var LoadData = ''; var dblclickid = 0; var Reqctrlid = 0; var dblclickFlag = 1;
jquery_1_11_3_min_p(document).ready(function () {
    jquery_1_11_3_min_p("#hdnLoad").val(1000);
    BindReqsetup();
    jquery_1_11_3_min_p('#btnnew').click(function () {
        jquery_1_11_3_min_p("#createusserForm").css('display', 'block');
        jquery_1_11_3_min_p("#createusserGrid").css('display', 'none');
        jquery_1_11_3_min_p("#btnnew").css('display', 'none');
        jquery_1_11_3_min_p("#btnback").css('display', 'block');
        jquery_1_11_3_min_p("#btnSubmit").css('display', 'block');
        BindAllFields();
    });
    jquery_1_11_3_min_p('#btnback').click(function () {

        jquery_1_11_3_min_p("#createusserForm").css('display', 'none');
        jquery_1_11_3_min_p("#createusserGrid").css('display', 'block');
        jquery_1_11_3_min_p("#btnnew").css('display', 'block');
        jquery_1_11_3_min_p("#btnback").css('display', 'none');
        jquery_1_11_3_min_p("#btnSubmit").css('display', 'none');
    });
    jquery_1_11_3_min_p('#btnSubmit').click(function () {
        if (Validation() == true) {
            if (dblclickid == 0) {
                swal({
                    title: "Do you want to proceed?",
                    text: "",
                    icon: "warning",
                    buttons: true,
                    dangerMode: true,
                })
                    .then((willDelete) => {
                        if (willDelete) {
                            SaveRequestcontrolaccess();

                        }
                    });
            }
            else {
                swal({
                    title: "Do you want to proceed?",
                    text: "",
                    icon: "warning",
                    buttons: true,
                    dangerMode: true,
                })
                    .then((willDelete) => {
                        if (willDelete) {
                            UpdateRequestcontrolaccess();

                        }
                    });
            }

        }
    });
    jquery_1_11_3_min_p('#btnLoadMore').click(function () {
        LoadData = parseInt(LoadData) + 500;
        jquery_1_11_3_min_p("#hdnLoad").val(LoadData);
        jquery_1_11_3_min_p('#ContentPlaceHolder1_preloader').css('display', 'block');
        jquery_1_11_3_min_p('#ContentPlaceHolder1_Overlay_Load').css('display', 'block');
        BindReqsetup();
    });
    $(document).on("dblclick", "#userGrid tbody tr", function () {
        var row = jquery_1_11_3_min_p(this);
        dblclickid = 1; Reqctrlid = row.find('td:nth-child(5)').text().trim();
        jquery_1_11_3_min_p("#createusserForm").css('display', 'block');
        jquery_1_11_3_min_p("#createusserGrid").css('display', 'none');
        jquery_1_11_3_min_p("#btnnew").css('display', 'none');
        jquery_1_11_3_min_p("#btnback").css('display', 'block');
        jquery_1_11_3_min_p("#btnSubmit").css('display', 'block');
        BindAllFields();
        kendo_all_min_js('#ddlemployee').data("kendoDropDownList").value(row.find('td:nth-child(3)').text().trim());
        var data = row.find('td:nth-child(9)').text().trim().split(',');
        for (var x = 0; x < data.length; x++) {
            jquery_1_11_3_min_p("#" + "chk_Otherpartner_" + data[x]).prop("checked", true);
            if (data.length-1 == x) {
                kendo_all_min_js('#ddlpartneremp').data("kendoDropDownList").value(data[x]);
            }
        }
        if (row.find('td:nth-child(4)').text().trim()==1) {
            jquery_1_11_3_min_p('#chk_overallow').prop("checked", true);
        }
        

    });

});
function BindReqsetup() {
    var wh = jquery_1_11_3_min_p(document).height();
    var gh = wh - 260;
    jquery_1_11_3_min_p('#ContentPlaceHolder1_preloader').css('display', 'block');
    jquery_1_11_3_min_p('#ContentPlaceHolder1_Overlay_Load').css('display', 'block');
    LoadData = jquery_1_11_3_min_p("#hdnLoad").val();
    jquery_1_11_3_min_p.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "../WebServices/Setup.asmx/BindReqControltype",
        data: "{'LoadData':'" + LoadData + "'}",
        dataType: "json",
        success: function (result) {
            jquery_1_11_3_min_p('#ContentPlaceHolder1_preloader').css('display', 'none');
            jquery_1_11_3_min_p('#ContentPlaceHolder1_Overlay_Load').css('display', 'none');
            var jsonData = result.d;
            var i = 0;
            jquery_1_11_3_min_p("#userGrid tbody").empty();
            jQuery.each(jsonData.Table, function (rec) {
                var markup = "<tr> <td style='display:none'> " + jsonData.Table[i].CountryId + "</td><td style='display:none'> " + jsonData.Table[i].EntityId + "</td><td style='display:none'> " + jsonData.Table[i].EntityEmpId + "</td><td style='display:none'> " + jsonData.Table[i].AllowOverQty + "</td><td style='display:none'> " + jsonData.Table[i].ReqCtrlSetId + "</td> <td> <input id='chkbox' type='checkbox' class='checkAll'  /></td><td title='" + jsonData.Table[i].EmpName + "'>" + jsonData.Table[i].EmpName + "</td> <td >" + jsonData.Table[i].Employeecount + "</td><td style='display:none'>" + jsonData.Table[i].EmpLocation + "</td></tr>";
                jquery_1_11_3_min_p("#userGrid tbody").append(markup);
                i++;
            });
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

function SaveRequestcontrolaccess() {
    var Emparray = []; var EmployeeJson = ''; var Overqty = '';
    $(kendo_all_min_js('#ddlpartneremp').data("kendoDropDownList").dataItems()).each(function () {
        var b = this;
        var c = b.value;
        if ($("#" + "chk_Otherpartner_" + c).prop("checked")) {
            Emparray.push({ Empid: c })
        }
    });
    EmployeeJson = JSON.stringify(Emparray);
    if ($("#chk_overallow").is(':checked')) { Overqty = 1; } else { Overqty = 0 }
    jquery_1_11_3_min_p.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "../WebServices/Setup.asmx/SaveRequisitioncontrolaccess",
        data: "{'Entityemployee':'" + kendo_all_min_js('#ddlemployee').val() + "','Partneremp':'" + EmployeeJson + "','CreatedBy':'" + jquery_1_11_3_min_p('#ContentPlaceHolder1_lblUserId').text().trim() + "','CountryId':'" + kendo_all_min_js('#ddlcountry').val() + "','EntityId':'" + kendo_all_min_js('#ddlentity').val() + "','Overallow':'" + Overqty + "'}",
        dataType: "json",
        success: function (result) {
            var jsonData = result.d;
            if (jsonData.Table[0].Res == "1") {
                swal("Saved Successfully", "Data Saved successfully!", "success")
                    .then((value) => {
                        window.location.replace("RequestControlSetup.aspx");
                    });
            }
            if (jsonData.Table[0].Res == "2") {
                swal("Sorry", "Update Only No New Insertion allow!", "warning")
                    .then((value) => {
                        window.location.replace("RequestControlSetup.aspx");
                    });
            }
        }
    });
}
function Validation() {
    var allow = true;
    if (kendo_all_min_js("#ddlemployee").val() == 0) {
        kendo_all_min_js("#ddlemployee").data("kendoDropDownList").span.css('background', '#f9e5e5');
        allow = false;
    }
    if (kendo_all_min_js("#ddlpartneremp").val() == 0) {
        kendo_all_min_js("#ddlpartneremp").data("kendoDropDownList").span.css('background', '#f9e5e5');
        allow = false;
    }
   
    return allow;

}
function RemoveClass() {
    if (jquery_1_11_3_min_p("#taxalerttime").val() != "") {
        jquery_1_11_3_min_p("#taxalerttime").removeClass('validate');

    }

}
function Comparevalue(data) {
    var id = data.id;
    var val = jquery_1_11_3_min_p('#' + id).val();
    var re = /^([0-9]+[\.]?[0-9]?[0-9]?[0-9]?|[0-9]+)$/g;
    var re1 = /^([0-9]+[\.]?[0-9]?[0-9]?[0-9]?|[0-9]+)/g;
    if (re.test(val)) {
        //do something here

    } else {
        val = re1.exec(val);
        if (val) {
            jquery_1_11_3_min_p('#' + id).val(val[0]);
        } else {
            jquery_1_11_3_min_p('#' + id).val('');
        }
    }

    var Arr = id.split('_');
    var val = jquery_1_11_3_min_p('#' + id).val();
    if (val == '') {
        jquery_1_11_3_min_p('#' + Arr[1]).prop("disabled", true);
    }
    else {

    }

}
function BindAllFields() {
    var Country = []; var Entity = []; var EntityEmployee = []; var PartnerEmployee = [];
    jquery_1_11_3_min_p.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "../WebServices/Setup.asmx/BindRequisitionControlField",
        //        data: "{'jsonItem':'" + jsonItem + "','UpdatedBy':'" + UpdatedBy + "'}",
        data: "{}",
        dataType: "json",
        async: false,
        success: function (result) {
            jsonData = eval(result.d);
            EntityEmployee = [];
            var i = 0;
            EntityEmployee.push({ value: "0", text: "Select" });
            jQuery.each(jsonData.Table, function (rec) {
                EntityEmployee.push({ value: jsonData.Table[i].Empid, text: jsonData.Table[i].EmpName });
                i++;
            });
            PartnerEmployee = [];
            var i = 0;
            PartnerEmployee.push({ value: "0", text: "Select" });
            jQuery.each(jsonData.Table3, function (rec) {
                PartnerEmployee.push({ value: jsonData.Table3[i].Empid, text: jsonData.Table3[i].EmpName });
                i++;
            });
            Country = [];
            var i = 0;
            //  Country.push({ value: "0", text: "Select" });
            jQuery.each(jsonData.Table1, function (rec) {
                Country.push({ value: jsonData.Table1[i].CountryId, text: jsonData.Table1[i].CountryName });
                i++;
            });
            Entity = [];
            var i = 0;
            //  Entity.push({ value: "0", text: "Select" });
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
        }
    });

    kendo_all_min_js('#ddlentity').kendoDropDownList({
        filter: "contains",
        dataTextField: "text",
        dataValueField: "value",
        dataSource: Entity,
        change: function () {
            kendo_all_min_js('#ddlentity').data("kendoDropDownList").span.css('background', 'none');
        }
    });

    kendo_all_min_js('#ddlemployee').kendoDropDownList({
        filter: "contains",
        dataTextField: "text",
        dataValueField: "value",
        dataSource: EntityEmployee,
        change: function () {
            kendo_all_min_js('#ddlemployee').data("kendoDropDownList").span.css('background', 'none');
        }
    });
    //kendo_all_min_js('#ddlpartneremp').kendoDropDownList({
    //    filter: "contains",
    //    dataTextField: "text",
    //    dataValueField: "value",
    //    dataSource: PartnerEmployee,
    //    change: function () {
    //        kendo_all_min_js('#ddlpartneremp').data("kendoDropDownList").span.css('background', 'none');
    //    }
    //});
    kendo_all_min_js("#ddlpartneremp").kendoDropDownList({
        filter: "contains",
        template: "<input type='checkbox' id='chk_Otherpartner_#=data.value#' class='clsSkillInner' value='#=data.value #' name='Otherpartner' />" + " " + "${ data.text }",
        dataTextField: "text",
        dataValueField: "value",
        dataSource: PartnerEmployee,
        close: onClose,
        dataBound: onOtherUnitBound,
        change: function () {
            kendo_all_min_js('#ddlpartneremp').data("kendoDropDownList").span.css('background', 'none');

        }
    });
}

function onOtherUnitBound(e) {

    $(".clsSkillInner").on("click", function (e) {
        var obj = this;
        var id = $(obj).attr('id');
        var name = 'Otherpartner';
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
        $('input[id*="chk_Otherpartner_' + data + '"]').prop("checked", true);
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

function UpdateRequestcontrolaccess() {
    var Emparray = []; var EmployeeJson = ''; var Overqty = '';
    $(kendo_all_min_js('#ddlpartneremp').data("kendoDropDownList").dataItems()).each(function () {
        var b = this;
        var c = b.value;
        if ($("#" + "chk_Otherpartner_" + c).prop("checked")) {
            Emparray.push({ Empid: c })
        }
    });
    EmployeeJson = JSON.stringify(Emparray);
    if ($("#chk_overallow").is(':checked')) { Overqty = 1; } else { Overqty = 0 }
    jquery_1_11_3_min_p.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "../WebServices/Setup.asmx/UpdateRequisitioncontrolaccess",
        data: "{'Entityemployee':'" + kendo_all_min_js('#ddlemployee').val() + "','Partneremp':'" + EmployeeJson + "','CreatedBy':'" + jquery_1_11_3_min_p('#ContentPlaceHolder1_lblUserId').text().trim() + "','CountryId':'" + kendo_all_min_js('#ddlcountry').val() + "','EntityId':'" + kendo_all_min_js('#ddlentity').val() + "','Overallow':'" + Overqty + "','Rowid':'" + Reqctrlid + "'}",
        dataType: "json",
        success: function (result) {
            var jsonData = result.d;
            if (jsonData.Table[0].Res == "1") {
                swal("Updated Successfully", "Data Updated successfully!", "success")
                    .then((value) => {
                        window.location.replace("RequestControlSetup.aspx");
                    });
            }
        }
    });
}