var LoadData = ''; var dblclickid = 0; var RAlertid = 0;
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
                            SaveAlert();

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
                            UpdateAlert();

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
        dblclickid = 1; RAlertid = row.find('td:nth-child(1)').text().trim();
        jquery_1_11_3_min_p("#createusserForm").css('display', 'block');
        jquery_1_11_3_min_p("#createusserGrid").css('display', 'none');
        jquery_1_11_3_min_p("#btnnew").css('display', 'none');
        jquery_1_11_3_min_p("#btnback").css('display', 'block');
        jquery_1_11_3_min_p("#btnSubmit").css('display', 'block');
        BindAllFields();
        kendo_all_min_js('#ddlrequisitiontype').data("kendoDropDownList").value(row.find('td:nth-child(4)').text().trim());
        jquery_1_11_3_min_p('#taxalerttime').val(row.find('td:nth-child(7)').text().trim());
        jquery_1_11_3_min_p('#txtdescription').val(row.find('td:nth-child(8)').text().trim());

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
        url: "../WebServices/Setup.asmx/BindReqtype",
        data: "{'LoadData':'" + LoadData + "'}",
        dataType: "json",
        success: function (result) {
            jquery_1_11_3_min_p('#ContentPlaceHolder1_preloader').css('display', 'none');
            jquery_1_11_3_min_p('#ContentPlaceHolder1_Overlay_Load').css('display', 'none');
            var jsonData = result.d;
            var i = 0;
            jquery_1_11_3_min_p("#userGrid tbody").empty();
            jQuery.each(jsonData.Table, function (rec) {
                var markup = "<tr> <td style='display:none'> " + jsonData.Table[i].RAlertid + "</td><td style='display:none'> " + jsonData.Table[i].EntityId + "</td><td style='display:none'> " + jsonData.Table[i].CountryId + "</td><td style='display:none'> " + jsonData.Table[i].ReqFormat + "</td> <td> <input id='chkbox' type='checkbox' class='checkAll'  /></td><td title='" + jsonData.Table[i].ItemName + "'>" + jsonData.Table[i].AlertType + "</td> <td >" + jsonData.Table[i].Reqvalue + "</td><td >" + jsonData.Table[i].Description + "</td></tr>";
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
function SaveAlert() {
    jquery_1_11_3_min_p.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "../WebServices/Setup.asmx/SaveRequisitionalert",
        data: "{'Reqtype':'" + kendo_all_min_js('#ddlrequisitiontype').val() + "','Reqval':'" + jquery_1_11_3_min_p('#taxalerttime').val() + "','CreatedBy':'" + jquery_1_11_3_min_p('#ContentPlaceHolder1_lblUserId').text().trim() + "','CountryId':'" + kendo_all_min_js('#ddlcountry').val() + "','EntityId':'" + kendo_all_min_js('#ddlentity').val() + "','Description':'" + jquery_1_11_3_min_p('#txtdescription').val().trim()+ "'}",
        dataType: "json",
        success: function (result) {
            var jsonData = result.d;
            if (jsonData.Table[0].Res == "1") {
                swal("Saved Successfully", "Data Saved successfully!", "success")
                    .then((value) => {
                        window.location.replace("RequisitionSetup.aspx");
                    });
            }
            if (jsonData.Table[0].Res == "2") {
                swal("Sorry", "Update Only No New Insertion allow!", "warning")
                    .then((value) => {
                        window.location.replace("RequisitionSetup.aspx");
                    });
            }
        }
    });
}
function Validation() {
    var allow = true;
    if (kendo_all_min_js("#ddlrequisitiontype").val() == 0)
    {
        kendo_all_min_js("#ddlrequisitiontype").data("kendoDropDownList").span.css('background', '#f9e5e5');
        allow = false;
    }
    if (jquery_1_11_3_min_p("#taxalerttime").val() == "") {
        jquery_1_11_3_min_p("#taxalerttime").addClass('validate');
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
    var Country = []; var Entity = []; var Alerttype = [];
    jquery_1_11_3_min_p.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "../WebServices/Setup.asmx/BindRequisitionField",
        //        data: "{'jsonItem':'" + jsonItem + "','UpdatedBy':'" + UpdatedBy + "'}",
        data: "{}",
        dataType: "json",
        async: false,
        success: function (result) {
            jsonData = eval(result.d);
            Alerttype = [];
            var i = 0;
            Alerttype.push({ value: "0", text: "Select" });
            jQuery.each(jsonData.Table, function (rec) {
                Alerttype.push({ value: jsonData.Table[i].Alertid, text: jsonData.Table[i].AlertType });
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

    kendo_all_min_js('#ddlrequisitiontype').kendoDropDownList({
        filter: "contains",
        dataTextField: "text",
        dataValueField: "value",
        dataSource: Alerttype,
        change: function () {
            kendo_all_min_js('#ddlrequisitiontype').data("kendoDropDownList").span.css('background', 'none');
        }
    });
}
function UpdateAlert() {
    jquery_1_11_3_min_p.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "../WebServices/Setup.asmx/UpdateRequisitionalert",
        data: "{'Reqtype':'" + kendo_all_min_js('#ddlrequisitiontype').val() + "','Reqval':'" + jquery_1_11_3_min_p('#taxalerttime').val() + "','CreatedBy':'" + jquery_1_11_3_min_p('#ContentPlaceHolder1_lblUserId').text().trim() + "','CountryId':'" + kendo_all_min_js('#ddlcountry').val() + "','EntityId':'" + kendo_all_min_js('#ddlentity').val() + "','Alertid':'" + RAlertid + "','Description':'" + jquery_1_11_3_min_p('#txtdescription').val().trim() + "'}",
        dataType: "json",
        success: function (result) {
            var jsonData = result.d;
            if (jsonData.Table[0].Res == "1") {
                swal("Updated Successfully", "Data Updated successfully!", "success")
                    .then((value) => {
                        window.location.replace("RequisitionSetup.aspx");
                    });
            }
        }
    });
}