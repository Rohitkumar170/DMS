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
        .table tbody td, .table thead th {    width: 140px;  }
         #RequisitionLineForm td:nth-child(1), #RequisitionLineForm th:nth-child(1) {    width: 50px;} 
         #RequisitionLineForm td:nth-child(6) input[type="text"]{    text-align:right; width: 90px;} 
         #RequisitionLineForm td:nth-child(5), #RequisitionLineForm th:nth-child(5) {    text-align:right; width: 90px;} 
         .table td:last-child, .table th:last-child {    width: 120px;}
         .headerPropery{width: 100px;}
         .headerValue{width: 100px;}
         #AllRequisitionGrid td:nth-child(1), #AllRequisitionGrid th:nth-child(1) {    width: 50px;}
         #QtyAssignTable td:nth-child(1), #QtyAssignTable th:nth-child(1) {    width: 50px;}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="content-header row">
        <div class="content-header-light col-12">
            <div class="row">
                <div class="content-header-left col-md-6 col-12 mb-2">
                    <h4 class="content-header-title mainheading">
                         <span class="customer">Request Control</span></h4>
                </div>
                <div class="content-header-right col-md-6 col-12">
                    <div class="btn-group float-md-right" role="group" aria-label="Button group with nested dropdown">
                    
                       <button type="button" id="btnNew" class="btn btn-primary">
                            <i class="fa fa-plus-square"></i> New</button>                        
                         <button type="button"  id=""  class="btn btn-primary">
                            <i class="fa fa-save"></i> Save</button>
                         <%--<button type="button"  id=""  class="btn btn-primary">
                            <i class="fa fa-repeat"></i> Recall</button>--%>
                             <%-- <button type="button" id="" class="btn btn-primary">
                            <i class="fa fa-remove"></i> Cancel</button>--%>
                        <button type="button" id="btnBack" class="btn btn-primary"   >
                           <i class="fa fa-arrow-left"></i> Back</button>
                            <button type="button" id="btnsummary" data-toggle="modal" data-target="#AllLeaveRequestPopup" class="btn btn-primary">
                            <i class="fa fa-arrow-left"></i> pop</button>


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
            <section id="RequisitionForm" style=" display:none" >
                <div class="row match-height">
                   <div class="col-12 col-xl-12 ">                    
                    <div class="card">
                        <div class="card-content">
                      <div class="container">
                          <h6 class="form-section">Requisition  Header</h6>
                      <div class="row  mt-1 ">
                      <div class="col-md-3"> 
                          <label class="headerPropery">Request No.</label>
                           : <label class="headerValue">0001</label>
                      </div>
                      
                           <div class="col-md-3"> 
                          <label class="headerPropery">Request Date</label>
                                : <label class="headerValue">01-Feb-2020 4:08pm</label>
                      </div>
                      
                           <div class="col-md-3"> 
                          <label class="headerPropery">Location</label>
                                : <label class="headerValue">Delhi</label>
                      </div>
                       <div class="col-md-3"> 
                          <label class="headerPropery">Creation Date</label>
                                : <label class="headerValue">01-Feb-2020 4:08pm</label>
                      </div>
                      </div>
                           <div class="row pt5 ">
                      <div class="col-md-3"> 
                          <label class="headerPropery">Submission Date</label>
                           : <label class="headerValue">01-Feb-2020 4:08pm</label>
                      </div>
                      
                           <div class="col-md-3"> 
                          <label class="headerPropery">Cancel Request Date</label>
                                : <label class="headerValue">01-Feb-2020 4:08pm</label>
                      </div>
                      
                           <div class="col-md-3"> 
                          <label class="headerPropery">Last Activity Date</label>
                                : <label class="headerValue"> 01-Feb-2020 4:08pm</label>
                      </div>
                       <div class="col-md-3"> 
                          <label class="headerPropery">Total Time</label>
                                : <label class="headerValue">24:10:12 Hours</label>
                      </div>
                      </div>
                           <div class="row  pt5 ">
                      <div class="col-md-3"> 
                          <label class="headerPropery">Last Activity Status</label>
                           : <label class="headerValue">01-Feb-2020 4:08pm</label>
                      </div>
                      
                           <div class="col-md-3"> 
                          <label class="headerPropery">Last Activity By</label>
                                : <label class="headerValue">Mobile</label>
                      </div>
                      
                      
                      </div>
                      </div>
                        <div class="container">
                              <h6 class="form-section mt-1"></h6>
                      <div class="row  headerDropdown ">
    <div class="col-md-6 ">    
    <div class="pdfexport">
   <button type="button" id="btnAdd" onclick="AddRow()" class="btn btn-outline-primary" title="Add Line">
                            <i class="fa fa-plus"></i> </button>
                            <button type="button"  id="btnDeleteLine" class="btn btn-outline-primary" title="Delete Line">
                            <i class="fa fa-trash"></i> </button>
                            <button type="button" id="Button1" class="btn btn-outline-primary" title="Export">
                            <i class="fa fa-file-excel-o"></i> </button>
                            <button type="button" id="Button2" class="btn btn-outline-primary" title="PDF">
                            <i class="fa fa-file-pdf-o"></i> </button>    
                          
    </div>
  
    
    </div>
                           <div class="col-md-3"  ></div>
                         <div class="col-md-3"  >
                                          <%--<div class="input-group input-group-sm">
								                   <div class="input-group-prepend ">
								                     <span class="input-group-text">Select Location</span>
								                   </div>                                               
								                 <select  class="Operator">
												<option value="Item">Location1</option>
                                                <option value="Group">Location2</option>
												<option value="All">Location3</option>                                        
                                                </select>
							                    </div>--%>
                                          </div>
    
      <%-- <div class="col-md-3">
                                                <div class="form-group pull-right pr-1">
                                                   <label class="pr-1">Select Entity</label>
                                                   
                                                 <input type="text" id="ddlentity"  autocomplete="off"  style="width: 95px;"/>
                                                </div>
                                            </div>
    <div class="col-md-3 ">
                                                <div class="form-group pull-right  ">                                                 
                                                    <label class="pr-1">Select Country</label>
<input type="text" id="ddlcountry"  autocomplete="off"  style="width: 100px;"/>
                                                
                                                </div>
                                            </div>--%>
 
                                          </div>
                                             </div>
                                             <div class="container">
          <div class="row">
    <div class="col-md-12 ">  
                           <div class="table-responsive full-width" >
                             <table  class="table table-de mb-0"  id="RequisitionLineForm">
                <thead>
                  <tr>                    
                    <th><input type="checkbox" id="" onclick="InputcheckAll(this)"/> All</th>
                   
                    <th>Item No.</th>
                    <th>Item Name</th>
                    <th>Onhand</th>
                    <th>Requested Quantity</th>                   
                  </tr>
                </thead>
              <tbody>
                <tr> 
                <td> <input type="checkbox" id="" class="chk_All" /></td>        
            
                <td> <label>0001</label> </td> 
                <td> <label>Bottle</label> </td> 
                <td> <label>25</label> </td> 
                <td> 520 </td>  
                </tr>
                <tr> 
                <td> <input type="checkbox" id="" class="chk_All" /></td>         
                   
                <td> <label>0002</label> </td> 
                <td> <label>Bottle2</label> </td> 
                <td> <label>252</label> </td> 
                <td> 50 </td>  
                </tr>
                <tr> 
                <td> <input type="checkbox" id="" class="chk_All" /></td>         
                 
                <td> <label>0003</label> </td> 
                <td> <label>Bottle3</label> </td> 
                <td> <label>235</label> </td> 
                <td> 501 </td>    
                </tr>
                   <tr> 
                <td> <input type="checkbox" id="" class="chk_All" /></td>         
                 
                <td> <label>0004</label> </td> 
                <td> <label>Bottle4</label> </td> 
                <td> <label>425</label> </td> 
                <td> 510 </td>  
                </tr>
                <tr> 
                <td> <input type="checkbox" id="" class="chk_All" /></td>         
                 
                <td> <label>0005</label> </td> 
                <td> <label>Bottle5</label> </td> 
                <td> <label>255</label> </td> 
                <td> 150 </td>  
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
            </section>
            <div class="row match-height" id="RequisitionGrid" style="display:block">
          
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
                            <table class="table table-de mb-0" id="AllRequisitionGrid">
                        <thead>
                            <tr>
                                
                                <th><input Type="checkbox" id="chkall"/> All</th>
                                <th>Request No.</th>
                                  <th>Requested Qty</th>
                                <th>Request Date</th>
                                <th>Location</th>
                                <th>Creation Date</th>
                                <th>Submission Date</th>
                                <th>Cancel Request Date</th>
                                <th>Last Activity Date</th>
                                <th>Total Time</th>
                                <th>Last Activity Status</th>
                                <th>Last Activity By</th>
                               
                            </tr>
                        </thead>
                      <tbody>
                            <tr>  
                                 <td><input Type="checkbox"/></td>
                                 <td>0001</td>
                                <td>3000</td>
                                 <td>01-Feb-2020 4:08pm</td>
                                <td>Noida</td>
                                <td>01-Feb-2020 4:08pm</td>
                                <td>01-Feb-2020 4:08pm</td>
                                <td>01-Feb-2020 4:08pm</td>
                                <td>01-Feb-2020 4:08pm</td>
                                <td>2:2:08 Hours</td>
                                <td>01-Feb-2020 4:08pm</td>
                                <td>01-Feb-2020 4:08pm</td>
                            </tr>
                             <tr>  
                                 <td><input Type="checkbox"/></td>
                                 <td>0002</td>
                                 <td>2000</td>
                                 <td>01-Feb-2020 4:08pm</td>
                                <td>Delhi</td>
                                <td>01-Feb-2020 4:08pm</td>
                                <td>01-Feb-2020 4:08pm</td>
                                <td>01-Feb-2020 4:08pm</td>
                                <td>01-Feb-2020 4:08pm</td>
                                <td>2:2:08 Hours</td>
                                <td>01-Feb-2020 4:08pm</td>
                                <td>01-Feb-2020 4:08pm</td>
                            </tr>
                            <tr>  
                                 <td><input Type="checkbox"/></td>
                                 <td>0003</td>
                                <td>1000</td>
                                 <td>01-Feb-2020 4:08pm</td>
                                <td>Noida</td>
                                <td>01-Feb-2020 4:08pm</td>
                                <td>01-Feb-2020 4:08pm</td>
                                <td>01-Feb-2020 4:08pm</td>
                                <td>01-Feb-2020 4:08pm</td>
                                <td>2:2:08 Hours</td>
                                <td>01-Feb-2020 4:08pm</td>
                                <td>01-Feb-2020 4:08pm</td>
                            </tr>
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
     <div class="modal fade text-left" id="AllLeaveRequestPopup" tabindex="-1" role="dialog" aria-labelledby="myModalLabel8"
									 aria-hidden="true" data-backdrop="static" data-keyboard="false">
										<div class="modal-dialog modal-lg" role="document">
											<div class="modal-content">
												<div class="modal-header bg-primary white">
                                                    <h6 class="white" id="H1">Item Name : <span class="white" id="ColumnName"> Bottle</span></h6>
													
													<button type="button" id="btnclosedata" class="close" aria-label="Close">
														<span aria-hidden="true">&times;</span>
													</button>
												</div>
											<div class="modal-body">
												    <div class="row">
                                         
                                            <div class="col-md-4">
                                           
    <div class="pdfexport">
                            <button type="button" id="btnpopupaddline" onclick="Addpopuprow()" class="btn btn-outline-primary" title="Add Line">
                            <i class="fa fa-plus"></i></button>
                            <button type="button" id="btnpopupdeleteline" class="btn btn-outline-primary" title="Delete Line">
                            <i class="fa fa-trash"></i> </button>
                           <button type="button"  id="btnsavepopupdata" class="btn btn-outline-primary" title="Submit">
                            <i class="fa fa-save"></i> </button>
    </div>
    </div>
                                                           <div class="col-md-4">
                                                               <div class="pull-right pt-1">
                                                                <label class="headerPropery">Request No.</label>
                           : <label class="headerValue">0001</label>

                                                               </div>
                                                           </div>
                                                        <div class="col-md-4">
                                                            <div class="pull-right pt-1">
                                                                <label class="headerPropery">Requested Quantity</label>
                           : <label class="headerValue">1000</label>
                                                           </div> </div>
     <div class="col-md-12">
                                                  <div class="table-responsive full-width" id="QtyAssignTable">
                              <table id="" class="table table-de mb-0">
                        <thead>
                            <tr>
                                 <%--<th>S. No.</th>--%>
                                   <th id="hidePselect_all"  ><input type="checkbox" id="chkPAll" onclick="checkPAll(this)" /> All</th>
                                <th>Location</th>  
                                <th>Onhand</th>  
                                <th>Approve Qty</th>                                
                                  
                            </tr>
                        </thead>
                        <tbody>
                        <tr>
                        <td id=""><input type="checkbox" id=""  class="chk_PAll"/></td>
                        <td >Noida</td> 
                        <td >510</td> 
                        <td > <input type="text"  placeholder="Enter Quantity" autocomplete="off"  /></td>  
                        </tr>
                        <tr>
                        <td id=""><input type="checkbox" id=""  class="chk_PAll"/></td>
                        <td >Delhi</td> 
                        <td >501</td> 
                        <td > <input type="text"  placeholder="Enter Quantity" autocomplete="off"  /></td>  
                        </tr>
                         <tr>
                        <td id=""><input type="checkbox" id=""  class="chk_PAll"/></td>
                        <td >Noida</td> 
                        <td >150</td> 
                        <td > <input type="text"  placeholder="Enter Quantity" autocomplete="off"  /></td>  
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
        <script type="text/javascript">

                    jquery_1_11_3_min_p(document).ready(function () {

                        jquery_1_11_3_min_p("#btnNew").click(function () {
                            $("#RequisitionForm").css('display', 'block');
                            $("#RequisitionGrid").css('display', 'none');
                        })
                        jquery_1_11_3_min_p("#btnBack").click(function () {
                            $("#RequisitionGrid").css('display', 'block');
                            $("#RequisitionForm").css('display', 'none');
                        })
                    })

</script>
</asp:Content>



