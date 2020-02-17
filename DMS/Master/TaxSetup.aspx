<%@ Page Language="C#" MasterPageFile="~/DMS.Master" AutoEventWireup="true" CodeBehind="TaxSetup.aspx.cs" Inherits="DMS.Master.TaxSetup" %>

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
   
    <script src="../JavaScript/Taxgroupsetup.js" type="text/javascript"></script>
    <style>
    .ui-datepicker-calendar table tr:nth-child(even) {
    background: none !important;
}
#TxHistorygrd td:nth-child(4), #TxHistorygrd th:nth-child(4) {
    white-space: nowrap;
    width: 120px;
    overflow: hidden;
    text-overflow: ellipsis;
}
#rulesVerify .k-dropdown{    width: 78% !important;}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<input type="hidden" id="hdnLoad"/>
<input type="hidden" id="hdnLoad1"/>
<div class="content-header row">
        <div class="content-header-light col-12">
            <div class="row">
                <div class="content-header-left col-md-6 col-12 mb-2">
                    <h4 class="content-header-title mainheading">
                          Tax Group Setup </h4>
                </div>
                <div class="content-header-right col-md-6 col-12">
                    <div class="btn-group float-md-right" role="group" aria-label="Button group with nested dropdown">
                       <button type="button" id="btnnew" class="btn btn-primary">
                            <i class="fa fa-plus-square"></i> New</button>
                             <button type="button"  id="btnformSubmit" style="display:none" class="btn btn-primary">
                            <i class="fa fa-save"></i> Submit</button>
                            <%--  <button type="button" id="btndesable" style="display:none"  class="btn btn-primary">
                            <i class="fa-disabled"></i> Disable</button>--%>
                        <button type="button"  id="btnback" style="display:none"  class="btn btn-primary" >
                           <i class="fa fa-arrow-left"></i> Back</button>
                                     <button type="button" id="btncal" style="display:none"  class="btn btn-primary">
                            <i class="fa fa-calculator"></i> GST Calculator</button>
                       
                      
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
        <section id="CreateSequenceNew" style="display:none" >
                <div class="row match-height">
                   <div class="col-12 col-xl-12 ">                    
                    <div class="card">
                        <div class="card-content">
                        <div class="card-body" style="padding-top: 5px;padding-bottom: 2px;">
           <%--  <div class="card-text">
 <div class="row ">
<div class="content-header-right col-md-12">
                    <div class="btn-group float-md-right" role="group">
                            <button type="button" id="" class="btn btn-primary" data-toggle="modal" data-Target="#rulesPopup">
                            <i class="fa fa-plus"></i> Create Rule</button>
                              <button type="button" id="btnother2" class="btn btn-primary waves-effect waves-light">
                            <i class="fa fa-save"></i> Button1</button>
                    </div>
                </div>
</div>
                                    </div>--%>
                         <div class="form-body "  >
                                       
                                     <%--   <div class="row">
                                       <div class="col-md-12"  >
                                       <h6 class="form-section">Tax Setup <label id="lblfieldname"></label></h6>
                                         </div>
                                          <div class="col-md-3"  >
                                            <div class="form-group">                                                   
                                                    <label for="GroupName"> Group Name</label>
                                                     <input type="text"  class="form-control" placeholder="Enter Group Name" />
                                                </div>
                                          </div>
                                          <div class="col-md-3"  >
                                           <div class="form-group">                                                   
                                                    <label for="Description"> Description</label>
                                                     <input type="text"  class="form-control" placeholder="Enter Description" />
                                                </div>
                                          </div>
                                          <div class="col-md-3 " >
                                                <div class="form-group">
                                                  <label for="ItemGroup">Tax Mode</label>
                                                   <input type="text" id="ddlgst"  class="form-control" />
                                                  
                                                <select id="GSTValue" class="form-control">
												<option value="GST">GST</option>
                                                <option value="VAT">VAT</option>
												<option value="Textbox">TDS</option>                                        
                                                </select>
                                                </div>
                                            </div>
                                            <div class="col-md-3 " >
                                                <div class="form-group">
                                                  <label for="ItemGroup">Tax Type</label>
                                                   <input type="text" id="ddltaxtype"  class="form-control" />
                                                <select id="Select2" class="form-control">
												<option value="Exclusive">Exclusive</option>
                                                <option value="Inclusive">Inclusive</option>
                                                </select> 
                                                </div>
                                            </div> 
                                        
                                        </div>--%>
                                      
                                          <div class="row">
                                       <div class="col-md-12"  >
                                       <h6 class="form-section">Tax Setup <label id="lblfieldname"></label></h6>
                                         </div>
                                          <div class="col-md-3"  >
                                            <div class="input-group input-group-sm">
								                   <div class="input-group-prepend">
								                     <span class="input-group-text">Group Name</span>
								                   </div>
								                  <input type="text" id="txtgrpName" onkeypress= "RemoveClass(this)" class="form-control" placeholder="Enter Group Name"/>
							                    </div>
                                          </div>
                                          <div class="col-md-3"  >
                                          <div class="input-group input-group-sm">
								                   <div class="input-group-prepend">
								                     <span class="input-group-text">Description</span>
								                   </div>
								                  <input type="text" id="txtdesc" onkeypress= "RemoveClass(this)" class="form-control" placeholder="Enter Description"/>
							                    </div>
                                          </div>
                                          <div class="col-md-3 " >
                                              <div class="input-group input-group-sm">
								                   <div class="input-group-prepend">
								                     <span class="input-group-text">Tax Mode</span>
								                   </div>
                                                    <input type="text" id="ddlgst"  class="form-control" />
								                <%-- <select id="GSTValue" class="form-control">
												<option value="GST">GST</option>
                                                <option value="VAT">VAT</option>
												<option value="Textbox">TDS</option>                                        
                                                </select>--%>
							                    </div>
                                            </div>
                                            <div class="col-md-3 ">
                                                 <div class="input-group input-group-sm">
								                   <div class="input-group-prepend">
								                     <span class="input-group-text">Default Tax Type</span>
								                   </div>
                                                   <input type="text" id="ddltaxtype"  class="form-control" />
								                 <%-- <select id="Select2" class="form-control">
												<option value="Exclusive">Exclusive</option>
                                                <option value="Inclusive">Inclusive</option>
                                                </select> --%>
							                    </div>
                                            </div> 
                                        
                                        </div>
                                        <div class="row mt-1">
                                         <div class="col-md-12"  >
                                         
                                         <h6 class="form-section">Tax Rule </h6>
                                         </div>
                                           <div class="col-md-3">
                                               <div class="input-group input-group-sm">
								                   <div class="input-group-prepend pl-1">
								                     <span class="input-group-text">From Date</span>
								                   </div>
								                  <input type="text"  autocomplete="off" onchange="RemoveClass(this)" class="form-control dp-month-year" id="txtFromDate" placeholder="From Date">
							                    </div>
                                            </div>
                                               <div class="col-md-3">
                                               <div class="input-group input-group-sm">
								                   <div class="input-group-prepend pl-1">
								                     <span class="input-group-text">To Date</span>
								                   </div>
								                  <input type="text" autocomplete="off" id="txtTodate" onchange="RemoveClass(this)" class="form-control dp-month-year" placeholder="To Date"/>
							                    </div>
                                            </div>
                                          <div class="col-md-6"  >
                                          <div class="input-group input-group-sm">
								                   <div class="input-group-prepend pl-1">
								                     <span class="input-group-text">Tax Value</span>
								                   </div>
								                  <input type="text" class="form-control " autocomplete="off" id="txtgstclose" onchange ="RemoveClass(this)" readonly='readonly' placeholder="Formula" onclick="Showpopup(this)"  />
							                    </div>
                                          </div>
                                    <%--      <div class="col-md-3"  >
                                           <div class="form-group">                                                   
                                                    <label for="Value"> Value</label>
                                                     <input type="text"  class="form-control" placeholder="Enter Value in %" /  data-toggle="modal" data-target="#CalculatorPopup">
                                                </div>
                                          </div>--%>
                                         
                                  <%--        <div class="col-md-3 " >
                                                <div class="form-group">
                                                  <label for="ItemGroup">Select Mode</label>
                                                 <select id="Select3" class="form-control">
												<option value="SellingPrice">Selling Price</option>
                                                <option value="Cost Price">Cost Price</option>
												<option value="Discount">Discount</option>
                                                <option value="Cost Price">Surcharge</option>
												<option value="Discount">Invoice Net</option>                                         
                                                </select>
                                                </div>
                                            </div>--%>
                                          
                                        
                                        </div>
                                     
                                     <div class="row"> 
                                    <%--  <div class="col-md-4">
                                            <div class="row gstGroup"> 
                                             <div class="col-md-12">
                                            <h6 class="form-section">Effective Date</h6>
                                             </div>
                                          <div class="col-md-4">
                                                <div class="form-group">
                                                     <label for="FromDate">From Date</label>
                                                     <input type="text" class="form-control dp-month-year " placeholder="From Date" >
                                                </div>
                                            </div>
                                               <div class="col-md-4">
                                                <div class="form-group">
                                                     <label for="FromDate">To Date</label>
                                                     <input type="text" class="form-control dp-month-year " placeholder="To Date" >
                                                </div>
                                            </div>
                                           
                                         
                                           </div>
                                            </div>--%>
                                            <div class="col-md-6">
                                            <div class="row gstGroup" > 
                                             <div class="col-md-12">
                                            <h6 class="form-section">Intra State</h6>
                                             </div>
                                        <div class="full-width" id="IntraDivappend">
                                          <%--  <div class="col-md-12">
                                                <div class="input-group input-group-sm">
								                   <div class="input-group-prepend">
								                     <span class="input-group-text" >SGST</span>
								                   </div>
								                  <input type="text" class="form-control" placeholder="SGST in %" data-toggle="modal" data-target="#CalculatorPopup" >
							                    </div>
                                           </div>
                                                <div class="col-md-12">
                                                <div class="input-group input-group-sm">
								                   <div class="input-group-prepend">
								                     <span class="input-group-text" >CGST</span>
								                   </div>
								                  <input type="text" class="form-control" placeholder="CGST in %" >
							                    </div>
                                           </div>
                                            <div class="col-md-12">
                                                <div class="input-group input-group-sm">
								                   <div class="input-group-prepend">
								                     <span class="input-group-text">IGST</span>
								                   </div>
								                  <input type="text" class="form-control" placeholder="IGST in %" >
							                    </div>
                                           </div>
                                             <div class="col-md-12">
                                                <div class="input-group input-group-sm">
								                   <div class="input-group-prepend">
								                     <span class="input-group-text" >Surcharge 1</span>
								                   </div>
								                  <input type="text" class="form-control" placeholder="Surcharge in %" >
							                    </div>
                                           </div>
                                             <div class="col-md-12">
                                                <div class="input-group input-group-sm">
								                   <div class="input-group-prepend">
								                     <span class="input-group-text">Surcharge 2</span>
								                   </div>
								                  <input type="text" class="form-control" placeholder="Surcharge in %" >
							                    </div>
                                           </div>--%>
                                          </div>
                                           </div>
                                            </div>
                                          <div class="col-md-6">
                                          <div class="row gstGroup"> 
                                                    <div class="col-md-12">
                                            <h6 class="form-section">Inter State</h6>
                                             </div>
                                             <div class="full-width" id="InterDivappend">
                                            <%-- <div class="col-md-12">
                                                <div class="input-group input-group-sm">
								                   <div class="input-group-prepend">
								                     <span class="input-group-text" >SGST</span>
								                   </div>
								                  <input type="text" class="form-control" placeholder="SGST in %" >
							                    </div>
                                           </div>
                                                <div class="col-md-12">
                                                <div class="input-group input-group-sm">
								                   <div class="input-group-prepend">
								                     <span class="input-group-text" >CGST</span>
								                   </div>
								                  <input type="text" class="form-control" placeholder="CGST in %" >
							                    </div>
                                           </div>
                                            <div class="col-md-12">
                                                <div class="input-group input-group-sm">
								                   <div class="input-group-prepend">
								                     <span class="input-group-text">IGST</span>
								                   </div>
								                  <input type="text" class="form-control" placeholder="IGST in %" >
							                    </div>
                                           </div>
                                             <div class="col-md-12">
                                                <div class="input-group input-group-sm">
								                   <div class="input-group-prepend">
								                     <span class="input-group-text" >Surcharge 1</span>
								                   </div>
								                  <input type="text" class="form-control" placeholder="Surcharge in %" >
							                    </div>
                                           </div>
                                             <div class="col-md-12">
                                                <div class="input-group input-group-sm">
								                   <div class="input-group-prepend">
								                     <span class="input-group-text">Surcharge 2</span>
								                   </div>
								                  <input type="text" class="form-control" placeholder="Surcharge in %" >
							                    </div>
                                           </div>--%>
                                            </div>
                                             </div>
                                             </div>
                                            </div>  
                                     <div class="row">
                                               <div class="col-md-12">
                                                 <button type="button" id="btnConfirm" class="btn btn-primary pull-right" style="margin:0 0 0 3px" >
                            <i class="fa fa-save"></i> Confirm</button>
                                             <h6 class="form-section">History</h6>
                                            </div>
    <div class="col-md-7 ">    
    <div class="pdfexport">
   <button type="button" id="Button3" class="btn btn-outline-primary" title="Export">
                            <i class="fa fa-file-excel-o"></i> </button>
                            <button type="button" id="Button4" class="btn btn-outline-primary" title="PDF">
                            <i class="fa fa-file-pdf-o"></i> </button>
                          
                          
    </div>
    
    
    </div>
    <div class="col-md-3 ">   <div class="searchDropdown">
         
            <label class="showLebel">  Show Records :</label>
			<select id="Select4" class=" form-control showrecords pull-right">
												<option>2 </option>
                                                <option>5 </option>
                                                <option>50 </option>
												<option>100 </option>
												<option>150</option>
                                                <option>200</option>
                                                 <option>500</option>
                                                </select>		
					
     </div>  </div>
    <div class="col-md-2  ">
    
                           
    <div class="searchbox">
   
                                   <div class="dropdown">
							<div class="dropdown-menu checkboxSearch" id="Div3">
							<div class="columnList" id="Div4">
							
                          
								<div class="dropdown-item">
									<span class="skin skin-polaris">
										<input type="checkbox" id="Checkbox6" checked="">
										<label for="check3" class="coldata">All</label>
									</span>
								</div>
								<div class="dropdown-item">
									<span class="skin skin-polaris">
										<input type="checkbox" id="Checkbox7">
										<label for="check4" class="coldata">Field Name</label>
									</span>
								</div>
                            
                                	<div class="dropdown-item">
									<span class="skin skin-polaris">
										<input type="checkbox" id="Checkbox8">
										<label for="check4" class="coldata">Entity</label>
									</span>
								</div>
                                </div>
                                <div class="dropdownBottom">
                                <label class="pull-left" id="Label3">Select All</label>
                                  <label class="pull-right" id="Label4">Reset</label>
                                </div>
							</div>
                            
						</div>
                        <fieldset class=" position-relative" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <input type="text" class="form-control round " placeholder="Search" autocomplete="off" id="Text2">
                            <div class="form-control-position">
                                <i class="fa fa-search"></i>
                            </div>
                            
                        </fieldset></div>
</div>
</div>
<div class="row">
                                            <div class="col-md-12">
                                               <div class="table-responsive full-width">
                             <table class="table table-de mb-0 clickableRow" id="TxHistorygrd">
                <thead>
                  <tr>
                    <th class="active"><input type="checkbox" id="Checkbox9" onclick="checkAll(this)"> All</th>                
                    <th>From Date</th>
                    <th>To Date</th>
                    <th>GST Formula</th>
                     <th>Status</th>
                  </tr>
                </thead>
                <tbody>
             <%-- <tr>
              <td><input type="checkbox" id="Checkbox10" onclick="checkAll(this)"></td>
              <td>10-02-2018</td>
              <td>10-02-2019</td>
              <td>18%</td>
              </tr>
                <tr>
              <td><input type="checkbox" id="Checkbox11" onclick="checkAll(this)"></td>
              <td>10-02-2018</td>
              <td>10-02-2019</td>
              <td>28%</td>
              </tr>
               
               </tbody>--%>
              </table>

              </div>

                        <span class="  pull-right">Showing <label id="lblRowCount1"></label> of <label id="lblTotalCount1"></label></span>
                        <p class="text-center mt-1">
                            <span class="load" id="btnLoadMore1">Load More.....</span> </p> 
                                            </div>
											</div>
                                    <%--  <div class="row " id="add" style="display:block">
                                       <div class="col-md-12 ">
                                      
                                        <button type="button" id="btnadd" disabled  class="btn btn-primary pull-right mb-1 waves-effect waves-light">
                            <i class="fa fa-plus-square"></i> Add</button>
                                   

                                       </div>
                                       </div>--%>
                                   </div>
                                   <div class="noData" style="display: none;">
                                   <div class="row">
                                    <div class="col-md-12 pt-5 text-center">
                                   <span class=" noDataMsg "><i class="fa fa-exclamation-triangle" aria-hidden="true"></i> Please select above options first !!!</span>
                                   </div>
                                   </div>
                                   </div>
           </div>
                        
                        </div>
                    </div>
                </div>
                </div>
            </section>
            <div class="row match-height" id="itemTaxGroupGrid" >
          
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
                             <table  class="table table-de mb-0 clickableRow" id="itemTaxtbl">
                <thead>
                  <tr>
                   <th style="display:none"></th>
                    <th><input type="checkbox" id="chkAll" onclick="checkAll(this)"> All</th>
                    <th>Group Code</th>
                    <th>Group Name</th>
                    <th>Description</th>
                    <th>Tax Mode</th>
                    <th>Country Name</th>
                
                
                   
                  </tr>
                </thead>
               <tbody>
              <%-- <tr>
               <td><input type="checkbox"></td>
               <td>CD001</td>
               <td>GST @ 28%</td>
              
                <td>Item 1</td>
               <td>GST</td>
           
               </tr>
                 <tr>
               <td><input type="checkbox"></td>
               <td>CD002</td>
               <td>GST @ 18%</td>
              
                <td>Item 1</td>
               <td>GST</td>
             
               </tr>
                 <tr>
               <td><input type="checkbox"></td>
               <td>CD003</td>
               <td>VAT @ 18%</td>
               
                <td>Item 1</td>
               <td>VAT</td>
              
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
    
    </div>

     <label id="lblUserId" runat="server" style="display: none">
        </label>
    </div>
      <div class="modal fade text-left" id="rulesVerify" tabindex="-1" role="dialog" aria-labelledby="myModalLabel8"
									 aria-hidden="true" >
										<div class="modal-dialog " role="document">
											<div class="modal-content">
												<div class="modal-header bg-primary white">
                                                    <h6 class="white" >  Verify Formula  </h6>
													
													<button type="button" id="btncloseformula" class="close" aria-label="Close">
														<span aria-hidden="true">&times;</span>
													</button>
												</div>
											<div class="modal-body">
                                            <div class="row">
                                                                               
    <div class="col-md-12 ">   
    <div class="input-group input-group-sm">
								                   <div class="input-group-prepend">
								                     <span class="input-group-text">Select Formula</span>
								                   </div>
                                                   <input type="text" id="ddlformula"/>
							                    </div>
    </div>
    <div class="col-md-12 mt-1">
                                       <h6 class="form-section">Tax Value <label id="Label1"></label></h6>
                                         </div>
                                            <div class="col-md-12 ">
    
                                                  <div class="table-responsive full-width" >
                              <table id="rulesVariables" class="table table-de mb-0">
                      <thead>
                            <tr>
                                 <th> S.No.</th>
                                 <th>  Variables</th>
                                 <th>  Values</th>
                                  <th style="display:none" >  Values</th>
                            </tr>
                        </thead>
                        <tbody>
                       <%-- <tr>
                        <td>1</td>
                        <td>IGST</td>
                        <td><input type="text" placeholder="Enter Value" class="fieldName"></td>
                        </tr>--%>
                        <%--  <tr>
                        <td>2</td>
                        <td>CGST</td>
                        <td><input type="text" placeholder="Enter Value" class="fieldName"></td>
                        </tr>
                         <tr>
                        <td>3</td>
                        <td>SGST</td>
                        <td><input type="text" placeholder="Enter Value" class="fieldName"></td>
                        </tr>--%>
                           
                        </tbody>
                    </table>
                            </div>
                                            </div>
                                           <div class="col-md-12" id="divoutput" style="display:none">
                                           <label>Output 
                                           :</label> <label id="lblout">0</label>
                                           </div>
                                        </div>
                                        <div class="row">
                                         
                                            <div class="col-md-12">
                                            <div class="">
												 <button type="button" id="btnverify" disabled  class="btn btn-primary pull-right ">
                            <i class="fa fa-save"></i> Verify</button>
												</div>
												</div></div>
                                            </div>
											</div>
										</div>
									</div>
    <div class="modal fade text-left" id="CalculatorPopup" tabindex="-1" role="dialog" aria-labelledby="myModalLabel8"
									 aria-hidden="true" >
										<div class="modal-dialog" role="document">
											<div class="modal-content">
												<div class="modal-header bg-primary white">
                                                    <h6 class="white" id="H3">  <span class="white" id="ColumnName"></span></h6>
													
													<button type="button" id="btnclosedata" class="close" aria-label="Close">
														<span aria-hidden="true">&times;</span>
													</button>
												</div>
											<div class="modal-body">												   
                                        	<div class="row outerRow">                                         
                                            <div class="col-md-9">
                                            <div class="row">
                                            <div class="col-md-12">
                                            <div style="padding-bottom: 5px;" id="Divint">
<%--<button type="button" class="btn btn-primary calOperators activeBtn"> 0 </button>
<button type="button" class="btn btn-primary calOperators"> 1 </button>
<button type="button" class="btn btn-primary calOperators"> 2 </button>
<button type="button" class="btn btn-primary calOperators"> 3 </button>
<button type="button" class="btn btn-primary calOperators"> 4 </button>
<button type="button" class="btn btn-primary calOperators"> 5 </button>
<button type="button" class="btn btn-primary calOperators"> 6 </button>
<button type="button" class="btn btn-primary calOperators"> 7 </button>
<button type="button" class="btn btn-primary calOperators"> 8 </button>
<button type="button" class="btn btn-primary calOperators"> 9 </button>--%>
    </div>
                                             <div style="padding-bottom: 10px;border: 0;border-bottom: 1px solid rgba(0,0,0,.12);" id="Divoperator">
                                           <%-- <button type="button"  class="btn btn-primary calOperators"> + </button>
                                            <button type="button"  class="btn btn-primary calOperators"> - </button>
                                            <button type="button"  class="btn btn-primary calOperators"> * </button>
                                            <button type="button"  class="btn btn-primary calOperators"> / </button>
                                            <button type="button"  class="btn btn-primary calOperators"> % </button>
                                             <button type="button"  class="btn btn-primary calOperators"> . </button>
                                            <button type="button"  class="btn btn-primary calOperators"> [ </button>
                                            <button type="button"  class="btn btn-primary calOperators"> ] </button>
                                            <button type="button" class="btn btn-primary calOperators"> ( </button>
                                            <button type="button" class="btn btn-primary calOperators"> ) </button>--%>
                                          
                                            </div>
                                           
											</div>
                                            <div class="col-md-12" >
                             <div class="input-group input-group-sm">
								                   <div class="input-group-prepend">
								                     <span class="input-group-text">Label</span>
								                   </div>
								                  <input type="text" id="txtruleslabel" class="form-control" onchange="RemoveValidation()" placeholder="Enter Label">
							                    </div>
<hr>                   
                                           </div>
                                            <div class="col-md-12 mb-1">
                                            <h6 class="form-section">Rule Preview</h6>
                                            <div class="ruleArea">
                                            <label id="lblrulename"></label>&nbsp;<label id="lblfinalrule"></label>
                                            </div>
											</div>
                                           
                                            <div class="col-md-5">
                                             <button type="button" id="btnclear"  class="btn btn-primary calControl"> Clear </button>
                                              <button type="button" id="btnsubmit"  class="btn btn-primary calControl"> Submit</button>
                                            </div>
                                              <div class="col-md-7" >
                                             <label id="calError" class="pull-right"></label>
                                             </div>
                                             </div>
											</div>
                                            <div class="col-md-3 buttonSidebar">
                                           <div class="row">
                                            <div class="col-md-12" id="divsubcomponenets">
                                            
                                            <%--<button type="button"  class="btn btn-primary calBtn "> Unit Price </button>
                                            <button type="button"  class="btn btn-primary calBtn"> Quantity </button>
                                            <button type="button"  class="btn btn-primary calBtn"> Discount </button>--%>
											</div>
                                            </div>
											</div>
                                            </div>
                                            </div>
											</div>
										</div>
									</div>
   <script type="text/javascript">

       // jquery_1_11_3_min_p(document).ready(function () {

//            jquery_1_11_3_min_p("#btnnew").click(function () {
//                $("#CreateSequenceNew").css('display', 'block');
//                $("#itemTaxGroupGrid").css('display', 'none');
//            })
//            jquery_1_11_3_min_p("#btnback").click(function () {
//                $("#itemTaxGroupGrid").css('display', 'block');
//                $("#CreateSequenceNew").css('display', 'none');
//            })
      //  })

//</script>
 <script>
     jquery_1_11_3_min_p(document).ready(function () {
         $(function () {
             $('#GSTValue').change(function () {
                 //  alert("w");
                 $('.aa')[($("option[value='GST']").is(":checked")) ? "show" : "hide"]();

                 $('#VATValue')[($("option[value='VAT']").is(":checked")) ? "show" : "hide"]();
                
             });

         });

         kendo_all_min_js("#TxHistorygrd").kendoTooltip({
             filter: "td:nth-child(4)",
             position: "right",
             content: function (e) {
                 var text = kendo_all_min_js(e.target).text();
                 return '<div style="width: ' + text.length * .7 + 'em; max-width: 40em">' + text + '</div>';
             }
         });
     });
      </script>  

      <script type="text/javascript">
          $(function () {
              $("#txtFromDate").datepicker({
                  numberOfMonths: 1,
                  minDate: 0,
                  onSelect: function (selected) {
                      var dt = new Date(selected);
                      dt.setDate(dt.getDate() + 1);
                      $("#txtTodate").datepicker("option", "minDate", dt);
                      RemoveClass(this)
                  }
              });
              $("#txtTodate").datepicker({
                  numberOfMonths: 1,
                  minDate: 0,
                  onSelect: function (selected) {
                      var dt = new Date(selected);
                      dt.setDate(dt.getDate() - 1);
                      $("#txtFromDate").datepicker("option", "maxDate", dt);
                       RemoveClass(this);
                  }
              });
          });
</script>
</asp:Content>
