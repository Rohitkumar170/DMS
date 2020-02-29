﻿<%@ Page Title="" Language="C#" MasterPageFile="~/DMS.Master" AutoEventWireup="true" CodeBehind="RequisitionSetup.aspx.cs" Inherits="DMS.Master.Requisition" %>
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
     <script src="../JavaScript/Requisitionsetup.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <input type="hidden" id="hdnLoad"/>
    <div class="content-header row">
        <div class="content-header-light col-12">
            <div class="row">
                <div class="content-header-left col-md-6 col-12 mb-2">
                    <h4 class="content-header-title mainheading">
                         Requisition Setup</h4>
                </div>
                
                <div class="content-header-right col-md-6 col-12">
                    <div class="btn-group float-md-right" role="group" aria-label="Button group with nested dropdown">
                       
                       <button type="button" id="btnnew" class="btn btn-primary">
                            <i class="fa fa-plus-square"></i> New</button>
                       <%--   <button type="button" id="btnSubmit" style="display:none" class="btn btn-primary" >
                           <i class="fa fa-arrow-left"></i> Submit</button>--%>
                        <button type="button" id="btnback" style="display:none" class="btn btn-primary" >
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
            <section id="createusserForm" style=" display:none" >
                 <div class="row match-height pb-2">
                  <div class="col-md-12">
                        <div class="card">
                         
                            <div class="card-content collapse show" >
                                <div class="card-body">
                                <div class="card-text">

                                    </div>
                             
                                    <div class="form-body lineSelection">
                                       
                                        <div class="row mt-1 headerDropdown form-section">
    <div class="col-md-6 pull-left">    
   
   <h6>Requisition Setup</h6>
    
    </div>
    
    <div class="col-md-3 ">
                                                <div class="form-group pull-right  ">                                                 
                                                    <label class="pr-1">Default Country</label>
<span title="" class="k-widget k-dropdown k-header" unselectable="on" role="listbox" aria-haspopup="true" aria-expanded="false" tabindex="0" aria-owns="ddlcountry_listbox" aria-disabled="false" aria-readonly="false" aria-busy="false" aria-activedescendant="e2cae17f-293c-4581-996f-401752124c15" style="width: 100px;"><span unselectable="on" class="k-dropdown-wrap k-state-default"><span unselectable="on" class="k-input">Maldives</span><span unselectable="on" class="k-select"><span unselectable="on" class="k-icon k-i-arrow-s">select</span></span></span><input type="text" id="ddlcountry" autocomplete="off" style="width: 100px; display: none;" data-role="dropdownlist"></span>
                                             
                                                </div>
                                            </div>
    <div class="col-md-3">
                                                <div class="form-group pull-right ">
                                                   <label class="pr-1">Select Entity</label>
                                                 <span title="" class="k-widget k-dropdown k-header" unselectable="on" role="listbox" aria-haspopup="true" aria-expanded="false" tabindex="0" aria-owns="ddlentity_listbox" aria-disabled="false" aria-readonly="false" aria-busy="false" aria-activedescendant="889c137e-f805-4891-9106-31ab9ceac4db" style="width: 100px;"><span unselectable="on" class="k-dropdown-wrap k-state-default"><span unselectable="on" class="k-input">Select</span><span unselectable="on" class="k-select"><span unselectable="on" class="k-icon k-i-arrow-s">select</span></span></span><input type="text" id="ddlentity" autocomplete="off" style="width: 100px; display: none;" data-role="dropdownlist"></span>
                                                </div>
                                            </div>
                                            </div>
                                        <div class="row">
                                     
                                          
                                       <div class="col-md-3">
                                                <div class="form-group">
                                                  <label for="ItemType">Requisition Alert</label>
                                             <input type="text" id="ddlrequisitiontype" autocomplete="off" />
                                     <%--    <select id="Select1" name="interested" class="form-control">											
												<option value="Type1">Hours</option>
												<option value="Type2">Days</option>
                                                <option value="Type2">Weeks</option>
                                                <option value="Type2">Months</option>
                                                <option value="Type2">Years</option>
                                                </select>--%>
                                                </div>
                                            </div>
                                             
                                           
                                               <div class="col-md-3">
                                                <div class="form-group">
                                                  <label for="ItemGroup">Alert Duration Time</label>
                        <input type="text" id="taxalerttime"    class="form-control" autocomplete="off" placeholder="Enter Number" onkeyup="Comparevalue(this)"  onkeypress="RemoveClass()" />
                                                
                                                </div>
                                            </div>
                                      
                                          <div class="col-md-3">
                                                <div class="form-group">
                                                  <label for="ItemGroup">Description</label>
                        <input type="text" id="txtdescription"    class="form-control" autocomplete="off" placeholder="Enter Number"  />
                                                
                                                </div>
                                            </div>
                                        
                                        </div>
                                    
                                   
                            
                             
                                      <div class="row ">
                                       <div class="col-md-12">
                                        <button type="button" id="btnSubmit"   class="btn btn-primary pull-right mt-1 ">
                            <i class="fa fa-save"></i> Submit</button>
                                          

                                       </div>
                                       </div>

                                    
                                   </div>
                                  
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <div class="row match-height" id="createusserGrid" style="display:block">
          
               <div class="col-12 col-xl-12 ">                    
                    <div class="card">
                        <div class="card-content">
                    <div class="container">
          <div class="row">

    <div class="col-md-8 ">    
    <div class="pdfexport">
   <button type="button" id="btnExcel"  class="btn btn-outline-primary" title="Export">
                            <i class="fa fa-file-excel-o"></i> </button>
                      
                 <button type="button" id="btnexportpdf"  class="btn btn-outline-primary" title="PDF">
                           <i class="fa fa-file-pdf-o"></i> </button>
     
               
                         
    </div></div>
            
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
     </div> 
    </div>
    <div class="col-md-2  ">
     <div class="searchbox">
    <%--<button type="button" class="btn btn-primary  mr-1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								 <i class="fa fa-search"></i>	Column Search		</button>--%>
                                  <%-- <div class="dropdown ">
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
						</div>--%>
                          <div class="dropdown " >
							<div class="dropdown-menu checkboxSearch"  >
							<div class="columnList" id="DivSearch">
							
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
                   
                           <%-- table for content--%>
                           <div class="container">
          <div class="row">
    <div class="col-md-12 ">  
                            <div class="table-responsive full-width">
                            <table class="table table-de mb-0 clickableRow" id="userGrid">
                        <thead>
                            <tr>
                                 
                                
                                <th style="display:none"></th>
                                   <th style="display:none"></th>
                                <th style="display:none"></th>
                                 <th style="display:none"></th>
                                <th><input type="checkbox" id="chkAll"/> All</th>
                                <th>Requisition Formate</th>
                                <th>Requisition Time</th>  
                                 <th>Description</th>             
                            </tr>
                        </thead>
                      <tbody>
                          <%--  <tr>  
                                 <td><input type="checkbox" /></td>
                                 <td>Days</td>                                
                                 <td>14</td>
                            </tr>
                               <tr>  
                             <td><input type="checkbox" /></td>
                                 <td>Hours</td>                               
                                 <td>48 </td>
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
         <label id="lblUserId" runat="server" style="display: none"><</label>
    </div>
   
    </div>
     
      <%--<script >

          jquery_1_11_3_min_p(document).ready(function () {

              jquery_1_11_3_min_p("#btnnew").click(function () {
                  $("#createusserForm").css('display', 'block');
                  $("#createusserGrid").css('display', 'none');
              })
              jquery_1_11_3_min_p("#btnback").click(function () {
                  $("#createusserForm").css('display', 'none');
                  $("#createusserGrid").css('display', 'block');
              })
          })

</script>--%>
   
         <script>
 jquery_1_11_3_min_p(document).ready(function () {
     jquery_1_11_3_min_p(".footerDropdown").hide();
       });
</script>
</asp:Content>
