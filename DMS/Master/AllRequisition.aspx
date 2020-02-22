<%@ Page Language="C#" MasterPageFile="~/DMS.Master" AutoEventWireup="true" CodeBehind="AllRequisition.aspx.cs" Inherits="DMS.Master.AllRequisition" %>

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
     <script src="../JavaScript/Request.js" type="text/javascript"></script>
     <script>
         jquery_1_11_3_min_p(document).ready(function () {
         });
         </script>
         <style>
             #itemRequestList tbody td, #itemRequestList thead th {      width: 105px;    }
         </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <input type="hidden" id="hdnLoad"/>
   <div class="content-header row">
        <div class="content-header-light col-12">
            <div class="row">
                <div class="content-header-left col-md-6 col-12 mb-2">
                    <h4 class="content-header-title mainheading" id="AllRequisition">
                        All Requisition</h4>
                         <h4 class="content-header-title mainheading " id="RequisitionForm" style="Display:none">
                        Requisition Form</h4>
                </div>
                <div class="content-header-right col-md-6 col-12">
                    <div class="btn-group float-md-right" role="group" aria-label="Button group with nested dropdown">
                        <button type="button" id="btnNew"  class="btn btn-primary">
                            <i class="fa fa-plus-square"></i> New</button>

                        <button type="button" id="btnSubmit" style="display:none" class="btn btn-primary">
                            <i class="fa fa-save"></i> Submit</button>
                        <button type="button" id="btnedit" style="display:none" class="btn btn-primary">
                            <i class="fa fa-edit"></i> Recall</button>
                             <button type="button" id="btnRecallHistory" style="display:none" class="btn btn-primary">
                            <i class="fa fa-arrow-left"></i> Recall History</button>
                               <button type="button" id="btnship" style="display:none" class="btn btn-primary">
                            <%--<i class="fa fa-arrow-left"></i>--%> Ship</button>
                              <button type="button" id="btnreturn" style="display:none" class="btn btn-primary">
                            <%--<i class="fa fa-arrow-left"></i>--%> Return</button>

                        <button type="button" id="btnDelete" style="display:none" class="btn btn-primary">
                            <i class="fa fa-trash-o"></i> Cancel</button>
                        <button type="button" id="btnback" style="display:none" class="btn btn-primary">
                            <i class="fa fa-arrow-left"></i> Back</button>
                           <%--   <button type="button" id="btnsummary" data-toggle="modal" data-target="#summery" class="btn btn-primary">
                            <i class="fa fa-arrow-left"></i> pop</button>--%>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="content-wrapper">
<div id="preloader" style="display: none;">
  <div id="showPreloader"> <img src="../../assets/img/preloader.gif" > </div>
</div>

<div id="Overlay_Load" style="display: none;"></div>
    <div class="">
        <div class="content-body">
        <%--  <section id="RequestControlDetail" style="Display:none"  >
                <div class="row match-height">
                    <div class="col-md-12">
                        <div class="card">
                          
                          
                            </div>
                        </div>
                    </div>
                </div>
            </section>--%>

             <div class="row match-height" id="Kendorequestdetail"  style="Display:none">
          
                <div class="col-12 col-xl-12 ">                    
                    <div class="card">
                <div class=" collapse show" >
                                <div class="card-body">
                                    <div class="card-text">
                                    </div>
                                    <form class="form">
                                    <div class="form-body">
                                      
                                        <div class="row lebels">
                                            <div class="col-md-2">
                                                <div class="form-group">
                                                  
                                                    <label for="RequestNo">Request No. </label>
                                                
                                                </div>
                                            </div>
                                            <div class="col-md-2">
                                              <span > : <label  id="lblReqNum"></label></span>
                                            </div>
                                            <div class="col-md-2">
                                                <div class="form-group">
                                                  <label for="CreatedBy">Created By </label>
                                                  
                                                </div>
                                            </div>
                                            <div class="col-md-2">
                                             <span >: <label  id="lblCreatedBy"></label></span>
                                            </div>
                                                   <div class="col-md-2">
                                                <div class="form-group">
                                                  <label for="CreatedDate">Requested Date </label>
                                                   
                                                </div>
                                            </div>
                                              <div class="col-md-2">
                                               <span > :  <label  id="lblReqDate"></label></span>
                                              </div>
                                            <div class="col-md-2">
                                                <div class="form-group">
                                                  <label for="CreatedDate">Submitted Date </label>
                                                   
                                                </div>
                                            </div>
                                              <div class="col-md-2">
                                               <span >: <label  id="lblSubmittedDate"></label></span>
                                              </div>
                                            <div class="col-md-2">
                                                <div class="form-group">                                                  
                                                    <label for="Status">Requested Warehouse </label> 
                                                </div>
                                            </div>
                                              <div class="col-md-2">
                                               <span >: <label  id="lblrequestedwarehouse" ></label></span>
                                              </div>
                                                <div class="col-md-2">
                                                <div class="form-group">                                                  
                                                    <label for="Status">Status </label>             
                                                </div>
                                            </div>
                                              <div class="col-md-2">
                                              <span > : <label  id="lblStatus"></label></span>
                                              </div>
                                        </div>
                                          
                                        </div>
                                       
                                    </div>
                                    
                                    </form>
                                </div>
                        <div class="pb-1" id="Kendorecall" >
                             <div class="row">
    <div class="col-md-12">    
    <div class="pdfexport tablewidth">
   <button type="button" id="Button1" class="btn btn-primary waves-effect waves-light">
                            <i class="fa fa-file"></i> Export</button>
                          
                 

                 <button type="button" id="Button2" class="btn btn-primary waves-effect waves-light">
                           <i class="fa fa-print"></i> PDF</button>
                       
                         
    </div></div>
  
</div>
                            <div class="table-responsive">
                             <table class="table table-de mb-0" id="DivRequestKendo">
                        <thead>
                            <tr>
                            <th style="Display:none" >RequestDetId</th>
                            <th style="Display:none" >RequestDetId</th>
                                <th> <input id='Checkbox1' type='checkbox' class='checkboxcls' onclick='checkAllHeaderGrid(this)'/> All</th>
                                 <th>Location</th>
                                <th>Item No</th>
                                <th>Item Name</th>
                                <th>Inventory Unit</th>
                                <th>Onhand</th>
                                <th>Requested Qty</th>
                                <th>Received Qty</th>
                                 <th>Transfer Order</th>
                                <th>Shipping Reason</th>
                                 <th>Remarks</th>
                                 <th>Line Status</th>
                            </tr>
                        </thead>
                      <tbody></tbody>
                          
                    </table>
                    </div>
                        </div>
                    </div>
                </div>
            </div>
            <%--<section id="basic-form-layouts"  >
                <div class="row match-height" id="newheader" style="display: none;" >
                    <div class="col-md-12">
                        <div class="card">
                          
                            <div class="card-content collapse show" >
                              
                            </div>
                        </div>
                    </div>
                </div>
            </section>--%>


              <div class="row match-height" id="createNewItem" style="display: none;">
             
                <div class="col-12 col-xl-12 ">                    
                    <div class="card">
                      <div class="card-body" id="Divnewrequest" >
                                   
                                    <form class="form">
                                    <div class="form-body">
                                      
                                        <div class="row">
                                            <div class="col-md-2">
                                                <div class="">
                                                  <label class="" id="lblRequisitionId" style="display:none"></label>
                                                    <label for="RequestNo">Request No.</label>
                                                  
                                                </div>
                                                <label id="lblRequestNum" style="color:Red"></label>
                                            </div>
                                            <div class="col-md-2">
                                             <input type="text" id="txtRequestNum"   />
                                            </div>
                                            <div class="col-md-2">
                                                <div class="">
                                                  <label for="CreatedBy">Created By</label>
                                                   
                                                </div>
                                            </div>

                                             <div class="col-md-2">
                                            <input type="text" id="txtCreatedBy" disabled />
                                            </div>
                                                   <div class="col-md-2">
                                                <div class="">
                                                  <label for="CreatedDate">Request Date</label>
                                                  
                                                </div>
                                            </div>
                                            <div class="col-md-2">                                            
                                              <input type="text" id="txtRequestedDate" disabled />
                                            </div>
                                               <div class="col-md-4" style="display:none">
                                                <div class="form-group">
                                                  <label for="Warehouse">Warehouse</label>
                                                    <input type="text" id="ddlWarehouse" disabled="disabled" class="form-control" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    </form>
                                </div>
                       <div class=" ml-1">
                    <div class="btn-group pb-1 pt-1" role="group" aria-label="Button group with nested dropdown">
                        <button type="button" id="btnAdd" onclick="AddRow()" class="btn btn-primary waves-effect waves-light mr-1">
                            <i class="fa fa-plus-square"></i> Add Line</button>
                        <button type="button" id="btnDeleteLine" class="btn btn-primary waves-effect waves-light">
                            <i class="fa fa-trash"></i> Delete Line</button>
                        
                    </div>
                </div>
                        <div class="">
                        <div class="table-responsive">
                             <table class="table table-de mb-0" id="tblRequisitionDetail" >
                <thead>
                  <tr>
                    <th id="hideselect_all"  style="display:none">
                    <input id="select_all" type="checkbox" class="checkbox" /> All
                    </th>
                     <th >Location</th>
                    <th >Item No.</th>
                    <th >Item Name</th>
                    <th >Item SKU.</th>
                    <th >Item Onhand</th>
                    <th >Requested Qty</th>
                    <th >Remark</th>
                    <th  style="display:none">Counter</th>
                  </tr>
                </thead>
                <tbody>
                <tr>
                <td  style="display:none" id="chktd"><input type="checkbox" id="cb_1"  class="checkbox"/> </td>                                     <td >
                    <input type="text" id="ddlLocation_1" class="form-control" onkeyup="RemoveClassItemMaster(this)" autocomplete="off" />
                </td>
                <td >
                    <input type="text" id="ddlItem_1" class="form-control" onkeyup="RemoveClassItemMaster(this)"  onchange="ItemChange(this)" autocomplete="off" />
                </td>
                 <td >
                    <label id="lblItemName_1" class="gridTooltip"><span class="tooltiptext"></span></label>
                </td>
               
                 <td >
                    <input type="text" id="ddlItemSku_1" class="form-control" onkeyup="RemoveClassItemMaster(this)"  autocomplete="off" />
                </td>
                <td >
                    <label id="lblItemOnhand_1" class="gridTooltip"><span class="tooltiptext"></span></label>
                </td>
                <td >
                    <input type="text" placeholder="" class="" id="txtRequestedQTY_1" autocomplete="off" onkeypress="NumericAllow(this)" 
                    onchange="RemoveClassItemMaster(this)" onkeyup="Comparevalue(this)" />
                </td>  
                 <td >
                <input type='text' placeholder="" class='' id="txtRemark_1" autocomplete="off" onkeypress="NumericAllow(this)"  />
                </td>    
                <td  style="display:none">1</td>
                </tr>
               </tbody>
              </table>

              </div>



                        </div>
                    </div>
                </div>
            </div>
            <div class="row match-height" id="divGrid" >
                <div class="col-12 col-xl-12 ">                    
                    <div class="card">
                        <div class="card-content">
                        
                      <div class="container">
                         <div class="row">
    <div class="col-md-8">    
    <div class="pdfexport ">
   <button type="button" id="btnExcel" class="btn btn-outline-primary" title="Export">
                            <i class="fa fa-file-excel-o"></i> </button>
                          
                 

                 <button type="button" id="btnexportpdf" class="btn btn-outline-primary" title="PDF">
                           <i class="fa fa-file-pdf-o"></i> </button>
                       
                         
    </div></div>
    <div class="col-md-2 "> 
      <div class="searchDropdown">
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
    <div class="col-md-2  ">
     <div class="searchbox ">
    
                                   <div class="dropdown">
							<div class="dropdown-menu checkboxSearch">
							<div class="columnList">
								<div class="dropdown-item">
									<span class="skin skin-polaris">
										<input type="checkbox" id="check3" checked="">
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
										<input type="checkbox" id="Checkbox2">
										<label for="check4" class="coldata">City</label>
									</span>
								</div>
                                	<div class="dropdown-item">
									<span class="skin skin-polaris">
										<input type="checkbox" id="Checkbox3">
										<label for="check4" class="coldata">State</label>
									</span>
								</div>
                                	<div class="dropdown-item">
									<span class="skin skin-polaris">
										<input type="checkbox" id="Checkbox4">
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
                            <input type="text" class="form-control round " placeholder="Search">
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
                             <table class="table table-de mb-0 clickableRow" id="itemRequestList">
                        <thead>
                            <tr>
                            <th style="Display:none" >Requisition Id</th>
                                <th> <input id='chkall' type='checkbox' class='checkboxcls' onclick='checkAllHeaderGrid(this)'/> All</th>
                                <th>Request Number</th>
                                <th>Warehouse Name</th>
                                <th>Created By</th>
                                <th>Created On</th>
                                <th>Submitted Date</th>
                                <th>Status</th>
                                 <th>Last Activtity By</th>
                                <th>Last Activtity Date</th>
                            </tr>
                        </thead>
                      <tbody></tbody>
                          
                    </table>
                    </div>
                   <div id="countRow">
                 <p class=" pull-right">Showing <label id="lblRowCount"></label> of <label id="lblTotalCount"></label></p>
                 <p class="text-center mt-1">
                 <span class="load text-center" id="btnLoadMore">Load More.....</span>
                 </p>
                 </div>
                        </div>
                    </div>
                 </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


      
             
         
        <label id="lblUserId" runat="server" style="display: none"></label>
        <label id="lblwarehouseid" runat="server" style="display: none"></label>
        <label id="lblUserName" runat="server" style="display: none"></label>
        <asp:Label ID="lblrecallvalue" runat="server" style="display:none"></asp:Label>
        
    </div>
    </div>

      <div class="modal fade text-left summery" id="summery" tabindex="-1" role="dialog" aria-labelledby="myModalLabel8"
									 aria-hidden="true" data-backdrop="static" data-keyboard="false">
										<div class="modal-dialog modal-lg" role="document">
											<div class="modal-content">
												<div class="modal-header  white">
													<h4 class="modal-title " id="calname">Requisition Summary</h4>
													<button type="button" class="close" data-dismiss="modal" aria-label="Close">
														<span aria-hidden="true">&times;</span>
													</button>
												</div>
											<div class="modal-body">
												    <div class="row">
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>Request No. :</label>
                                                    <span id="VoucherNo"><label  id="lblSReqNum"></label></span>
                                                </div>
                                            </div>
                                                <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>Created By:</label>
                                                    <span  id="Span1"><label  id="lblSCreatedBy"></label></span>
                                                </div>
                                            </div>
                                             <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>Request Date  :</label>
                                                    <span id="Span2"><label  id="lblSReqDate"></label></span>
                                                </div>
                                            </div>
                                               
                                      
                                        </div>

                                        <div class="row">
                                          <div class="col-md-12">
                                         <div class="table-responsive" id="deptgrid">
                              <table id="tblrowappend" class="table table-de mb-0">
                        <thead>
                            <tr>
                                <th>Item No.</th>                               
                                <th>Item Name</th>
                                 <th>Requested Quantity</th>
                                  <th>Remark </th>
                            </tr>
                        </thead>
                        <tbody>
                            <%--<tr class="">
                              
                                <td> 10001</td>
                                <td>3 PAIR PLAIN SCREENED INDOOR </td>
                                 <td>33</td>
                                 <td>as soon as possible</td>
                            </tr>--%>
                        <%--    <tr>
                                <td> 10003</td>
                                <td>3 PAIR PLAIN SCREENED INDOOR </td>
                                 <td>33</td>
                                 <td>abc</td>
                            </tr>
                            <tr>
                                 <td> 10007</td>
                                <td>3 PAIR PLAIN SCREENED INDOOR </td>
                                 <td>33</td>
                                 <td>Xyz</td>
                            </tr>
                            <tr>
                               <td> 10005</td>
                                <td>3  INDOOR CABLE 100M/REELS</td>
                                 <td>3</td>
                                 <td> possible</td>
                            </tr>
                            <tr>
                                <td> 10003</td>
                                <td> SCREENED INDOOR CABLE 100M/REELS</td>
                                 <td>33</td>
                                 <td></td>
                            </tr>
                            <tr class="">
                               <td> 10001</td>
                                <td> PLAIN SCREENED INDOOR </td>
                                 <td>33</td>
                                 <td>possible</td>
                            </tr>--%>
                        </tbody>
                    </table>
                            </div>
                                        </div>
                                        </div>
													<hr>
													
												</div>
												<div class="modal-footer">
													
													 <button type="button" id="btnprint" class="btn btn-primary btngrid waves-effect waves-light">
                            Print </button>

                                                    <button type="button" id="btnconfirm" class="btn btn-primary btngrid waves-effect waves-light">
                            Close </button>
												</div>
											</div>
										</div>
                                        <label id="Label1" runat="server" style="display: none">
        
        </label>
         
									</div>


    <script>
        kendo_all_min_js("#DivRequestKendo").kendoTooltip({
            filter: "td:nth-child(4), td:nth-child(5)",
            position: "right",
            content: function (e) {
                var text = kendo_all_min_js(e.target).text();
                return '<div style="width: ' + text.length * .6 + 'em; max-width: 20em">' + text + '</div>';
            }
        });
        
        kendo_all_min_js("#itemRequestList").kendoTooltip({
            filter: "td:nth-child(4),th:nth-child(7) .k-link, th:nth-child(9) .k-link, th:nth-child(10) .k-link",
            position: "right",
            content: function (e) {
                var text = kendo_all_min_js(e.target).text();
                return '<div style="width: ' + text.length * .6 + 'em; max-width: 20em">' + text + '</div>';
            }
        });
    </script>
</asp:Content>

