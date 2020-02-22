<%@ Page Language="C#" MasterPageFile="~/DMS.Master" AutoEventWireup="true" CodeBehind="ItemAssigned.aspx.cs" Inherits="DMS.Master.ItemAssigned" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<script src="../js/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script>        var jquery_1_11_3_min_p = jQuery.noConflict();</script>
    <script src="../js/bootstrap.min.js" type="text/javascript"></script>
    <script>        var bootstrap_min_js = jQuery.noConflict();</script>
    <link href="/Telerix/Style/kendo.default.min.css" rel="stylesheet" type="text/css" /><link href="/Telerix/Style/kendo.dataviz.min.css" rel="stylesheet" type="text/css" /><link href="/Telerix/Style/kendo.dataviz.default.min.css" rel="stylesheet" type="text/css" /><link href="/Telerix/Style/kendo.common.min.css" rel="stylesheet" type="text/css" /><link href="/Telerix/Style/kendo.rtl.min.css" rel="stylesheet" type="text/css" />
      <link href="../Telerix/Style/kendo.default.mobile.min.css" rel="stylesheet" type="text/css" />
    <link href="../Telerix/Style/kendo.common.min.css" rel="stylesheet" type="text/css" />
    <link href="../Telerix/Style/kendo.rtl.min.css" rel="stylesheet" type="text/css" />
    <link href="../Telerix/Style/kendo.default.min.css" rel="stylesheet" type="text/css" />
    <link href="../Telerix/Style/kendo.dataviz.min.css" rel="stylesheet" type="text/css" />
    <link href="../Telerix/Style/kendo.dataviz.default.min.css" rel="stylesheet" type="text/css" />
    <script src="../Telerix/js/angular.min.js"></script>
    <script src="../Telerix/js/kendo.all.min.js"></script>
    <script>        var kendo_all_min_js = jQuery.noConflict();</script>
    <script src="../Telerix/js/jquery.min.js"></script>
    <script src="../Telerix/js/jszip.min.js" type="text/javascript"></script>
   
    <script src="../JavaScript/Assigneditem.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <input type="hidden" id="hdnLoad"/>
<div class="content-header row">
        <div class="content-header-light col-12">
            <div class="row">
                <div class="content-header-left col-md-6 col-12 mb-2">
                    <h4 class="content-header-title mainheading">
                         <span class="customer"> Item Assigned</span></h4>
                </div>
                <div class="content-header-right col-md-6 col-12">
                    <div class="btn-group float-md-right" role="group" aria-label="Button group with nested dropdown">
                         <span class="multifileupload" id="btnupload1" style="display:none" > 
                       <i class="fa fa-upload"></i>
               <input type="button" id="upload" value="Import" title="Import Items" class="custom-file-input multifileBtn" onclick="Findclick();" />
                           <asp:FileUpload runat="server" Visible="true" ID="FileUpload" onchange="UploadFile(this);" style="display:none" />
                           <asp:Button ID="btnUpload4" runat="server" OnClick="btnUpload4_Click"  style="display:none" /> 
                       </span>
                       <button type="button" id="btnnew" class="btn btn-primary">
                            <i class="fa fa-plus-square"></i> New</button>
                        <button type="button" style="display:none" id="btnsubmit"  class="btn btn-primary">
                            <i class="fa fa-save"></i> Submit</button>
                        <button type="button" id="btnback"  class="btn btn-primary"   >
                           <i class="fa fa-arrow-left"></i> Back</button>
                         
                      
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="content-wrapper">
<div id="preloader" runat="server" style="display:none" >
  <div id="showPreloader"> <img src="../../assets/img/preloader.gif" > </div>
</div>

<div id="Overlay_Load" runat="server" style="display:none" ></div>

    <div class="">
        <div class="content-body">
            <section id="PartnerItemAssignedForm" style=" display:none" >
                <div class="row match-height">
                   <div class="col-12 col-xl-12 ">                    
                    <div class="card">
                        <div class="card-content">
                        <div class="container">
                      <div class="row    headerDropdown ">
    <div class="col-md-4 pull-left">    
    <div class="pdfexport">
<%--   <button type="button" id="btnAdd" onclick="AddRow()" class="btn btn-outline-primary" title="Add Line">
                            <i class="fa fa-plus"></i> </button>
                            <button type="button"  id="btnDeleteLine" class="btn btn-outline-primary" title="Delete Line">
                            <i class="fa fa-trash"></i> </button>--%>
                            <button type="button" id="Button1" class="btn btn-outline-primary" title="Export">
                            <i class="fa fa-file-excel-o"></i> </button>
                            <button type="button" id="Button2" class="btn btn-primary" title="PDF">
                            <i class="fa fa-file-pdf-o"></i> </button>    
                          
    </div>
  
    
    </div>
    

                                            <div class="col-md-3 ">
                                                <div class=" pull-right  pt5">                                                 
                                                    <label class="customPadding"> Partner </label>
                                                    <input type="text" id="ddlpartnername"  autocomplete="off"  style="width: 145px!important;"/>
 
                                                
                                                </div>
                                            </div>
       <div class="col-md-3 ">
                                                <div class="  pt5">                                                 
                                                    <label class="customPadding"> Location</label>
                                                    <input type="text" id="ddllocation"  autocomplete="off"  style="width: 75px!important;"/>
                                                
                                                </div>
                                            </div>
                            <div class="col-md-2  " id="DivNewitemsearch" style="display:none">
     <div class="searchbox">
                                   <div class="dropdown " id="">
							<div class="dropdown-menu checkboxSearch" >
							<div class="columnList" id="DivSearch">
							<%--	<div class="dropdown-item">
									<span class="skin skin-polaris">
										<input type="checkbox"  class='searchcheckAll' id="chk_Name" onclick='Addclasstocolumnforitem(this)' />
										<label for="chk_Name" class="coldata">All</label>
									</span>
								</div>--%>
								<div class="dropdown-item">
									<span class="skin skin-polaris">
										<input type="checkbox" id="chk_ItemName" class="searchcheckAll" />
										<label for="chk_ItemName" class="coldata">Item Name</label>
									</span>
								</div>
                                <div class="dropdown-item">
									<span class="skin skin-polaris">
										<input type="checkbox" id="chk_itemcode" class="searchcheckAll" />
										<label for="chk_ItemCode" class="coldata">Item Code</label>
									</span>
								</div><div class="dropdown-item">
									<span class="skin skin-polaris">
										<input type="checkbox" id="chk_groupcode" class="searchcheckAll" />
										<label for="chk_GroupName" class="coldata">Item Group</label>
									</span>
								</div>

                                 <div class="dropdownBottom">
                                <label class="pull-left" id="selectall" onclick="searchcheckAll()">Select All</label>
                                  <label class="pull-right" id="reset" onclick="searchUncheckAll()">Reset</label>
                                </div>

                                </div>
                                
							</div>
						</div>
                        <fieldset class=" position-relative" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <input type="text" class="form-control round " id="searchText"  placeholder="Search" />
                            <div class="form-control-position">
                                <i class="fa fa-search"></i>
                            </div>
                            
                        </fieldset></div>
</div>
                                            </div></div>
                                            <div class="container">
          <div class="row">
    <div class="col-md-12 "> 
                           <div class="table-responsive full-width" >
                             <table  class="table table-de mb-0"  id="tblitemassigned">
                <thead>
                  <tr>
                    
                    <th ><input type="checkbox" id="chkAll" onclick="InputcheckAll(this)"/> All</th>
                    <th><span class="customer">Item</span></th>
                     <th><span class="customer">Minimum Item Qty</span></th>
                      <th><span class="customer">Maximum Item Qty</span></th>
                    <th style="opacity:0">Counter</th>
                        <th style="opacity:0">ITEMID</th>
                  
                   
                  </tr>
                </thead>
              <tbody>
            <%--    <tr>  
                <td><input type="checkbox" id="chk_1" class="chk_All" /></td>         
                <td ><span class="customer"> <input type="text" id="txtItem_1" readonly="readonly"  placeholder="Enter item" onkeyup="RemoveClass(this)" class="fieldName" /></span></td>
                 <td ><span class="customer"> <input type="text" id="txtMinQty_1"  placeholder="Enter Minimum Qty" onkeyup="RemoveClass(this)" class="fieldName" /></span></td>
                  <td ><span class="customer"> <input type="text" id="txtMaxQty_1"  placeholder="Enter Maximum Qty" onkeyup="RemoveClass(this)" class="fieldName" /></span></td>
                 <td style="opacity:0">1</td>                
                </tr>--%>
                 <%--  <tr>  
                <td><input type="checkbox" id="chk_1" class="chk_All" /></td>         
                <td ><span class="customer"> <input type="text" id=""  placeholder="Enter item" onkeyup="RemoveClass(this)" class="fieldName" /></span></td>
                 <td ><span class="customer"> <input type="text" id=""  placeholder="Enter Minimum Qty" onkeyup="RemoveClass(this)" class="fieldName" /></span></td>
                  <td ><span class="customer"> <input type="text" id=""  placeholder="Enter Maximum Qty" onkeyup="RemoveClass(this)" class="fieldName" /></span></td>
                 <td style="opacity:0">1</td>                
                </tr>
                   <tr>  
                <td><input type="checkbox" id="chk_1" class="chk_All" /></td>         
                <td ><span class="customer"> <input type="text" id=""  placeholder="Enter item" onkeyup="RemoveClass(this)" class="fieldName" /></span></td>
                 <td ><span class="customer"> <input type="text" id=""  placeholder="Enter Minimum Qty" onkeyup="RemoveClass(this)" class="fieldName" /></span></td>
                  <td ><span class="customer"> <input type="text" id=""  placeholder="Enter Maximum Qty" onkeyup="RemoveClass(this)" class="fieldName" /></span></td>
                 <td style="opacity:0">1</td>                
                </tr>
                   <tr>  
                <td><input type="checkbox" id="chk_1" class="chk_All" /></td>         
                <td ><span class="customer"> <input type="text" id=""  placeholder="Enter item" onkeyup="RemoveClass(this)" class="fieldName" /></span></td>
                 <td ><span class="customer"> <input type="text" id=""  placeholder="Enter Minimum Qty" onkeyup="RemoveClass(this)" class="fieldName" /></span></td>
                  <td ><span class="customer"> <input type="text" id=""  placeholder="Enter Maximum Qty" onkeyup="RemoveClass(this)" class="fieldName" /></span></td>
                 <td style="opacity:0">1</td>                
                </tr>
                   <tr>  
                <td><input type="checkbox" id="chk_1" class="chk_All" /></td>         
                <td ><span class="customer"> <input type="text" id=""  placeholder="Enter item" onkeyup="RemoveClass(this)" class="fieldName" /></span></td>
                 <td ><span class="customer"> <input type="text" id=""  placeholder="Enter Minimum Qty" onkeyup="RemoveClass(this)" class="fieldName" /></span></td>
                  <td ><span class="customer"> <input type="text" id=""  placeholder="Enter Maximum Qty" onkeyup="RemoveClass(this)" class="fieldName" /></span></td>
                 <td style="opacity:0">1</td>                
                </tr>
                   <tr>  
                <td><input type="checkbox" id="chk_1" class="chk_All" /></td>         
                <td ><span class="customer"> <input type="text" id=""  placeholder="Enter item" onkeyup="RemoveClass(this)" class="fieldName" /></span></td>
                 <td ><span class="customer"> <input type="text" id=""  placeholder="Enter Minimum Qty" onkeyup="RemoveClass(this)" class="fieldName" /></span></td>
                  <td ><span class="customer"> <input type="text" id=""  placeholder="Enter Maximum Qty" onkeyup="RemoveClass(this)" class="fieldName" /></span></td>
                 <td style="opacity:0">1</td>                
                </tr>
                   <tr>  
                <td><input type="checkbox" id="chk_1" class="chk_All" /></td>         
                <td ><span class="customer"> <input type="text" id=""  placeholder="Enter item" onkeyup="RemoveClass(this)" class="fieldName" /></span></td>
                 <td ><span class="customer"> <input type="text" id=""  placeholder="Enter Minimum Qty" onkeyup="RemoveClass(this)" class="fieldName" /></span></td>
                  <td ><span class="customer"> <input type="text" id=""  placeholder="Enter Maximum Qty" onkeyup="RemoveClass(this)" class="fieldName" /></span></td>
                 <td style="opacity:0">1</td>                
                </tr>--%>
              </tbody>
              </table>

              </div>
           
                         </div>
                    </div>
                </div>
                        </div>
                    </div>
                </div>
                </div>
            </section>
            <div class="row match-height" id="PartnerItemAssignedGrid" style="display:block">
          
                <div class="col-12 col-xl-12 ">                    
                    <div class="card">
                        <div class="card-content">
                     <div class="container">
          <div class="row">
  
    <div class="col-md-8 ">    
    <div class="pdfexport">
   <button type="button" id="btnExcel"  class="btn btn-outline-primary" title="Export">
                            <i class="fa fa-file-excel-o"></i> </button>
                          <%--   <asp:LinkButton ID="btnExcel" runat="server" OnClick="btnExcel_Click"   class="btn btn-primary waves-effect waves-light"><i class="fa fa-print"></i> Export</asp:LinkButton>--%>
                 <%--<asp:LinkButton ID="btnpdf1" runat="server" OnClick="Exportpdf_Click" OnClientClick="SetHTML()"  class="btn btn-primary waves-effect waves-light"><i class="fa fa-print"></i> PDF</asp:LinkButton>--%>

                 <button type="button" id="btnexportpdf"  class="btn btn-outline-primary" title="PDF">
                           <i class="fa fa-file-pdf-o"></i> </button>
                       
                         
    </div></div>
        <div class="col-md-4 " style="display:none"> 
    <label class="showLebel" style=" float: left;">  Entity :</label><input type="text" id="ddlgridEntity"  class=" form-control " style=" width: 100px !important;"/>
    </div>
    <div class="col-md-2"> 
      <div class="searchDropdown">
            <label class="showLebel">  Show Records :</label>
			<select id="ddlLoadMore" class=" form-control showrecords pull-right">
												<option >2 </option>
                                                <option >5 </option>
                                                <option >50 </option>
												<option >100 </option>
												<option>150</option>
                                                <option >200</option>
                                                 <option>500</option>
                                                </select>	
     </div>  </div>
    <div class="col-md-2  ">
     <div class="searchbox">
    <%--<button type="button" class="btn btn-primary  mr-1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								 <i class="fa fa-search"></i>	Column Search		</button>--%>
                                   <div class="dropdown " id="">
							<div class="dropdown-menu checkboxSearch" >
							<div class="columnList" id="DivSearch1">
								
                                </div>
                                
							</div>
						</div>
                        <fieldset class=" position-relative" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <input type="text" class="form-control round "  placeholder="Search" >
                            <div class="form-control-position">
                                <i class="fa fa-search"></i>
                            </div>
                            
                        </fieldset></div>
</div>
</div>
</div>
                                <%--===================== start table for content=========================--%>
                         <%-- <div style="display:none" class="table-responsive" id="pdfDiv">--%>
                            <table class="table table-de mb-0" id="pdftable" style="display:none">
                        <thead>
                            <tr>
                                
                                <th></th>
                                <th></th>
                                <th>Contact</th>
                             
                            </tr>
                        </thead>
                      <tbody></tbody>
                          
                    </table>

                           <%-- </div>--%>

      <%-- =======================end table for content===================--%>
                           <%-- table for content--%>
                           <div class="container">
          <div class="row">
    <div class="col-md-12 "> 
                            <div class="table-responsive full-width">
                            <table class="table table-de mb-0 clickableRow" id="tblassignedpartneritem">
                        <thead>
                            <tr>
                                <th style="display:none"></th>
                                <th style="display:none"></th>
                                <th style="display:none"></th>
                                <th style="display:none"></th>
                                <th style="display:none"></th>
                                <th><input Type="checkbox" id="chkall"> All</th>
                                <th>Entity</th>
                                <th>Country</th>
                                <th>Partner Name</th>
                                <th>Partner Location</th>
                              
                               
                            </tr>
                        </thead>
                      <tbody>
                          
                      </tbody>
                          
                    </table>

                            </div>
                               <span class="  pull-right">Showing <label id="lblRowCount"></label> of <label id="lblTotalCount"></label></span>
                        <p class="text-center mt-1">
                            <span class="load" id="btnLoadMore">Load More.....</span> </p>
                              </div>
                    </div>
                </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <label id="lblUserId" runat="server" style="display: none"></label>
        <label id="partnerid" style="display: none"></label>
    </div>
    </div>
    
       <%--<script type="text/javascript">

                           jquery_1_11_3_min_p(document).ready(function () {

                               jquery_1_11_3_min_p("#btnNew").click(function () {
                                   $("#PartnerItemAssignedForm").css('display', 'block');
                                   $("#PartnerItemAssignedGrid").css('display', 'none');
                                                })
                                                jquery_1_11_3_min_p("#btnBack").click(function () {
                                                    $("#PartnerItemAssignedForm").css('display', 'none');
                                                    $("#PartnerItemAssignedGrid").css('display', 'block');
                                                })
                           })

</script>--%>
        <script>
            jquery_1_11_3_min_p(document).ready(function () {
                jquery_1_11_3_min_p(".footerDropdown").hide();
            });
</script>
    <script type="text/javascript">
    function ShowPopup(title, body) {
        $("#success").modal("show");
    }
</script>
</asp:Content>
