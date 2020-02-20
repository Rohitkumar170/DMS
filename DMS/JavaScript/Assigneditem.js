var LoadData = ''; var Country = []; Entity = []; var searchtxt = ''; var ColumnName = []; var Items = []; var Itemcount = 1; var PartnerLocation = [];
var locationid = ''; var partnerid = ''; var SessionEntityId = 1; var SessionCountryId = 1; var PartnerArr = []; var itemcounter = 0; var getdoubleclick = 0;
var Assignedid = 0;
jquery_1_11_3_min_p(document).ready(function () {
    jquery_1_11_3_min_p("#hdnLoad").val(10);
    LoadData = jquery_1_11_3_min_p("#hdnLoad").val();
    BindAssignedDataSetupGrid(searchtxt, SessionEntityId);
    PartnerArr.push({ value: "0", text: "Select" });
    kendo_all_min_js('#ddlpartnername').kendoDropDownList({
        filter: "contains",
        dataTextField: "text",
        dataValueField: "value",
        dataSource: PartnerArr,
        change: function () {
            kendo_all_min_js('#ddlpartnername').data("kendoDropDownList").span.css('background', 'none');
        }
    });
    PartnerLocation = [];
    PartnerLocation.push({ value: "0", text: "Select" });
    kendo_all_min_js('#ddllocation').kendoDropDownList({
        filter: "contains",
        dataTextField: "text",
        dataValueField: "value",
        dataSource: PartnerLocation,
        change: function () {
            kendo_all_min_js('#ddllocation').data("kendoDropDownList").span.css('background', 'none');
        }
    });
    jquery_1_11_3_min_p('#btnnew').click(function () {
        $("#PartnerItemAssignedForm").css('display', 'block');
        $("#PartnerItemAssignedGrid").css('display', 'none');
        jquery_1_11_3_min_p('#btnsubmit').css('display', 'block');
        jquery_1_11_3_min_p('#btnback').css('display', 'block');
        jquery_1_11_3_min_p('#btnnew').css('display', 'none');
        jquery_1_11_3_min_p("#txtMinQty_1").val(0);
        jquery_1_11_3_min_p("#txtMaxQty_1").val(0);
        BindPartner(SessionCountryId, SessionEntityId);
        jquery_1_11_3_min_p('#DivNewitemsearch').css('display', 'block');
    });
    jquery_1_11_3_min_p("#btnback").click(function () {
        window.location.replace("ItemAssigned.aspx");
    });
    jquery_1_11_3_min_p('#btnsubmit').click(function () {
        if (ValidateHeaderDropDown() == true) {

            if (Assignedid == '0') {
                swal({
                    title: "Do you want to Proceed?",
                    text: "",
                    icon: "warning",
                    buttons: true,
                    dangerMode: true,
                })
                    .then((willDelete) => {
                        if (willDelete) {
                            SaveAssignedItem();


                        }
                    });
            }
            else
            {
                swal({
                    title: "Do you want to Proceed?",
                    text: "",
                    icon: "warning",
                    buttons: true,
                    dangerMode: true,
                })
                    .then((willDelete) => {
                        if (willDelete) {
                            UpdateAssignedItem();


                        }
                    });
            }


        }
    });

    $(document).on("dblclick", "#tblassignedpartneritem tbody tr", function () {
        var row = jquery_1_11_3_min_p(this);
        var AssignedItemid = row.find('td:nth-child(1)').text().trim();
        Assignedid = AssignedItemid;
        var entityid = row.find('td:nth-child(2)').text().trim();
        var countryid = row.find('td:nth-child(3)').text().trim();
        partnerid = row.find('td:nth-child(4)').text().trim();
        locationid = row.find('td:nth-child(5)').text().trim();
        BindPartnerLocation(partnerid, entityid);
        BindPartner(SessionCountryId, SessionEntityId);

        BindLocationwisedata(countryid, entityid, kendo_all_min_js('#ddllocation').data("kendoDropDownList").value(), kendo_all_min_js('#ddlpartnername').data("kendoDropDownList").value())
        jquery_1_11_3_min_p('#PartnerItemAssignedForm').css('display', 'block');
        jquery_1_11_3_min_p('#PartnerItemAssignedGrid').css('display', 'none');
        jquery_1_11_3_min_p('#btnsubmit').css('display', 'block');
       // jquery_1_11_3_min_p('#btnsubmit').prop("disabled", true);
        jquery_1_11_3_min_p('#btnback').css('display', 'block');
        jquery_1_11_3_min_p('#btnnew').css('display', 'none');
        jquery_1_11_3_min_p('#DivNewitemsearch').css('display', 'none');
        
    });

    // =================================== start for search===========================
    jquery_1_11_3_min_p('#searchText').keypress(function (event) {

        var keycode = (event.keyCode ? event.keyCode : event.which);
        if (keycode == '13') {
            if (jquery_1_11_3_min_p('#searchText').val().trim() == '') { jquery_1_11_3_min_p('#searchText').addClass('validate'); }
            else {
                Querystring = ''; Searchcondition = '';
                var flag = "";
                $('#DivSearch input:checked').each(function () {
                    flag = 1;
                    var columname1 = this.id;
                    var splitval = columname1.split('_');
                    var colm = splitval[1];

                    if (columname1 != 'chk_undefined') {
                        var len = '';
                        var searchvalue = jquery_1_11_3_min_p('#searchText').val().trim();
                        var searchval = searchvalue.split('*');

                        var FirstChar = searchvalue.substring(0, 1);
                        var lastChar = searchvalue[searchvalue.length - 1];

                        if (FirstChar != '*' && lastChar == '*') {
                            //start with value

                            var dd = searchval[0];
                            Querystring += colm + ' like ' + "$" + dd + '%' + "$" + ' ' + 'or' + ' ';
                        }
                        else if (FirstChar == '*' && lastChar == '*') {
                            //end with value
                            var dd = searchval[1];
                            Querystring += colm + ' like ' + "$" + '%' + dd + '%' + "$" + ' ' + ' ' + 'or' + ' ';
                        }
                        else if (FirstChar == '*' && lastChar != '*') {
                            //between with value
                            var dd = searchval[1];
                            Querystring += colm + ' like ' + "$" + '%' + dd + "$" + ' ' + ' ' + 'or' + ' ';

                        }
                        else {
                            // search for exact value
                            var dd = searchval[0];
                            Querystring += colm + '=' + "$" + dd + "$" + ' ' + ' ' + 'or' + ' ';
                        }
                    }
                });
                if (flag == 1) {
                    var newquerystring = Querystring.substring(0, Querystring.length - 3);
                    searchtxt = ' and ' + newquerystring.trim();
                }
                else {
                    searchtxt = '';
                }

                BindAssigned(SessionCountryId, SessionEntityId, searchtxt);
                event.preventDefault();
            }
        }

    });
    //===============================end for search========================================
});
function BindLocationwisedata(CountryId, EntityId, Partnerlocation,Partner) {
    jquery_1_11_3_min_p.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "../WebServices/Setup.asmx/BindLocationwisedata",
        data: "{'CountryId':'" + CountryId + "','EntityId':'" + EntityId + "','Partnerlocation':'" + Partnerlocation + "','Partner':'" + Partner + "'}",
        dataType: "json",
        async: false,
        success: function (result) {
            jsonData = eval(result.d);
            jquery_1_11_3_min_p('#tblitemassigned tbody tr').empty();
            var i = 0;
            jQuery.each(jsonData.Table, function (rec) {
                var rowID = itemcounter + 1;
                var markup = "<tr><td><input type='checkbox' class='chk_All' id='chk_" + rowID + "'></td><td ><input type='text' class='fieldName' id='txtItem_" + rowID + "' readonly='readonly' autocomplete='off' title='" + jsonData.Table[i].ItemName + "'  placeholder='Enter tem' /> <td ><span class='customer'> <input type='text' id='txtMinQty_" + rowID + "' placeholder='Enter Minimum Qty' value='0' onkeyup='RemoveClass(this)' class='fieldName' /></span></td><td ><span class='customer'> <input type='text' id='txtMaxQty_" + rowID + "'  placeholder='Enter Maximum Qty' value='0' onkeyup='RemoveClass(this)' class='fieldName'/></span></td></td><td style='opacity:0'>" + rowID + "</td><td style='opacity:0'>" + jsonData.Table[i].Itemid + "</td></tr>";
                jquery_1_11_3_min_p("#tblitemassigned tbody").append(markup);
                jquery_1_11_3_min_p('#txtItem_' + rowID).val(jsonData.Table[i].ItemName);
                jquery_1_11_3_min_p('#chk_' + rowID).prop("checked", "true");
                i++;
                itemcounter = rowID;
            });

        },
        error: function (result) {
        }
    });

}
function InputcheckAll(ele) {
    debugger;
    var state = $(ele).is(':checked');
    // var grid = $('#tblFields').data('kendoGrid');
    if (state == true) {

        $('.chk_All').prop('checked', true);
    }
    else {

        $('.chk_All').prop('checked', false);
    }
};
function BindAssigned(CountryId, EntityId, searchtxt) {
    jquery_1_11_3_min_p.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "../WebServices/Setup.asmx/Assigneditemtopartner",
        data: "{'CountryId':'" + CountryId + "','EntityId':'" + EntityId + "','searchtxt':'" + searchtxt + "'}",
        dataType: "json",
        async: false,
        success: function (result) {
            jsonData = eval(result.d);
            jquery_1_11_3_min_p('#tblitemassigned tbody tr').empty();
            var i = 0;
            jQuery.each(jsonData.Table, function (rec) {
                var rowID = itemcounter + 1;
                var markup = "<tr><td><input type='checkbox' class='chk_All' id='chk_" + rowID + "'></td><td ><input type='text' class='fieldName' id='txtItem_" + rowID + "' readonly='readonly' autocomplete='off' title='" + jsonData.Table[i].ItemName + "'  placeholder='Enter tem' /> <td ><span class='customer'> <input type='text' id='txtMinQty_" + rowID + "' placeholder='Enter Minimum Qty' value='0' onkeyup='RemoveClass(this)' class='fieldName' /></span></td><td ><span class='customer'> <input type='text' id='txtMaxQty_" + rowID + "'  placeholder='Enter Maximum Qty' value='0' onkeyup='RemoveClass(this)' class='fieldName'/></span></td></td><td style='opacity:0'>" + rowID + "</td><td style='opacity:0'>" + jsonData.Table[i].Itemid + "</td></tr>";
                jquery_1_11_3_min_p("#tblitemassigned tbody").append(markup);
                jquery_1_11_3_min_p('#txtItem_' + rowID).val(jsonData.Table[i].ItemName);
                i++;
                itemcounter = rowID;
            });

        },
        error: function (result) {
        }
    });
   
}
function BindPartnerLocation(Partnerid, Entityid) {
    jquery_1_11_3_min_p.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "../WebServices/Setup.asmx/BindPartnerLocation",
        data: "{'PartnerId':'" + Partnerid + "','Entityid':'" + Entityid + "'}",
        dataType: "json",
        async: false,
        success: function (result) {
            jsonData = eval(result.d);
            PartnerLocation = [];
            var i = 0;
            PartnerLocation.push({ value: "0", text: "Select" });
            jQuery.each(jsonData.Table, function (rec) {
                PartnerLocation.push({ value: jsonData.Table[i].AutoId, text: jsonData.Table[i].Locationname });
                i++;
            });


        },
        error: function (result) {
        }
    });

    kendo_all_min_js('#ddllocation').kendoDropDownList({
        filter: "contains",
        dataTextField: "text",
        dataValueField: "value",
        dataSource: PartnerLocation,
        change: function () {
            kendo_all_min_js('#ddllocation').data("kendoDropDownList").span.css('background', 'none');
        }
    });

    if (locationid != '') {
        kendo_all_min_js('#ddllocation').data("kendoDropDownList").value(locationid);
    }
}
function ValidateHeaderDropDown() {
    var allow = true;
    var i = 0;
    if (kendo_all_min_js("#ddlpartnername").val() == 0) {
        kendo_all_min_js("#ddlpartnername").data("kendoDropDownList").span.css('background', '#f9e5e5');
        allow = false;
    }

    if (kendo_all_min_js("#ddllocation").val() == 0) {
        kendo_all_min_js("#ddllocation").data("kendoDropDownList").span.css('background', '#f9e5e5');
        allow = false;
    }
    var i = 1; var checkeditem = 0;
    jquery_1_11_3_min_p('#tblitemassigned tbody').find('tr').each(function () {
        var row = jquery_1_11_3_min_p(this);
        var rowid = "chk_" + row.find("td:nth-child(5)").text().trim();
        if ($('#' + rowid).prop("checked") == true) {
            checkeditem = 1;
        }
    });

    if (checkeditem == 1) { } else {
        allow = false;
        swal('Please select atleast one item'); }
   
    return allow;
}
function SaveAssignedItem() {
    var jsonfield = []; var Jsonfdata = '';

    jsonfield.push({ CountryId: SessionCountryId, EntityId: SessionEntityId, CreatedBy: jquery_1_11_3_min_p('#ContentPlaceHolder1_lblUserId').text().trim(), Partnerid: kendo_all_min_js("#ddlpartnername").val(), Locationid: kendo_all_min_js("#ddllocation").val() });
    Jsonfdata = JSON.stringify(jsonfield);
    var Items = []; var Jsonitems = '';
    var i = 0;
    jquery_1_11_3_min_p('#tblitemassigned tbody').find('tr').each(function () {
        var row = jquery_1_11_3_min_p(this);

        var rowid = "chk_" + row.find("td:nth-child(5)").text().trim();
        if ($('#' + rowid).prop("checked") == true) {
            var itemid = row.find('td:nth-child(6)').text().trim();
            var MinimumQty = jquery_1_11_3_min_p("#txtMinQty_" + row.find('td:nth-child(5)').text().trim()).val().trim();
            var MaximumQty = jquery_1_11_3_min_p("#txtMaxQty_" + row.find('td:nth-child(5)').text().trim()).val().trim();
            Items.push({ ItemId: itemid, CreatedBy: jquery_1_11_3_min_p('#ContentPlaceHolder1_lblUserId').text().trim(), MinimumQty: MinimumQty, MaximumQty: MaximumQty })
        }
        i++;
    });
    Jsonitems = JSON.stringify(Items);
    jquery_1_11_3_min_p.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "../WebServices/Setup.asmx/SaveAssigneditem",
        data: "{'Jsondata':'" + Jsonfdata + "','Jsonitems':'" + Jsonitems + "','Assignedid':'" + Assignedid + "'}",
        dataType: "json",
        success: function (result) {
            var i = 0;
            var jsonData = eval(result.d);
            if (jsonData.Table[0].Res == "1") {
                swal("Saved Successfully", "Items Saved successfully!", "success")
                    .then((value) => {
                        window.location.replace("ItemAssigned.aspx");
                    });
            }
        }
    });

}
function UpdateAssignedItem() {
     var Jsonfdata = '';
    var Items = []; var Jsonitems = '';
    var i = 0;
    jquery_1_11_3_min_p('#tblitemassigned tbody').find('tr').each(function () {
        var row = jquery_1_11_3_min_p(this);
        var rowid = "chk_" + row.find("td:nth-child(5)").text().trim();
        if ($('#' + rowid).prop("checked") == true) {
            var itemid = row.find('td:nth-child(6)').text().trim();
            var MinimumQty = jquery_1_11_3_min_p("#txtMinQty_" + row.find('td:nth-child(5)').text().trim()).val().trim();
            var MaximumQty = jquery_1_11_3_min_p("#txtMaxQty_" + row.find('td:nth-child(5)').text().trim()).val().trim();
            Items.push({ ItemId: itemid, CreatedBy: jquery_1_11_3_min_p('#ContentPlaceHolder1_lblUserId').text().trim(), MinimumQty: MinimumQty, MaximumQty: MaximumQty, Flag: 1 })
        }
        else {
            var itemid = row.find('td:nth-child(6)').text().trim();
            var MinimumQty = jquery_1_11_3_min_p("#txtMinQty_" + row.find('td:nth-child(5)').text().trim()).val().trim();
            var MaximumQty = jquery_1_11_3_min_p("#txtMaxQty_" + row.find('td:nth-child(5)').text().trim()).val().trim();
            Items.push({ ItemId: itemid, CreatedBy: jquery_1_11_3_min_p('#ContentPlaceHolder1_lblUserId').text().trim(), MinimumQty: MinimumQty, MaximumQty: MaximumQty, Flag: 0 })

        }
        i++;
    });
    Jsonitems = JSON.stringify(Items);
    jquery_1_11_3_min_p.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "../WebServices/Setup.asmx/UpdateAssigneditem",
        data: "{'Jsondata':'" + Jsonfdata + "','Jsonitems':'" + Jsonitems + "','Assignedid':'" + Assignedid + "'}",
        dataType: "json",
        success: function (result) {
            var i = 0;
            var jsonData = eval(result.d);
            if (jsonData.Table[0].Res == "1") {
                swal("Update Successfully", "Items Updated successfully!", "success")
                    .then((value) => {
                        window.location.replace("ItemAssigned.aspx");
                    });
            }
        }
    });

}
function BindAssignedDataSetupGrid(searchtxt, entityid) {
    jquery_1_11_3_min_p("#tblassignedpartneritem tbody").empty();
    var wh = jquery_1_11_3_min_p(document).height();
    var gh = wh - 260;
    var Partners = [];

    var SearchValue = searchtxt;

    LoadData = jquery_1_11_3_min_p("#hdnLoad").val();
    jquery_1_11_3_min_p.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "../WebServices/Setup.asmx/BindAssignedDataSetupGrid",
        data: "{'LoadData':'" + LoadData + "','SearchValue':'" + SearchValue + "','EntityId':'" + entityid + "'}",
        dataType: "json",
        success: function (result) {
            jquery_1_11_3_min_p('#preloader').css('display', 'none');
            jquery_1_11_3_min_p('#Overlay_Load').css('display', 'none');
            jquery_1_11_3_min_p('#divGrid').css('display', 'block');
            var i = 0;
            var jsonData = result.d;
            editjsondata = result.d;
            //            if(jsonData.Table.length>0)
            //            {
            //            editjson=result.d;
            //            jquery_1_11_3_min_p('#btnUpdate').prop("disabled", false);
            //            }
            //            else
            //            {
            //            jquery_1_11_3_min_p('#btnUpdate').prop("disabled", true);
            //            }

            jQuery.each(jsonData.Table, function (rec) {

                var markup = "<tr> <td style='display:none'> " + jsonData.Table[i].Assignedid + "</td> <td style='display:none'> " + jsonData.Table[i].EntityId + "</td> <td style='display:none'> " + jsonData.Table[i].Countryid + "</td> <td style='display:none'> " + jsonData.Table[i].PartnerId + "</td> <td style='display:none'> " + jsonData.Table[i].Locationid + "</td> <td> <input id='chkbox' type='checkbox' class='checkAll'  /></td><td>" + jsonData.Table[i].Entityname + "</td> <td >" + jsonData.Table[i].CountryName + "</td> <td >" + jsonData.Table[i].PartnerName + "</td><td >" + jsonData.Table[i].Locationname + "</td></tr>";

                jquery_1_11_3_min_p("#tblassignedpartneritem tbody").append(markup);

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
            var j = 0; jquery_1_11_3_min_p("#DivSearch1").empty();
            //            var SearchDiv1 = "<div class='dropdown-item'><span class='skin skin-polaris'><input type='checkbox' class='checkAll' id='chk_" + ColumnName[j - 1] + "' onclick='checkAll(this)'><label for='check3' class='coldata'>All</label></span></div>";
            //            jquery_1_11_3_min_p("#DivSearch").append(SearchDiv1);
            jquery_1_11_3_min_p('#tblassignedpartneritem thead tr th').each(function () {
                if (j > 1) {

                    var id1 = 'chk_' + ColumnName[j - 2];
                    this.id = id1;
                    var SearchDiv = "<div class='dropdown-item'><span class='skin skin-polaris'><input type='checkbox' class='searchcheckAll' id='chk_" + ColumnName[j - 2] + "' onclick='Addclasstocolumn(this)'><label for='check3' class='coldata'>" + $(this).text() + "</label></span></div>";
                    jquery_1_11_3_min_p("#DivSearch1").append(SearchDiv);

                }
                j++;

            });
            var Searchfinaldiv = "<div class='dropdownBottom'><label class='pull-left' id='selectall' onclick='searchcheckAll()' >Select All</label><label class='pull-right' id='reset' onclick='searchUncheckAll()' >Reset</label></div>";
            jquery_1_11_3_min_p("#DivSearch1").append(Searchfinaldiv);
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
function Addclasstocolumnforitem(Data) {
    var state = $(Data).is(':checked');
    // var grid = $('#tblFields').data('kendoGrid');
    if (state == true) {
        var checkid = '#' + Data.id;
        jquery_1_11_3_min_p('#tblitemassigned thead tr ' + checkid).addClass('filter');
    }
    else {
        var checkid = '#' + Data.id;
        jquery_1_11_3_min_p('#tblitemassigned thead tr ' + checkid).removeClass('filter');
    }

}
function Comparevalue(data) {
    var id = data.id;
    var val = jquery_1_11_3_min_p('#' + id).val();
    var table = document.getElementById('tblitemassigned');
    var rowlength = jquery_1_11_3_min_p("#tblitemassigned tr").not("thead tr").length;
    if (rowlength > 1) {
        var i;
        for (i = 1; i <= parseInt(rowlength - 1); i++) {
            var existfieldid1 = jquery_1_11_3_min_p(table.rows[i].cells[4]).text().trim();
            var newid = "txtItem_" + existfieldid1;
            var existfieldid = jquery_1_11_3_min_p('#' + newid).val().trim();
            if (val == existfieldid) {
                swal("Item already selected", "Please choose different items!", "info")
                    .then((value) => {
                        kendo_all_min_js('#' + id).data("kendoDropDownList").value(0);

                    });
            }
        }
    }

}
function RemoveClass(data) {

    var id = data.id;
    var arr = id.split('_');
    var id = arr[1];
    if (jquery_1_11_3_min_p('#txtMinQty_' + id).val() != '') {
        jquery_1_11_3_min_p("#txtMinQty_" + id).removeClass('validate');
    }
    if (jquery_1_11_3_min_p('#txtMaxQty_' + id).val() != '') {
        jquery_1_11_3_min_p("#txtMaxQty_" + id).removeClass('validate');
    }
}
function BindPartner(CountryId, EntityId) {
    jquery_1_11_3_min_p.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "../WebServices/Setup.asmx/BindPartners",
        data: "{'CountryId':'" + CountryId + "','EntityId':'" + EntityId + "'}",
        dataType: "json",
        async: false,
        success: function (result) {
            jsonData = eval(result.d);
            PartnerArr = [];
            var i = 0;
            PartnerArr.push({ value: "0", text: "Select" });
            jQuery.each(jsonData.Table, function (rec) {
                PartnerArr.push({ value: jsonData.Table[i].PartnerId, text: jsonData.Table[i].PartnerName });
                i++;
            });

          
        },
        error: function (result) {
        }
    });
  
    kendo_all_min_js('#ddlpartnername').kendoDropDownList({
        filter: "contains",
        dataTextField: "text",
        dataValueField: "value",
        dataSource: PartnerArr,
        change: function () {
            kendo_all_min_js('#ddlpartnername').data("kendoDropDownList").span.css('background', 'none');
            BindPartnerLocation(kendo_all_min_js('#ddlpartnername').val(), SessionEntityId);
        }
    });

    if (partnerid != '') {
        kendo_all_min_js('#ddlpartnername').data("kendoDropDownList").value(partnerid);
    }
}
function searchcheckAll() {
    $('.searchcheckAll').prop('checked', true);

};
function searchUncheckAll() {
    $('.searchcheckAll').prop('checked', false);

};


