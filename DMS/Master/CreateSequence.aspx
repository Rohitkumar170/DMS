<%@ Page Language="C#" MasterPageFile="~/DMS.Master" AutoEventWireup="true" CodeBehind="CreateSequence.aspx.cs" Inherits="DMS.Master.CreateSequence" %>

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
     <script src="../JavaScript/Sequencesetup.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="content-header row">
        <div class="content-header-light col-12">
            <div class="row">
                <div class="content-header-left col-md-6 col-12 mb-2">
                    <h4 class="content-header-title mainheading">
                         <span class="customer">Create Sequence</span></h4>
                </div>
                <div class="content-header-right col-md-6 col-12">
                    <div class="btn-group float-md-right" role="group" aria-label="Button group with nested dropdown">
                       <button type="button" id="btnnew" style="display:none" class="btn btn-primary">
                            <i class="fa fa-plus-square"></i> Create New</button>
                        <button type="button"  id="btnsubmit"  style="display:none" class="btn btn-primary">
                            <i class="fa fa-save"></i> Submit</button>
                            <button type="button" id="btncancel" style="display:none" class="btn btn-primary"   >
                        <i class="fa fa-cross"></i> Cancel</button>
                        <button type="button" id="btnback" style="display:none" class="btn btn-primary"   >
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
            <section id="CreateSequenceForm" style="display:none" >
                <div class="row match-height">
                   <div class="col-12 col-xl-12 ">                    
                    <div class="card">
                        <div class="card-content">
                      <div class="row  pl-1 mt-1 headerDropdown ">
    <div class="col-md-6 pull-left">    
    <div class="pdfexport">
   <%--<button type="button" id="btnAdd" onclick="AddRow()" class="btn btn-primary waves-effect waves-light">
                            <i class="fa fa-plus"></i> Add Line</button>
                            <button type="button"  id="btnDeleteLine" class="btn btn-primary waves-effect waves-light">
                            <i class="fa fa-trash"></i> Delete Line</button>--%>
                            <button type="button" id="Button1" class="btn btn-outline-primary" title="Export">
                            <i class="fa fa-file-excel-o"></i> </button>
                            <button type="button" id="Button2" class="btn btn-outline-primary" title="PDF">
                            <i class="fa fa-file-pdf-o"></i> </button>    
                          
    </div>
  
    
    </div>
    
     <%--  <div class="col-md-3">
                                                <div class="form-group pull-right pr-1">
                                                   <label class="pr-1">Select Entity</label>
                                                   
                                                 <input type="text" id="ddlentity"  autocomplete="off"  style="width: 100px;"/>
                                                </div>
                                            </div>
    <div class="col-md-3 ">
                                                <div class="form-group pull-right pr-1 ">                                                 
                                                    <label class="pr-1">Select Country</label>
<input type="text" id="ddlcountry"  autocomplete="off"  style="width: 100px;"/>
                                                
                                                </div>
                                            </div>--%>
 
                                            </div>
                           <div class="table-responsive" >
                             <table  class="table table-de mb-0 clickableRow"  id="tblPageFields">
                <thead>
                  <tr>  
                  <th style="display:none"></th>
                  <th style="display:none"></th>                   
                  <th><input type="checkbox" id="chkAll" onclick="InputcheckAll(this)"/> All</th>
                  <th>Field Name</th>
                     
                  </tr>
                </thead>
              <tbody>
               <%-- <tr class="selectedRow">   
               <td><input type="checkbox" id="Checkbox1"/></td> 
               <td>Partner Code</td>
               <td>Checked</td>
                </tr>
                   <tr>   
               <td><input type="checkbox" id="Checkbox2" /></td> 
               <td>Partner Name</td>
               <td>Unchecked</td>
                </tr>
                  <tr>   
               <td><input type="checkbox" id="Checkbox3" /></td> 
               <td>Partner Representative</td>
               <td>Unchecked</td>
                </tr>--%>
              </tbody>
              </table>

              </div>
           
                        
                        </div>
                    </div>
                </div>
                </div>
            </section>
            <div class="row match-height" id="CreateSequenceGrid" style="display:block">
          
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
                            <table class="table table-de mb-0 clickableRow" id="CreateSequenceTable">
                        <thead>
                            <tr>
                               <th style="display:none" >Counter</th>
                               <th ><input id="select_all" type="checkbox" class="checkAll" style="height:16px" /> All</th>
                                <th>Page Name</th>
                                <th>Page URL</th>
                            </tr>
                        </thead>
                      <tbody>
                           <%-- <tr>  
                                 <td>1</td>
                                 <td>Parner Group</td>
                                 <td>Master/PartnerGroup.aspx</td>
                                 <td>Partners/Sub-menu/Parner Group</td>
                            </tr>
                             <tr>  
                                 <td>2</td>
                                 <td>Parner</td>
                                 <td>Master/Partner.aspx</td>
                                 <td>Partners/Sub-menu/Parner</td>
                            </tr>
                              <tr>  
                                 <td>3</td>
                                 <td>Vendor Group</td>
                                 <td>Master/vendorGroup.aspx</td>
                                 <td>Partners/Sub-menu/Vendor Group</td>
                            </tr>
                              <tr>  
                                 <td>4</td>
                                 <td>Vendor</td>
                                 <td>Master/Vendor.aspx</td>
                                 <td>Partners/Sub-menu/Vendor</td>
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
             <section id="CreateSequenceNew" style="display:none" >
                <div class="row match-height">
                   <div class="col-12 col-xl-12 ">                    
                    <div class="card">
                        <div class="card-content">
                        <div class="card-body">
                        <div class="card-text">
                      <div class="row  pl-1  headerDropdown ">
  
    
       <div class="col-md-4">
                                                <div class="form-group pull-right pr-1">
                                                   <label class="pr-1">Select Entity</label>
                                     <input type="text" id="ddlentity"  autocomplete="off"  style="width: 100px;"/>
                                    
                                                </div>
                                            </div>
    <div class="col-md-4 ">
                                                <div class="form-group pull-right pr-1 ">                                                 
                                                    <label class="pr-1">Select Country</label>
                                            <input type="text" id="ddlcountry"  autocomplete="off"  style="width: 100px;"/>
                                                   
                                                 
                                                </div>
                                            </div>
   <div class="col-md-4 ">
                                                <div class="form-group pull-right pr-1 ">                                                 
                                                    <label class="pr-1">Select Field</label>
                                                 <input type="text" id="ddlfields"  autocomplete="off"  style="width: 100px;"/>
                                                    
                                                 
                                                </div>
                                            </div>
                                            </div>
                                            </div>
                         <div class="form-body lineSelection combinesequencerow" style="display:none" >
                                        <h6 class="form-section">Field Name : <label id="lblfieldname"></label></h6>
                                          <div class="row pb-1 pt-1 mb-1 " id="BlockRow" style="background: #efefef;">
                                            <div class="col-md-3"> 
                                                <div class="">
                                                   
                                                    <label class="pr-1">Sequence Length :</label>
                                                     <input type="text" id="txtsequencelength" onkeyup="Getsequence(this)" autocomplete="off"  class="pull-right" placeholder="Enter  Length">
                                                </div>
                                            </div>
                                              <div class="col-md-3">
                                                <div class="">
                                                   
                                                    <label for="Remaining">Remaining Count :</label>
                                                     <label id="lblremaincount" >0 </label>
                                                </div>
                                            </div>
                                          <div class="col-md-6" id="Fieldblock" style="display:none">
                                                <div class="row">
        <div class="col-md-2">
                                                  <label for="Running" class="">Blocks :</label>
                                                  </div>
                                                  <div class="col-md-10">
                                               <div id="RunningDiv">
                                                <%--<input type="text" id="Text1" class="runningText" >--%>
                                               <%--  <input type="text" id="Text2" class="runningText" >
                                                  <input type="text" id="Text3" class="runningText" >
                                                  <input type="text" id="Text4" class="runningText" >
                                                 <input type="text" id="Text5" class="runningText" >
                                                  <input type="text" id="Text6" class="runningText" >
                                                  <input type="text" id="Text7" class="runningText" >
                                                 <input type="text" id="Text8" class="runningText" >
                                                  <input type="text" id="Text9" class="runningText" >
                                                   <input type="text" id="Text10" class="runningText" >
                                                  <input type="text" id="Text11" class="runningText" >
                                                 <input type="text" id="Text12" class="runningText" >
                                                  <input type="text" id="Text13" class="runningText" >
                                                   <input type="text" id="Text14" class="runningText" >
                                                  <input type="text" id="Text15" class="runningText" >--%>
                                                 </div>
                                                 </div>
                                                </div>
                                            </div>
                                      
                                          
                                            
                                           
                                        </div>

                                        <div class="row">
                                          <div class="col-md-3 sequencetype" style="display:none">
                                                <div class="form-group">
                                                  <label for="ItemGroup">Sequence Type</label>
                                               <%-- <select id="Select1" class="form-control">
                                                <option value="Textbox">Constant</option>
												<option value="Textbox">Date</option>
                                                <option value="Textbox">Running</option>
												
                                                </select>      --%>
                                                 <input type="text" id="txtseqtype" class="form-control" />
                                                </div>
                                            </div>
                                            
                                             
                                            <div class="col-md-3 constantDiv" style="display:none">
                                            <div class="form-group">
                                                   
                                                    <label for="First">  Fixed Length</label>
                                                     <input type="text" id="txtfixedno" onkeyup="NumericAllow(this)" autocomplete="off" class="form-control" placeholder="Enter Fixed Length" />
                                                </div>
                                            </div>
                                              <div class="col-md-3 constantDiv" style="display:none">
                                                <div class="form-group">
                                                   
                                                    <label for="Sequence">  Start Position</label>
                                                     <input type="text" id="txtfirstposition" onkeyup="NumericAllow(this)" autocomplete="off" class="form-control" placeholder="Enter Start  Position" />
                                                </div>
                                            </div>
                                           <div class="col-md-3 constantDiv" style="display:none">
                                                <div class="form-group">
                                                   
                                                    <label for="Sequence">  Value</label>
                                                     <input type="text" id="txtfixedvalue" onkeyup="Comparedata(this)" autocomplete="off" class="form-control" placeholder="Enter Value" />
                                                </div>
                                            </div>
                                            <div class="col-md-3 runningDiv" style="display:none">
                                                <div class="form-group">
                                                  <label for="ItemGroup">Fixed Length</label>
                                               <input type="text" id="txtrunningno" onkeyup="NumericAllow(this)" autocomplete="off" class="form-control" placeholder="Enter Fixed Length" />
                                                 
                                                </div>
                                            </div>
                                            <div class="col-md-3 runningDiv" style="display:none">
                                                <div class="form-group">
                                                   
                                                    <label for="Sequence">  Start Position</label>
                                                     <input type="text" id="txtrunfirstposition" onkeyup="NumericAllow(this)" autocomplete="off" class="form-control" placeholder="Enter Start  Position" />
                                                </div>
                                            </div>
                                            
                                              <div class="col-md-3 runningDiv" style="display:none">
                                            <div class="form-group">
                                                   
                                                    <label for="First">  Value</label>
                                                     <input type="text" id="txtrunfirstno" onkeyup="Comparedata(this)" class="form-control" autocomplete="off" placeholder="Enter First No." />
                                                </div>
                                            </div>
                                               <div class="col-md-3 runningDiv" style="display:none">
                                            <div class="form-group">
                                                   
                                                    <label for="Increment">  Increment Value</label>
                                                     <input type="text" id="txtrunincreementval" onkeyup="NumericAllow(this)"  autocomplete="off" class="form-control" placeholder="Enter Increment Value" />
                                                </div>
                                            </div>
                                             <div class="col-md-3 SeperatorDiv" style="display:none">
                                            <div class="form-group">
                                                   
                                                    <label for="First">  Fixed Length</label>
                                                     <input type="text" id="txtfixedno1"  onkeyup="NumericAllow(this)" autocomplete="off" class="form-control" placeholder="Enter Fixed Length" />
                                                </div>
                                            </div>
                                              <div class="col-md-3 SeperatorDiv" style="display:none">
                                                <div class="form-group">
                                                   
                                                    <label for="Sequence">  Start Position</label>
                                                     <input type="text" id="txtfirstposition1" onkeyup="NumericAllow(this)" autocomplete="off" class="form-control" placeholder="Enter Start  Position" />
                                                </div>
                                            </div>
                                           <div class="col-md-3 SeperatorDiv" style="display:none">
                                                <div class="form-group">
                                                   
                                                    <label for="Sequence">  Value</label>
                                                     <input type="text" id="txtfixedvalue1" onkeyup="Comparedata(this)" autocomplete="off" class="form-control" placeholder="Enter Value" />
                                                </div>
                                            </div>

                                               <div class="col-md-3 dateDiv"  style="display: none;">
                                                <div class="form-group">
                                                  <label for="ItemGroup">Date Format</label>
                                                   <input type="text" id="txtformat" class="form-control" />

                                               <%-- <select id="Select2" class="form-control">
												<option value="Textbox">DD/MM/YYYY</option>
                                                <option value="Textbox">dd/mm/yyyy</option>
												<option value="Textbox">dd-mm-yy</option>
                                                </select>   --%>   
                                                 
                                                </div>
                                            </div>
                                              <div class="col-md-3 dateDiv" style="display:none">
                                                <div class="form-group">
                                                  <label for="ItemGroup">Fixed Length</label>
                                               <input type="text" id="txtfixedno2"  disabled autocomplete="off" class="form-control" placeholder="Enter Fixed Length" />
                                                 
                                                </div>
                                            </div>
                                              <div class="col-md-3 dateDiv" style="display:none">
                                                <div class="form-group">
                                                   
                                                    <label for="Sequence">  Start  Position</label>
                                                     <input type="text" id="txtdateplaceofdigit" onkeyup="NumericAllow(this)"  autocomplete="off" class="form-control" placeholder="Enter Start  Position" />
                                                </div>
                                            </div>
                                           
                                             <div class="col-md-3 dateDiv " style="display:none">
                                                <div class="form-group">
                                                  <label for="Start" class="dateValueBox"> Date Value</label>
                                              <%-- <input type="text" id="txtstartno"   autocomplete="off" class=" form-control" placeholder="Enter Date Value">--%>
                                             <div class="dateValue">
                                              <%--<input type='text' id='txtblock_DD_0'  class='runningText' placeholder='DD' /><input type='text' id='txtblock_DD_1'  class='runningText' placeholder='MM' />--%>
                                               <%--  <input type="text" id="txtblock"  class="runningText" placeholder="D" />
                                                 <input type="text" id="Text1"  class="runningText" placeholder="D" />
                                                 <input type="text" id="Text2"  class="runningText" placeholder="M" />
                                                 <input type="text" id="Text3"  class="runningText" placeholder="M" />
                                                 <input type="text" id="Text4"  class="runningText" placeholder="Y" />
                                                 <input type="text" id="Text5"  class="runningText" placeholder="Y" />
                                                 <input type="text" id="Text6"  class="runningText" placeholder="Y" />
                                                 <input type="text" id="Text7"  class="runningText" placeholder="Y" />--%>
                                                </div>
                                                </div>
                                            </div>
                                            <div class="col-md-3  dateDiv"  style="display:none">
                                           <div class="form-group pt-2">
                                                   
                                                    <label for="Increment" class="pr-3">Auto  Increment</label>
                                                     <input name="rdoautoincree" id="rdyes" checked="checked" value="Y" type="radio" />
                                                     <label for="Increment" class="pr-1">  Yes</label>
                                                     <input name="rdoautoincree" id="rdno" checked="checked" value="N" type="radio" />
                                                     <label for="Increment">  No</label>
                                                    
                                                </div>
                                            </div>
                                             
                                        </div>
                                       
                                  
                                  

 <div class="row">
                                          
                                           
                                               
                                           
                                        </div>
                                      <div class="row " id="add" style="display:block">
                                       <div class="col-md-12 ">
                                      
                                        <button type="button" id="btnadd" disabled  class="btn btn-primary pull-right mb-1 waves-effect waves-light">
                            <i class="fa fa-plus-square"></i> Add</button>
                                   

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
    <div class="modal fade text-left" id="FieldSequencePopup" tabindex="-1" role="dialog" aria-labelledby="myModalLabel8"
									 aria-hidden="true" >
										<div class="modal-dialog modal-lg" role="document">
											<div class="modal-content">
												<div class="modal-header bg-primary white">
                                                    <h6 class="white" id="H3">  Field Name  :<span class="white" id="lblseqfieldname">
                                                    Partner Code</span></h6>
													
													<button type="button" id="btndetailclose" class="close" aria-label="Close">
														<span aria-hidden="true">&times;</span>
													</button>
												</div>
											<div class="modal-body">
												    <div class="row">
                                         
                                            <div class="col-md-12">
                                     
   
    <div class="pdfexport tablewidth">
                             <button type="button" id="Button3" class="btn btn-primary ">
                            <i class="fa fa-file"></i> Export</button>
                            <button type="button" id="Button4" class="btn btn-primary">
                            <i class="fa fa-print"></i> PDF</button>  
                           <%--<button type="button" id="Button5" class="btn btn-primary">
                            <i class="fa fa-ban"></i> Deactivate</button> --%>
                          
    </div>
    
    
    </div>
    
    </div>

    <div class="row">
      <div class="col-md-12">
                                                  <div class="table-responsive" id="FieldSequencePopupTable">
                              <table id="" class="table table-de mb-0">
                      <thead>
                            <tr>
                                 <th style="display:none">SeqId</th>
                                 <th ><input id="Checkbox1" type="checkbox" class="checkAll" style="height:16px" /> All</th>
                                 <th>Feild Name</th>
                                 <th>Sequence No.</th>
                                <%-- <th>Next Sequence No.</th>--%>
                                 <th>Entity Name</th> 
                                 <th>Country Name</th>   
                                 
                                    
                            </tr>
                        </thead>
                        <tbody>
                   
                     <%--   <tr>
                                <td>1</td> 
                                <td>Partner Code</td> 
                                <td>0001_seq</td> 
                                <td>Yoeki Soft</td> 
                                <td>India</td> 
                            </tr>
                          <tr>
                                <td>2</td> 
                                <td>Partner Code</td> 
                                <td>0001_seq</td> 
                                <td>Yoeki Soft</td> 
                                <td>India</td> 
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
        <script>
 jquery_1_11_3_min_p(document).ready(function () {
     jquery_1_11_3_min_p(".footerDropdown").hide();
       });
</script>
</asp:Content>

