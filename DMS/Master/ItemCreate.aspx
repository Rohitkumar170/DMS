<%@ Page Language="C#" MasterPageFile="~/DMS.Master" AutoEventWireup="true" CodeBehind="ItemCreate.aspx.cs" Inherits="DMS.Master.ItemCreate" %>

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
    <script src="../JavaScript/item.js" type="text/javascript"></script>
   <style>
   
   </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<input type="hidden" id="hdnLoad"/><input type="hidden" id="hf"/> 
<div class="content-header row">
        <div class="content-header-light col-12">
            <div class="row">
                <div class="content-header-left col-md-6 col-12 mb-2">
                    <h4 class="content-header-title mainheading">
                         Item</h4>
                </div>
                <div class="content-header-right col-md-6 col-12">
                    <div class="btn-group float-md-right" role="group" aria-label="Button group with nested dropdown">
                   
                       <button type="button" id="btnnew" class="btn btn-primary">
                            <i class="fa fa-plus-square"></i> New</button>
                        <button type="button" id="btndisable" style="display:none" class="btn btn-primary"   >
                           <i class="fa fa-ban"></i> Disable</button>
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
            <section id="variantForm" style=" display:none" >
                 <div class="row match-height pb-2">
                  <div class="col-md-12">
                        <div class="card">
                         
                            <div class="card-content collapse show" >
                                <div class="card-body">
                                <div class="card-text">
 <div class="row ">
                    <%--<div class="content-header-left col-md-8 ">
   
                </div>--%>
 

<div class="content-header-right col-md-12">
                    <div class="btn-group float-md-right" role="group">
                
                            <button type="button" id="btnvariantdetails" disabled  class="btn btn-primary waves-effect waves-light" style="display:none">
                            <i class="fa fa-info-circle"></i> Variant Details</button>
                        <button type="button" id="btnconversion" disabled class="btn btn-primary waves-effect waves-light" >
                            <i class="fa fa-exchange"></i> Unit Conversion</button>
                            <button type="button" id="btntaxGrp" disabled class="btn btn-primary " data-toggle="modal" >
                            <i class="fa fa-money"></i> Tax Group</button>
                                   <button type="button" id="btnaddunit" class="btn btn-primary waves-effect waves-light" >
                            <i class="fa fa-plus-square"></i> Add Unit</button>
                            
                              <button type="button" id="btnother2" class="btn btn-primary waves-effect waves-light">
                            <i class="fa fa-save"></i> Button1</button>

                      
                    </div>
                </div>
</div>
                                    </div>
                              <%--  <div class="row  pl-1 headerDropdown ">
    <div class="col-md-4 pull-left">    
   
    
    </div>
    
  
    <div class="col-md-4">
                  <div class=" pull-right pr-1">
                                                   <label class="pr-1">Select Country</label>
                                                    <input type="text" id="ddlcountry"  autocomplete="off"  style="width: 100px;"/>
                                                </div>                              
                                            </div>
<div class="col-md-4">
<div class=" pull-right ">
                                                   <label class="pr-1">Select Entity</label>
                                                    <input type="text" id="ddlentity"  autocomplete="off"  style="width: 100px;"/>
   
                                                </div>
                                                
                                            </div>
                                            </div>--%>
                                    <div class="form-body lineSelection">
                                        <h6 class="form-section">Create Item</h6>
                                        <div class="row">
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                   
                                                    <label for="ItemName">Item Name</label>
                                                     <input type="text" id="txtitemname"  onkeyup="RemoveClassItem(this)"  class="form-control" placeholder="Enter Item Name">
                                                </div>
                                            </div>
                                              <div class="col-md-3">
                                                <div class="form-group">
                                                   
                                                    <label for="ItemName">Item Code</label>
                                                     <input type="text" id="txtitemcode"  onkeyup="RemoveClassItem(this)"   class="form-control" placeholder="Enter Item Code">
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                  <label for="ItemGroup">Item Group</label>
                                                  <input type="text" id="txtitemgroup"  class="form-control" />
                                                 <%--  <select id="CustomerType" name="interested" class="form-control">
												<option value="none" selected="" disabled="">Select Item Group </option>
												<option value="Group1">Group1 </option>
												<option value="Group2">Group2</option>
                                                </select>--%>
                                                </div>
                                            </div>
                                               <div class="col-md-3">
                                                <div class="form-group">
                                                  <label for="ItemType">Item Type</label>
                                               <input type="text" id="txtitemtype"  class="form-control" />
                                         <%--<select id="Select1" name="interested" class="form-control">
												<option value="none" selected="" disabled="">Select Item Type </option>
												<option value="Type1">Item Type 1</option>
												<option value="Type2">Item Type 2</option>
                                                </select>--%>
                                                </div>
                                            </div>
                                           
                                        </div>
                                          <div class="row">
                                           <div class="col-md-3">
                                                <div class="form-group">
                                                  <label for="Description">Description</label>
                                                    <input type="text" id="txtdescription" onkeyup="RemoveClassItem(this)"   class="form-control" placeholder="Enter Description">
                                                </div>
                                            </div>
                                              
                                                <div class="col-md-3">
                                                <div class="form-group">
                                                   
                                                    <label for="ItemName">Base Unit </label>
                                                    <input type="text" id="ddlunit" class="form-control" />
                                                 <%--   <select id="Select2" name="interested" class="form-control">
												<option value="none" selected="" disabled="">Select   </option>
												<option value="Type1">KG</option>
												<option value="Type2">Meter</option>
                                                <option value="Type2">Box</option>
                                                </select>--%>
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                   
                                                    <label for="ItemName">Other Unit</label>
                                                    <%--<input type="text" id="ddlunit" class="form-control" />--%>
                                                     <%--<select id="Select1" name="interested" class="form-control">
												<option value="none" selected="" disabled="">Select   </option>
												<option value="Type1">Mass</option>
												<option value="Type2">Volume</option>
                                                <option value="Type2">Length</option>
                                                </select>--%>
                                                 <input type="text" id="ddlotherunits" class="form-control" />
 

                                                </div>
                                         
                                            </div>
                                                 <div class="col-md-3">
                                                <div class="form-group">
                                                   
                                                    <label for="ItemName">Tracking </label>
                                                  <%--  <input type="text" id="Text1" class="form-control" />--%>
                                                  <%--  <select  name="interested" class="form-control">
												<option value="none" selected="" disabled="">Select   </option>
												<option value="Type1">None</option>
												<option value="Type2">Serial No.</option>
                                                <option value="Type2">Batch No.</option>
                                                </select>--%>
                                                 <input type="text" id="ddltracking" class="form-control" />
                                                </div>
                                            </div>
                                         <%-- <div class="col-md-3" style="display:none">
                                                <div class="form-group">
                                                <div  class="VarientList" id="Divotherunits">
                                                <table id="tblotherunits" >
                                                <thead></thead>
                                                <tbody>
                                                <tr>
                                                <td></td>
                                                </tr>
                                                </tbody>
                                                </table>
                                                </div>
                                                </div>
                                                </div>--%>
                                            
                                        </div>
                                        <div class="row">
                                         <div class="col-md-3">
                                                <div class="form-group">
                                                  <label for="ItemGroup">Cart Price</label>
                        <input type="text" id="txtcartprice"  keypress="RemoveClassItem(this)"  onkeyup="Comparevalue(this)"    class="form-control" placeholder="Enter Cart Price" />
                                                
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                  <label for="ItemGroup">Max Quantity</label>
                        <input type="text" id="Text2"     class="form-control" placeholder="Enter Max Quantity" />
                                                
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="form-group">
                                               <label for="ItemGroup">Min Quantity</label>
                        <input type="text" id="Text3"     class="form-control" placeholder="Enter Min Quantity" />
                                                
                                                </div>
                                            </div>
                                               <div class="col-md-3">
                                                <div class="form-group">
                                                  <label for="ItemGroup">Tax Type</label>
                          <select  name="interested" class="form-control">
												<option value="Exclusive" >Exclusive   </option>
												<option value="Inclusive">Inclusive</option>
												
                                                </select>
                                                
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row mt-1" id="Displaychkvariant" style="display:none">
                           
									<div class="col-md-3">

										 <div class="">                     
											<input type="checkbox" name="variant" disabled value="Mon" id="chkvariant">
											<label class="">Check for Variant  </label>
										</div>
									</div>
								
                                 <%--   <div class="col-md-3">

										 <div class="">                     
											<input type="checkbox" name="Calculator"  id="Checkbox5">
											<label class="">Check for Unit  </label>
										</div>
									</div>--%>
								</div>
                                <div id="variants" style="display:none">
                                        <div class="row " id="appendvariant1">
                                        <%--<div class="col-md-4">
                                         <div class="row">
									<div class="col-md-4">

										 <div class="">                     
											<input type="checkbox" onchange="valueChanged()" class="colorCheckbox">
											<label class="">Color </label>
										</div>
									</div>
									<div class="col-md-8" id="colorTextBox" style="display:none">
										 <div class="form-group">                     
											<input type="text" name="weekday" class="form-control" id="Checkbox5" placeholder="Enter Color">
										</div>
									</div>
                                    <div class="col-md-12" id="colorListBox" style="display:none">
                                    <div class="VarientList">
                                    </div>
                                    </div>

                                    </div>
                                    </div>--%>
                                   <%--  <div class="col-md-4">
                                         <div class="row">
								<div class="col-md-4">

										 <div class="">                     
											<input type="checkbox" name="weekday" value="Mon" id="Checkbox4" placeholder="Enter Color">
											<label class="">Size </label>
										</div>
									</div>
<div class="col-md-8">

										 <div class="form-group">                     
											<input type="text" name="weekday" class="form-control" placeholder="Enter Size">
											
										</div>
									</div>
                                     <div class="col-md-12">
                                    <div class="VarientList">
                                    </div>
                                    </div>
                                     </div>
                                    </div>
                                     <div class="col-md-4">
                                         <div class="row">
                                    <div class="col-md-4">

										 <div class="">                     
											<input type="checkbox" name="weekday" value="Mon" id="Checkbox5" placeholder="Enter Color">
											<label class="">Varient3 </label>
										</div>
									</div>
                                    <div class="col-md-8">

										 <div class="form-group">                     
											<input type="text" name="weekday" class="form-control" placeholder="Enter Varient3">
											
										</div>
									</div>
                                     <div class="col-md-12">
                                    <div class="VarientList">
                                    </div>
                                    </div>
                                     </div>
                                    </div>--%>
                                    </div>
                                     
                                    </div>



                                      <div class="row " id="Procced"  style="display:none">
                                       <div class="col-md-12">
                                      <%--  <button type="button" id="btnsubmit"   class="btn btn-primary pull-right mt-1  ml-1">
                            <i class="fa fa-save"></i> Submit</button>--%>
                                        <button type="button" id="btnproceed" class="btn btn-primary pull-right mt-1">
                            <i class="fa fa-arrow-right"></i> Proceed</button>
                                   

                                       </div>
                                       </div>
                                   </div>
                                      <div class="form-body" id="Divvariant1" style="display:none">
                                        <h6 class="form-section">Variant Selection</h6>
                                        <div class="row  pl-1 ">
    <div class="col-md-6 pull-left">    
    <div class="pdfexport">
   <button type="button" id="btnAdd" onclick="AddVariantRow()" class="btn btn-primary waves-effect waves-light">
                            <i class="fa fa-plus"></i> Add Line</button>
                            <button type="button" id="btnDeleteLine" class="btn btn-primary waves-effect waves-light">
                            <i class="fa fa-trash"></i> Delete Line</button>
                          <%--  <button type="button" id="Button2" class="btn btn-primary waves-effect waves-light">
                            <i class="fa fa-file"></i> Export</button>
                            <button type="button" id="Button3" class="btn btn-primary waves-effect waves-light">
                            <i class="fa fa-print"></i> PDF</button>    --%>
                          
    </div>
  
    
    </div>
    
    <div class="col-md-3 ">
                                              
                                            </div>
    <div class="col-md-3">
                                             
                                            </div>
                                            </div>
                                        <div class="row">
                                         <div class="col-md-12">
                                                    <div  class="table-responsive" >
                            <table class="table table-de VariantSelectionGrid" id="varianttable1"  >
                        <thead>
                            <tr>
                               <%-- <th><input type="checkbox" id="chkAll" >All</th>--%>
                               <%-- <th>Variant 1</th>
                                <th>Variant 2</th>
                                <th>Variant 3</th>--%>
                            </tr>
                        </thead>
                      <tbody>
                      <%--<tr>
                      <td><input type="checkbox" id="Checkbox4"></td>
                      <td> <select name="interested" class="Operator">
												<option value="none" selected="" disabled="">Select Value </option>
												<option value="Address1">Value 1 </option>
												<option value="Address2">Value 2</option>
                                                <option value="Address3">Value 3</option>
                                                </select></td>
                      <td> <select name="interested" class="Operator">
												<option value="none" selected="" disabled="">Select Value </option>
												<option value="Address1">Value 1 </option>
												<option value="Address2">Value 2</option>
                                                <option value="Address3">Value 3</option>
                                                </select></td>
                      <td> <select name="interested" class="Operator">
												<option value="none" selected="" disabled="">Select Value </option>
												<option value="Address1">Value 1 </option>
												<option value="Address2">Value 2</option>
                                                <option value="Address3">Value 3</option>
                                                </select></td>
                      </tr>--%>
                      </tbody>
                          
                    </table>
                            </div>
                                            </div>
                                   

                                        </div>
                                         <%--<div class="row " id="Div1">
                                       <div class="col-md-12">
                                        <button type="button" id="Button4" class="btn btn-primary pull-right ">
                            <i class="fa fa-save"></i> Submit</button>
                                       </div>
                                       </div>--%>
                                    </div>





                                    <div class="row " id="finalSubmit" >
                                       <div class="col-md-12">
                                        <button type="button" id="btnsubmit" class="btn btn-primary pull-right mt-1 waves-effect waves-light" style="display: block;">
                            <i class="fa fa-save"></i> Submit</button>
                                       
                                   

                                       </div>
                                       </div>
                                    <div class="form-body" id="DIVBINDVARIANT" style="display:none">
                                        <h6 class="form-section">Variant Selection</h6>
                                        <div class="row  pl-1 ">
    <div class="col-md-6 pull-left">    
    <div class="pdfexport">
   <%--<button type="button" id="Button4" onclick="AddVariantRow()" class="btn btn-primary waves-effect waves-light">
                            <i class="fa fa-plus"></i> Add Line</button>
                            <button type="button" id="Button5" class="btn btn-primary waves-effect waves-light">
                            <i class="fa fa-trash"></i> Delete Line</button>--%>
                            <button type="button" id="Button2" class="btn btn-primary waves-effect waves-light">
                            <i class="fa fa-file"></i> Export</button>
                            <button type="button" id="Button3" class="btn btn-primary waves-effect waves-light">
                            <i class="fa fa-print"></i> PDF</button>    
                          
    </div>
  
    
    </div>
    
    <div class="col-md-3 ">
                                              
                                            </div>
    <div class="col-md-3">
                                             
                                            </div>
                                            </div>
                                        <div class="row">
                                         <div class="col-md-12">
                                                    <div  class="table-responsive" >
                            <table class="table table-de VariantSelectionGrid" id="tblvariantdata"  >
                        <thead>
                            <tr>
                                <th><input type="checkbox" id="chkAll" />All</th>
                                <th>Sku Code</th>
                                <th>Sku Name </th>
                                
                            </tr>
                        </thead>
                      <tbody>
                      <%--<tr>
                      <td><input type="checkbox" id="Checkbox4"></td>
                      <td> <select name="interested" class="Operator">
												<option value="none" selected="" disabled="">Select Value </option>
												<option value="Address1">Value 1 </option>
												<option value="Address2">Value 2</option>
                                                <option value="Address3">Value 3</option>
                                                </select></td>
                      <td> <select name="interested" class="Operator">
												<option value="none" selected="" disabled="">Select Value </option>
												<option value="Address1">Value 1 </option>
												<option value="Address2">Value 2</option>
                                                <option value="Address3">Value 3</option>
                                                </select></td>
                      <td> <select name="interested" class="Operator">
												<option value="none" selected="" disabled="">Select Value </option>
												<option value="Address1">Value 1 </option>
												<option value="Address2">Value 2</option>
                                                <option value="Address3">Value 3</option>
                                                </select></td>
                      </tr>--%>
                      </tbody>
                          
                    </table>
                            </div>
                                            </div>
                                   

                                        </div>
                                         <%--<div class="row " id="Div1">
                                       <div class="col-md-12">
                                        <button type="button" id="Button4" class="btn btn-primary pull-right ">
                            <i class="fa fa-save"></i> Submit</button>
                                       </div>
                                       </div>--%>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <div class="row match-height" id="variantGrid" style="display:block">
          
               <div class="col-12 col-xl-12 ">                    
                    <div class="card">
                        <div class="card-content">
                    <div class="container">
          <div class="row">

    <div class="col-md-8 ">    
    <div class="pdfexport">
   <button type="button" id="btnExcel"  class="btn btn-outline-primary" title="Export">
                            <i class="fa fa-file-excel-o"></i> </button>
                          <%--   <asp:LinkButton ID="btnExcel" runat="server" OnClick="btnExcel_Click"   class="btn btn-primary waves-effect waves-light"><i class="fa fa-print"></i> Export</asp:LinkButton>--%>
                 <%--<asp:LinkButton ID="btnpdf1" runat="server" OnClick="Exportpdf_Click" OnClientClick="SetHTML()"  class="btn btn-primary waves-effect waves-light"><i class="fa fa-print"></i> PDF</asp:LinkButton>--%>

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
     </div>  </div>
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
                            <table class="table table-de mb-0 clickableRow" id="ItemGrid">
                        <thead>
                            <tr>
                                 <th style="Display:none"></th>
                                <th><input type="checkbox" id="chkAll"> All</th>
                                <th>Item Name</th>
                                <th>Item Group</th>
                                <th>Item Type</th>
                                <th>Item Price</th>
                                <th>Description</th>
                               
                            </tr>
                        </thead>
                      <tbody>
                          <%--  <tr>  
                                 <td>1</td>
                                 <td>Shirt</td>
                                 <td>Cloths</td>
                                  <td>Mens</td>
                                 <td>CM</td>
                                 <td>200</td>
                                 <td>Description 1</td>
                            </tr>
                               <tr>  
                                 <td>2</td>
                                 <td>Shirt</td>
                                 <td>Cloths</td>
                                  <td>Mens</td>
                                 <td>CM</td>
                                 <td>200</td>
                                 <td>Description 2</td>
                                       <tr>  
                                 <td>3</td>
                                 <td>Shirt</td>
                                 <td>Cloths</td>
                                  <td>Mens</td>
                                 <td>CM</td>
                                 <td>200</td>
                                 <td>Description 3</td>
                            </tr>
                                  <tr>  
                                 <td>4</td>
                                 <td>Shirt</td>
                                 <td>Cloths</td>
                                  <td>Mens</td>
                                 <td>CM</td>
                                 <td>200</td>
                                 <td>Description 4</td>
                            </tr>

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
      <div class="modal fade text-left" id="conversionpopup" tabindex="-1" role="dialog" aria-labelledby="myModalLabel8"
									 aria-hidden="true" data-backdrop="static" data-keyboard="false">
										<div class="modal-dialog modal-lg" role="document">
											<div class="modal-content">
												<div class="modal-header bg-primary white">
                                                    <h6 class="white" id="H4">  Conversion  : <span class="white" id="conversioname"></span></h6>
													
													<button type="button" id="btnclose" class="close" aria-label="Close">
														<span aria-hidden="true">&times;</span>
													</button>
												</div>
											<div class="modal-body">
												    <div class="row">
                                         
                                           
                                            <%--<div class="  pl-1   ">
    <div class=" pull-left">    
   
   <button type="button" id="Button4" onclick="AddRow()" class="btn btn-primary waves-effect waves-light">
                            <i class="fa fa-plus"></i> Add Line</button>
                            <button type="button" id="Button5" class="btn btn-primary waves-effect waves-light">
                            <i class="fa fa-trash"></i> Delete Line</button>
                           
                       
                          
  
  
    
    </div>
    
    
    
                                            </div>--%>
 <div class="table-responsive" id="conversionForm">
                            <table class="table table-de mb-0 mt-1">
                        <thead>
                            <tr>
                            <th><input type="checkbox" id="Checkbox1" >All</th>
                                 <th>Value</th>
                                 <th>From Unit</th>
                                 <th>To Unit</th>
                                 <th>Converted Value</th>
                               
                            </tr>
                        </thead>
                      <tbody>
                            <tr> 
                            <td><input type="checkbox" id="Checkbox4"></td> 
                              <td>
                                 <input type="text" id="txtvalue" onkeyup="Comparevalue(this)" onkeypress="PopupRemoveClassItem(this)"  class="" placeholder="Enter  Value"> </td>
                                   
                                 
                               <td>
                               <input type="text" id="ddlfromunit" class="form-control" />
                                  <%-- <select  name="interested" class="form-control">
                                 <option value="none" selected="" disabled="">Select Item Unit </option>
												<option value="Type1">KG</option>
												<option value="Type2">Meter</option>
                                                 <option value="Type2">Gram</option>
                                                </select> --%>
                                                
                                                </td>
                                                <td>
                                 <input type="text" id="ddlBaseunit" readonly="readonly" class="form-control" />
                              <%--   <select  name="interested" class="form-control">
									<option value="none" selected="" disabled="">Select Item Unit </option>
												<option value="Type1">KG</option>
												<option value="Type2">Meter</option>
                                                <option value="Type2">Gram</option>
                                                </select>--%>
                                                </td>
                               
                                 <td>   <input type="text" id="txtconverted" onkeyup="Comparevalue(this)" onkeypress="PopupRemoveClassItem(this)"  class="" placeholder="Enter  Value"></td>
                            </tr>
                           
                      </tbody>
                          
                    </table>
                     <button type="button" id="btnconversionsub"   class="btn btn-primary pull-right buttonMargin">
                            <i class="fa fa-save"></i> Submit</button>
                            </div>
                                           
                                         
											
                                                 
												</div>
												  <div class="row" id="viewList">
                                        
                                      
 <div class="table-responsive">
 <div class=" ">    
   
       <button type="button" id="Button1" class="btn btn-primary waves-effect waves-light">
                            <i class="fa fa-file"></i> Export</button>
                            <button type="button" id="Button1" class="btn btn-primary waves-effect waves-light">
                            <i class="fa fa-print"></i> PDF</button>    
                       
    </div>
                            <table class="table table-de mb-0 buttonMargin" id="tblpopunit">
                        <thead>
                            <tr>
                            <th><input type="checkbox" id="Checkbox2" onclick="InputcheckAll(this)"/>All</th>
                                 <th>Value</th>
                                  <th>From Unit</th>
                                 <th>To Unit</th>
                               
                                
                                <th>Converted Value</th>
                               
                            </tr>
                        </thead>
                      <tbody>
                           <%-- <tr>  
                            <td>1</td>
                            <td>1</td>
                            <td>KG</td>
                            <td>ML</td>
                            <td>800 ML</td>
                            </tr>
                           <tr>  
                            <td>2</td>
                            <td>1</td>
                            <td>Pound</td>
                            <td>ML</td>
                            <td>400 ML</td>
                            </tr>--%>
                      </tbody>
                          
                    </table>

                            </div> 
                                          
                                        </div>
											</div>
										</div>
									</div>
                                    </div>
<div class="modal fade text-left" id="AllLeaveRequestPopup" tabindex="-1" role="dialog" aria-labelledby="myModalLabel8"
									 aria-hidden="true" data-backdrop="static" data-keyboard="false">
										<div class="modal-dialog" role="document">
											<div class="modal-content">
												<div class="modal-header bg-primary white">
                                                    <h6 class="white" id="H3">  Units  <span class="white" id="ColumnName"></span></h6>
													
													<button type="button" id="btnclosedata" class="close" aria-label="Close">
														<span aria-hidden="true">&times;</span>
													</button>
												</div>
											<div class="modal-body">
												    <div class="row">
                                                                               
    <div class="col-md-12">    
    <div class="pdfexport tablebtn">
                            <button type="button" id="btnpopupaddline" onclick="AddRow()" class="btn btn-primary waves-effect waves-light">
                            <i class="fa fa-plus"></i> Add Line</button>
                            <button type="button" id="btnpopupDeleteLine" class="btn btn-primary waves-effect waves-light">
                            <i class="fa fa-trash"></i> Delete Line</button>
                          
                          
    </div>

    </div>
                                            <div class="col-md-12">
    
                                                  <div class="table-responsive" id="Div1">
                              <table id="tblpopupdata" class="table table-de mb-0">
                      <thead>
                            <tr>
                                <th style="display:none"> </th>
                                <th id="hidePselect_all"><input type="checkbox" id="chkPAll" onclick="">All</th>
                                 <th>  Unit Name</th>
                                 <th>Description</th>   
                            </tr>
                        </thead>
                        <tbody>
                        <tr>
                        <td  style="display:none">1</td>
                        <td id="chkPtd"><input type="checkbox" id="cb_1" class="chk_PAll"></td>
                         <td>  <input type="text" id="txtUnit_1" onchange="" onkeypress='RemoveClass(this)' placeholder="Enter Unit Name" class="fieldName" autocomplete="off">      </td>
                     <td><input type="text" id="txtDesc_1" onchange="" onkeypress='RemoveClass(this)' placeholder="Enter Description" autocomplete="off"></td> 
                        </tr>
                         
                           
                        </tbody>
                    </table>
                            </div>
                                            </div>
                                          
                                        </div>
                                        	    <div class="row">
                                         
                                            <div class="col-md-12">
                                            <div class="table-responsive">
												 <button type="button"  id="btnsavepopupdata" class="btn btn-primary  pull-right">
                            <i class="fa fa-save"></i> Submit</button>
												</div>
												</div></div></div>
											</div>
										</div>
									</div>

<div class="modal fade text-left" id="variantPopup" tabindex="-1" role="dialog"  aria-hidden="true" data-backdrop="static" data-keyboard="false">
										<div class="modal-dialog modal-lg" role="document">
											<div class="modal-content">
												<div class="modal-header bg-primary white">
                                                    <h6 class="white" id="H1">Variant Details : <span class="white" id="lblvariantitemname"></span></h6>
													
													<button type="button" id="btnvariantclose" class="close" aria-label="Close">
														<span aria-hidden="true">&times;</span>
													</button>
												</div>
											<div class="modal-body">
												    <div class="row">
                                         
                                            <div class="col-md-12">
                                            <div >
                                       <div class="row " id="Div4">
									<div class="col-md-2">
                                    <div class="form-group">
											<label class="textHeader">Variant Name </label>
									</div>
                                    </div>
									<div class="col-md-2" >
                                    <div class="form-group">
											<label class="textHeader">Variant Value </label>
									</div>
                                    </div>
                                    <div class="col-md-8" >
                                    <div class="form-group">
                                    <label class="textHeader">Variant List </label>
                                    </div>
                                    </div>
                                    </div>
                                        <div class="row " id="appendvariant">

								<%--	<div class="col-md-2">
										 <div class="">                     
											<input type="checkbox" onchange="valueChanged()" class="colorCheckbox">
											<label class="">Color </label>
										</div>
									</div>
									<div class="col-md-2" id="colorTextBox">
										 <div class="form-group">                     
											<input type="text" name="weekday" class="form-control" id="Checkbox5" placeholder="Enter Value">
										</div>
									</div>
                                    <div class="col-md-8" id="colorListBox" >
                                    <div class="VarientList">
                                    </div>
                                    </div>--%>

                                  
                                  
                                 
                                    </div>
                                       

                                   <div class="row">
                                   <div class="col-md-12">
                                     <button type="button"  id="btnaddvariants" class="btn btn-primary  pull-right">
                            <i class="fa fa-plus-square"></i> Add Variant</button>
                                    </div>
                                    </div>
                                     <div class="row " id="Divvariant" style="display:none">
                                      <div class="col-md-12 ">
                                     <button type="button" id="Button7" onclick="AddVariantRow()" class="btn btn-primary ">
                            <i class="fa fa-plus"></i> Add Line</button>
                            <button type="button" id="Button9" class="btn btn-primary ">
                            <i class="fa fa-trash"></i> Delete Line</button>
                                    </div>
									<div class="col-md-12">
										 <div class="table-responsive" style="  width: 100% !important;">
                            <table class="table table-de mb-0 " id="varianttable">
                        <thead>
                            <tr>
                           <%-- <th><input type="checkbox" id="Checkbox3" onclick="InputcheckAll(this)"/> All</th>
                                 <th>Variant</th>
                                  <th>Price</th>
                                 <th>SKU</th>--%>
                               
                            </tr>
                        </thead>
                      <tbody>
                          
                      </tbody>
                          
                    </table>

                            </div>
									</div>
                                    <div class="pb-1"> 
                                      <div class="col-md-12">
                                    <button type="button"  id="btnfinalsubmit" class="btn btn-primary  pull-right">
                            <i class="fa fa-save"></i> Submit</button>
                            </div>
                            </div>
                                    </div>



                                     
                                    </div>
                                    <div class="row " id="ShowVariantDiv" style="display:block">
                                      <div class="col-md-12 ">
                                     <button type="button" id="Button4" class="btn btn-primary">
                            <i class="fa fa-file"></i> Export</button>
                          <button type="button" id="Button5" class="btn btn-primary ">
                           <i class="fa fa-print"></i> PDF</button>
                                    </div>
									<div class="col-md-12">
                                    <div class="">
										 <div class="table-responsive" style=" width: 100%!important">
                            <table class="table table-de mb-0 " id="varianttablebind" >
                        <thead>
                            <tr>
                                 <th id="Th1"><input type="checkbox" id="Checkbox3" onclick=""> All</th>
                                 <th>S.No.</th>
                                  <th>SKU Code</th>
                                 <th>SKU Name</th>
                               
                            </tr>
                        </thead>
                      <tbody>
                        
                      </tbody>
                          
                    </table>

                            </div>
                            </div>
									</div>
                                    <div> 
                            
                            </div>
                                    </div>
                                            </div>
                                          
                                        </div>
												
												</div>
												
											</div>
										</div>
									</div>
 <div class="modal fade text-left" id="TaxGroup" tabindex="-1" role="dialog" aria-labelledby="myModalLabel8"
									 aria-hidden="true" >
										<div class="modal-dialog " role="document">
											<div class="modal-content">
												<div class="modal-header bg-primary white">
                                                    <h6 class="white" id="H2"> Group Tax : <span class="white" id="lblitm"></span></h6>
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

                                        </div>
                                 
                                        
                                        
                                        
                                        <div class="row">
<div class="col-md-12">
         <button type="button" id="btnTaxgrpSubmit" class="btn btn-primary pull-right mb-1 waves-effect waves-light">
                            <i class="fa fa-save"></i> Submit</button>
		</div>
		</div></div>
												
												</div>
												
											</div>
										</div>
									</div>
      <script>
          jquery_1_11_3_min_p(document).ready(function () {
              $(function () {
                  $('#gsttype').change(function () {
                    //  alert("w");
                      $('#GSTType')[($("option[value='gst']").is(":checked")) ? "show" : "hide"]();
                  });
              });
          });
      </script>                              
</asp:Content>
