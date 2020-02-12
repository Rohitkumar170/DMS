<%@ Page Language="C#" MasterPageFile="~/DMS.Master" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="DMS.Master.Users" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

 <script>     var jquery_1_11_3_min_p = jQuery.noConflict();</script>
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
    <script src="../JavaScript/CreateUser.js" type="text/javascript"></script>
<style>
#userGrid td:nth-child(3), #userGrid th:nth-child(3) {    width: 50px;}
#userGrid td:nth-child(5), #userGrid th:nth-child(5) {    width: 200px;}
.AccessRights li{list-style:none;}
    .accessLevel {margin-top:5px;    }
    .accessCheck li{display:inline-block;list-style:none;    margin: 0 40px 0 0;}
    .accessCheck{padding-left:0;}
    #accessTree{max-height: 250px;overflow-y:auto;overflow-x:hidden;}
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<input type="hidden" id="hdnLoad"/>
<div class="content-header row">
        <div class="content-header-light col-12">
            <div class="row">
                <div class="content-header-left col-md-6 col-12 mb-2">
                    <h4 class="content-header-title mainheading">
                         Create User</h4>
                </div>
                <div class="content-header-right col-md-6 col-12">
                    <div class="btn-group float-md-right" role="group" aria-label="Button group with nested dropdown">
                   
                       <button type="button" id="btnnew" class="btn btn-primary">
                            <i class="fa fa-plus-square"></i> New</button>
                        
                        <button type="button" id="btnback" class="btn btn-primary"  style="display:none"  >
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
            <section id="createusserForm" style=" display:none" >
                 <div class="row match-height pb-2">
                  <div class="col-md-12">
                        <div class="card">
                         
                            <div class="card-content collapse show" >
                                <div class="card-body">
                                <div class="card-text">

                                    </div>
                             
                                    <div class="form-body lineSelection">
                                        <h6 class="form-section">Create User</h6>
                                        <div class="row">
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                   
                                                    <label for="ItemName">User Name</label>
                                                     <input type="text" id="txtusername" autocomplete="off" onkeypress="RemoveClass()"  class="form-control" placeholder="Enter User Name"/>
                                                </div>
                                            </div>
                                          
                            <%--          <div class="col-md-3">
                                                <div class="form-group">
                                                  <label for="ItemGroup">User Type</label>
                                                  <input type="text" id="ddlUserType" class="form-control"/>
                        
                                                
                                                </div>
                                            </div>--%>
                                           
                                               <%-- <div class="col-md-3">
                                                <div class="form-group">
                                                  <label for="ItemGroup">Address</label>
                                                  <input type="text" id="ddladdress"   class="form-control"/>
                                                </div>
                                            </div>--%>
                                               <div class="col-md-3">
                                                <div class="form-group">
                                                  <label for="ItemGroup"> Mobile</label>
                        <input type="text" id="txtmobile"    class="form-control" onkeypress="RemoveClass()" autocomplete="off" placeholder="Enter Mobile" />
                                                
                                                </div>
                                            </div>
                                              
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                  <label for="ItemGroup"> Email</label>
                        <input type="text" id="txtemail"     class="form-control" onkeypress="RemoveClass()" autocomplete="off" placeholder="Enter Email" />
                                                
                                                </div>
                                            </div>
                                               <div class="col-md-3">
                                                <div class="form-group">
                                                  <label for="ItemGroup">User Role</label>
                                                  <input type="text" id="ddlpartner" class="form-control"/>
                       <%--   <select  name="Partners" class="form-control">
												<option value="Partners" >Partners 1  </option>
												<option value="Partners">Partners 2</option>
												
                                                </select>--%>
                                                
                                                </div>
                                            </div>
                                        </div>
                                    
                                        <div class="row">
                                   
                                         
                                            <div class="col-md-3">
                                                <div class="form-group">
                                               <label for="ItemGroup">Password</label>
                        <input type="password" id="txtpassword"      class="form-control" autocomplete="off" onkeypress="RemoveClass()" placeholder="Enter Password" />
                                                
                                                </div>
                                            </div>
                                             <div class="col-md-3">
                                                <div class="form-group">
                                               <label for="ItemGroup">Confirm Password</label>
                        <input type="password" id="txtconfirmpwd"     class="form-control" autocomplete="off" onkeypress="RemoveClass()" placeholder="Enter Confirm Password" />
                                                
                                                </div>
                                            </div>
                                         <div class="col-md-3">
                                                <div class="form-group mt-1">
                                                     <input type="checkbox" class="checkLocation" >
                                                     <label for="Self">User Active</label>
                                                </div>
                                            </div>
                                        </div>
                             
                             
                                      <div class="row ">
                                       <div class="col-md-12">
                                        <button type="button" id="btnsubmit"   class="btn btn-primary pull-right mt-1 ">
                            <i class="fa fa-save"></i> Submit</button>

                                       </div>
                                       </div>

                                    
                                   </div>
                                  





                             
                                 

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                 <div class="row match-height pb-2" >
                  <div class="col-md-12">
                        <div class="card">
                         
                            <div class="card-content collapse show" >
                                <div class="card-body">
                                <div class="card-text">

                                    </div>
                             
                                    <div class="form-body lineSelection" id="accessTree">
                                        <h6 class="form-section">Access Rights</h6>
                                        <div class="row " >
                                             <div class="col-md-12">
                                       <ul class="accessCheck mt-1 ">
                                                            <li class="form-group">
                                                            <input type="radio" name="access" value="1" class="form-checkbox checkclass" >
                                                            <label>Web</label>
                                                            </li>
                                                            <li class="form-group">
                                                                <input type="radio" name="access" value="2" class="form-checkbox checkclass" >
                                                                <label>Mobile</label>
                                                            </li>
                                                            <li class="form-group">
                                                                <input type="radio" name="access" value="3" class="form-checkbox checkclass" checked>
                                                                <label>Both</label>
                                                            </li>
                                                        </ul>
                                                 </div>
                                            </div>
                                        <div class="row AccessRights" id="access1">
                                             <div class="col-md-12">
                                             <h6 class="form-section">Web Rights</h6>
                                                 </div>
                                   <div class="col-md-3">
                                                <div class="form-group mt-1">
                                                    <div class="form-group">
                                                        <input type="checkbox" class="form-checkbox checkclass" >
                                                        <label>Partners </label>
                                                        <ul class="accessLevel">
                                                            <li class="form-group">
                                                            <input type="checkbox" class="form-checkbox checkclass" >
                                                            <label>Sub-menu</label>
                                                                 <ul class="accessLevel">
                                                            <li class="form-group">
                                                            <input type="checkbox" class="form-checkbox checkclass" >
                                                            <label>Partner Group</label>
                                                            </li>
                                                            <li class="form-group">
                                                                <input type="checkbox" class="form-checkbox checkclass" >
                                                                <label>Partner</label>
                                                            </li>
                                                            <li class="form-group">
                                                                <input type="checkbox" class="form-checkbox checkclass" >
                                                                <label>Item Assign</label>
                                                            </li>
                                                        </ul>
                                                            </li>
                                                          
                                                        </ul>

                                                    </div>
                                                </div>
                                            </div>

                                   
                                             <div class="col-md-3">
                                                <div class="form-group mt-1">
                                                    <div class="form-group">
                                                        <input type="checkbox" class="form-checkbox checkclass" >
                                                        <label>Item </label>
                                                        <ul class="accessLevel">
                                                            <li class="form-group">
                                                            <input type="checkbox" class="form-checkbox checkclass" >
                                                            <label>Sub-menu</label>
                                                                 <ul class="accessLevel">
                                                            <li class="form-group">
                                                            <input type="checkbox" class="form-checkbox checkclass" >
                                                            <label>Item</label>
                                                            </li>
                                                           
                                                        </ul>
                                                            </li>
                                                          
                                                        </ul>

                                                    </div>
                                                </div>
                                            </div>
                                        <div class="col-md-3">
                                                <div class="form-group mt-1">
                                                    <div class="form-group">
                                                        <input type="checkbox" class="form-checkbox checkclass" >
                                                        <label>Requisition Center </label>
                                                        <ul class="accessLevel">
                                                            <li class="form-group">
                                                            <input type="checkbox" class="form-checkbox checkclass" >
                                                            <label>Sub-menu</label>
                                                                 <ul class="accessLevel">
                                                            <li class="form-group">
                                                            <input type="checkbox" class="form-checkbox checkclass" >
                                                            <label>  All Requisition </label>
                                                            </li>
                                                            <li class="form-group">
                                                                <input type="checkbox" class="form-checkbox checkclass" >
                                                                <label> Requisition center</label>
                                                            </li>
                                                            
                                                        </ul>
                                                            </li>
                                                          
                                                        </ul>

                                                    </div>
                                                </div>
                                            </div>
                                              <div class="col-md-3">
                                                <div class="form-group mt-1">
                                                    <div class="form-group">
                                                        <input type="checkbox" class="form-checkbox checkclass" >
                                                        <label>Primary Sales </label>
                                                        <ul class="accessLevel">
                                                            <li class="form-group">
                                                            <input type="checkbox" class="form-checkbox checkclass" >
                                                            <label>Sub-menu</label>
                                                                 <ul class="accessLevel">
                                                            <li class="form-group">
                                                            <input type="checkbox" class="form-checkbox checkclass" >
                                                            <label>Sale Invoice</label>
                                                            </li>
                                                            <li class="form-group">
                                                                <input type="checkbox" class="form-checkbox checkclass" >
                                                                <label>Purchase Invoice</label>
                                                            </li>
                                                            
                                                        </ul>
                                                            </li>
                                                         
                                                        </ul>

                                                    </div>
                                                </div>
                                            </div>
                                             <div class="col-md-3">
                                                <div class="form-group mt-1">
                                                    <div class="form-group">
                                                        <input type="checkbox" class="form-checkbox checkclass" >
                                                        <label>Vendor </label>
                                                        <ul class="accessLevel">
                                                            <li class="form-group">
                                                            <input type="checkbox" class="form-checkbox checkclass" >
                                                            <label>Sub-menu</label>
                                                                 <ul class="accessLevel">
                                                            <li class="form-group">
                                                            <input type="checkbox" class="form-checkbox checkclass" >
                                                            <label>Vendor Group</label>
                                                            </li>
                                                            <li class="form-group">
                                                                <input type="checkbox" class="form-checkbox checkclass" >
                                                                <label>Vendor</label>
                                                            </li>
                                                            <li class="form-group">
                                                                <input type="checkbox" class="form-checkbox checkclass" >
                                                                <label>Item Assign</label>
                                                            </li>
                                                        </ul>
                                                            </li>
                                                          
                                                        </ul>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                              <div class="row AccessRights" id="access2">
                                             <div class="col-md-12">
                                             <h6 class="form-section">Mobile Rights</h6>
                                                 </div>
                                    <div class="col-md-3">
                                                <div class="form-group mt-1">
                                                    <div class="form-group">
                                                        <input type="checkbox" class="form-checkbox checkclass" >
                                                        <label>Requisition Center </label>
                                                        <ul class="accessLevel">
                                                            <li class="form-group">
                                                            <input type="checkbox" class="form-checkbox checkclass" >
                                                            <label>Requisition</label>                                                        
                                                            </li>
                                                          <li class="form-group">
                                                            <input type="checkbox" class="form-checkbox checkclass" >
                                                            <label>Requisition Control</label>                                                        
                                                            </li>
                                                            <li class="form-group">
                                                            <input type="checkbox" class="form-checkbox checkclass" >
                                                            <label>Shipped Requisition </label>                                                        
                                                            </li>
                                                        </ul>

                                                    </div>
                                                </div>
                                            </div>
                                    <div class="col-md-3">
                                                <div class="form-group mt-1">
                                                    <div class="form-group">
                                                        <input type="checkbox" class="form-checkbox checkclass" >
                                                        <label>Inventory </label>
                                                        <ul class="accessLevel">
                                                            <li class="form-group">
                                                            <input type="checkbox" class="form-checkbox checkclass" >
                                                            <label>Inventory Onhand</label>                                                        
                                                            </li>
                                                          <li class="form-group">
                                                            <input type="checkbox" class="form-checkbox checkclass" >
                                                            <label>Payment Receiving</label>                                                        
                                                            </li>
                                                            
                                                        </ul>

                                                    </div>
                                                </div>
                                            </div>
                                   <div class="col-md-3">
                                                <div class="form-group mt-1">
                                                    <div class="form-group">
                                                        <input type="checkbox" class="form-checkbox checkclass" >
                                                        <label>MIS </label>
                                                        <ul class="accessLevel">
                                                            <li class="form-group">
                                                            <input type="checkbox" class="form-checkbox checkclass" >
                                                            <label>MIS</label>                                                        
                                                            </li>
                                                          <li class="form-group">
                                                            <input type="checkbox" class="form-checkbox checkclass" >
                                                            <label>Claims & Returns</label>                                                        
                                                            </li>
                                                            
                                                        </ul>

                                                    </div>
                                                </div>
                                            </div>
                                  <div class="col-md-3">
                                                <div class="form-group mt-1">
                                                    <div class="form-group">
                                                        <input type="checkbox" class="form-checkbox checkclass" >
                                                        <label>Primary Sales </label>
                                                        <ul class="accessLevel">
                                                            <li class="form-group">
                                                            <input type="checkbox" class="form-checkbox checkclass" >
                                                            <label>New Sales</label>                                                        
                                                            </li>
                                                          <li class="form-group">
                                                            <input type="checkbox" class="form-checkbox checkclass" >
                                                            <label>Sales Invoice</label>                                                        
                                                            </li>
                                                            
                                                        </ul>

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
                            <i class="fa fa-file"></i> </button>
                          <%--   <asp:LinkButton ID="btnExcel" runat="server" OnClick="btnExcel_Click"   class="btn btn-primary waves-effect waves-light"><i class="fa fa-print"></i> Export</asp:LinkButton>--%>
                 <%--<asp:LinkButton ID="btnpdf1" runat="server" OnClick="Exportpdf_Click" OnClientClick="SetHTML()"  class="btn btn-primary waves-effect waves-light"><i class="fa fa-print"></i> PDF</asp:LinkButton>--%>

                 <button type="button" id="btnexportpdf"  class="btn btn-outline-primary" title="PDF">
                           <i class="fa fa-print"></i> </button>
                       
                         
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
                            <table class="table table-de mb-0 clickableRow" id="userGrid">
                        <thead>
                            <tr>
                                <th style="display:none">UserId</th>
                                <th style="display:none">PartnerId</th>
                                <th><input type="checkbox" id="chkAll"> All</th>
                                <th>User Name</th>
                                <th>Email</th>
                                <th>Mobile</th>
                                <th>Entity</th>
                                <th>Country</th>
                               
                            </tr>
                        </thead>
                      <tbody>
                           <%-- <tr>  
                                 <td><input type="checkbox" /></td>
                                 <td>Yoeki</td>
                                
                                  <td>Entity</td>
                                  <td>898655565</td>
                                 <td>yoeki@gmail.com</td>
                                 <td>Noida</td>
                                 
                            </tr>
                               <tr>  
                             <td><input type="checkbox" /></td>
                                 <td>Amysoft</td>
                               
                                 <td>Partner</td>
                                  <td>4794565665</td>
                                 <td>amy@gmail.com</td>
                                 <td>Delhi</td>
                               
                                       
                         
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
    <script>
      $(document).ready(function() {
    $("input[name$='access']").click(function() {
        var test = $(this).val();
       // alert(test);
        
        $(".AccessRights").hide();
        $("#access" + test).show();
        if (test==3) {  $(".AccessRights").show();}
    });
});
    </script>
</asp:Content>