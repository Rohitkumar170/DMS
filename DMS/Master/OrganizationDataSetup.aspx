﻿<%@ Page Language="C#" MasterPageFile="~/DMS.Master" AutoEventWireup="true" CodeBehind="OrganizationDataSetup.aspx.cs" Inherits="DMS.Master.OrganizationDataSetup" %>

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
   
    <script src="../JavaScript/OrganizationDataSetup.js" type="text/javascript"></script>
  <style>
      #TblOrgDataGrid td:nth-child(6), #TblOrgDataGrid th:nth-child(6) {
    width: 50px !important;
}
  </style>
  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <input type="hidden" id="hdnLoad"/>
    <input type="hidden" id="hf" />
<div class="content-header row">
        <div class="content-header-light col-12">
            <div class="row">
                <div class="content-header-left col-md-6 col-12 mb-2">
                    <h4 class="content-header-title mainheading">
                        Organization Data Setup</h4>
                </div>
                <div class="content-header-right col-md-6 col-12">
                    <div class="btn-group float-md-right" role="group" aria-label="Button group with nested dropdown">
                       <button type="button" id="btnnew" class="btn btn-primary">
                            <i class="fa fa-plus-square"></i> New</button>
                             <button type="button" style="display:none" id="btnSubmit" class="btn btn-primary">
                            <i class="fa fa-save"></i> Submit</button>
                              <button type="button" id="btndesable" style="display:none"  class="btn btn-primary">
                            <i class="fa-disabled"></i>Disable</button>
                        <button type="button" style="display:none" id="btnback"  class="btn btn-primary" >
                           <i class="fa fa-arrow-left"></i> Back</button>
                                 <%--    <button type="button" id="btnsummary" data-toggle="modal" data-target="#AllLeaveRequestPopup" class="btn btn-primary">
                            <i class="fa fa-arrow-left"></i> pop</button>--%>
                      
                    </div>
                </div>
            </div>
        </div>
    </div>
       <div class="content-wrapper">
<%--<div id="preloader">
  <div id="showPreloader"> <img src="../../assets/img/preloader.gif" > </div>
</div>

<div id="Overlay_Load"></div>--%>
    <div class="">
        <div class="content-body">
           <div class="row match-height pb-2" id="OrganizationDataForm"  style="display:none" >
          
                <div class="col-12 col-xl-12 ">                    
                    <div class="card">
                        <div class="card-content cardScroll">
                          <div class="card-body">
                      <div class="row  pl-1  hborder headerDropdown ">
    <div class="col-md-3 pull-left">    
 
    </div>
    
    <div class="col-md-3 ">
                                                <div class="form-group pull-right  ">                                                 
                                                    <label class="pr-1">Default Country</label>
<input type="text" id="ddlcountry"  autocomplete="off"  style="width: 100px;"/>
                                             
                                                </div>
                                            </div>
                                          <div class="col-md-3">
                                                <div class="form-group pull-right pr-1">
                                                   <label class="pr-1">Select Entity</label>
                                                 <input type="text" id="ddlentity"  autocomplete="off"  style="width: 100px;"/>
                                                </div>
                                            </div>

                                             <div class="col-md-3">
                                                <div class="form-group pull-right pr-1">
                                                   <label class="pr-1"> Parameter</label>
                                                   
                                                 <input type="text" id="ddlOrgPara"  autocomplete="off"  style="width: 100px;"/>
                                                </div>
                                            </div>
                                            </div>
                                            <div class="noData">
                                   <div class="row">
                                    <div class="col-md-12 pt-5 text-center">
                                   <span class=" noDataMsg "><i class="fa fa-exclamation-triangle" aria-hidden="true"></i> Please select above options first !!!</span>
                                   </div>
                                   </div>
                                   </div>
<div id="OrgFielddiv" style="display:none;">
<div class="row  pl-1 mt-1 headerDropdown ">
    <div class="col-md-12 pull-left">    
    <div class="pdfexport">
   <button type="button" id="btnAdd" onclick="AddRow()" class="btn btn-outline-primary" title="Add Line">
                            <i class="fa fa-plus"></i> </button>
                            <button type="button" id="btnDeleteLine" class="btn btn-outline-primary" title="Delete Line">
                            <i class="fa fa-trash"></i> </button>
                            <button type="button" id="Button1" style="display:none" class="btn btn-outline-primary" title="Export">
                            <i class="fa fa-file-excel-o"></i> </button>
                            <button type="button" id="Button2" style="display:none" class="btn btn-outline-primary" title="PDF">
                            <i class="fa fa-file-pdf-o"></i> </button>    
                          
    </div>
  
    
    </div>
    
  
                                            </div>
                           <div class="table-responsive"  >
                             <table  class="table table-de mb-0"  id="tblOrgFields">
                <thead>
                <tr>
               
                  </tr>
                </thead>
              <tbody>
               <%-- <tr> 
                <td style="display:none">1</td> 
                <td><input type="checkbox" id="chk_1" class="chk_All"></td>  --%>       
              <%--  <td >  <input type="text" id="txtField_1" placeholder="Enter Field Name" class="fieldName" onkeyup="Enablebutton(this)"  autocomplete="off" onkeypress="RemoveClass(this)" />      </td>
                <td > <input type="text" id="ddlDatatype_1" readonly="readonly" class="fieldName"  autocomplete="off" />
                 
                                                </td> --%> 
                <%--</tr>--%>
                </tbody>
              </table>

              </div>
           </div>
                        <div class="" id="OrgAddressDiv" style="display:none;">
                        <div class="form-body lineSelection">
                                        <h6 class="form-section">Address</h6>
                                        <div class="row addressDiv" >
                                         
                                          <div class="col-md-3 mb-1" >
                                          <div class="addressBg" id="AddressDiv">
                                          <div class="closeAddress pull-right"><i class="fa fa-close"></i></div>
                                          <div class="AllAddress form-group">
                                          <label class="textHeader">Address 1</label>
                                          
                                          </div> 
                                                <div class="form-group">
                                                <label for="Country">Location Code</label>
                                                  <input type="text"  id="txtLocationCode_1"  autocomplete="off" placeholder="Enter Location Name" class="form-control"/>
                                                     <label id='lblAutoid_1' style='display: none;' />
                                                </div>
                                                <div class="form-group">
                                                <label for="Country">Location Name</label>
                                                  <input type="text"  id="txtLocatuion_1" autocomplete="off" placeholder="Enter Location Name" class="form-control"/>
                                                </div>
                                                <div class="form-group">
                                                <label for="Country">Location Description</label>
                                                  <input type="text"  id="txtLocDesc_1" autocomplete="off" placeholder="Enter Location Description" class="form-control"/>
                                                </div>
                                                <div id="repeatArea_1">
                                           
                                                </div>
                                                </div>
                                            </div>
                                      </div>

                                      </div>  
                               <div class="form-body" id="empDiv" style="display:none" >
                                        <h6 class="form-section">Employee</h6>
                                        <div class="row   ">
    <div class="col-md-6 ">    
    <div class="pdfexport tablebtn">
   <button type="button" id="btnAdd1" onclick="AddRow()" class="btn btn-outline-primary" title="Add Line">
                            <i class="fa fa-plus"></i> </button>
                            <button type="button" id="btnDeleteLine1" class="btn btn-outline-primary" title="Delete Line">
                            <i class="fa fa-trash"></i> </button>
                            <button type="button" id="btn6" class="btn btn-outline-primary" title="Export">
                            <i class="fa fa-file-excel-o"></i> </button>
                            <button type="button" id="btn7" class="btn btn-outline-primary" title="PDF">
                            <i class="fa fa-file-pdf-o"></i> </button>    
                          
    </div>
        </div>
  <div class="col-md-6 "> 
      <div class="pdfexport tablebtn ">
<span class="multifileupload pb5 pull-right" id="btnupload3" > 
                       <i class="fa fa-upload"></i>
                  <%--   <input type="file" id='FileUpload' runat="server" class="custom-file-input multifileBtn" onchange="UploadFile(this);" />--%>
                           <input type="button" id="upload3" value="Import" class="custom-file-input multifileBtn" />
                           <asp:FileUpload runat="server" Visible="true" ID="FileUpload3"  style="display:none" />
                           <asp:Button ID="Button4" runat="server" style="display:none" /> 
                       </span>
  
      </div>
    </div>
    
    
                                            </div>
                                        <div class="row">
                                         <div class="col-md-12">
                                                    <div  class="table-responsive" >
                            <table class="table table-de"  id="empTable" >
                        <thead>
                            <tr>
                                <th style="display:none"></th>
                                <th><input type="checkBox" id=""/> All</th>
                                <th>Name</th>
                                <th>Mobile</th>
                                <th>Email</th>
                                <th>Address</th>
                                <th>Credentials</th>
                            </tr>
                        </thead>
                      <tbody>
                      <tr>
                      <td style="display:none">1</td>
                      <td><input type="checkbox" id="chk_1" class="checkbox"/></td>
                      <td><input type='text' id='empname_1' class='fieldName' onchange=''  onkeyup='' autocomplete='off'/></td>
                      <td><input type='text' placeholder='' class='fieldName' id='empmobile_1' autocomplete='off' onchange='' onkeypress='' onkeyup='' /></td>
                       <td><input type='text' placeholder='' class='fieldName' id='empemail_1' autocomplete='off' onchange='' onkeypress='' onkeyup='' /></td>
                       <td><input type='text' id='empaddress_1' class='fieldName'  autocomplete='off'/></td>
                          <td><input type="checkbox" id="chkcredential_1" class="checkbox"/></td>
                          <td><input type="checkbox" id="chkisactive_1" class="checkbox"/></td>
                      </tr>
                           <tr>
                      <td style="display:none">2</td>
                      <td><input type="checkbox" id="chk_2" class="checkbox"/></td>
                      <td><input type='text' id='empname_2' class='fieldName' onchange=''  onkeyup='' autocomplete='off'/></td>
                      <td><input type='text' placeholder='' class='fieldName' id='empmobile_2' autocomplete='off' onchange='' onkeypress='' onkeyup='' /></td>
                       <td><input type='text' placeholder='' class='fieldName' id='empemail_2' autocomplete='off' onchange='' onkeypress='' onkeyup='' /></td>
                       <td><input type='text' id='empaddress_2' class='fieldName'  autocomplete='off'/>
                           <%--<select id="" class="Operator">
												<option value="Textbox">Address1</option>
                                                <option value="Textbox">Address2</option>
												<option value="Textbox">Address3</option>
                                                </select>--%></td>
                          <td><input type="checkbox" id="chkcredential_2" class="checkbox"/></td>
                          <td><input type="checkbox" id="chkisactive_2" class="checkbox"/></td>
                      </tr>
                            <tr>
                      <td style="display:none">3</td>
                      <td><input type="checkbox" id="chk_3" class="checkbox"/></td>
                      <td><input type='text' id='empname_3' class='fieldName' onchange=''  onkeyup='' autocomplete='off'/></td>
                      <td><input type='text' placeholder='' class='fieldName' id='empmobile_3' autocomplete='off' onchange='' onkeypress='' onkeyup='' /></td>
                       <td><input type='text' placeholder='' class='fieldName' id='empemail_3' autocomplete='off' onchange='' onkeypress='' onkeyup='' /></td>
                       <td><input type='text' id='empaddress_3' class='fieldName'  autocomplete='off'/>
                           <%--<select id="" class="Operator">
												<option value="Textbox">Address1</option>
                                                <option value="Textbox">Address2</option>
												<option value="Textbox">Address3</option>
                                                </select>--%></td>
                          <td><input type="checkbox" id="chkcredential_3" class="checkbox"/></td>
                          <td><input type="checkbox" id="chkisactive_3" class="checkbox"/></td>
                      </tr>
                          <tr>
                      <td style="display:none">4</td>
                      <td><input type="checkbox" id="chk_4" class="checkbox"/></td>
                      <td><input type='text' id='empname_4' class='fieldName' onchange=''  onkeyup='' autocomplete='off'/></td>
                      <td><input type='text' placeholder='' class='fieldName' id='empmobile_4' autocomplete='off' onchange='' onkeypress='' onkeyup='' /></td>
                       <td><input type='text' placeholder='' class='fieldName' id='empemail_4' autocomplete='off' onchange='' onkeypress='' onkeyup='' /></td>
                       <td><input type='text' id='empaddress_4' class='fieldName'  autocomplete='off'/>
                           <%--<select id="" class="Operator">
												<option value="Textbox">Address1</option>
                                                <option value="Textbox">Address2</option>
												<option value="Textbox">Address3</option>
                                                </select>--%></td>
                          <td><input type="checkbox" id="chkcredential_4" class="checkbox"/></td>
                          <td><input type="checkbox" id="chkisactive_4" class="checkbox"/></td>
                      </tr>
                          <tr>
                      <td style="display:none">5</td>
                      <td><input type="checkbox" id="chk_5" class="checkbox"/></td>
                      <td><input type='text' id='empname_5' class='fieldName' onchange=''  onkeyup='' autocomplete='off'/></td>
                      <td><input type='text' placeholder='' class='fieldName' id='empmobile_5' autocomplete='off' onchange='' onkeypress='' onkeyup='' /></td>
                       <td><input type='text' placeholder='' class='fieldName' id='empemail_5' autocomplete='off' onchange='' onkeypress='' onkeyup='' /></td>
                       <td><input type='text' id='empaddress_5' class='fieldName'  autocomplete='off'/>
                           <%--<select id="" class="Operator">
												<option value="Textbox">Address1</option>
                                                <option value="Textbox">Address2</option>
												<option value="Textbox">Address3</option>
                                                </select>--%></td>
                          <td><input type="checkbox" id="chkcredential_5" class="checkbox"/></td>
                          <td><input type="checkbox" id="chkisactive_5" class="checkbox"/></td>
                      </tr>
                      </tbody>
                          
                    </table>
                            </div>
                                            </div>
                                   

                                        </div>
                                       
                                    </div>
                                          
                                       
                                           
                                       
<div class="row " >
                                       <div class="col-md-12">
                                        <button type="button" id="btnaddAddress" class="btn btn-primary pull-right mt-1" style="display: block;">
                            <i class="fa fa-plus-square"></i> Add Address</button>
                                       
                                   

                                       </div>
                                       </div>
                                         
                                          </div>
                                        </div>
                                       </div> 
                                       
                                    </div>



                                     
                                   </div>
                        </div>
                    </div>
                </div>
       
            <div class="row match-height" id="OrganizationDataGrid" >
          
                <div class="col-12 col-xl-12 ">                    
                    <div class="card">
                        <div class="card-content">
                   <div class="container">
          <div class="row">

    <div class="col-md-8 pull-left">    
    <div class="pdfexport">
   <button type="button" id="btnExport" class="btn btn-outline-primary" title="Export">
                            <i class="fa fa-file-excel-o"></i> </button>
                            <button type="button" id="btnPdf" class="btn btn-outline-primary" title="PDF">
                            <i class="fa fa-file-pdf-o"></i> </button>
                             <button type="button" id="btnUpdate" style="display:none" disabled class="btn btn-outline-primary" title="Edit">
                            <i class="fa fa-edit"></i> </button>
                          
                          
    </div>
    
    
    </div>
    <div class="col-md-2 pull-left">   <div class="searchDropdown">
         
            <label class="showLebel">  Show Records :</label>
			<select id="ddlLoadMore"  class=" form-control showrecords pull-right">
												<option >2 </option>
                                                <option >5 </option>
                                                <option >50 </option>
												<option >100 </option>
												<option>150</option>
                                                <option >200</option>
                                                 <option>500</option>
                                                </select>		
					
     </div>  </div>
    <div class="col-md-2 pull-right ">
    
                           
    <div class="searchbox">
    <%--<button type="button" class="btn btn-primary  mr-1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								 <i class="fa fa-search"></i>	Column Search		</button>--%>
                                   <div class="dropdown " >
							<div class="dropdown-menu checkboxSearch"  >
							<div class="columnList" id="DivSearch">
							
                                </div>
							</div>
						</div>
                        <fieldset class=" position-relative" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <input type="text" class="form-control round " id="searchText" autocomplete="off" placeholder="Search" >
                            <div class="form-control-position">
                                <i class="fa fa-search"></i>
                            </div>
                            
                        </fieldset></div>
</div>
</div>
</div>
<div class="container">
          <div class="row">
    <div class="col-md-12 "> 

                           <div class="table-responsive full-width">
                             <table  class="table table-de mb-0 clickableRow" id="TblOrgDataGrid">
                <thead>
                  <tr>
                  <th style="display:none" >FieldId</th>
                   <th style="display:none" >FieldDataType</th>
                    <th style="display:none" >EntityId</th>
                   <th style="display:none" >CountryId</th>
                      <th style="display:none" >ParameterId</th>
                 <th  ><input type="checkbox" id="chkAll" onclick="checkAll(this)"> All</th>
                    <th id='' class='' >Entity Name</th>
                    <th id='' class='' >Country</th>
                   <th id='' class='' >Parameter Name</th>
                   
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

   <%--
         <script type="text/javascript">

           


            
</script>

             <script>
                 jquery_1_11_3_min_p(document).ready(function () {

                     jquery_1_11_3_min_p('#dropSelect').on('change', function () {
                         if (this.value == 'type1') {
                             jquery_1_11_3_min_p("#cardbody1").show();
                         }
                         else {
                             jquery_1_11_3_min_p("#cardbody1").hide();
                         }
                     });
                 });

                 jquery_1_11_3_min_p(document).ready(function () {

                     jquery_1_11_3_min_p('#dropSelect').on('change', function () {
                         if (this.value == 'type2') {
                             jquery_1_11_3_min_p("#table1").show();
                         }
                         else {
                             jquery_1_11_3_min_p("#table1").hide();
                         }
                     });
                 });
             </script>--%>
   <label id="lblUserId" runat="server" style="display: none"> </label>
    <script>
        jquery_1_11_3_min_p(document).ready(function () {
            jquery_1_11_3_min_p(".footerDropdown").css('visibility', 'hidden');
        });
</script>
</asp:Content>

