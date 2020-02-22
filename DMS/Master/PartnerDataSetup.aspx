<%@ Page Language="C#" MasterPageFile="~/DMS.Master" AutoEventWireup="true" CodeBehind="PartnerDataSetup.aspx.cs" Inherits="DMS.Master.PartnerDataSetup" %>

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
   
    <script src="../JavaScript/PartnerDataSetup.js" type="text/javascript"></script>
  <style>
      #ParameterSetupTable td:nth-child(4), #ParameterSetupTable th:nth-child(4) {
    width: 50px;
}
  </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <input type="hidden" id="hdnLoad"/>
<div class="content-header row">
        <div class="content-header-light col-12">
            <div class="row">
                <div class="content-header-left col-md-6 col-12 mb-2">
                    <h4 class="content-header-title mainheading">
                        Partner Data Setup</h4>
                </div>
                <div class="content-header-right col-md-6 col-12">
                     <div class="btn-group float-md-right" role="group" aria-label="Button group with nested dropdown">
                       <button type="button" id="btnnew" class="btn btn-primary">
                            <i class="fa fa-plus-square"></i> New</button>
                             <button type="button" style="display:none" id="btnSubmit" class="btn btn-primary">
                            <i class="fa fa-save"></i> Submit</button>
                              <button type="button" id="btndesable" style="display:none"  class="btn btn-primary">
                            <i class="fa-disabled"></i>Disable</button>
                        <button type="button" style="display:none" id="btnback"  class="btn btn-primary"><i class="fa fa-arrow-left"></i> Back</button>
                        
                      
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
           <div class="row match-height pb-2" id="SystemParameterSetupForm"  style="display:none" >
          
                <div class="col-12 col-xl-12 ">                    
                    <div class="card">
                        <div class="card-content">
                          <div class="card-body">
                      <div class="row  pl-1  hborder headerDropdown ">
    <div class="col-md-3 pull-left">    
 
  
    
    </div>
    
    <div class="col-md-3 ">
                                                <div class="form-group pull-right  ">                                                 
                                                    <label class="pr-1">Default Country</label>
                                                   <input type="text" id="ddlcountry"  autocomplete="off"  style="width: 100px;"/>   
                                             
                                                </div>
                                            </div>
                                          <div class="col-md-3">
                                                <div class="form-group pull-right pr-1">
                                                   <label class="pr-1">Select Entity</label>
                                               <input type="text" id="ddlentity"  autocomplete="off"  style="width: 100px;"/>
                                                </div>
                                            </div>

                                             <div class="col-md-3">
                                                <div class="form-group pull-right pr-1">
                                                   <label class="pr-1"> Parameter</label>
                                                    <input type="text" id="ddlOrgPara"  autocomplete="off"  style="width: 100px;"/>
                                                   
                                                </div>
                                            </div>
                                            </div>
<div class="form-body ">
                                        <h6 class="form-section">Parameter Type</h6>
                                        <div class="row">
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                   
                                                   
                                                     <input type="checkbox" id="chkselfmanaged" onchange='RemoveVaidation(this)'  class="" >
                                                     <label for="Self">Self Managed</label>
                                                </div>
                                            </div>
                                              <div class="col-md-3">
                                                <div class="form-group">
                                                   
                                                      <input type="checkbox" id="chkentitymanaged" onchange='RemoveVaidation(this)'  class="" >
                                                     <label for="Entity">Entity Managed</label>
                                                </div>
                                            </div>
                                          
                                           
                                        </div>
                                     
                                  <div class="row ">
                                       <div class="col-md-12">
                                        <button type="button" id="btnsubmit" class="btn btn-primary pull-right mt-1 " >
                            <i class="fa fa-save"></i> Submit</button>
                                       
                                   

                                       </div>
                                       </div>
                                   </div>
 <%-- <div class="form-body ">
                                        <h6 class="form-section">Locations</h6>
                                        <div class="row">
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                   
                                                   
                                                     <input type="checkbox"  class="Location" >
                                                     <label for="Self">Location A</label>
                                                </div>
                                            </div>
                                              <div class="col-md-3">
                                                <div class="form-group">
                                                   
                                                      <input type="checkbox"  class="Location" >
                                                     <label for="Entity">Location B</label>
                                                </div>
                                            </div>
                                             <div class="col-md-3">
                                                <div class="form-group">
                                                   
                                                      <input type="checkbox"  class="Location" >
                                                     <label for="Entity">Location C</label>
                                                </div>
                                            </div>
                                               <div class="col-md-3">
                                                <div class="form-group">
                                                   
                                                      <input type="checkbox"  class="Location" >
                                                     <label for="Entity">Location D</label>
                                                </div>
                                            </div>
                                              <div class="col-md-3">
                                                <div class="form-group">
                                                   
                                                      <input type="checkbox"  class="Location" >
                                                     <label for="Entity">Location E</label>
                                                </div>
                                            </div>
                                               <div class="col-md-3">
                                                <div class="form-group">
                                                   
                                                      <input type="checkbox"  class="Location" >
                                                     <label for="Entity">Location F</label>
                                                </div>
                                            </div>
                                               <div class="col-md-3">
                                                <div class="form-group">
                                                   
                                                      <input type="checkbox"  class="Location" >
                                                     <label for="Entity">Location G</label>
                                                </div>
                                            </div>
                                               <div class="col-md-3">
                                                <div class="form-group">
                                                   
                                                      <input type="checkbox"  class="Location" >
                                                     <label for="Entity">Location H</label>
                                                </div>
                                            </div>
                                               <div class="col-md-3">
                                                <div class="form-group">
                                                   
                                                      <input type="checkbox"  class="Location" >
                                                     <label for="Entity">Location I</label>
                                                </div>
                                            </div>
                                               <div class="col-md-3">
                                                <div class="form-group">
                                                   
                                                      <input type="checkbox"  class="Location" >
                                                     <label for="Entity">Location J</label>
                                                </div>
                                            </div>
                                        </div>
                                   
                                
                                   </div>  --%>              
                                        </div>
                                       </div> 
                                       
                                    </div>



                                     
                                   </div>
                        </div>
                    </div>
                </div>
       
            <div class="row match-height" id="SystemParameterSetupGrid" >
          
                <div class="col-12 col-xl-12 ">                    
                    <div class="card">
                        <div class="card-content">
                    <div class="container">
          <div class="row">

    <div class="col-md-8 ">    
    <div class="pdfexport">
   <button type="button" id="btnExport" class="btn  btn-outline-primary" title="Export">
                            <i class="fa fa-file-excel-o"></i> </button>
                            <button type="button" id="btnPdf" class="btn btn-outline-primary" title="PDF">
                            <i class="fa fa-file-pdf-o"></i> </button>
                             <button type="button" id="btnUpdate" style="display:none" disabled class="btn btn-outline-primary" title="Edit">
                            <i class="fa fa-edit"></i> </button>
                          
                          
    </div>
    
    
    </div>
    <div class="col-md-2 ">   <div class="searchDropdown">
         
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
                             <table  class="table table-de mb-0 clickableRow" id="ParameterSetupTable">
                <thead>
                  <tr>
                <th style="display:none"></th>
                <th style="display:none"></th>
                <th style="display:none"></th>
                 <th ><input type="checkbox" id="chkAll" onclick="checkAll(this)"> All</th>
                    <th >Entity Name</th>
                    <th >Country</th>
                   <th >Parameter Name</th>
                  <%-- <th >Parameter Type</th>--%>
                  </tr>
                </thead>
               <tbody>
              <%-- <tr>
               <td> <input type="checkbox" ></td>
               <td> Amy Softech </td>
               <td> India</td>
               <td> Parameter 1 </td>
               <td> Self Managed</td>
               </tr>
               <tr>
               <td> <input type="checkbox" ></td>
               <td> Yoeki Soft </td>
               <td> India</td>
               <td> Parameter 2 </td>
               <td> Self Managed</td>
               </tr>
               <tr>
               <td> <input type="checkbox" ></td>
               <td> IACE </td>
               <td> Russia</td>
               <td> Parameter 3 </td>
               <td> Entity Managed</td>
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
            <label id="lblUserId" runat="server" style="display: none"> </label>   
      
    </div>
     <script>
         jquery_1_11_3_min_p(document).ready(function () {
             jquery_1_11_3_min_p(".footerDropdown").hide();
         });
</script>
   <%--<script type="text/javascript">

       jquery_1_11_3_min_p(document).ready(function () {

           jquery_1_11_3_min_p("#btnnew").click(function () {
               $("#SystemParameterSetupForm").css('display', 'block');
               $("#SystemParameterSetupGrid").css('display', 'none');
           })
           jquery_1_11_3_min_p("#btnback").click(function () {
               $("#SystemParameterSetupForm").css('display', 'none');
               $("#SystemParameterSetupGrid").css('display', 'block');
           })
       })

</script>--%>

</asp:Content>

