var SessionPartnerId = "5"; var SessionCountryId = "1"; var SessionEntityId = "1"; var globalCounter = 0; var Item = []; var RequestData = []; var dblclickFlag = 0;
Item.push({ value: "0", text: "Select" });
jquery_1_11_3_min_p(document).ready(function () {
    var time = new Date();
    var t= time.toLocaleString('en-US', { hour: 'numeric', minute: 'numeric', hour12: true })
    var Reqdate=$.datepicker.formatDate('dd M yy', new Date())+" "+t;
    $("#lblreqdate").text(Reqdate);
    BindLocation();
    AddDefaultRow();
    BindRequestGrid();

    $(document).on("dblclick", "#AllRequisitionGrid tbody tr", function () {
        var row = jquery_1_11_3_min_p(this);
        $("#AllRequisitionGrid tbody tr").removeClass("selectedRow");
        row.addClass("selectedRow");
        dblclickFlag = 1;
        $("#RequisitionHeader").css('display', 'block');
        $("#RequisitionForm").css('display', 'block');
        $("#RequisitionGrid").css('display', 'none');
        $("#iblreqNo").text(row.find('td:nth-child(3)').text().trim());
        BindLocation();
        AddDefaultRow();

    });

    jquery_1_11_3_min_p('#btnsave').click(function () {
        if (validateRequisitionForm() == true) {
            swal({
                title: "Do you want to Submit?",
                text: "",
                icon: "warning",
                buttons: true,
                dangerMode: true,
            })
                .then((willDelete) => {
                    if (willDelete) {
                        SaveRequest();
                    }
                });
        }
    });
});



function BindLocation() {
  var  Location = [];
    jquery_1_11_3_min_p.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "../WebServices/ItemRequisition.asmx/BindLocation",
        data: "{'entityId':'" + SessionEntityId + "','CountryId':'" + SessionCountryId + "','PartnerId':'" + SessionPartnerId + "'}",
        dataType: "json",
        async: false,
        success: function (result) {
            jsonData = eval(result.d);
            var i = 0;
            Location.push({ value: "0", text: "Select" });
            jQuery.each(jsonData.Table, function (rec) {
                Location.push({ value: jsonData.Table[i].AutoId, text: jsonData.Table[i].ParterAddress });
                i++;
            });
        }
    });
    kendo_all_min_js("#ddllocation").kendoDropDownList({
            filter: "contains",
            dataTextField: "text",
            dataValueField: "value",
            dataSource: Location,
            change: function () {
                kendo_all_min_js('#ddllocation').data("kendoDropDownList").span.css('background', 'none');
                var LocationId = kendo_all_min_js('#ddllocation').data("kendoDropDownList").value();
                BindItem(LocationId)
                AddDefaultRow();
            }
    });

}
function AddRow() {
    
    globalCounter = globalCounter + 1;
    var markup = "<tr><td style='display: none'>" + globalCounter + "</td><td> <input type='checkbox' id='chk_" + globalCounter + "' class='chk_All' /></td ><td> <input type='text' id='ddlitem_" + globalCounter + "'  class='fieldName'   /></td><td> <label id='lblitemNo_" + globalCounter + "'></label> </td><td> <label id='lblitemName_" + globalCounter + "'></label> </td><td> <label id='lblonhand_" + globalCounter + "'></label> </td><td><input type='text' id='txtReqQty_" + globalCounter + "' placeholder='00.000' onkeyup='RemoveClass(this)' class='fieldName' autocomplete='off' /> </td> </tr >";
    jquery_1_11_3_min_p("#RequisitionLineForm  tbody").append(markup);
    BindDefaultItemddl();

}

function AddDefaultRow() {
    $("#RequisitionLineForm  tbody").empty();
    globalCounter = 0;
    for (var i = 1; i <= 5; i++) {
        globalCounter = i;
        var markup = "<tr><td style='display: none'>" + globalCounter + "</td><td> <input type='checkbox' id='chk_" + globalCounter + "' class='chk_All' /></td ><td> <input type='text' id='ddlitem_" + globalCounter + "'  class='fieldName'   /></td><td> <label id='lblitemNo_" + globalCounter + "'></label> </td><td> <label id='lblitemName_" + globalCounter + "'></label> </td><td> <label id='lblonhand_" + globalCounter + "'></label> </td><td><input type='text' id='txtReqQty_" + globalCounter + "' placeholder='00.000' onkeyup='RemoveClass(this)' class='fieldName' autocomplete='off' /> </td> </tr >";
        jquery_1_11_3_min_p("#RequisitionLineForm  tbody").append(markup);
        BindDefaultItemddl();
    }

}
function BindDefaultItemddl() {
    kendo_all_min_js("#ddlitem_" + globalCounter).kendoDropDownList({
        filter: "contains",
        dataTextField: "text",
        dataValueField: "value",
        dataSource: Item,
        change: function (e) {
            var elementId = e.sender.element[0].id;
            var Id = elementId.split('_');
            kendo_all_min_js("#" + elementId).data("kendoDropDownList").span.css('background', 'none');
            var Item = kendo_all_min_js("#" + elementId).data("kendoDropDownList").text();
            var ItemName = Item.split('|');
            $("#lblitemNo_" + Id[1]).text(ItemName[0]);
            $("#lblitemName_" + Id[1]).text(ItemName[1]);
            $("#lblonhand_" + Id[1]).text(10);
        }
    });
}

function BindItem(LocationId) {
   Item = [];
    jquery_1_11_3_min_p.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "../WebServices/ItemRequisition.asmx/BindItem",
        data: "{'entityId':'" + SessionEntityId + "','CountryId':'" + SessionCountryId + "','PartnerId':'" + SessionPartnerId + "','LocationId':'" + LocationId + "'}",
        dataType: "json",
        async: false,
        success: function (result) {
            jsonData = eval(result.d);
            var i = 0;
            Item.push({ value: "0", text: "Select" });
            jQuery.each(jsonData.Table, function (rec) {
                Item.push({ value: jsonData.Table[i].Itemid, text: jsonData.Table[i].ItemName });
                i++;
            });
        }
    });
}

function BindRequestGrid() {
    Item = [];
    var Loadmore = 10;
    jquery_1_11_3_min_p.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "../WebServices/ItemRequisition.asmx/BindRequestGrid",
        data: "{'EntityId':'" + SessionEntityId + "','CountryId':'" + SessionCountryId + "','Loadmore':'" + Loadmore + "'}",
        dataType: "json",
        async: false,
        success: function (result) {
            jsonData = eval(result.d);
            var i = 0;
            Item.push({ value: "0", text: "Select" });
            jQuery.each(jsonData.Table, function (rec) {
                var markup = "<tr><td style ='display:none'> " + jsonData.Table[i].RequisitionId + "</td> <td> <input type='checkbox' id='chk_' class='chk_All' /></td > <td>" + jsonData.Table[i].RequestNumber + "</td><td>" + jsonData.Table[i].Location + "</td><td>" + jsonData.Table[i].CreationDate + "</td><td>" + jsonData.Table[i].SubmissionDate + "</td><td>" + jsonData.Table[i].LastActivityDate + "</td><td>" + jsonData.Table[i].UserName + "</td><td>" + jsonData.Table[i].Status + "</td> </tr >";
                jquery_1_11_3_min_p("#AllRequisitionGrid  tbody").append(markup);         
                i++;
            });
        }
    });
}


function SaveRequest() {
    CreateJson();
    var Reqjson = JSON.stringify(RequestData);
    jquery_1_11_3_min_p.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "../WebServices/ItemRequisition.asmx/SaveRequest",
        data: "{'Reqjson':'" + Reqjson + "'}",
        dataType: "json",
        async: false,
        success: function (result) {
            jsonData = eval(result.d);
            swal("Saved Successfully", "Your data Saved successfully!", "success")
                .then((value) => {
                    window.location.replace("AllRequisition.aspx");
                });
           
        }
    });
}

function CreateJson() {
    RequestData = []
    CreatedBy = jquery_1_11_3_min_p('#ContentPlaceHolder1_lblUserId').text();
    var LocationId = kendo_all_min_js('#ddllocation').data("kendoDropDownList").value();
    jquery_1_11_3_min_p('#RequisitionLineForm tbody').find('tr').each(function () {
        var row = jquery_1_11_3_min_p(this);
        var rowNumber = row.find('td:nth-child(1)').text().trim();
        if (kendo_all_min_js('#ddlitem_' + rowNumber).val() != 0) {
            RequestData.push({ Itemid: kendo_all_min_js('#ddlitem_' + rowNumber).val(), RequestedQty: jquery_1_11_3_min_p("#txtReqQty_" + rowNumber).val(), LocationId: LocationId, PartnerId: SessionPartnerId, EntityId: SessionEntityId, CountryId: SessionCountryId, createdBy: CreatedBy })
        }
    });
}

function validateRequisitionForm() {
    var allow = true;
    var Flag = 0;
    jquery_1_11_3_min_p('#RequisitionLineForm tbody').find('tr').each(function () {
        var row = jquery_1_11_3_min_p(this);
        var rowNumber = row.find('td:nth-child(1)').text().trim();
        if (kendo_all_min_js('#ddlitem_' + rowNumber).val() != 0) {
            Flag=1
            if (jquery_1_11_3_min_p("#txtReqQty_" + rowNumber).val() == "") {
                jquery_1_11_3_min_p("#txtReqQty_" + rowNumber).addClass('validate');
                jquery_1_11_3_min_p("#txtReqQty_" + rowNumber).attr("placeholder", "enter Qty!");
                allow = false;
            }
           
        }
    });
    if (kendo_all_min_js('#ddllocation').data("kendoDropDownList").value() != 0) {
        if (Flag == 0) {
            allow = false;
            swal("Please select atleast one item");

        }
    }
    else {
        allow = false;
        swal("Please select Location");

    }
    return allow;

}
function RemoveClass(a) {
    var id = a.id;
    $("#" + id).removeClass('validate');
}