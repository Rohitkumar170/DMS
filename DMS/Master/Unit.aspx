<%@ Page Language="C#" MasterPageFile="~/DMS.Master" AutoEventWireup="true" CodeBehind="Unit.aspx.cs" Inherits="DMS.Master.Unit" %>

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
     <script src="../JavaScript/UnitMaster.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <input type="hidden" id="hdnLoad"/>
<div class="content-header row">
        <div class="content-header-light col-12">
            <div class="row">
                <div class="content-header-left col-md-6 col-12 mb-2">
                    <h4 class="content-header-title mainheading">
                         Unit</h4>
                </div>
                <div class="content-header-right col-md-6 col-12">
                    <div class="btn-group float-md-right" role="group" aria-label="Button group with nested dropdown">
                         <span class="multifileupload" id="btnupload" style="display:none" > 
                       <i class="fa fa-upload"></i>
               <input type="button" id="upload" value="Import" class="custom-file-input multifileBtn" onclick="Findclick();" />
                           <asp:FileUpload runat="server" Visible="true" ID="FileUpload" onchange="UploadFile(this);" style="display:none" />
                           <asp:Button ID="btnUpload" runat="server" OnClick="btnUpload_Click" OnClientClick="Showloader();"  style="display:none" /> 
                       </span>
                       <button type="button" id="btnnew" class="btn btn-primary">
                            <i class="fa fa-plus-square"></i> Add Unit</button>
                        <button type="button" id="btnsubmit" style="display:none"  class="btn btn-primary">
                            <i class="fa fa-save"></i> Submit</button>
                        <button type="button" id="btnback" style="display:none"  class="btn btn-primary"   >
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
           <div class="row match-height" id="unitForm"  style="display:none" >
          
                <div class="col-12 col-xl-12 ">                    
                    <div class="card">
                        <div class="card-content">
                      <div class="row  pl-1 mt-1 headerDropdown ">
    <div class="col-md-6 pull-left">    
    <div class="pdfexport">
   <button type="button" id="btnAdd" onclick="AddRow()" class="btn btn-primary waves-effect waves-light">
                            <i class="fa fa-plus"></i> Add Line</button>
                            <button type="button" id="btnDeleteLine" class="btn btn-primary waves-effect waves-light">
                            <i class="fa fa-trash"></i> Delete Line</button>
                            <button type="button" id="Button1" class="btn btn-primary waves-effect waves-light">
                            <i class="fa fa-file"></i> Export</button>
                            <button type="button" id="Button2" class="btn btn-primary waves-effect waves-light">
                            <i class="fa fa-print"></i> PDF</button>    
                          
    </div>
  
    
    </div>
    
                                            </div>
                       <div class="table-responsive" id="Div1">
                              <table id="tblUnit" class="table table-de mb-0">
                        <thead>
                            <tr>
                                <th style="display:none"> </th>
                                <th id="hidePselect_all"><input type="checkbox" id="chkPAll" onclick="">All</th>
                                 <th>  Unit Name</th>
                                  <th>  Unit Code</th>
                                 <th>Description</th>   
                            </tr>
                        </thead>
                        <tbody>
                        <tr>
                        <td  style="display:none">1</td>
                        <td id="chkPtd"><input type="checkbox" id="cb_1" class="chk_PAll" /></td>
                         <td>  <input type="text" id="txtUnit_1" onchange="" onkeypress='RemoveClass(this)' placeholder="Enter Unit Name" class="fieldName" autocomplete="off" />      </td>
                             <td>  <input type="text" id="txtUnitcode_1" onchange="" onkeypress='RemoveClass(this)' placeholder="Enter Unit Code" class="fieldName" autocomplete="off" />      </td>
                     <td><input type="text" id="txtDesc_1" onchange="" onkeypress='RemoveClass(this)' placeholder="Enter Description" autocomplete="off" /></td> 
                        </tr>
                         
                           
                        </tbody>
                    </table>
                            </div>
           
                        
                        </div>
                    </div>
                </div>
            </div>
            <div class="row match-height" id="unitGrid" >
          
                <div class="col-12 col-xl-12 ">                    
                    <div class="card">
                        <div class="card-content">
                  <div class="card-body">

            <ul class="nav nav-tabs nav-underline no-hover-bg">
            <li class="nav-item">
								<a class="nav-link active" id="base-tab32" data-toggle="tab" aria-controls="tab32" href="#tab32" aria-expanded="false">Custom</a>
							</li>
							<li class="nav-item">
								<a class="nav-link " id="base-tab31" data-toggle="tab" aria-controls="tab31" href="#tab31" aria-expanded="true">Standard</a>
							</li>
							
							
						</ul>
						<div class="tab-content px-1 pt-1">
                        	<div class="tab-pane active" id="tab32" aria-labelledby="base-tab32">
								 <div class="">
    <div class="col-md-7 pull-left">    
    <div class="pdfexport">
   <button type="button" id="Button3" class="btn btn-primary waves-effect waves-light">
                            <i class="fa fa-file"></i> Export</button>
                            <button type="button" id="Button4" class="btn btn-primary waves-effect waves-light">
                            <i class="fa fa-print"></i> PDF</button>
                          
                          
    </div>
    
    
    </div>
    <div class="col-md-2 pull-left">   <div class="searchDropdown">
         
            <label class="showLebel">  Show Records :</label>
			<select id="Select1" class=" form-control showrecords pull-right">
												<option>2 </option>
                                                <option>5 </option>
                                                <option>50 </option>
												<option>100 </option>
												<option>150</option>
                                                <option>200</option>
                                                 <option>500</option>
                                                </select>		
					
     </div>  </div>
    <div class="col-md-3 pull-right ">
    
                           
    <div class="searchbox pull-right">
    
                                   <div class="dropdown ">
							<div class="dropdown-menu checkboxSearch" id="Div2">
							<div class="columnList" id="DivSearch">
							
                                </div>
							
							</div>
                            
						</div>
                        <fieldset class=" position-relative" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <input type="text" class="form-control round " placeholder="Search" autocomplete="off" id="Text1">
                            <div class="form-control-position">
                                <i class="fa fa-search"></i>
                            </div>
                            
                        </fieldset></div>
</div></div>
                           <div class="table-responsive">
                             <table class="table table-de mb-0" id="tblUnitGrid">
                <thead>
                            <tr>
                                <th style="display:none"></th>
                                <th><input type ="checkBox" id ="CheckAll"> All</th>
                                <th>Units</th>
                                 <th>UnitCode</th>
                                <th>Description</th>
                            </tr>
                        </thead>
                      <tbody>
                      </tbody>
                
              </table>

              </div>
                        <span class="showMsg  pull-right">Showing <label id="lblRowCount1"></label> of <label id="lblTotalCount1"></label></span>
                        <p class="text-center mt-1">
                            <span class="load" id="btnLoadMore1">Load More.....</span> </p> 
							</div>
							<div role="tabpanel" class="tab-pane " id="tab31" aria-expanded="true" aria-labelledby="base-tab31">
                            <div class="nav-vertical">
							<ul class="nav nav-tabs nav-left flex-column" id="UnitClass">
								<%--<li class="nav-item">
									<a class="nav-link active" id="baseVerticalLeft-tab1" data-toggle="tab" aria-controls="tabVerticalLeft1" href="#tabVerticalLeft1" aria-expanded="true">Mass</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" id="baseVerticalLeft-tab2" data-toggle="tab" aria-controls="tabVerticalLeft2" href="#tabVerticalLeft2" aria-expanded="false">Volume</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" id="baseVerticalLeft-tab3" data-toggle="tab" aria-controls="tabVerticalLeft3" href="#tabVerticalLeft3" aria-expanded="false">Length </a>
								</li>--%>
							</ul>
							<div class="tab-content px-1">
								<div role="tabpanel" class="tab-pane active" id="tabVerticalLeft1" aria-expanded="true" aria-labelledby="baseVerticalLeft-tab1">
									<div class="container Tabtable">
								 <div class="row">
    <div class="col-md-6 pull-left">    
    <div class="pdfexport pl-1">
   <button type="button" id="btnExport" class="btn btn-primary waves-effect waves-light">
                            <i class="fa fa-file"></i> Export</button>
                            <button type="button" id="btnPdf" class="btn btn-primary ">
                            <i class="fa fa-print"></i> PDF</button>
                             <button type="button" id="btnShowUnitConv" class="btn btn-primary ">
                            <i class="fa fa-exchange"></i> Unit Conversion</button>
                          
                          
    </div>
    
    
    </div>
    <div class="col-md-3 pull-left">   <div class="searchDropdown">
         
            <label class="showLebel">  Show Records :</label>
			<select id="ddlLoadMore" class=" form-control showrecords pull-right">
												<option>2 </option>
                                                <option>5 </option>
                                                <option>50 </option>
												<option>100 </option>
												<option>150</option>
                                                <option>200</option>
                                                 <option>500</option>
                                                </select>		
					
     </div>  </div>
    <div class="col-md-3 pull-right ">
    
                           
    <div class="searchbox">
    
                                   <div class="dropdown ">
							<div class="dropdown-menu checkboxSearch" id="">
							<div class="columnList" id="DivSearch">
							
                                </div>
							
							</div>
                            
						</div>
                        <fieldset class=" position-relative" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <input type="text" class="form-control round " placeholder="Search" autocomplete="off" id="searchText">
                            <div class="form-control-position">
                                <i class="fa fa-search"></i>
                            </div>
                            
                        </fieldset></div>
</div></div>
                           <div class="table-responsive">
                             <table class="table table-de mb-0" id="stndUnit">
                <thead>
                            <tr>
                                 <th style="display:none"></th>
                                <th><input type="checkBox" id="chkAll" > All</th>
                                <th>UnitName</th>
                            </tr>
                        </thead>
                      <tbody>
                            <%--<tr>  
                                 <td>1</td>
                                 <td>1 kilogram </td>
                                 <td>1000 gram </td>
                                 
                            </tr>
                             <tr>  
                                 <td>2</td>
                                 <td>5 kilogram </td>
                                 <td>5000 gram </td>
                                 
                            </tr> 
                             <tr>  
                                 <td>3</td>
                                 <td>1 kilogram </td>
                                 <td>1000000 miligram</td>
                                 
                            </tr>
                           --%>
                      </tbody>
                    
              </table>

              </div>
                        <span class="showMsg  pull-right">Showing <label id="lblRowCount2"></label> of <label id="lblTotalCount2"></label></span>
                        <p class="text-center mt-1">
                            <span class="load" id="btnLoadMore2">Load More.....</span> </p> 
                            </div>
								</div>
								<div class="tab-pane" id="tabVerticalLeft2" aria-labelledby="baseVerticalLeft-tab2">
										<div class="container Tabtable">
								 <div class="row">
    <div class="col-md-6 pull-left">    
    <div class="pdfexport pl-1">
   <button type="button" id="Button5" class="btn btn-primary waves-effect waves-light">
                            <i class="fa fa-file"></i> Export</button>
                            <button type="button" id="Button6" class="btn btn-primary waves-effect waves-light">
                            <i class="fa fa-print"></i> PDF</button>
                          
                          
    </div>
    
    
    </div>
    <div class="col-md-3 pull-left">   <div class="searchDropdown">
         
            <label class="showLebel">  Show Records :</label>
			<select id="Select2" class=" form-control showrecords pull-right">
												<option>2 </option>
                                                <option>5 </option>
                                                <option>50 </option>
												<option>100 </option>
												<option>150</option>
                                                <option>200</option>
                                                 <option>500</option>
                                                </select>		
					
     </div>  </div>
    <div class="col-md-3 pull-right ">
    
                           
    <div class="searchbox">
    
                                   <div class="dropdown ">
							<div class="dropdown-menu checkboxSearch" id="Div4">
							<div class="columnList" id="Div5">
							
                                </div>
							
							</div>
                            
						</div>
                        <fieldset class=" position-relative" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <input type="text" class="form-control round " placeholder="Search" autocomplete="off" id="Text2">
                            <div class="form-control-position">
                                <i class="fa fa-search"></i>
                            </div>
                            
                        </fieldset></div>
</div></div>
                           <div class="table-responsive">
                             <table class="table table-de mb-0" id="Table2">
                <thead>
                            <tr>
                                 
                                <th>S.No.</th>
                                <th>From</th>
                                <th>To</th>
                               
                               
                            </tr>
                        </thead>
                      <tbody>
                            <tr>  
                                 <td>1</td>
                                 <td>1 liter </td>
                                 <td>1000 mililiter </td>
                                 
                            </tr>
                             <tr>  
                                 <td>2</td>
                                 <td>1 liter </td>
                                 <td>61.0237 cubic inch </td>
                                 
                            </tr> 
                             <tr>  
                                 <td>3</td>
                                 <td>1 liter </td>
                                 <td>0.264172 US liquid gallon</td>
                                 
                            </tr>
                           
                      </tbody>
                      </tbody>
              </table>

              </div>
                        <span class="showMsg  pull-right">Showing <label id="Label3"></label> of <label id="Label4"></label></span>
                        <p class="text-center mt-1">
                            <span class="load" id="volumeLoadMore">Load More.....</span> </p> 
                            </div>
								</div>
								<div class="tab-pane" id="tabVerticalLeft3" aria-labelledby="baseVerticalLeft-tab3">
										<div class="container Tabtable">
								 <div class="row">
    <div class="col-md-6 pull-left">    
    <div class="pdfexport pl-1">
   <button type="button" id="Button7" class="btn btn-primary waves-effect waves-light">
                            <i class="fa fa-file"></i> Export</button>
                            <button type="button" id="Button8" class="btn btn-primary waves-effect waves-light">
                            <i class="fa fa-print"></i> PDF</button>
                          
                          
    </div>
    
    
    </div>
    <div class="col-md-3 pull-left">   <div class="searchDropdown">
         
            <label class="showLebel">  Show Records :</label>
			<select id="Select3" class=" form-control showrecords pull-right">
												<option>2 </option>
                                                <option>5 </option>
                                                <option>50 </option>
												<option>100 </option>
												<option>150</option>
                                                <option>200</option>
                                                 <option>500</option>
                                                </select>		
					
     </div>  </div>
    <div class="col-md-3 pull-right ">
    
                           
    <div class="searchbox">
    
                                   <div class="dropdown ">
							<div class="dropdown-menu checkboxSearch" id="Div6">
							<div class="columnList" id="Div7">
							
                                </div>
							
							</div>
                            
						</div>
                        <fieldset class=" position-relative" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <input type="text" class="form-control round " placeholder="Search" autocomplete="off" id="Text3">
                            <div class="form-control-position">
                                <i class="fa fa-search"></i>
                            </div>
                            
                        </fieldset></div>
</div></div>
                           <div class="table-responsive">
                             <table class="table table-de mb-0" id="Table3">
                <thead>
                            <tr>
                                 
                                <th>S.No.</th>
                                <th>From</th>
                                <th>To</th>
                               
                               
                            </tr>
                        </thead>
                      <tbody>
                            <tr>  
                                 <td>1</td>
                                 <td>1 meter </td>
                                 <td>100 centimeter </td>
                                 
                            </tr>
                             <tr>  
                                 <td>2</td>
                                 <td>1 meter</td>
                                 <td>3.28084 foot </td>
                                 
                            </tr> 
                             <tr>  
                                 <td>3</td>
                                 <td>1 kilometer </td>
                                 <td>1000 meter</td>
                                 
                            </tr>
                           
                      </tbody>
                      </tbody>
              </table>

              </div>
                        <span class="showMsg  pull-right">Showing <label id="Label5"></label> of <label id="Label6"></label></span>
                        <p class="text-center mt-1">
                            <span class="load" id="lengthLoadMore">Load More.....</span> </p> 
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
               
        </div>
    
    </div>
     <label id="lblUserId" runat="server" style="display: none">
        </label>
    </div>

     <div class="modal fade text-left" id="conversionpopup" tabindex="-1" role="dialog" aria-labelledby="myModalLabel8"
									 aria-hidden="true" data-backdrop="static" data-keyboard="false">
										<div class="modal-dialog modal-lg" role="document">
											<div class="modal-content">
												<div class="modal-header bg-primary white">
                                                    <h6 class="white" id="H4">  Conversion  :<label class="white" id="conversioname"></label></h6>
													
													<button type="button" id="btnclose" class="close" aria-label="Close">
														<span aria-hidden="true">&times;</span>
													</button>
												</div>
											<div class="modal-body">
												   
												  <div class="row" id="viewList">
                                         <div class="  pl-1   ">
    <div class=" pull-left">    
   
       <button type="button" id="Button10" class="btn btn-primary waves-effect waves-light">
                            <i class="fa fa-file"></i> Export</button>
                            <button type="button" id="Button11" class="btn btn-primary waves-effect waves-light">
                            <i class="fa fa-print"></i> PDF</button>    
                        
    </div>
    
    
    
                                            </div>
                                      
 <div class="table-responsive">
                            <table class="table table-de mb-0 mt-1" id="tblpopunitConversion">
                        <thead>
                            <tr>
                                 <th><input type="checkbox" id="ChkAll" onclick=""/> All</th>
                                 <th>Value</th>
                                  <th>From Unit</th>
                                 <th>To Unit</th>
                                <th>Converted Value</th>
                            </tr>
                        </thead>
                      <tbody>
                           
                      </tbody>
                          
                    </table>

                            </div> 
                                          
                                        </div>
											</div>
										</div>
									</div>
                                    </div>
             <script type="text/javascript">

//                 jquery_1_11_3_min_p(document).ready(function () {

//                     jquery_1_11_3_min_p("#btnnew").click(function () {
//                                          $("#unitForm").css('display', 'block');
//                                          $("#unitGrid").css('display', 'none');
//                                      })
//                                      jquery_1_11_3_min_p("#btnback").click(function () {
//                                          $("#unitForm").css('display', 'none');
//                                          $("#unitGrid").css('display', 'block');
//                                      })
//                 })

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

