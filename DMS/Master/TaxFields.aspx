<%@ Page Language="C#" MasterPageFile="~/DMS.Master" AutoEventWireup="true" CodeBehind="TaxFields.aspx.cs" Inherits="DMS.Master.TaxFields" %>

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
    <script src="../JavaScript/TaxSetup.js" type="text/javascript"></script>
  <style>
  #tblpopupdata td:nth-child(2), #tblpopupdata th:nth-child(2) {
    width: auto !important;
}
 #tblpopupdata td:nth-child(1), #tblpopupdata th:nth-child(1) {
    width: 50px !important;
}
  </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<input type="hidden" id="hdnLoad"/>
 <div class="content-header row">
        <div class="content-header-light col-12">
            <div class="row">
                <div class="content-header-left col-md-6 col-12 mb-2">
                    <h4 class="content-header-title mainheading">
                         Tax Field </h4>
                </div>
                <div class="content-header-right col-md-6 col-12">
                    <div class="btn-group float-md-right" role="group" aria-label="Button group with nested dropdown">
                       <button type="button" id="btnnew" class="btn btn-primary">
                            <i class="fa fa-plus-square"></i> New</button>
                             <button type="button" id="btnSubmit" style="display:none" class="btn btn-primary">
                            <i class="fa fa-save"></i> Submit</button>
                              <button type="button" id="btndisable"  style="display:none"  class="btn btn-primary">
                            <i class="fa fa-ban"></i> Disable</button>
                        <button type="button" id="btnback" style="display:none"  class="btn btn-primary" >
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
           <div class="row match-height" id="TaxSetup"  style="display:none" >
          
                <div class="col-12 col-xl-12 ">                    
                    <div class="card">
                        <div class="card-content">
                      <div class="container">
                <div class="row  mt-1 headerDropdown">
    <div class="col-md-6 pull-left">    
    <div class="pdfexport">
   <button type="button" id="btnAdd" onclick="AddRow()" class="btn btn-outline-primary" title="Add Line">
                            <i class="fa fa-plus"></i> </button>
                            <button type="button" id="btnDeleteLine" class="btn btn-outline-primary" title="Delete Line">
                            <i class="fa fa-trash"></i> </button>
                            <button type="button" id="dblbtnExport" class="btn btn-outline-primary" title="Export">
                            <i class="fa fa-file"></i> </button>
                            <button type="button" id="dblbtnPdf" class="btn btn-outline-primary" title="PDF">
                            <i class="fa fa-print"></i> </button>    
                          
    </div>
     <div class="searchDropdown">
         
   
					
					
     </div>
    
    </div>
    <div class="col-md-3 ">
                                                <div class="form-group pull-right  ">                                                 
                                                    <label class="pr-1"> Country</label>
                         <input type="text" id="ddlcountry"  autocomplete="off"  />
                                                 
                                                <%--  <select id="Select9" class="Operator">
												
													
												<option value="Textbox">India</option>
                                                <option value="Textbox">Russia</option>
												<option value="Textbox">Pakistan</option>
                                                </select> --%>    
                                                </div>
                                            </div>
   <%-- <div class="col-md-3">
                                                <div class="form-group pull-right ">
                                                <label class="pr-1">Select Entity</label>
                                            
                                                 <input type="text" id="ddlentity"  autocomplete="off"  />
                                                </div>
                                            </div>--%>
                                             <div class="col-md-3">
                                                <div class="form-group pull-right ">
                                                <label class="pr-1">Tax Type</label>
                                                 <input type="text" id="ddlTaxType"  autocomplete="off"  />
                                                <%--<select id="Select1" name="interested" class="Operator">
												<option value="Textbox">Company Tax</option>
                                                <option value="Textbox">Item Tax</option>--%>
												
                                             <%--    </select>--%>
                                                <%-- <input type="text" id="ddlentity"  autocomplete="off"  />--%>
                                                </div>
                                            </div>
                                            </div>
                                            </div>
<div class="container">
          <div class="row">
    <div class="col-md-12 ">
                           <div class="table-responsive full-width">
                             <table id="tblfields"  class="TblTaxGrid table table-de mb-0">
                <thead>
                  <tr>
                  <th style="display:none"></th>
                    <th ><input type="checkbox" id="chkAll" class='chk_All'>All</th>
                    <th >Field Name</th>
                    <th >Priority</th>
                     <th >Data Type</th>
                      <th></th>          
                  </tr>
                </thead>
                <tbody>
                <tr>    
                <td style='display:none'>1</td>
                
                <td ><input type="checkbox" id="Checkbox5" class='chk_1' /></td>  
                <td > <input type="text"  class=""  id="txtFieldName_1"  onkeypress="RemoveClass(this)" onkeyup="Enablebutton(this)" autocomplete="off" placeholder="Enter Field Name" /> </td>
                 <td > <input type="text"  class=""  id="txtPriority_1"  onkeypress="NumericAllow(this)" onchange="RemoveClass(this)" onkeyup="Enablebutton(this)" autocomplete="off" placeholder="Enter Priority Order"/> </td>
                  <td > <input type="text"  class="" id="ddlDatatype_1" autocomplete="off"/></td>
                    <td> </td>   
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
            <div class="row match-height" id="TaxSetUpGrid" >
          
                <div class="col-12 col-xl-12 ">                    
                    <div class="card">
                        <div class="card-content">
                   <div class="container">
          <div class="row">

    <div class="col-md-8 pull-left">    
    <div class="pdfexport">
   <button type="button" id="btnExport" class="btn btn-outline-primary" title="Export">
                            <i class="fa fa-file"></i> </button>
                            <button type="button" id="btnPdf" class="btn btn-outline-primary" title="PDF">
                            <i class="fa fa-print"></i> </button>
                          
                          
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
                                   <div class="dropdown ">
							<div class="dropdown-menu checkboxSearch" id="">
							<div class="columnList" id="DivSearch">
							
                          
								<div class="dropdown-item">
									<span class="skin skin-polaris">
										<input type="checkbox" id="check3" checked>
										<label for="check3" class="coldata">All</label>
									</span>
								</div>
								<div class="dropdown-item">
									<span class="skin skin-polaris">
										<input type="checkbox" id="check4">
										<label for="check4" class="coldata">Field Name</label>
									</span>
								</div>
                            
                                	<div class="dropdown-item">
									<span class="skin skin-polaris">
										<input type="checkbox" id="Checkbox2">
										<label for="check4" class="coldata">Entity</label>
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
                            <input type="text" class="form-control round "  placeholder="Search" autocomplete="off"  id="searchText">
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
                             <table  class="table table-de mb-0 clickableRow" id="tblTaxSetupGrid">
                <thead>
                  <tr>
                  <th style="display:none"></th>
                    <th class="active" ><input type="checkbox" id="CheckAll" onclick="checkAll(this)"> All</th>                
                    <th >Country</th>
                    <th >TaxType</th>
                    
                  </tr>
                </thead>
                <tbody>
             <%-- <tr>
              <td><input type="checkbox" id="Checkbox1" onclick="checkAll(this)"></td>
              <td>Tax Type</td>
              <td>1</td>
              <td>India</td>
              <td>Amy Soft</td>
              <td>Company Tax</td>
              </tr>
                <tr>
              <td><input type="checkbox" id="Checkbox2" onclick="checkAll(this)"></td>
              <td>Company Tax</td>
              <td>3</td>
              <td>India</td>
              <td>Yoeki Soft</td>
              <td>Company Tax</td>
              </tr>
                <tr>
              <td><input type="checkbox" id="Checkbox3" onclick="checkAll(this)"></td>
              <td>Pan No.</td>
              <td>4</td>
              <td>India</td>
              <td>Amy Soft</td>
              <td>Company Tax</td>
              </tr>
                <tr>
              <td><input type="checkbox" id="Checkbox4" onclick="checkAll(this)"></td>
              <td>GST No.</td>
              <td>2</td>
              <td>Russia</td>
              <td>Amy Soft</td>
              <td>Item Tax</td>
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
     <label id="lblUserId" runat="server" style="display: none"> </label>
      <label id="lblTaxSetupId"  style="display: none"> </label>
    </div>
    </div>

    <div class="modal fade text-left" id="AllLeaveRequestPopup" tabindex="-1" role="dialog" aria-labelledby="myModalLabel8"
									 aria-hidden="true" data-backdrop="static" data-keyboard="false">
										<div class="modal-dialog" role="document">
											<div class="modal-content">
												<div class="modal-header bg-primary white">
                                                    <h6 class="white" id="H1">Feild Name : <span class="white" id="ColumnName"> Column Name</span></h6>
													
													<button type="button" id="btnclosedata" class="close" aria-label="Close">
														<span aria-hidden="true">&times;</span>
													</button>
												</div>
											<div class="mt-1">
                                            <div class="container">
												    <div class="row">
                                         
                              <div class="col-md-12 ">    
    <div class="pdfexport">
                            <button type="button" id="btnpopupaddline" onclick="Addpopuprow()" class="btn btn-primary waves-effect waves-light">
                            <i class="fa fa-plus"></i> Add Line</button>
                            <button type="button" id="btnpopupdeleteline" class="btn btn-primary waves-effect waves-light">
                            <i class="fa fa-trash"></i> Delete Line</button>
                           <button type="button"  id="btnsavepopupdata" class="btn btn-primary">
                            <i class="fa fa-save"></i> Submit</button>
                          
    </div>
    
    
    </div>
    </div>
    <div class="row">
    <div class="col-md-12 ">    
                              <div class="table-responsive full-width" id="Div1">
                              <table id="tblpopupdata" class="table table-de mb-0">
                        <thead>
                            <tr>
                                 <%--<th>S. No.</th>--%>
                                   <th id="hidePselect_all"  ><input type="checkbox" id="chkPAll" onclick="checkPAll(this)" />All</th>
                                 <th>Column Name</th>
                                 <th style="display:none"></th>   
                            </tr>
                        </thead>
                        <tbody>
                        <tr>
                        <td id="chkPtd"><input type="checkbox" id="cbP_1"  class="chk_PAll"/></td>
                         <td >  <input type="text" id="txtPField_1" 
                     onchange="RemoveClassItemMaster(this)" onkeyup="Comparevalue1(this)"  placeholder="Enter Column Name" class="fieldName"  autocomplete="off"  />      </td>
                     <td  style="display:none">1</td> 
                        </tr>
                         <%-- <tr class="">
                                <td>1</td> 
                                <td> <input type="text" placeholder="Enter Value"></td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td> <input type="text" placeholder="Enter Value"></td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td> <input type="text" placeholder="Enter Value"></td>
                            </tr>
                            <tr>
                                <td>4</td>
                                <td> <input type="text" placeholder="Enter Value"></td>
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

      <script type="text/javascript">

//          jquery_1_11_3_min_p(document).ready(function () {

//              jquery_1_11_3_min_p("#btnnew").click(function () {
//                  $("#TaxSetup").css('display', 'block');
//                  $("#TaxSetUpGrid").css('display', 'none');
//              })
//          })

</script>
 <script>
     jquery_1_11_3_min_p(document).ready(function () {
         jquery_1_11_3_min_p(".footerDropdown").hide();
     });
</script>
</asp:Content>
