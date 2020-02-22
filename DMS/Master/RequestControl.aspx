<%@ Page Language="C#" MasterPageFile="~/DMS.Master" AutoEventWireup="true" CodeBehind="RequestControl.aspx.cs" Inherits="DMS.Master.RequestControl" %>

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
    

     <script src="../JavaScript/RequestControl.js" type="text/javascript"></script>
    
     <style>
          #AllRequests tbody td, #AllRequests thead th {      width: 105px;    }
     #tblRequisitionDetail td:nth-child(3), #tblRequisitionDetail th:nth-child(3) {
    width: 50px;
}
#tblRequisitionDetail td:nth-child(5) {    white-space: nowrap;
    width: 150px;
    overflow: hidden;
    text-overflow: ellipsis;}
     </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <input type="hidden" id="hdnLoad"/>
 <div class="content-header row">
        <div class="content-header-light col-12" >
            <div class="row" id="">
                <div class="content-header-left col-md-6 col-12 mb-2">
                    <h4 class="content-header-title mainheading">
                       Request Control</h4>
                </div>
                <div class="content-header-right col-md-6 col-12" id="divbtn" style="display:none">
                    <div class="btn-group float-md-right" role="group" aria-label="Button group with nested dropdown">
                        <button type="button" id="btnApprove" class="btn btn-primary">
                            <i class="fa fa-plus-square"></i> Approve</button>
                       <%-- <button type="button" id="btnReject" class="btn btn-primary">
                            <i class="fa fa-save"></i> Reject</button>--%>

                        <button type="button" id="btnRecall" style="display:none"  class="btn btn-primary">
                            <i class="fa fa-edit"></i> Recall</button>
                         <button type="button" id="btnShip"  class="btn btn-primary">
                            <i class="fa fa-edit"></i> Ship</button>
                        <button type="button" id="btnback" class="btn btn-primary">
                            <i class="fa fa-arrow-left"></i> Back</button>
                          <%--  <button type="button" id="Button1" class="btn btn-primary" data-toggle="modal" data-target="#RequisitionApproval">
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
         <%--   <section id="RequestControlDetail" style="display:none" >
                <div class="row match-height">
                    <div class="col-md-12">
                        <div class="card">
                          
                            <div class=" collapse show" >
                              
                            </div>
                        </div>
                    </div>
                </div>
            </section>--%>
              <div class="row match-height" id="createNewItem" style="display:none">
          
                <div class="col-12 col-xl-12 ">                    
                    <div class="card">
                   <div class="card-body">
                                 
                                    <form class="form">
                                    <div class="form-body" id="Reqheader" >
                                      
                                        <div class="row lebels borderBottom">
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                  
                                                    <label for="RequestNo">Request No. </label>
                                                 <span  > : <label id="lblReqNum"></label></span>
                                                </div>
                                            </div>
                                             
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                  <label for="CreatedBy">Created By </label>
                                                   <span> : <label id="lblCreatedBy"></label></span>
                                                </div>
                                            </div>
                                           
                                                   <div class="col-md-3">
                                                <div class="form-group">
                                                  <label for="CreatedDate">Requested Date </label>
                                                    <span > : <label id="lblReqDate"></label></span>
                                                </div>
                                            </div>
                                             <div class="col-md-3">
                                                <div class="form-group">
                                                  
                                                    <label for="Status">Status </label>
                                                   <span > : <label id="lblStatus"></label> </span>
                                                </div>
                                            </div>
                                        </div>
                                       
                                    </div>
                                    
                                    </form>
                                </div>
                        <div class="card-content">
                        <div class="container">
                        <div class="row">
    <div class="col-md-8">    
    <div class="pdfexport">
   <button type="button" id="Button1" class="btn btn-primary ">
                            <i class="fa fa-file"></i> Export</button>
                          
                 

                 <button type="button" id="Button2" class="btn btn-primary ">
                           <i class="fa fa-print"></i> PDF</button>
                       
                         
    </div></div>
    <div class="col-md-2 "> 
      <div class="searchDropdown">
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
    <div class="col-md-2  ">
     <div class="searchbox ">
    
                                   <div class="dropdown">
							<div class="dropdown-menu checkboxSearch" x-placement="bottom-start" style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(15px, 28px, 0px);">
							<div class="columnList">
								<div class="dropdown-item">
									<span class="skin skin-polaris">
										<input type="checkbox" id="Checkbox6" checked="">
										<label for="check3" class="coldata">Address Line 1</label>
									</span>
								</div>
								<div class="dropdown-item">
									<span class="skin skin-polaris">
										<input type="checkbox" id="Checkbox7">
										<label for="check4" class="coldata">Address Line 1</label>
									</span>
								</div>
                                	<div class="dropdown-item">
									<span class="skin skin-polaris">
										<input type="checkbox" id="Checkbox8">
										<label for="check4" class="coldata">City</label>
									</span>
								</div>
                                	<div class="dropdown-item">
									<span class="skin skin-polaris">
										<input type="checkbox" id="Checkbox9">
										<label for="check4" class="coldata">State</label>
									</span>
								</div>
                                	<div class="dropdown-item">
									<span class="skin skin-polaris">
										<input type="checkbox" id="Checkbox10">
										<label for="check4" class="coldata">State</label>
									</span>
								</div>
                                </div>
                                 <div class="dropdownBottom">
                                <label class="pull-left" id="Label2">Select All</label>
                                  <label class="pull-right" id="Label3">Reset</label>
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
                            <table class="table table-de mb-0 clickableRow" id="tblRequisitionDetail">
                        <thead>
                            <tr>
                             <th style="Display:none" >RequisitiondetId</th>
                             <th style="Display:none" >RequisitionId</th>
                                <th> <input id='Checkbox1' type='checkbox' class='checkboxcls' onclick='checkAllHeaderGrid(this)'/> All</th>
                                 <th>Location</th>
                                <th>Item No.</th>
                                <th>Item Name</th>
                                <th>Requester</th>
                                <th>Inventory Unit</th>
                                <th>Requested Qty</th>
                                <th>Approved Qty</th>
                                 <th>Status</th>
                                <th>Remaining Qty</th>
                                 <th>Remarks</th>
                            </tr>
                        </thead>
                      <tbody></tbody>
                          
                    </table>
                            </div>
                            </div>
                    </div>
                </div>
                        </div>
                    </div>
                </div>
            </div>

             <div class="row mt-1" id="availableWarehouse" style="display:none">
          
                <div class="col-12 col-xl-12 ">                    
                    <div class="card">
                    <div class="card-header "><h6 class="form-section">Available Quantity Location Wise</h6>    </div>
                        <div class="card-content">
                        <div class="container">
                        <div class="row lebels mb-1">
                                            <div class="col-md-3">
                                                <div class=" ">
                                                  
                                                    <label for="RequestNo">Item No. </label>
                                                 <span> : <label id="lblWReqNum"></label></span>
                                                </div>
                                            </div>
                                             
                                            <div class="col-md-5">
                                                <div class="">
                                                  <label for="CreatedBy">Item Name </label>
                                                    <span> : <label id="lblWReqName"></label></span>
                                                </div>
                                            </div>
                                           
                                                   <div class="col-md-3">
                                                <div class="">
                                                  <label for="CreatedDate">Requested Quantity </label>
                                                     <span> : <label id="lblWReqqty"></label></span>
                                                </div>
                                            </div>
                                            </div>
                                        </div>
                                        <div class="container">
                                        <div class="row">
    <div class="col-md-8">    
    <div class="pdfexport ">
   <button type="button" id="Button3" class="btn btn-outline-primary" title="Export">
                            <i class="fa fa-file-excel-o"></i> </button>
                          
                 

                 <button type="button" id="Button4" class="btn btn-outline-primary" title="PDF">
                           <i class="fa fa-file-pdf-o"></i> </button>
                       
                         
    </div></div>
    <div class="col-md-2 "> 
      <div class="searchDropdown">
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
    <div class="col-md-2  ">
     <div class="searchbox">
    
                                   <div class="dropdown">
							<div class="dropdown-menu checkboxSearch" x-placement="bottom-start" style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(15px, 28px, 0px);">
							<div class="columnList">
								<div class="dropdown-item">
									<span class="skin skin-polaris">
										<input type="checkbox" id="Checkbox11" checked="">
										<label for="check3" class="coldata">Address Line 1</label>
									</span>
								</div>
								<div class="dropdown-item">
									<span class="skin skin-polaris">
										<input type="checkbox" id="Checkbox12">
										<label for="check4" class="coldata">Address Line 1</label>
									</span>
								</div>
                                	<div class="dropdown-item">
									<span class="skin skin-polaris">
										<input type="checkbox" id="Checkbox13">
										<label for="check4" class="coldata">City</label>
									</span>
								</div>
                                	<div class="dropdown-item">
									<span class="skin skin-polaris">
										<input type="checkbox" id="Checkbox14">
										<label for="check4" class="coldata">State</label>
									</span>
								</div>
                                	<div class="dropdown-item">
									<span class="skin skin-polaris">
										<input type="checkbox" id="Checkbox15">
										<label for="check4" class="coldata">State</label>
									</span>
								</div>
                                </div>
                                 <div class="dropdownBottom">
                                <label class="pull-left" id="Label4">Select All</label>
                                  <label class="pull-right" id="Label5">Reset</label>
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
                                        <table class="table table-de mb-0" id="RequestLine">
                        <thead>
                            <tr>
                           
                                <th> <input id='Checkbox2' type='checkbox' class='checkboxcls' onclick='checkAllHeaderGrid(this)'/> All</th>
                                <th>S.No</th>
                                <th>Location Code</th>
                                <th>Location Name</th>
                                <th>Onhand</th>
                                <th>Approve Qty</th>
                                
                            </tr>
                        </thead>
                      <tbody></tbody>
                          
                    </table>
                                        
                                        </div>
                             </div>
                    </div>
                </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row match-height" id="Al">
         <%--   <div class="col-12 col-xl-12 selectAll ">
                        
                      <div class="custom-control">                     
											<input type="checkbox" class="" id="chkall"/>
											<label class="custom-control-label" for="chkall">Select All </label>
										</div>
                    </div>--%>
                <div class="col-12 col-xl-12 ">                    
                    <div class="card">
                   
                        <div class="card-content" id ="MainGrid">
                        <div class="container">
                        <div class="row">
    <div class="col-md-8">    
    <div class="pdfexport ">
   <button type="button" id="btnExcel" class="btn btn-outline-primary" title="Export">
                            <i class="fa fa-file"></i> </button>
                          
                 

                 <button type="button" id="btnexportpdf" class="btn btn-outline-primary" title="PDF">
                           <i class="fa fa-print"></i> </button>
                       
                         
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
										<input type="checkbox" id="Checkbox3">
										<label for="check4" class="coldata">City</label>
									</span>
								</div>
                                	<div class="dropdown-item">
									<span class="skin skin-polaris">
										<input type="checkbox" id="Checkbox4">
										<label for="check4" class="coldata">State</label>
									</span>
								</div>
                                	<div class="dropdown-item">
									<span class="skin skin-polaris">
										<input type="checkbox" id="Checkbox5">
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
                             <table class="table table-de mb-0 clickableRow" id="AllRequests">
                        <thead>
                            <tr>
                              <th style="Display:none" >RequisitionId</th>
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
                           
                 <span class="showMsg  pull-right">Showing <label id="lblRowCount"></label> of <label id="lblTotalCount"></label></span>
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
        <label id="lblUserId" runat="server" style="display: none">
        
        </label>
         <label id="lblRequestedWareHouseId" style="display: none">
        
        
        </label>
         <label id="lblreqdetid" style="display: none"></label>
         <label id="lblrequitionid" style="display: none"></label>
            </div>
           

    </div>
      <div class="modal fade text-left summery" id="RequisitionApproval" tabindex="-1" role="dialog" aria-labelledby="myModalLabel8"
									 aria-hidden="true" data-backdrop="static" data-keyboard="false">
										<div class="modal-dialog modal-lg" role="document">
											<div class="modal-content">
												<div class="modal-header  white">
													<h4 class="modal-title black" id="calname">Requisition Approval Summary</h4>
													<button type="button" id="closeApprovePop"  class="close" data-dismiss="modal" aria-label="Close">
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
                                                    <label>Requested Date  :</label>
                                                    <span id="Span2"><label  id="lblSReqDate"></label></span>
                                                </div>
                                            </div>
                                               
                                      
                                        </div>

                                        <div class="row">
                                          <div class="col-md-12">
                                         <div class="table-responsive" id="">
                              <table id="tblrowappend" class="table table-de mb-0">
                        <thead>
                            <tr>
                                <th>Item No.</th>                               
                                <th>Item Name</th>
                                <th>Requester</th>
                                 <th>Inventory Unit</th>
                                 <th>Requested Quantity</th>
                                 <th>Approved Quantity</th>                                  
                                  <th>Remark </th>
                            </tr>
                        </thead>
                        <tbody>
                          <%--  <tr class="">
                              
                                <td> 10001</td>
                                <td>3 PAIR PLAIN SCREENED INDOOR </td>
                                 <td>Partner Shops</td>
                                 <td>Mtr</td>
                                 <td>44</td>
                                 <td>30</td>
                                 <td>14</td>
                                 <td>In Progress</td>
                                 <td>Urgent</td>
                            </tr>
                      <tr class="">
                              
                                <td> 10001</td>
                                <td>3 PAIR PLAIN SCREENED INDOOR </td>
                                 <td>Partner Shops</td>
                                 <td>Mtr</td>
                                 <td>44</td>
                                 <td>30</td>
                                 <td>14</td>
                                 <td>In Progress</td>
                                 <td>Urgent</td>
                            </tr>
                              <tr class="">
                              
                                <td> 10001</td>
                                <td>3 PAIR PLAIN SCREENED INDOOR </td>
                                 <td>Partner Shops</td>
                                 <td>Mtr</td>
                                 <td>44</td>
                                 <td>30</td>
                                 <td>14</td>
                                 <td>In Progress</td>
                                 <td>Urgent</td>
                            </tr>--%>
                        </tbody>
                    </table>
                            </div>
                                        </div>
                                        </div>
													<hr>
													
												</div>
												<div class="modal-footer">
													
													 <button type="button" id="print" class="btn btn-primary btngrid waves-effect waves-light">
                            Print </button>

                                                    <button type="button" id="btnconfirm"  class="btn btn-primary btngrid waves-effect waves-light">
                            Close </button>
												</div>
											</div>
										</div>
                                        <label id="Label1" runat="server" style="display: none">
        
        </label>
         
									</div>
        <script>
            kendo_all_min_js("#tblRequisitionDetail").kendoTooltip({
                filter: "td:nth-child(6)",
                position: "right",
                content: function (e) {
                    var text = kendo_all_min_js(e.target).text();
                    return '<div style="width: ' + text.length * .6 + 'em; max-width: 18em">' + text + '</div>';
                }
            })
            kendo_all_min_js("#RequestLine").kendoTooltip({
                filter: "td:nth-child(4)",
                position: "right",
                content: function (e) {
                    var text = kendo_all_min_js(e.target).text();
                    return '<div style="width: ' + text.length * .6 + 'em; max-width: 14em">' + text + '</div>';
                }
            })
          
    </script>
</asp:Content>



