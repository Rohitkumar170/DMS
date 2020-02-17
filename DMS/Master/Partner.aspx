<%@ Page Language="C#" MasterPageFile="~/DMS.Master" AutoEventWireup="true" CodeBehind="Partner.aspx.cs" Inherits="DMS.Master.Partner" %>


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
  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<input type="hidden" id="hdnLoad"/>
<div class="content-header row">
        <div class="content-header-light col-12">
            <div class="row">
                <div class="content-header-left col-md-6 col-12 mb-2">
                    <h4 class="content-header-title mainheading">
                         Partner</h4>
                </div>
                <div class="content-header-right col-md-6 col-12">
                    <div class="btn-group float-md-right" role="group" aria-label="Button group with nested dropdown">
                       <button type="button" id="btnNew" class="btn btn-primary">
                            <i class="fa fa-plus-square"></i> New</button>
                        <button type="button" id="btnSubmit" style="display:none"  class="btn btn-primary">
                            <i class="fa fa-save"></i> Submit</button>
                        <button type="button" id="btnBack" style="display:none"  class="btn btn-primary"   >
                           <i class="fa fa-arrow-left"></i> Back</button>
                      
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
            <section id="partnerForm" style=" display:none" >
                <div class="row match-height">
                    <div class="col-md-12">
                        <div class="card">
                      
                            <div class="card-content collapse show cardScroll" >
                                <div class="card-body ">
                                    <div class="card-text">
 <div class="row headerDropdown ">
                    <div class="content-header-left col-md-3 ">
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
<div class="content-header-right col-md-3">
                    <div class="btn-group float-md-right" role="group">
                     <button type="button" style="display:none" class="btn btn-primary " id="btntaxGrp">
                            <i class="fa fa-money"></i> Tax Group</button>
                      
                        <button type="button" id="Button4" class="btn btn-primary waves-effect waves-light">
                           <i class="fa fa-arrow-left"></i> Button3</button>
                      
                    </div>
                </div>
</div>
                                    </div>
                                    <form class="form ">
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
                                        <div class="form-body ">
                                        <h6 class="form-section">Locations</h6>
                                      <div class="row">
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                   
                                                   
                                                     <input type="checkbox" class="checkLocation" onchange="ExistingLocation()">
                                                     <label for="Self">New Location</label>
                                                </div>
                                            </div>
                                              <div class="col-md-3">
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
                          <%--           <div class="row"> 
                                              <div class="col-md-12">    
                                   <button type="button" id="Button1" class=" addIdentity btn btn-primary waves-effect waves-light pull-right">
                            <i class="fa fa-plus-square"></i> Add Identity</button>
                            </div>
                            </div>--%>

                                     <div class="form-body" id="TaxDiv" style="display:none">
                                        <h6 class="form-section">Legal / Tax</h6>
                                        <div class="row   ">
    <div class="col-md-12 ">    
    <div class="pdfexport tablebtn">
   <button type="button" id="btnAdd" onclick="AddRow()" class="btn btn-outline-primary" title="Add Line">
                            <i class="fa fa-plus"></i> </button>
                            <button type="button" id="btnDeleteLine" class="btn btn-outline-primary" title="Delete Line">
                            <i class="fa fa-trash"></i> </button>
                            <button type="button" id="Button1" class="btn btn-outline-primary" title="Export">
                            <i class="fa fa-file"></i> </button>
                            <button type="button" id="Button1" class="btn btn-outline-primary" title="PDF">
                            <i class="fa fa-print"></i> </button>    
                          
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
                      <td><input type='text' id='ddlTaxCountry_1' class='fieldName' onchange=''  onkeyup='' autocomplete='off'/></td>
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
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
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

    




                                                              <script type="text/javascript">

                                                          jquery_1_11_3_min_p(document).ready(function () {

                
               

                 jquery_1_11_3_min_p(".addIdentity").click(function () {
                     jquery_1_11_3_min_p(".IdentityDiv").append('<div class="col-md-3"><div class="form-group"><label for="Address1">Corporate  Identity</label><input type="text"  id="Text4" autocomplete="off"  class="form-control" placeholder="Enter Corporate  Identity " /></div></div>');
                 });
             })

         
</script>
        <script>
            jquery_1_11_3_min_p(document).ready(function () {
                jquery_1_11_3_min_p(".footerDropdown").hide();
            });
</script>
</asp:Content>
