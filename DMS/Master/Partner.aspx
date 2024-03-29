﻿<%@ Page Language="C#" MasterPageFile="~/DMS.Master" AutoEventWireup="true" CodeBehind="Partner.aspx.cs" Inherits="DMS.Master.Partner" %>

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
     <script src="../JavaScript/Partners.js" type="text/javascript"></script>
    <style>
#empTable td:nth-child(7), #empTable th:nth-child(7) {   text-align:center;}
#empTable td:nth-child(2), #empTable th:nth-child(2) {   width:50px;}
        #accordionWrap1 .card-header {    color: #2D4D76!important;  padding: 5px 15px;
    border-bottom: 1px solid #cfcdcd;      background: #f6f6f6;    }
         #accordionWrap1 .card-title {    font-size:12px;      }

          .empImage{width: 50px;
    height: 50px;
    border: 1px solid #dcd8d8;}

        .addressDiv {
    overflow-y: auto;
    max-height: 200px;
        }

    </style>
  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<input type="hidden" id="hdnLoad"/>
 <input type="hidden" id="hf"/>
<div class="content-header row">
        <div class="content-header-light col-12">
            <div class="row">
                <div class="content-header-left col-md-6 col-12 mb-2">
                    <h4 class="content-header-title mainheading">
                         Partner</h4>
                </div>
                <div class="content-header-right col-md-6 col-12">
                    <div class="btn-group float-md-right" role="group" aria-label="Button group with nested dropdown">
                       <span class="multifileupload" id="btnuploadAddress" style="display:none"  > 
                       <i class="fa fa-upload"></i>
               <input type="button" id="uploadAddress" value="Import" title="Import Address" class="custom-file-input multifileBtn" onclick="FindclickAddress();" />
                           <asp:FileUpload runat="server" Visible="true" ID="FileUploadAddress" onchange="UploadFileAddress(this);" style="display:none" />
                           <asp:Button ID="btnUploadAddress" runat="server" OnClick="btnUploadAddress_Click" OnClientClick="Showloader();"  style="display:none" /> 
                       </span>
                          <span class="multifileupload" id="btnupload" style="display:none"  > 
                       <i class="fa fa-upload"></i>
               <input type="button" id="upload" value="Import" title="Import Partner" class="custom-file-input multifileBtn" onclick="Findclick();" />
                           <asp:FileUpload runat="server" Visible="true" ID="FileUpload" onchange="UploadFile(this);" style="display:none" />
                           <asp:Button ID="btnUpload" runat="server" OnClick="btnUpload_Click" OnClientClick="Showloader();"  style="display:none" /> 
                       </span>
                       <button type="button" id="btnNew" class="btn btn-primary">
                            <i class="fa fa-plus-square"></i> New</button>
                        <button type="button" id="btnSubmit" style="display:none"  class="btn btn-primary">
                            <i class="fa fa-save"></i> Submit</button>
                        <button type="button" id="btnBack" style="display:none"  class="btn btn-primary"   >
                           <i class="fa fa-arrow-left"></i> Back</button>
                         <button type="button" id="" class="btn btn-primary" style="display:none" data-toggle="modal" data-target="#RejectedData">
                            <i class="fa fa-plus-square"></i> pop</button>
                      
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
            <section id="partnerForm" style=" display:none" >
                 <div class="row headerDropdown mb-1">
                    <div class="content-header-left col-md-6 ">
    <label class="textHeader" id="pCode" style="display:none">Partner Code:</label> <label class="pr-5" id="lblPCode"></label>
    <label class="textHeader" id="pName" style="display:none">Partner Name:</label> <label id="lblPName"></label>
                </div>
<%-- <div class="col-md-3">
                                                <div class=" pull-right pr-1">
                                                   <label class="pr-1">Select Entity</label>
                                                    <input type="text"  id="ddlentity" autocomplete="off"  class="form-control"/>
                                                <%--    <select id="Select4" name="interested" class="Operator">
												<option value="Textbox">Amy Softech</option>
                                                <option value="Textbox">Yoeki Soft</option>
												<option value="Textbox">IACE</option>	
												
                                                 </select
                                               
                                                </div>
                                            </div>
 <div class="col-md-3">
                                                <div class=" pull-right pr-1">
                                                   <label class="pr-1">Select Country</label>
                                                    <input type="text"  id="ddlEntityCountry" autocomplete="off"  class="form-control"/>
                                                  <%-- <select id="Select9" class="Operator">
												<option value="Textbox">India</option>
                                                <option value="Textbox">Russia</option>
												<option value="Textbox">Pakistan</option>
                                                </select>
                                               
                                                </div>
                                            </div>--%>
<div class="content-header-right col-md-6">
                    <div class="btn-group float-md-right" role="group">
                     <button type="button" style="display:none" class="btn btn-primary " id="btntaxGrp">
                            <i class="fa fa-money"></i> Tax Group</button>
                      
                     
                      
                    </div>
                </div>
</div>
                 <div class="row">
                   <div class="col-lg-12 col-xl-12">
		
			<div id="accordionWrap1" role="tablist" aria-multiselectable="true">
				<div class="card accordion collapse-icon accordion-icon-rotate">
					<a id="heading11" class="card-header info" data-toggle="collapse" href="#accordion11" aria-expanded="true" aria-controls="accordion11">
						<div class="card-title lead" >Partner Details</div>
          </a>
					<div id="accordion11" role="tabpanel" data-parent="#accordionWrap1" aria-labelledby="heading11" class="collapse show">
						<div class="card-content">
							<div class="card-body">
							 <div class="form-body lineSelection">
                                        <h6 class="form-section">Partner  Details</h6>
                                        <div class="row">
                                         <div class="col-md-3">
                                                <div class="form-group">
                                                  <label for="Partner Name">PartnerCode</label>
                                                    <input type="text"  id="txtPartnerCode" autocomplete="off"  class="form-control" placeholder="" />
                                                </div>
                                            </div>
                                         <div class="col-md-3">
                                                <div class="form-group">
                                                  <label for="Partner Name">Partner Name</label>
                                                    <input type="text"  id="txtPname" autocomplete="off" onkeypress="RemoveClass(this)"  class="form-control" placeholder="Enter Partner Name" />
                                                </div>
                                            </div>
                                              <div class="col-md-3">
                                                <div class="form-group">
                                                 
                                                    <label for="PartnerType">Partner Group</label>
                                                    <input type="text" id="ddlPartnergroup"  class="form-control" placeholder="Enter Partner Type" />
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                 
                                                    <label for="PartnerType">Partner Type</label>
                                                    <input type="text" id="ddlPartnerType"  class="form-control" placeholder="Enter Partner Type" />
                                                </div>
                                            </div>
                                           

                                        </div>
                                         <div class="row">
                                          <div class="col-md-3">
                                                <div class="form-group">
                                                  <label for="Description">Description</label>
                                                    <input type="text"  id="txtdesc" autocomplete="off" onkeypress="RemoveClass(this)" class="form-control" placeholder="Enter Description" />
                                                </div>
                                            </div>
                                         <div class="col-md-3">
                                                <div class="form-group">
                                                  <label for="Partner Name">Partner Representative</label>
                                                    <input type="text" onkeypress="RemoveClass(this)"  id="txtrepresentative" autocomplete="off"  class="form-control" placeholder="Enter Customer Representative" />
                                                </div>
                                            </div>
                                        
                                        
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                  <label for="Corporate Identity">Partner Status</label>
                                                    <input type="text"  id="ddlPartnerStatus" autocomplete="off"  class="form-control" placeholder="Enter Corporate Identity No." />
                                                </div>
                                            </div>

                                        </div>
                                    </div>
							</div>
						</div>
					</div>
					<a id="heading12" class="card-header info" data-toggle="collapse" href="#accordion12" aria-expanded="false" aria-controls="accordion12">
						<div class="card-title lead collapsed" >Locations</div>
          </a>
					<div id="accordion12" role="tabpanel" data-parent="#accordionWrap1" aria-labelledby="heading12" class="collapse" aria-expanded="false">
						<div class="card-content">
							<div class="card-body">
								  <div class="form-body ">
                                        <h6 class="form-section">Locations</h6>
                                      <div class="row">
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                   
                                                   
                                                     <input type="checkbox" class="checkLocation" onchange="ExistingLocation()">
                                                     <label for="Self">New Location</label>
                                                </div>
                                            </div>
                                              <div class="col-md-3" style="display:none">
                                                <div class="form-group">
                                                   
                                                      <input type="checkbox" class="ExistingCheck"  onchange="valueChanged()" >
                                                     <label for="Entity">Existing Location</label>
                                                </div>
                                            </div>
                                          
                                           
                                        </div>
                                    </div>
                                    <div id="existingAddress" style=" display:none">
                                      <div class="form-body lineSelection" >
                                        <h6 class="form-section">Partner  Address</h6>

                                        <div class="row addressDiv" >     
                                         <label id="lblAutoId_1" style="display:none"></label>    
                                 <div class="col-md-12">    
                                   <button type="button" id="btnaddAddress" class=" addAddress btn btn-primary mb-1">
                            <i class="fa fa-plus-square"></i> Add Address</button>
                            </div>
                                          <div class="col-md-3 mb-1" >
                                          <div class="addressBg" id="AddressDiv">
                                          <div class="closeAddress pull-right"><i class="fa fa-close"></i></div>
                                          <div class="AllAddress form-group">
                                          <label class="textHeader">Address 1</label>
                                          </div>
                                                <div class="form-group">
                                                <label for="Country">Country</label>
                                                  <input type="text"  id="ddlCountry_1" autocomplete="off"  class="form-control"/>
                                                </div>
                                                <div class="form-group">
                                                <label for="Country">Location Name</label>
                                                  <input type="text"  id="txtLocation_1" autocomplete="off" placeholder="Location Name" class="form-control" onkeypress="RemoveClass(this)"/>
                                                </div>
                                                 <div class="form-group">
                                                <label for="Country">Location Code</label>
                                                  <input type="text"  id="txtLocationCode_1" autocomplete="off" placeholder="Location Code" class="form-control" onkeypress="RemoveClass(this)"/>
                                                </div>
                                                <div id="repeatArea_1">
                                            
                                                </div>
                                                </div>
                                            </div>
                            
                             
                                      </div>
                                                       


                                    </div>
                                    
                            
                            </div>
                              <div class="form-body " id="newLocations" style=" display:none">
                                        <h6 class="form-section">Locations</h6>

                                        <div class="row pb-1"><div class="col-md-12">
                                                <div class="  pr-1">
                                                   <label class="pr-1">Select Country</label>
                                                   <input type="text" id="ddlCountryExsingAdd"/>
                                                 <%--<select id="Select9" class="Operator">
												
													
												<option value="Textbox">India</option>
                                                <option value="Textbox">Russia</option>
												<option value="Textbox">Pakistan</option>
                                                </select>    --%>                                            
                                               
    </div></div>
                                            </div>
                                        <div class="row " id="AppendLocations">
                                          <%--  <div class="col-md-3">
                                                <div class="form-group">
                                                     <input type="checkbox"  class="Location" id="chkLoc_" >
                                                     <label for="Self">Lo</label>
                                                </div>
                                            </div>--%>
                                            <%--  <div class="col-md-3">
                                                <div class="form-group">
                                                      <input type="checkbox"  class="Location" >
                                                     <label for="Entity">Location B</label>
                                                </div>
                                            </div>
                                             <div class="col-md-3">
                                                <div class="form-group">
                                                   
                                                      <input type="checkbox"  class="Location" >
                                                     <label for="Entity">Location C</label>
                                                </div>
                                            </div>
                                               <div class="col-md-3">
                                                <div class="form-group">
                                                      <input type="checkbox"  class="Location" >
                                                     <label for="Entity">Location D</label>
                                                </div>
                                            </div>
                                              <div class="col-md-3">
                                                <div class="form-group">
                                                   
                                                      <input type="checkbox"  class="Location" >
                                                     <label for="Entity">Location E</label>
                                                </div>
                                            </div>
                                               <div class="col-md-3">
                                                <div class="form-group">
                                                   
                                                      <input type="checkbox"  class="Location" >
                                                     <label for="Entity">Location F</label>
                                                </div>
                                            </div>
                                               <div class="col-md-3">
                                                <div class="form-group">
                                                   
                                                      <input type="checkbox"  class="Location" >
                                                     <label for="Entity">Location G</label>
                                                </div>
                                            </div>
                                               <div class="col-md-3">
                                                <div class="form-group">
                                                   
                                                      <input type="checkbox"  class="Location" >
                                                     <label for="Entity">Location H</label>
                                                </div>
                                            </div>
                                               <div class="col-md-3">
                                                <div class="form-group">
                                                   
                                                      <input type="checkbox"  class="Location" >
                                                     <label for="Entity">Location I</label>
                                                </div>
                                            </div>
                                               <div class="col-md-3">
                                                <div class="form-group">
                                                   
                                                      <input type="checkbox"  class="Location" >
                                                     <label for="Entity">Location J</label>
                                                </div>
                                            </div>--%>
                                        </div>
                             
                                
                                   </div>   
                                           <div class="row " id="proceedDiv" style=" display:none">
                                       <div class="col-md-12">
                                    <button type="button" id="btnProceed" class=" btn btn-primary mt-1 pull-right">
                            <i class="fa fa-arrow-right"></i> Proceed</button>
                                       
                                   

                                       </div>
                                       </div>    
                                <div class="IdentityDivmain">
                                    <%--  <div class="form-body " >
                                        <h6 class="form-section">Corporate  Identity</h6>
                                        <div class="row IdentityDiv" >
                                         <div class="col-md-3">
                                                <div class="form-group">
                                                  <label for="Address1">Corporate  Identity</label>
                                                    <input type="text"  id="Text4" autocomplete="off"  class="form-control" placeholder="Enter Corporate  Identity " />
                                                </div>
                                            </div>
                                        

                                        </div>
                                 
                                    </div>--%>
                                    </div>
							</div>
						</div>
					</div>
					<a id="heading13" class="card-header info" data-toggle="collapse" href="#accordion13" aria-expanded="false" aria-controls="accordion13" style="pointer-events: none;">
						<div class="card-title lead collapsed" >Legal / Tax</div>
          </a>
					<div id="accordion13" role="tabpanel" data-parent="#accordionWrap1" aria-labelledby="heading13" class="collapse" aria-expanded="false">
						<div class="card-content">
							<div class="card-body">
								  <div class="form-body" id="TaxDiv" style="display:none">
                                        <h6 class="form-section">Legal / Tax</h6>
                                        <div class="row   ">
    <div class="col-md-6 ">    
    <div class="pdfexport tablebtn">
   <button type="button" id="btnAdd" onclick="AddRow()" class="btn btn-outline-primary" title="Add Line">
                            <i class="fa fa-plus"></i> </button>
                            <button type="button" id="btnDeleteLine" class="btn btn-outline-primary" title="Delete Line">
                            <i class="fa fa-trash"></i> </button>
                            <button type="button" id="Button1" class="btn btn-outline-primary" title="Export">
                            <i class="fa fa-file-excel-o"></i> </button>
                            <button type="button" id="Button1" class="btn btn-outline-primary" title="PDF">
                            <i class="fa fa-file-pdf-o"></i> </button>    
                          
    </div>
        </div>
  <div class="col-md-6 "> 
      <div class="pdfexport tablebtn ">
                          <span class="multifileupload" id="btnuploadLegalField" style="display:none"  > 
                       <i class="fa fa-upload"></i>
               <input type="button" id="uploadLegalField" value="Import" title="Import Legal Field" class="custom-file-input multifileBtn" onclick="FindclickLegalField();" />
                           <asp:FileUpload runat="server" Visible="true" ID="FileUploadLegalField" onchange="UploadFileLegalField(this);" style="display:none" />
                           <asp:Button ID="btnUploadLegalField" runat="server" OnClick="btnUploadLegalField_Click" OnClientClick="Showloader();"  style="display:none" /> 
                       </span>
  
      </div>
    </div>
    
    
                                            </div>
                                        <div class="row">
                                         <div class="col-md-12">
                                                    <div  class="table-responsive" >
                            <table class="table table-de"  id="tblTaxInfo" >
                        <thead>
                            <tr>
                                <th style="display:none"></th>
                                <th><input type="checkBox" id="checkAll"/> All</th>
                                <th>Country</th>
                                <th>Tax</th>
                                <th>Addresses</th>
                                <th>Input Value</th>
                               
                            </tr>
                        </thead>
                      <tbody>
                      <tr>
                      <td style="display:none">1</td>
                      <td><input type="checkbox" id="cb_1" class="checkbox"/></td>
                      <td><label style="display:none" id="lblTaxTypeid_1"></label><input type='text' id='ddlTaxCountry_1' class='fieldName' onchange=''  onkeyup='' autocomplete='off'/></td>
                    <td><input type='text' placeholder='' class='fieldName' id='ddlTax_1' autocomplete='off' onchange='' onkeypress='' onkeyup='' /></td>
                       <td><input type='text' placeholder='' class='fieldName' id='ddlAddress_1' autocomplete='off' onchange='' onkeypress='' onkeyup='' /></td>
                       <td><input type='text' id='txtamt_1' class='fieldName'   autocomplete='off'/></td>
                      </tr>
                      </tbody>
                          
                    </table>
                            </div>
                                            </div>
                                   

                                        </div>
                                       
                                    </div>
							</div>
                             <div class="row " id="proceedDiveLegafield">
                                       <div class="col-md-12">
                                    <button type="button" id="btnProceedLegal" class=" btn btn-primary mt-1 pull-right">
                            <i class="fa fa-arrow-right"></i> Proceed</button>
                                       
                                   

                                       </div>
                                       </div>    
						</div>
					</div>
					<a id="heading14" class="card-header info" data-toggle="collapse" href="#accordion14" aria-expanded="false" aria-controls="accordion14" style="pointer-events: none;">
						<div class="card-title lead collapsed" >Employee</div>
          </a>
					<div id="accordion14" role="tabpanel" data-parent="#accordionWrap1" aria-labelledby="heading14" class="collapse" aria-expanded="false">
						<div class="card-content">
							<div class="card-body">
								  <div class="form-body" id="empDiv" >
                                        <h6 class="form-section">Employee</h6>
                                        <div class="row   ">
    <div class="col-md-6 ">    
    <div class="pdfexport tablebtn">
   <button type="button" id="btnAddEmp" onclick="AddRowEmployee()" class="btn btn-outline-primary" title="Add Line">
                            <i class="fa fa-plus"></i> </button>
                            <button type="button" id="btnDeleteLineEmp" class="btn btn-outline-primary" title="Delete Line">
                            <i class="fa fa-trash"></i> </button>
                            <button type="button" id="btnexprt" class="btn btn-outline-primary" title="Export">
                            <i class="fa fa-file-excel-o"></i> </button>
                            <button type="button" id="btnpdf" class="btn btn-outline-primary" title="PDF">
                            <i class="fa fa-file-pdf-o"></i> </button>    
                          
    </div>
        </div>
  <div class="col-md-6 "> 
      <div class="pdfexport tablebtn ">
<span class="multifileupload pb5 pull-right" id="Spanupload" > 
                       <i class="fa fa-upload"></i>
                          <input type="button" id="uploadPartEmp" value="Import" title="Import Items" class="custom-file-input multifileBtn" onclick="FindclickEmp();" />
                           <asp:FileUpload runat="server" Visible="true" ID="FileUploadEmp" onchange="UploadFileEmp(this);" style="display:none" />
                           <asp:Button ID="btnUploademp" runat="server" OnClick="btnUploademp_Click" OnClientClick="Showloader();"   style="display:none" />
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
                                <th>IsActive</th>
                            </tr>
                        </thead>
                      <tbody>
                      <tr>
                      <td style="display:none">1</td>
                      <td><input type="checkbox" id="chk_1" class="checkbox"/></td>
                      <td><label id="empid_1" style='display:none'></label><label id="isemail_1" style='display:none'></label><input type='text'  id='empname_1' class='fieldName' onchange=''   onkeyup='RemoveClassEmp(this)' autocomplete='off'/></td>
                      <td><input type='text' placeholder='' class='fieldName' id='empmobile_1' autocomplete='off' onchange='' onkeypress='return isNumber(event)'  onkeyup='RemoveClassEmp(this)' /></td>
                       <td><input type='text' placeholder='' class='fieldName' id='empemail_1' autocomplete='off' onchange='' onkeypress='' onkeyup='RemoveClassEmp(this)' /></td>
                       <td><input type='text' id='empaddress_1' class='fieldName'  autocomplete='off'/>
                           <%--<select id="" class="Operator">
												<option value="Textbox">Address1</option>
                                                <option value="Textbox">Address2</option>
												<option value="Textbox">Address3</option>
                                                </select>--%></td>
                          <td><input type="checkbox" id="chkcredential_1" class="checkbox" disabled = "disabled" onclick="showCredentialpopup(this)"  /></td>
                          <td><input type="checkbox" id="chkisactive_1" class="checkbox"/></td>
                      </tr>
                           <tr>
                      <td style="display:none">2</td>
                      <td><input type="checkbox" id="chk_2" class="checkbox"/></td>
                      <td><label id="empid_2" style='display:none'></label><label id="isemail_2" style='display:none'></label><input type='text' id='empname_2' class='fieldName' onchange=''  onkeyup='RemoveClassEmp(this)' autocomplete='off'/></td>
                      <td><input type='text' placeholder='' class='fieldName' id='empmobile_2' autocomplete='off' onchange=''  onkeypress='return isNumber(event)' onkeyup='RemoveClassEmp(this)' /></td>
                       <td><input type='text' placeholder='' class='fieldName' id='empemail_2' autocomplete='off' onchange='' onkeypress='' onkeyup='RemoveClassEmp(this)' /></td>
                       <td><input type='text' id='empaddress_2' class='fieldName'  autocomplete='off'/>
                           <%--<select id="" class="Operator">
												<option value="Textbox">Address1</option>
                                                <option value="Textbox">Address2</option>
												<option value="Textbox">Address3</option>
                                                </select>--%></td>
                          <td><input type="checkbox" id="chkcredential_2" class="checkbox" disabled = "disabled" onclick='showCredentialpopup(this)' /></td>
                          <td><input type="checkbox" id="chkisactive_2" class="checkbox" /></td>
                      </tr>
                            <tr>
                      <td style="display:none">3</td>
                      <td><input type="checkbox" id="chk_3" class="checkbox"/></td>
                      <td><label id="empid_3" style='display:none'></label><label id="isemail_3" style='display:none'></label><input type='text' id='empname_3' class='fieldName' onchange=''   onkeyup='RemoveClassEmp(this)' autocomplete='off'/></td>
                      <td><input type='text' placeholder='' class='fieldName' id='empmobile_3' autocomplete='off' onchange=''  onkeypress='return isNumber(event)' onkeyup='RemoveClassEmp(this)' /></td>
                       <td><input type='text' placeholder='' class='fieldName' id='empemail_3' autocomplete='off' onchange='' onkeypress='' onkeyup='RemoveClassEmp(this)' /></td>
                       <td><input type='text' id='empaddress_3' class='fieldName'  autocomplete='off'/>
                           <%--<select id="" class="Operator">
												<option value="Textbox">Address1</option>
                                                <option value="Textbox">Address2</option>
												<option value="Textbox">Address3</option>
                                                </select>--%></td>
                          <td><input type="checkbox" id="chkcredential_3" class="checkbox" disabled = "disabled"  onclick="showCredentialpopup(this)" /></td>
                          <td><input type="checkbox" id="chkisactive_3" class="checkbox"/></td>
                      </tr>
                          <tr>
                      <td style="display:none">4</td>
                      <td><input type="checkbox" id="chk_4" class="checkbox"/></td>
                      <td><label id="empid_4" style='display:none'></label><label id="isemail_4" style='display:none'></label><input type='text' id='empname_4' class='fieldName' onchange=''  onkeyup='RemoveClassEmp(this)'' autocomplete='off'/></td>
                      <td><input type='text' placeholder='' class='fieldName' id='empmobile_4' autocomplete='off' onchange='' onkeypress='return isNumber(event)' onkeyup='RemoveClassEmp(this)' /></td>
                       <td><input type='text' placeholder='' class='fieldName' id='empemail_4' autocomplete='off' onchange='' onkeypress='' onkeyup='RemoveClassEmp(this)' /></td>
                       <td><input type='text' id='empaddress_4' class='fieldName'  autocomplete='off'/>
                           <%--<select id="" class="Operator">
												<option value="Textbox">Address1</option>
                                                <option value="Textbox">Address2</option>
												<option value="Textbox">Address3</option>
                                                </select>--%></td>  
                          <td><input type="checkbox" id="chkcredential_4" class="checkbox" disabled = "disabled"  onclick="showCredentialpopup(this)" /></td>
                          <td><input type="checkbox" id="chkisactive_4" class="checkbox"/></td>
                      </tr>
                          <tr>
                      <td style="display:none">5</td>
                      <td><input type="checkbox" id="chk_5" class="checkbox"/></td>
                      <td><label id="empid_5" style='display:none'></label><label id="isemail_5" style='display:none'></label><input type='text' id='empname_5' class='fieldName' onchange=''  onkeyup='RemoveClassEmp(this)' autocomplete='off'/></td>
                      <td><input type='text' placeholder='' class='fieldName' id='empmobile_5' autocomplete='off' onchange='' onkeypress='return isNumber(event)'  onkeyup='RemoveClassEmp(this)' /></td>
                       <td><input type='text' placeholder='' class='fieldName' id='empemail_5' autocomplete='off' onchange='' onkeypress='' onkeyup='RemoveClassEmp(this)' /></td>
                       <td><input type='text' id='empaddress_5' class='fieldName'  autocomplete='off'/>
                           <%--<select id="" class="Operator">
												<option value="Textbox">Address1</option>
                                                <option value="Textbox">Address2</option>
												<option value="Textbox">Address3</option>
                                                </select>--%></td>
                          <td><input type="checkbox" id="chkcredential_5" class="checkbox" disabled = "disabled" onclick="showCredentialpopup(this)" /></td>
                          <td><input type="checkbox" id="chkisactive_5" class="checkbox"/></td>
                      </tr>
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
			</div>
		</div>
                </div>
              <%--  <div class="row match-height">
                    <div class="col-md-12">
                        <div class="card">
                      
                            <div class="card-content collapse show cardScroll" >
                                <div class="card-body ">
                                    <div class="card-text">

                                    </div>
                                    <form class="form ">
                                   
                  

                                   

                                       
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>--%>
              
            </section>
            <div class="row match-height" id="PartnerGrid" style="display:block">
          
                <div class="col-12 col-xl-12 ">                    
                    <div class="card">
                        <div class="card-content">
                       <div class="container">
          <div class="row">

    <div class="col-md-8">    
    <div class="pdfexport">
   <button type="button" id="btnExcel"  class="btn btn-outline-primary" title="Export">
                            <i class="fa fa-file-excel-o"></i> </button>
                          <%--   <asp:LinkButton ID="btnExcel" runat="server" OnClick="btnExcel_Click"   class="btn btn-primary waves-effect waves-light"><i class="fa fa-print"></i> Export</asp:LinkButton>--%>
                 <%--<asp:LinkButton ID="btnpdf1" runat="server" OnClick="Exportpdf_Click" OnClientClick="SetHTML()"  class="btn btn-primary waves-effect waves-light"><i class="fa fa-print"></i> PDF</asp:LinkButton>--%>

                 <button type="button" id="btnexportpdf"  class="btn btn-outline-primary" title="PDF">
                           <i class="fa fa-file-pdf-o"></i> </button>
                       
                         
    </div></div>
    <div class="col-md-2 "> 
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
    <div class="col-md-2 ">
     <div class="searchbox">
    <%--<button type="button" class="btn btn-primary  mr-1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								 <i class="fa fa-search"></i>	Column Search		</button>--%>
                                   <div class="dropdown ">
							<div class="dropdown-menu checkboxSearch" >
							<div class="columnList">
								<div class="dropdown-item">
									<span class="skin skin-polaris">
										<input type="checkbox" id="check3" checked>
										<label for="check3" class="coldata">Address Line 1</label>
									</span>
								</div>
								<div class="dropdown-item">
									<span class="skin skin-polaris">
										<input type="checkbox" id="check4">
										<label for="check4" class="coldata">Address Line 1</label>
									</span>
								</div>
                                	<div class="dropdown-item">
									<span class="skin skin-polaris">
										<input type="checkbox" id="Checkbox1">
										<label for="check4" class="coldata">City</label>
									</span>
								</div>
                                	<div class="dropdown-item">
									<span class="skin skin-polaris">
										<input type="checkbox" id="Checkbox2">
										<label for="check4" class="coldata">State</label>
									</span>
								</div>
                                	<div class="dropdown-item">
									<span class="skin skin-polaris">
										<input type="checkbox" id="Checkbox3">
										<label for="check4" class="coldata">State</label>
									</span>
								</div>
                                </div>
                                 <div class="dropdownBottom">
                                <label class="pull-left" id="selectall">Select All</label>
                                  <label class="pull-right" id="reset">Reset</label>
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
                                
                                <th>Partner Type</th>
                                <th>Partner Name</th>
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
                            <table class="table table-de mb-0 clickableRow" id="partners">
                        <thead>
                            <tr>
                                <th style="Display:none">PartnerId</th>
                                <th><input type="checkbox" id="checkAll"> All</th>
                                <th>Partner Name</th>
                                <th>Partner Code</th>
                                <th>Partner Group</th>
                                <th>Partner Type.</th>
                               
                            </tr>
                        </thead>
                      <tbody>
                           <%-- <tr>  
                                 <td>1</td>
                                 <td>Abhishek Kumar</td>
                                 <td>PC_001</td>
                                 <td>Distributer</td>
                                 <td>PCI0001</td>
                            </tr>
                          <tr>  
                                 <td>2</td>
                                 <td>Abhishek Kumar</td>
                                 <td>PC_002</td>
                                 <td>Distributer</td>
                                 <td>PCI0002</td>
                            </tr>
                             <tr>  
                                 <td>3</td>
                                 <td>Abhi Kumar</td>
                                 <td>PC_003</td>
                                 <td>Distributer</td>
                                 <td>PCI0003</td>
                            </tr>
                             <tr>  
                                 <td>4</td>
                                 <td>shek Kumar</td>
                                 <td>PC_004</td>
                                 <td>Distributer</td>
                                 <td>PCI0004</td>
                            </tr>--%>
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
         <label id="lblPartnerId" style="display:none"></label>
    </div>
    </div> 


     <div class="modal fade text-left" id="TaxGroup" tabindex="-1" role="dialog" aria-labelledby="myModalLabel8"
									 aria-hidden="true" >
										<div class="modal-dialog " role="document">
											<div class="modal-content">
												<div class="modal-header bg-primary white">
                                                    <h6 class="white" id="H2"> Group Tax : <span class="white" id="lblitm">Bottle</span></h6>
													<button type="button" id="btntaxgrpclose" class="close" aria-label="Close">
														<span aria-hidden="true">&times;</span>
													</button>
												</div>
											<div class="mt-1">
                                          <div class="container ">
						<div class="assignedTaxGroups">						    
    <div class="row">
    <div class="col-md-12">
                                            <h6 class="form-section">All Rules</h6>
                                             </div> </div>
                                             
                                             <div class="row " id="divTaxGroup">
    
       <%--<div class="col-md-4 ">    
       <div class="taxGroup">
       <input type="checkbox">
       <label class="">GST@18% </label>
       </div>
       </div>
        <div class="col-md-4 ">    
       <div class="taxGroup">
       <input type="checkbox">
       <label class="">GST@28% </label>
       </div>
       </div>
        <div class="col-md-4 ">    
       <div class="taxGroup">
       <input type="checkbox">
       <label class="">GST@8% </label>
       </div>
       </div>
        <div class="col-md-4 ">    
       <div class="taxGroup">
       <input type="checkbox">
       <label class="">GST@5% </label>
       </div>
       </div>
        <div class="col-md-4 ">    
       <div class="taxGroup">
       <input type="checkbox">
       <label class="">GST@2% </label>
       </div>
       </div>--%>
       <%-- <div class="col-md-4 ">    
       <div class="taxGroup">
       <input type="checkbox">
       <label class="">GST@1% </label>
       </div>
       </div>--%>
                                         </div>


   
                                        </div><div class="row">
<div class="col-md-12">
         <button  type="button" id="btnTaxgrpSubmit" class="btn btn-primary pull-right mb-1 waves-effect waves-light">
                            <i class="fa fa-save"></i> Submit</button>
		</div>
		</div></div>
												
												</div>
												
											</div>
										</div>
									</div>

    

      <div class="modal fade text-left" id="RejectedData" tabindex="-1" role="dialog" aria-labelledby="myModalLabel8"
									 aria-hidden="true" >
										<div class="modal-dialog modal-lg" role="document">
											<div class="modal-content">
												<div class="modal-header bg-primary white">
                                                    <h6 class="white" >  Rejected Data  <span class="white" ></span></h6>
													
													<button type="button" id="" class="close" data-dismiss="modal"  aria-label="Close">
														<span aria-hidden="true">&times;</span>
													</button>
												</div>
											<div class="modal-body">
												    <div class="row">
                                                                               
    <div class="col-md-12">    
    <div class="pdfexport tablebtn">
                            <button type="button" id="btngg" class="btn btn-outline-primary" title="Export">
                            <i class="fa fa-file-excel-o"></i> </button>
                            <button type="button" id="bty" class="btn btn-outline-primary" title="PDF">
                            <i class="fa fa-file-pdf-o"></i> </button>  
                          
                          
    </div>

    </div>
                                            <div class="col-md-12">
    
                                                  <div class="table-responsive" >
                                                      <asp:GridView ID="grdpartner" runat="server" BackColor="White"  
BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4"  ></asp:GridView>
                              <%--<table id="rejectedTable" class="table table-de mb-0">
                      <thead>
                            <tr>
                                <th id="hidePselect_all"><input type="checkbox" id="chkPAll" onclick="">All</th>
                                 <th> Name</th>
                                 <th>Mobile</th>  
                                 <th>Email</th>  
                            </tr>
                        </thead>
                        <tbody>
                        <tr>                       
                        <td id="chkPtd"><input type="checkbox" id="cb_1" class="chk_PAll"></td>
                         <td> Abhishek    </td>
                         <td> 88825656  </td> 
                         <td> abc@gmail.com  </td> 
                        </tr>
                         
                           
                        </tbody>
                    </table>--%>
                            </div>
                                            </div>
                                          
                                        </div>
                                        	    <%--<div class="row">
                                         
                                            <div class="col-md-12">
                                            <div class="table-responsive">
												 <button type="button"  id="btnsavepopupdata" class="btn btn-primary  pull-right">
                            <i class="fa fa-save"></i> Submit</button>
												</div>
												</div></div>--%>

											</div>
											</div>
										</div>
									</div>
     <div class="modal fade text-left" id="imagePopup" tabindex="-1" role="dialog" aria-labelledby="myModalLabel8"
									 aria-hidden="true" >
										<div class="modal-dialog modal-sm" role="document">
											<div class="modal-content">
												<div class="modal-header bg-primary white">
                                                    <h6 class="white" id="h1"> Employee Name : <span class="white" id="lblempname"></span></h6>
													<button type="button" id="btnempgrpclose" class="close" aria-label="Close">
														<span aria-hidden="true">&times;</span>
													</button>
												</div>
											<div class="mt-1">
                                          <div class="container ">
                                  
						<div class="assignedTaxGroups">						    
    <div class="row">
    <div class="col-md-12">
                                            <h6 class="form-section">Upload Image</h6>
                                             </div> </div>
                                             
                                             <div class="row " id="divemp">
    
      
          <div class="col-4 pull-left ">
               <img id="myUploadedImg" alt="Photo" height="100px" width="100px" />
              <%--<div class="empImage">
<p class="text-muted text-center pt-1">Image</p>
              </div>--%>
          </div>
                                        <div class="col-8 pull-right pt-1">
                                            <input type="file" class="upload"  id="f_UploadImage" hidden><br />
                                          <label class="btn btn-sm btn-primary ml-50 mb-50 mb-sm-0 cursor-pointer"
                                                for="f_UploadImage">Upload new photo</label>
                                         <%--     <input type="file" id="account-upload" hidden>--%>
                                          <p class="text-muted ml-75 mt-50"><small>Allowed JPG or PNG. Max
                                                size of 800kB</small></p>
                                        </div>
                                        
                                    </div>
                                         </div>

                                    
                                 
                                        
                                        
                                        
                                        <div class="row">
<div class="col-md-12">
         <button type="button" id="btncredentialSubmit" class="btn btn-primary pull-right mb-1 waves-effect waves-light">
                            <i class="fa fa-save"></i> Submit</button>
		</div>
		</div></div>
												
												</div>
												
											</div>
										</div>
									</div>


                                                              <script type="text/javascript">

                                                          jquery_1_11_3_min_p(document).ready(function () {

                
               

                 jquery_1_11_3_min_p(".addIdentity").click(function () {
                     jquery_1_11_3_min_p(".IdentityDiv").append('<div class="col-md-3"><div class="form-group"><label for="Address1">Corporate  Identity</label><input type="text"  id="Text4" autocomplete="off"  class="form-control" placeholder="Enter Corporate  Identity " /></div></div>');
                 });
             })

         
</script>
        <script>
            
 function Showloader() {
                
                 jquery_1_11_3_min_p('#ContentPlaceHolder1_preloader').css('display', 'block');
                jquery_1_11_3_min_p('#ContentPlaceHolder1_Overlay_Load').css('display', 'block');
}
            jquery_1_11_3_min_p(document).ready(function () {
                jquery_1_11_3_min_p(".footerDropdown").hide();
            });
</script>
        <script type="text/javascript">
        function ShowPopup(text) {
        swal(text, "warning")
        
    }
</script>
</asp:Content>
