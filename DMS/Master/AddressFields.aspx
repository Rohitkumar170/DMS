<%@ Page Language="C#" MasterPageFile="~/DMS.Master" AutoEventWireup="true" CodeBehind="AddressFields.aspx.cs" Inherits="DMS.Master.AddressFields" %>

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
   
    <script src="../JavaScript/AddressField.js" type="text/javascript"></script>
 <style>
 #tblpopupdata td:nth-child(1), #tblpopupdata th:nth-child(1) {    width: 50px;}
  #tblpopupdata td:nth-child(2), #tblpopupdata th:nth-child(2) {
    width: 150px;
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
                         Address Fields</h4>
                </div>
                <div class="content-header-right col-md-6 col-12">
                    <div class="btn-group float-md-right" role="group" aria-label="Button group with nested dropdown">
                       <button type="button" id="btnnew" class="btn btn-primary">
                            <i class="fa fa-plus-square"></i> New</button>
                             <button type="button" style="display:none" id="btnSubmit" class="btn btn-primary">
                            <i class="fa fa-save"></i> Submit</button>
                              <button type="button" id="btndesable" style="display:none"  class="btn btn-primary">
                            <i class="fa-disabled"></i> Disable</button>
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
<div id="preloader">
  <div id="showPreloader"> <img src="../../assets/img/preloader.gif" > </div>
</div>

<div id="Overlay_Load"></div>
    <div class="">
        <div class="content-body">
           <div class="row match-height" id="NewFields"  style="display:none" >
          
                <div class="col-12 col-xl-12 ">                    
                    <div class="card">
                        <div class="card-content">
                        <div class="container">
                      <div class="row   mt-1 headerDropdown ">
    <div class="col-md-6 pull-left">    
    <div class="pdfexport">
   <button type="button" id="btnAdd" onclick="AddRow()" class="btn btn-outline-primary" title="Add Line">
                            <i class="fa fa-plus"></i> </button>
                            <button type="button" id="btnDeleteLine" class="btn btn-outline-primary" title="Delete Line">
                            <i class="fa fa-trash"></i> </button>
                            <button type="button" id="Button1" class="btn btn-outline-primary" title="Export">
                            <i class="fa fa-file"></i> </button>
                            <button type="button" id="Button2" class="btn btn-outline-primary" title="PDF">
                            <i class="fa fa-print"></i> </button>    
                          
    </div>
  
    
    </div>
    
    <div class="col-md-3 ">
                                                <div class=" pull-right  ">                                                 
                                                    <label class="pr-1">Default Country</label>
<input type="text" id="ddlcountry"  autocomplete="off"  style="width: 100px;"/>
                                                <%-- 
                                                  <select id="Select9" class="Operator">
												
													
												<option value="Textbox">India</option>
                                                <option value="Textbox">Russia</option>
												<option value="Textbox">Pakistan</option>
                                                </select>  --%>   
                                                </div>
                                            </div>
    <div class="col-md-3">
                                                <div class=" pull-right ">
                                                   <label class="pr-1">Select Entity</label>
                                                    <%--<select id="Select4" name="interested" class="Operator">
												<option value="Textbox">Amy Softech</option>
                                                <option value="Textbox">Yoeki Soft</option>
												<option value="Textbox">IACE</option>	
                                                 </select>--%>
                                                 <input type="text" id="ddlentity"  autocomplete="off"  style="width: 100px;"/>
                                                </div>
                                            </div>
                                            </div>

</div>
<div class="container">
          <div class="row">
    <div class="col-md-12 ">  

                           <div class="table-responsive full-width" >
                             <table  class="table table-de mb-0"  id="tblFields">
                <thead>
                  <tr>
                 <%-- <th style="display:none">1</th>--%>
                 <th style="display:none"></th>
                 <th ><input type="checkbox" id="chkAll" onclick="InputcheckAll(this)"/>All</th>
                    <th>Field Name</th>
                    <th>Data Type</th>
                  
                   
                  </tr>
                </thead>
              <tbody>
                <tr>   
                <td style="display:none">1</td>
                <td><input type="checkbox" id="chk_1" class="chk_All"></td>         
                <td >  <input type="text" id="txtField_1" placeholder="Enter Field Name" class="fieldName" onkeyup="Enablebutton(this)"  autocomplete="off" onkeypress="RemoveClass(this)" />      </td>
                <td > <input type="text" id="ddlDatatype_1" readonly="readonly" class="fieldName"  autocomplete="off" />
                 </td>  
                </tr>
              
              </table>

              </div>
 </div> </div>
                         </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row match-height" id="SetUpGrid" >
          
                <div class="col-12 col-xl-12 ">                    
                    <div class="card">
                        <div class="card-content">
                       <div class="container">
                     <div class="row">
    <div class="col-md-8 ">    
    <div class="pdfexport">
   <button type="button" id="btnExport" class="btn btn-outline-primary" title="Export">
                            <i class="fa fa-file-excel-o"></i> </button>
                            <button type="button" id="btnPdf" class="btn btn-outline-primary" title="PDF">
                            <i class="fa fa-file-pdf-o"></i> </button>
                             <button type="button" id="btnUpdate" style="display:none" disabled class="btn btn-outline-primary" title="Edit">
                            <i class="fa fa-edit"></i> </button>
                          
                          
    </div>
    
    
    </div>
    <div class="col-md-2">   <div class="searchDropdown">
         
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
    <div class="col-md-2  ">
    
                           
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
                             <table  class="table table-de mb-0 clickableRow" id="tblFieldGrid">
                <thead>
                  <tr>
                  <th style="display:none" ></th>
                   <th style="display:none" ></th>
                 <th ><input type="checkbox" id="chkAll" onclick="checkAll(this)"> All</th>
                    <th id='' class='' >Entity Name</th>
                    <th id='' class='' >Country</th>
                   <th id='' class='' >Field Count</th>
                   
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
    
    </div>
     <label id="lblUserId" runat="server" style="display: none">
        </label>
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
											<div class="modal-body">
												    <div class="row">
                                         
                                            <div class="col-md-12">
                                           
    <div class="pdfexport">
                            <button type="button" id="btnpopupaddline" onclick="Addpopuprow()" class="btn btn-outline-primary" title="Add Line">
                            <i class="fa fa-plus"></i></button>
                            <button type="button" id="btnpopupdeleteline" class="btn btn-outline-primary" title="Delete Line">
                            <i class="fa fa-trash"></i> </button>
                           <button type="button"  id="btnsavepopupdata" class="btn btn-outline-primary" title="Submit">
                            <i class="fa fa-save"></i> </button>
    </div>
    </div>
     <div class="col-md-12">
                                                  <div class="table-responsive full-width" id="Div1">
                              <table id="tblpopupdata" class="table table-de mb-0">
                        <thead>
                            <tr>
                                 <%--<th>S. No.</th>--%>
                                   <th id="hidePselect_all"  ><input type="checkbox" id="chkPAll" onclick="checkPAll(this)" /> All</th>
                                 <th>Column Name</th>
                                 <%--<th>Dropdown Value</th>--%>
                                 <th style="display:none"></th>   
                            </tr>
                        </thead>
                        <tbody>
                        <tr>
                        <td id="chkPtd"><input type="checkbox" id="cbP_1"  class="chk_PAll"/></td>
                         <td >  <input type="text" id="txtPField_1" 
                     onchange="RemoveClassItemMaster(this)" onkeyup="Comparevalue(this)"  placeholder="Enter Column Name" class="fieldName"  autocomplete="off"  />      </td>
                    <%-- <td><input type="radio" name="dropdownValue"/></td>--%>
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
<div class="modal fade text-left" id="Conversion" tabindex="-1" role="dialog" aria-labelledby="myModalLabel8"
									 aria-hidden="true" data-backdrop="static" data-keyboard="false">
										<div class="modal-dialog" role="document">
											<div class="modal-content">
												<div class="modal-header bg-primary white">
                                                    <h6 class="white" id="H2">Feild Name : <span class="white" id="Span1"> Column Name</span></h6>
													
													<button type="button" id="Button3" class="close" aria-label="Close">
														<span aria-hidden="true">&times;</span>
													</button>
												</div>
											<div class="modal-body">
												    <div class="row">
                                         
                                            <div class="col-md-12">
                                            <div class="">
    <div class="col-md-8 pull-left">    
    <div class="pdfexport">
                            <button type="button" id="Button4" onclick="Addpopuprow()" class="btn btn-outline-primary" title="Add Line">
                            <i class="fa fa-plus"></i> </button>
                            <button type="button" id="Button5" class="btn btn-outline-primary" title="Delete Line">
                            <i class="fa fa-trash"></i> </button>
                           <button type="button"  id="Button6" class="btn btn-outline-primary" title="Submit">
                            <i class="fa fa-save"></i> </button>
                          
    </div>
    
    
    </div>
    
    </div>
                                                  <div class="table-responsive" id="Div3">
                              <table id="Table1" class="table table-de mb-0">
                        <thead>
                            <tr>
                                 <%--<th>S. No.</th>--%>
                                   <th id="Th1"  ><input type="checkbox" id="Checkbox1" onclick="checkPAll(this)" />All</th>
                                 <th>Column Name</th>
                                 <th style="display:none"></th>   
                            </tr>
                        </thead>
                        <tbody>
                        <tr>
                        <td id="Td1"><input type="checkbox" id="Checkbox2"  class="chk_PAll"/></td>
                         <td >  <input type="text" id="Text1" 
                     onchange="RemoveClassItemMaster(this)" onkeyup="Comparevalue(this)"  placeholder="Enter Column Name" class="fieldName"  autocomplete="off"  />      </td>
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
												<hr>
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

