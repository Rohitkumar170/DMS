<%@ Page Language="C#" MasterPageFile="~/DMS.Master" AutoEventWireup="true" CodeBehind="AddressDataSetup.aspx.cs" Inherits="DMS.Master.AddressDataSetup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<script src="../js/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script>        var jquery_1_11_3_min_p = jQuery.noConflict();</script>
    <script src="../js/bootstrap.min.js" type="text/javascript"></script>
    <script>        var bootstrap_min_js = jQuery.noConflict();</script>
    <link href="../Telerix/Style/kendo.default.mobile.min.css" rel="stylesheet" type="text/css" />
    <link href="../Telerix/Style/kendo.common.min.css" rel="stylesheet" type="text/css" />
    <link href="../Telerix/Style/kendo.rtl.min.css" rel="stylesheet" type="text/css" />
    <link href="../Telerix/Style/kendo.default.min.css" rel="stylesheet" type="text/css" />
    <link href="../Telerix/Style/kendo.dataviz.min.css" rel="stylesheet" type="text/css" />
    <link href="../Telerix/Style/kendo.dataviz.default.min.css" rel="stylesheet" type="text/css" />
    <script src="../Telerix/js/angular.min.js"></script>
    <script src="../Telerix/js/kendo.all.min.js"></script>
    <script>        var kendo_all_min_js = jQuery.noConflict();</script>
    <%--<script src="../Telerix/content/shared/js/console.js"></script>--%>
    <script src="../Telerix/js/jquery.min.js"></script>
    <script src="../Telerix/js/jszip.min.js" type="text/javascript"></script>
   <script src="../JavaScript/Setup.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<input type="hidden" id="hdnLoad"/>
<div class="content-header row">
        <div class="content-header-light col-12">
            <div class="row">
                <div class="content-header-left col-md-6 col-12 mb-2">
                    <h4 class="content-header-title mainheading">
                         Address Data Setup</h4>
                </div>
                <div class="content-header-right col-md-6 col-12">
                    <div class="btn-group float-md-right" role="group" aria-label="Button group with nested dropdown">
                       <button type="button" id="btnnew" class="btn btn-primary">
                        <i class="fa fa-plus-square"></i> New</button>
                      
                        <button type="button" id="btnback" style="display:none" class="btn btn-primary" >
                           <i class="fa fa-arrow-left"></i> Back</button>
                      
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
             <section id="vertical-tabs" style="display:none">
	
	<div class="row match-height">
		
		<div class="col-xl-12 col-lg-12">
			<div class="card mainHeight">
				<div class="card-header">
					<%--<h4 class="card-title">Tabs with Icon</h4>--%>
				</div>
				<div class="card-content ">
					<div class="card-body">
						<%--<p>You can also add icons to the tab name.</p>--%>
                       <div class="row  pl-1 hborder headerDropdown ">
    <div class="col-md-4 pull-left">    
   
    
    </div>
    
  
    <div class="col-md-4">
                                                <div class="form-group pull-right ">
                                                   <label class="pr-1">Select Entity</label>
                                                     <input type="text" id="ddlentity" class="fieldName" autocomplete="off">
   
                                                </div>
                                            </div>
<div class="col-md-4">
                                                <div class="form-group pull-right pr-1">
                                                   <label class="pr-1">Select Country</label>
                                                     <input type="text" id="ddlcountry" class="fieldName" autocomplete="off">
   
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
						<div class="nav-vertical pt-1" id ="setupdiv" style="Display:none">
							<ul class="nav nav-tabs nav-left" id="BindField">
                          <%--  <li class="nav-item">
								<a class="nav-link  active" id="A4" data-toggle="tab"  href="#AddressLine1" >  Address 1</a>
								</li>
								<li class="nav-item">
								<a class="nav-link" id="A5" data-toggle="tab" href="#AddressLine2">  Address 2</a>
								</li>
								<li class="nav-item">
								<a class="nav-link " id="A1" data-toggle="tab"  href="#state" >  State</a>
								</li>
								<li class="nav-item">
								<a class="nav-link" id="A2" data-toggle="tab"  href="#city" >  City</a>
								</li>
								<li class="nav-item">
								<a class="nav-link" id="A3" data-toggle="tab" href="#pincode">  Pincode</a>
								</li>--%>
							</ul>
							<div class="tab-content px-1">
                            <div role="tabpanel" class="tab-pane active" id="AddressLine1">
									  <section class="TabSection" id="TabSection1"  >
                <div class="">
                    <div class="">
                        <div class="card">
                       
                            <div class="card-content collapse show" >
                                <div class="pr-1">
                             <div class="">
                              <div class="full-width">    
                             <div class="pdfexport">
                             <button type="button" id="btnAddLine" class="btn btn-primary waves-effect waves-light">
                            <i class="fa fa-plus"></i> Add Line</button>
                            <button type="button" id="Button14" class="btn btn-primary waves-effect waves-light">
                            <i class="fa fa-trash"></i> Delete Line</button>
                             <button type="button" id="Button15" class="btn btn-primary waves-effect waves-light pull-right">
                            <i class="fa fa-file"></i> Export</button>
                            <button type="button" id="Button16"  class="btn btn-primary waves-effect waves-light pull-right cpd">
                            <i class="fa fa-print"></i> PDF</button>
                            
                          
    </div>
    
    
    </div>
    
  </div>
                           <div class="table-responsive full-width" >
                             <table  class="table table-de mb-0"  id="tblFieldValue">
                <thead>
                  <tr>
                  <%--<th >Field Name</th>            
                    <th>Field Id</th>--%>
                    
                  </tr>
                </thead>
              <tbody>
              <%--<tr></tr>--%>
              <%--  <tr id="firstTr">   
                <td > <input type="text" id="txtFieldName_1" placeholder="Enter Field Name" class="fieldName"  autocomplete="off" onkeypress="RemoveClass(this)" />  </td>          
                <td >  <input type="text" id="txtFieldCode_1" placeholder="Enter Field Name" class="fieldName"  autocomplete="off"  onkeypress="RemoveClass(this)" />      </td>
                  
                </tr>--%>
                </tbody>
              <%-- <tr>   
                <td >2</td>          
                <td >  <input type="text" id="Text45" placeholder="Enter Field Name" class="fieldName"  autocomplete="off"  />      </td>
                  
                </tr>
                 <tr>   
                <td >3</td>          
                <td >  <input type="text" id="Text47" placeholder="Enter Field Name" class="fieldName"  autocomplete="off"  />      </td>
                
                </tr>
                 <tr>   
                <td >4</td>          
                <td >  <input type="text" id="Text49" placeholder="Enter Field Name" class="fieldName"  autocomplete="off"  />      </td>
              
                </tr>--%>
              </table>
                <button type="button" id="btnSubmit" style="display:none" class="btn btn-primary pull-right mt-1">
                            <i class="fa fa-save"></i> Submit</button>
              </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
								</div>
								<div role="tabpanel" class="tab-pane " id="">
									  <section class="TabSection"  >
                <div class="">
                    <div class="col-md-12">
                        <div class="card">
                       
                            <div class="card-content collapse show" >
                                <div class="">
                             <div class="">
                              <div class="col-md-12 pull-left">    
                             <div class="pdfexport">
                             <button type="button" id="Button7" class="btn btn-primary waves-effect waves-light">
                            <i class="fa fa-plus"></i> Add Line</button>
                            <button type="button" id="Button8" class="btn btn-primary waves-effect waves-light">
                            <i class="fa fa-trash"></i> Delete Line</button>
                                                 <button type="button" id="Button9" class="btn btn-primary waves-effect waves-light pull-right">
                            <i class="fa fa-file"></i> Export</button>
                            <button type="button" id="Button10" class="btn btn-primary waves-effect waves-light pull-right cpd">
                            <i class="fa fa-print"></i> PDF</button>
                          
    </div>
     <div class="searchDropdown">
         
   
					
					
     </div>
    
    </div>
    
    <div class="col-md-2 pull-right ">
    
                           
  
</div></div>
                           <div class="table-responsive" >
                             <table  class="table table-de mb-0"  id="tblFields">
                <thead>
                  <tr>
                  <th >S.No.</th>            
                    <th>State Name</th>
                    <th>State Code</th>
                  
                   
                  </tr>
                </thead>
              <tbody>
                <tr>   
                <td >1</td>          
                <td >  <input type="text" id="txtField_1" placeholder="Enter Field Name" class="fieldName"  autocomplete="off"  />      </td>
                <td > <input type="text" id="ddlDatatype_1" class="fieldName"  autocomplete="off" />  </td>  
                </tr>
               <tr>   
                <td >2</td>          
                <td >  <input type="text" id="Text1" placeholder="Enter Field Name" class="fieldName"  autocomplete="off"  />      </td>
                <td > <input type="text" id="Text2" class="fieldName"  autocomplete="off" />  </td>  
                </tr>
                 <tr>   
                <td >3</td>          
                <td >  <input type="text" id="Text3" placeholder="Enter Field Name" class="fieldName"  autocomplete="off"  />      </td>
                <td > <input type="text" id="Text4" class="fieldName"  autocomplete="off" />  </td>  
                </tr>
                 <tr>   
                <td >4</td>          
                <td >  <input type="text" id="Text5" placeholder="Enter Field Name" class="fieldName"  autocomplete="off"  />      </td>
                <td > <input type="text" id="Text6" class="fieldName"  autocomplete="off" />  </td>  
                </tr>
              </table>

              </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
								</div>
								<div class="tab-pane" id="city" >
                                <section class="TabSection"  >
                <div class="">
                    <div class="col-md-12">
                        <div class="card">
                       
                            <div class="card-content collapse show" >
                                <div class="">
                             <div class="">
                             <div class="col-md-12 pull-left">    
                             <div class="pdfexport">
                             <button type="button" id="Button1" class="btn btn-primary waves-effect waves-light">
                            <i class="fa fa-plus"></i> Add Line</button>
                            <button type="button" id="Button4" class="btn btn-primary waves-effect waves-light">
                            <i class="fa fa-trash"></i> Delete Line</button>
                                                 <button type="button" id="btnExport" class="btn btn-primary waves-effect waves-light pull-right">
                            <i class="fa fa-file"></i> Export</button>
                            <button type="button" id="btnPdf" class="btn btn-primary waves-effect waves-light pull-right cpd">
                            <i class="fa fa-print"></i> PDF</button>
                          
    </div>
     <div class="searchDropdown">
         
   
					
					
     </div>
    
    </div>
    
    <div class="col-md-2 pull-right ">
    
                           
  
</div></div>
                           <div class="table-responsive" >
                             <table  class="table table-de mb-0"  id="Table1">
                <thead>
                  <tr>
                  <th >S.No.</th>            
                    <th>State Name</th>
                    <th>State Code</th>
                   <th>City Name</th>
                    <th>City Code</th>
                   
                  </tr>
                </thead>
              <tbody>
                <tr>   
                <td >1</td>          
                <td >  <input type="text" id="Text7" placeholder="Enter Field Name" class="fieldName"  autocomplete="off"  />      </td>
                <td > <input type="text" id="Text8" class="fieldName"  autocomplete="off" />  </td> 
                 <td > <input type="text" id="Text23" class="fieldName"  autocomplete="off" />  </td>  
                  <td > <input type="text" id="Text24" class="fieldName"  autocomplete="off" />  </td>   
                </tr>
               <tr>   
                <td >2</td>          
                <td >  <input type="text" id="Text9" placeholder="Enter Field Name" class="fieldName"  autocomplete="off"  />      </td>
                <td > <input type="text" id="Text10" class="fieldName"  autocomplete="off" />  </td> 
                 <td > <input type="text" id="Text25" class="fieldName"  autocomplete="off" />  </td>  
                  <td > <input type="text" id="Text26" class="fieldName"  autocomplete="off" />  </td>    
                </tr>
                 <tr>   
                <td >3</td>          
                <td >  <input type="text" id="Text11" placeholder="Enter Field Name" class="fieldName"  autocomplete="off"  />      </td>
                <td > <input type="text" id="Text12" class="fieldName"  autocomplete="off" />  </td>  
                 <td > <input type="text" id="Text27" class="fieldName"  autocomplete="off" />  </td>  
                  <td > <input type="text" id="Text28" class="fieldName"  autocomplete="off" />  </td>   
                </tr>
                 <tr>   
                <td >4</td>          
                <td >  <input type="text" id="Text13" placeholder="Enter Field Name" class="fieldName"  autocomplete="off"  />      </td>
                <td > <input type="text" id="Text14" class="fieldName"  autocomplete="off" />  </td>  
                 <td > <input type="text" id="Text29" class="fieldName"  autocomplete="off" />  </td>  
                  <td > <input type="text" id="Text30" class="fieldName"  autocomplete="off" />  </td>   
                </tr>
              </table>

              </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
								</div>
								<div class="tab-pane" id="pincode">
                                <section class="TabSection"  >
                <div class="">
                    <div class="col-md-12">
                        <div class="card">
                       
                            <div class="card-content collapse show" >
                                <div class="">
                             <div class="">
                               <div class="col-md-12 pull-left">    
                             <div class="pdfexport">
                             <button type="button" id="Button5" class="btn btn-primary waves-effect waves-light">
                            <i class="fa fa-plus"></i> Add Line</button>
                            <button type="button" id="Button6" class="btn btn-primary waves-effect waves-light">
                            <i class="fa fa-trash"></i> Delete Line</button>
                                                 <button type="button" id="Button11" class="btn btn-primary waves-effect waves-light pull-right">
                            <i class="fa fa-file"></i> Export</button>
                            <button type="button" id="Button12" class="btn btn-primary waves-effect waves-light pull-right cpd">
                            <i class="fa fa-print"></i> PDF</button>
                          
    </div>
     <div class="searchDropdown">
         
   
					
					
     </div>
    
    </div>
    
    <div class="col-md-2 pull-right ">
    
                           
  
</div></div>
                           <div class="table-responsive" >
                             <table  class="table table-de mb-0"  id="Table2">
                <thead>
                  <tr>
                  <th >S.No.</th>            
                    <th>State Name</th>
                    <th>State Code</th>
                   <th>City Name</th>
                    <th>City Code</th>
                     <th>Pincode</th>
                  </tr>
                </thead>
              <tbody>
                <tr>   
                <td >1</td>          
                <td >  <input type="text" id="Text15" placeholder="Enter Field Name" class="fieldName"  autocomplete="off"  />      </td>
                <td > <input type="text" id="Text16" class="fieldName"  autocomplete="off" />  </td> 
                 <td > <input type="text" id="Text17" class="fieldName"  autocomplete="off" />  </td>  
                  <td > <input type="text" id="Text18" class="fieldName"  autocomplete="off" />  </td>
                   <td > <input type="text" id="Text39" class="fieldName"  autocomplete="off" />  </td>      
                </tr>
               <tr>   
                <td >2</td>          
                <td >  <input type="text" id="Text19" placeholder="Enter Field Name" class="fieldName"  autocomplete="off"  />      </td>
                <td > <input type="text" id="Text20" class="fieldName"  autocomplete="off" />  </td> 
                 <td > <input type="text" id="Text21" class="fieldName"  autocomplete="off" />  </td>  
                  <td > <input type="text" id="Text22" class="fieldName"  autocomplete="off" />  </td> 
                   <td > <input type="text" id="Text40" class="fieldName"  autocomplete="off" />  </td>      
                </tr>
                 <tr>   
                <td >3</td>          
                <td >  <input type="text" id="Text31" placeholder="Enter Field Name" class="fieldName"  autocomplete="off"  />      </td>
                <td > <input type="text" id="Text32" class="fieldName"  autocomplete="off" />  </td>  
                 <td > <input type="text" id="Text33" class="fieldName"  autocomplete="off" />  </td>  
                  <td > <input type="text" id="Text34" class="fieldName"  autocomplete="off" />  </td>  
                   <td > <input type="text" id="Text41" class="fieldName"  autocomplete="off" />  </td>    
                </tr>
                 <tr>   
                <td >4</td>          
                <td >  <input type="text" id="Text35" placeholder="Enter Field Name" class="fieldName"  autocomplete="off"  />      </td>
                <td > <input type="text" id="Text36" class="fieldName"  autocomplete="off" />  </td>  
                 <td > <input type="text" id="Text37" class="fieldName"  autocomplete="off" />  </td>  
                  <td > <input type="text" id="Text38" class="fieldName"  autocomplete="off" />  </td>  
                   <td > <input type="text" id="Text42" class="fieldName"  autocomplete="off" />  </td>    
                </tr>
              </table>

              </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
								</div>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	
		
	</div>
</section>
            <div class="row match-height" id="addressDiv" style="display:block">
          
                <div class="col-12 col-xl-12 ">                    
                    <div class="card">
                        <div class="card-content">
                    <div class="container">
          <div class="row">

    <div class="col-md-8 pull-left">    
    <div class="pdfexport">
   <button type="button" id="Button2" class="btn btn-outline-primary" title="Export">
                            <i class="fa fa-file-excel-o"></i> </button>
                            <button type="button" id="Button3" class="btn btn-outline-primary" title="PDF">
                            <i class="fa fa-file-pdf-o"></i> </button>
                          
                          
    </div>
    
    
    </div>
    <div class="col-md-2 pull-left"> 
      <div class="searchDropdown">
         
            <label class="showLebel">  Show Records :</label>
			<select id="" class=" form-control showrecords pull-right">
												<option value="none" selected="">50 </option>
												<option value="Textbox">100 </option>
												<option value="Dropdown">150</option>
                                                <option value="Radio">200</option>
                                                 <option value="Check">500</option>
                                                </select>		
					
     </div>
       </div>
    <div class="col-md-2 pull-right ">
    <div class="searchbox">
    <%--<button type="button" class="btn btn-primary  mr-1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								 <i class="fa fa-search"></i>	Column Search		</button>--%>
                                   <div class="dropdown ">
							<div class="dropdown-menu checkboxSearch" id="" >
                            <div class="columnList" id="DivSearch">
							
                                </div>
							<%--<div class="columnList">
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
                                </div>--%>
                                 <%--<div class="dropdownBottom">
                                <label class="pull-left" id="selectall">Select All</label>
                                  <label class="pull-right" id="reset">Reset</label>
                                </div>--%>
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
                            <div class="table-responsive full-width" id="AddressGrid">
                             <table class="table table-de mb-0 clickableRow" id="tbladdressgrid">
                        <thead>
                            <tr>
                    <th style="display:none"></th>
                    <th class="active" ><input type="checkbox" id="CheckAll" onclick="checkAll(this)" /> All</th>
                    <th >Entity Name</th>
                    <th >Country</th>
                     <th style="display:none"></th>
                      <th style="display:none"></th>
                  </tr>
                        </thead>
                        <tbody>
                           <%-- <tr class="">
                                <td>1</td>
                                <td> EID001</td>
                                <td>India</td>
                                <td>5</td>                                      
                            </tr>
                             <tr class="">
                                <td>2</td>
                                <td> EID002</td>
                                <td>Pakistan</td>
                                <td>53</td>                                      
                            </tr>
                             <tr class="">
                                <td>3</td>
                                <td> EID003</td>
                                <td>England</td>
                                <td>15</td>                                      
                            </tr>
                             <tr class="">
                                <td>4</td>
                                <td> EID004</td>
                                <td>China</td>
                                <td>55</td>                                      
                            </tr>--%>
                        </tbody>
                    </table>
                            </div>
                               <span class="  pull-right">Showing <label id="lblRowCount"></label> of <label id="lblTotalCount"></label></span>
                        <p class="text-center mt-1">
                            <span class="load" id="btnLoadMore">Load More.....</span> </p>
                            </div>
</div></div>

                        </div>
                    </div>
                </div>
            </div>
            <section id="BindAddress" style="display: none;" class="mt-1">
	
	<div class="row match-height">
		
		<div class="col-xl-12 col-lg-12">
			<div class="card mainHeight">
				<div class="card-header">
					<div class="row">
                    <div class="content-header-left col-md-6 pt-1">
                       <button type="button" id="Button13" class="btn btn-primary waves-effect waves-light">
                            <i class="fa fa-file"></i> Export</button>
                            <button type="button" id="Button17" class="btn btn-primary waves-effect waves-light">
                            <i class="fa fa-print"></i> PDF</button>
                    </div>
                    <div class="content-header-right col-md-6 pt-1">
                    <div class="pull-right pr-1">
    <label class="textHeader">Entity Name</label> <label class="pr-5">:  <label id="lblentityname"> </label></label>
    <label class="textHeader">Country Name</label> <label>: <label id="lblcountry"> </label></label>
                </div>
                </div>


</div>
				</div>
				<div class="card-content ">
					<div class="card-body">
                      <div class="nav-vertical" id ="setupdiv1">
                            <ul class="nav nav-tabs nav-left" id="BindField1">
                           <%-- <li class="nav-item"><a class="nav-link  active" data-toggle="tab" href="#2"> State</a></li>
                            <li class="nav-item">  <a class="nav-link "  data-toggle="tab" href="#3"> City</a></li>
                            <li class="nav-item"><a class="nav-link " data-toggle="tab" href="#4"> PinCode</a></li>--%>
                            </ul>
							<div class="tab-content px-1">
								<div role="tabpanel" class="tab-pane active" id="AddressLine11">
									<section class="TabSection" id="Section2">
                        <div class="card">
                       
                            <div class="card-content collapse show">
                                <div class="pt-1">
                             
                           <div class="table-responsive">
                             <table class="table table-de mb-0" id="tblFieldValue1">
                <thead>
                  <tr>
                 <%-- <th>S.No.</th>
                  <th>State Code</th>
                  <th>State Name</th>--%>
                  </tr>
                </thead>
              <tbody>
             <%-- <tr>
              <td >1</td>
              <td>DL </td>
              <td> Delhi</td>
              </tr>
                <tr>
              <td >2</td>
              <td>HR </td>
              <td> Haryana</td>
              </tr>
                <tr>
              <td >3</td>
              <td>UP </td>
              <td> Uttar Pradesh</td>
              </tr>
                <tr>
              <td >4</td>
              <td>DL </td>
              <td> Delhi</td>
              </tr>--%>
              </tbody>
              
              </table>
                
              </div>
                                </div>
                            </div>
                        </div>
            </section>
								</div>
							<%--	<div class="tab-pane" id="" >
                               <section class="TabSection" id="Section3">
                        <div class="card">
                       
                            <div class="card-content collapse show">
                                <div class="pt-1">
                             
                           <div class="table-responsive">
                             <table class="table table-de mb-0" id="Table4">
                <thead>
                  <tr>
                  <th>S.No.</th>
                  <th>City Code</th>
                  <th>City Name</th>
                  <th>State</th>
                  </tr>
                </thead>
              <tbody>
              <tr>
              <td >1</td>
              <td>PNBE </td>
              <td> Patna</td>
              <td> Bihar</td>
              </tr>
                <tr>
              <td >2</td>
              <td>LKO </td>
              <td> Lucknow</td>
             <td> Uttar Pradesh</td>
              </tr>
                <tr>
              <td >3</td>
              <td>NDLS </td>
              <td>New Delhi </td>
             <td>Delhi </td>
              </tr>
                <tr>
              <td >4</td>
              <td>AG </td>
              <td> Agra</td>
               <td> Uttar Pradesh</td>
              </tr>
              </tbody>
              
              </table>
                
              </div>
                                </div>
                            </div>
                        </div>
            </section>
								</div>
								<div class="tab-pane" id="4">
                                    <section class="TabSection" id="Section4">
                        <div class="card">
                       
                            <div class="card-content collapse show">
                                <div class="pt-1">
                             
                           <div class="table-responsive">
                             <table class="table table-de mb-0" id="Table5">
                <thead>
                  <tr>
                  <th>S.No.</th>
                  <th>Pin Code</th>
                  <th>State</th>
                  <th>City</th>
                  </tr>
                </thead>
              <tbody>
              <tr>
              <td >1</td>
              <td>100361 </td>
              <td> Bihar</td> 
              <td> Patna</td>
               </tr>
                <tr>
              <td >2</td>
              <td>560001 </td>
              <td> Uttar Pradesh</td>
              <td> Lucknow</td>
             
              </tr>
                <tr>
              <td >3</td>
              <td>100951 </td>            
             <td>Delhi </td>
               <td>New Delhi </td>
              </tr>
                <tr>
              <td >4</td>
              <td>100209 </td>            
               <td> Uttar Pradesh</td>
                 <td> Agra</td>
              </tr>
              </tbody>
              
              </table>
                
              </div>
                                </div>
                            </div>
                        </div>
            </section>
								</div>--%>
							</div>
						</div>
						
					</div>
				</div>
			</div>
		</div>
	
		
	</div>
</section>
        </div>
        <label id="lblUserId" runat="server" style="display: none"> </label>
        <label id="lblAccountNo" runat="server" style="display: none"> </label>
    </div>
    </div>
    <%-- <script type="text/javascript">

            jquery_1_11_3_min_p(document).ready(function () {

                jquery_1_11_3_min_p("#btnnew").click(function () {
                    $("#vertical-tabs").css('display', 'block');
                    $("#addressDiv").css('display', 'none');
                })
})

</script>--%>
 <script>
     jquery_1_11_3_min_p(document).ready(function () {
         jquery_1_11_3_min_p(".footerDropdown").hide();
     });
</script>
</asp:Content>

