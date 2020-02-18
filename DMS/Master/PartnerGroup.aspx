<%@ Page Language="C#" MasterPageFile="~/DMS.Master" AutoEventWireup="true" CodeBehind="PartnerGroup.aspx.cs" Inherits="DMS.Master.PartnerGroup" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script src="../js/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script>        var jquery_1_11_3_min_p = jQuery.noConflict();</script>
    <script src="../js/bootstrap.min.js" type="text/javascript"></script>
    <script>        var bootstrap_min_js = jQuery.noConflict();</script>
    <link href="/Telerix/Style/kendo.default.min.css" rel="stylesheet" type="text/css" />
    <link href="/Telerix/Style/kendo.dataviz.min.css" rel="stylesheet" type="text/css" />
    <link href="/Telerix/Style/kendo.dataviz.default.min.css" rel="stylesheet" type="text/css" />
    <link href="/Telerix/Style/kendo.common.min.css" rel="stylesheet" type="text/css" />
    <link href="/Telerix/Style/kendo.rtl.min.css" rel="stylesheet" type="text/css" />
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
     <script src="../JavaScript/PartnerGroup.js" type="text/javascript"></script>
        <style>  
                  #partnersgGrouprid td:nth-child(5), #partnersgGrouprid th:nth-child(5) {    width: 50px;}    
         </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<input type="hidden" id="hdnLoad"/>
<div class="content-header row">
        <div class="content-header-light col-12">
            <div class="row">
                <div class="content-header-left col-md-6 col-12 mb-2">
                    <h4 class="content-header-title mainheading">
                         <span class="customer">Partner Group</span></h4>
                </div>
                <div class="content-header-right col-md-6 col-12">
                    <div class="btn-group float-md-right" role="group" aria-label="Button group with nested dropdown">
                         <span class="multifileupload" id="btnupload" > 
                       <i class="fa fa-upload"></i>
                  <%--   <input type="file" id='FileUpload' runat="server" class="custom-file-input multifileBtn" onchange="UploadFile(this);" />--%>
                           <input type="button" id="upload" value="Import" class="custom-file-input multifileBtn" />
                           <asp:FileUpload runat="server" Visible="true" ID="FileUpload"  style="display:none" />
                           <asp:Button ID="btnUpload" runat="server" style="display:none" /> 
                       </span>
                       <button type="button" id="btnNew" class="btn btn-primary">
                            <i class="fa fa-plus-square"></i> New</button>
                        <button type="button" style="display:none" id="btnSubmit"  class="btn btn-primary">
                            <i class="fa fa-save"></i> Submit</button>
                              <button type="button" id="Button4" data-toggle="modal" data-target="#COAassign" class="btn btn-primary">
                            <i class="fa fa-save"></i> COA</button>
                        <button type="button" id="btnBack" style="display:none" class="btn btn-primary"   >
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
            <section id="partnerGroupForm" style=" display:none" >
                <div class="row match-height">
                   <div class="col-12 col-xl-12 ">                    
                    <div class="card">
                        <div class="card-content">
                        <div class="container">
                      <div class="row   mt-1 headerDropdown ">
    <div class="col-md-6 pull-left">    
    <div class="pdfexport">
   <button type="button" id="btnAdd" onclick="AddRow()" class="btn btn-outline-primary" title="Add Line">
                            <i class="fa fa-plus"></i> </button>
                            <button type="button"  id="btnDeleteLine" class="btn btn-outline-primary" title="Delete Line">
                            <i class="fa fa-trash"></i> </button>
                            <button type="button" id="Button1" class="btn btn-outline-primary" title="Export">
                            <i class="fa fa-file-excel-o"></i> </button>
                            <button type="button" id="Button2" class="btn btn-outline-primary" title="PDF">
                            <i class="fa fa-file-pdf-o"></i> </button>    
                          
    </div>
  
    
    </div>
    
       <div class="col-md-3">
                                                <div class="form-group pull-right pr-1">
                                                   <label class="pr-1">Select Entity</label>
                                                   
                                                 <input type="text" id="ddlentity"  autocomplete="off"  style="width: 95px;"/>
                                                </div>
                                            </div>
    <div class="col-md-3 ">
                                                <div class="form-group pull-right  ">                                                 
                                                    <label class="pr-1">Select Country</label>
<input type="text" id="ddlcountry"  autocomplete="off"  style="width: 100px;"/>
                                                
                                                </div>
                                            </div>
 
                                          </div>
                                             </div>
                                             <div class="container">
          <div class="row">
    <div class="col-md-12 ">  
                           <div class="table-responsive full-width" >
                             <table  class="table table-de mb-0"  id="tblPartnergroup">
                <thead>
                  <tr>
                  <th style="display:none"></th> 
                    <th ><input type="checkbox" id="chkAll" onclick="InputcheckAll(this)"/> All</th>
                    <th><span class="customer">Partner Type</span></th>
                    <th>Description</th>
                    <th>Accounts</th>
                  
                   
                  </tr>
                </thead>
              <tbody>
                <tr>   
               <td style="display:none">1</td> 
                <td><input type="checkbox" id="chk_1" class="chk_All" /></td>         
                <td ><span class="customer"> <input type="text" id="txtPartnerType_1"  placeholder="Enter Parner Type" onkeyup="RemoveClass(this)" class="fieldName" /></span></td>
                <td > <input type="text" id="txtDescription_1" placeholder="Enter Description"  onkeyup="RemoveClass(this)"  class="fieldName"  autocomplete="off" /> </td> 
                <td > <input type="text" id="ddlAccount_1" placeholder=""  onkeyup=""  class="fieldName"  autocomplete="off" /> </td>  
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
            </section>
            <div class="row match-height" id="PartnerGroupGrid" style="display:block">
          
                <div class="col-12 col-xl-12 ">                    
                    <div class="card">
                        <div class="card-content">
                     <div class="container">
          <div class="row">

    <div class="col-md-8 pull-left">    
    <div class="pdfexport">
   <button type="button" id="btnExcel"  class="btn btn-outline-primary" title="Export">
                            <i class="fa fa-file-excel-o"></i> </button>
                          <%--   <asp:LinkButton ID="btnExcel" runat="server" OnClick="btnExcel_Click"   class="btn btn-primary waves-effect waves-light"><i class="fa fa-print"></i> Export</asp:LinkButton>--%>
                 <%--<asp:LinkButton ID="btnpdf1" runat="server" OnClick="Exportpdf_Click" OnClientClick="SetHTML()"  class="btn btn-primary waves-effect waves-light"><i class="fa fa-print"></i> PDF</asp:LinkButton>--%>

                 <button type="button" id="btnexportpdf"  class="btn btn-outline-primary" title="PDF">
                           <i class="fa fa-file-pdf-o"></i> </button>
                       
                         
    </div></div>
    <div class="col-md-2 pull-left"> 
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
    <div class="col-md-2 pull-right ">
     <div class="searchbox">
    <%--<button type="button" class="btn btn-primary  mr-1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								 <i class="fa fa-search"></i>	Column Search		</button>--%>
                                   <div class="dropdown " id="">
							<div class="dropdown-menu checkboxSearch" >
							<div class="columnList" id="DivSearch">
								<%--<div class="dropdown-item">
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
								</div>--%>
                                </div>
                                <%-- <div class="dropdownBottom">
                                <label class="pull-left" id="selectall">Select All</label>
                                  <label class="pull-right" id="reset">Reset</label>
                                </div>--%>
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
                                
                                <th><span class="customer">Partner Type</span></th>
                                <th><span class="customer">Partner </span></th>
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
                            <table class="table table-de mb-0" id="partnersgGrouprid">
                        <thead>
                            <tr>
                                 <th style="display:none"></th>
                                  <th style="display:none">Entity</th>
                                   <th style="display:none">country</th>
                                    <th style="display:none">Account</th>
                                <th><input Type="checkbox" id="chkall"/> All</th>
                                <th><span class="customer">Partner Type</span></th>
                                <th>Description</th>
                                <th>Account</th>
                               
                            </tr>
                        </thead>
                      <tbody>
                           <%-- <tr>  
                                 <td>1</td>
                                 <td>Dealer</td>
                                 <td>New Dealer</td>
                            </tr>
                            <tr>  
                                 <td>2</td>
                                 <td>Distributer</td>
                                 <td>New Distributer</td>
                            </tr>
                              <tr>  
                                 <td>3</td>
                                 <td>Dealer</td>
                                 <td>New Dealer</td>
                            </tr>
                            <tr>  
                                 <td>4</td>
                                 <td>Distributer</td>
                                 <td>New Distributer</td>
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
    </div>
    </div>

     <div class="modal fade text-left" id="COAassign" tabindex="-1" role="dialog" aria-labelledby="myModalLabel8"
									 aria-hidden="true" >
										<div class="modal-dialog " role="document">
											<div class="modal-content">
												<div class="modal-header bg-primary white">
                                                    <h6 class="white" id="H1"> Partner Type : <span class="white" id="Span1">	PTGROUP1</span></h6>
													<button type="button" id="Button3" class="close" aria-label="Close">
														<span aria-hidden="true">&times;</span>
													</button>
												</div>
											<div class="mt-1">
                                          <div class="container ">
						<div class="assignedTaxGroups">						    
    <div class="row">
    <div class="col-md-12">
                                            <h6 class="form-section">All COA Accounts</h6>
                                             </div> </div>
                                             
                                             <div class="row " id="div2">
    
       <div class="col-md-4 ">    
       <div class="taxGroup">
       <input type="radio" name="coa">
       <label class="">AC001 </label>
       </div>
       </div>
        <div class="col-md-4 ">    
       <div class="taxGroup">
       <input type="radio" name="coa">
       <label class="">AC002 </label>
       </div>
       </div>
        <div class="col-md-4 ">    
       <div class="taxGroup">
       <input type="radio" name="coa">
       <label class="">AC003 </label>
       </div>
       </div>
        <div class="col-md-4 ">    
       <div class="taxGroup">
       <input type="radio" name="coa">
       <label class="">AC004 </label>
       </div>
       </div>
        <div class="col-md-4 ">    
       <div class="taxGroup">
       <input type="radio" name="coa">
       <label class="">AC005 </label>
       </div>
       </div>
       <%-- <div class="col-md-4 ">    
       <div class="taxGroup">
       <input type="checkbox">
       <label class="">GST@1% </label>
       </div>
       </div>--%>
                                         </div>


   
                                        </div><div class="row">
<div class="col-md-12">
         <button  type="button" id="Button5" class="btn btn-primary pull-right mb-1 waves-effect waves-light">
                            <i class="fa fa-save"></i> Submit</button>
		</div>
		</div></div>
												
												</div>
												
											</div>
										</div>
									</div>
                <script>
                    jquery_1_11_3_min_p(document).ready(function () {
                        jquery_1_11_3_min_p(".footerDropdown").hide();
                    });
</script>
</asp:Content>

