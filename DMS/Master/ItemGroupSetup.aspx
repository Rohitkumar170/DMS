<%@ Page Language="C#" MasterPageFile="~/DMS.Master" AutoEventWireup="true" CodeBehind="ItemGroupSetup.aspx.cs" Inherits="DMS.Master.ItemGroupSetup" %>

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
   
    <script src="../JavaScript/ItemGroupsetup.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<input type="hidden" id="hdnLoad"/>
<div class="content-header row">
        <div class="content-header-light col-12">
            <div class="row">
                <div class="content-header-left col-md-6 col-12 mb-2">
                    <h4 class="content-header-title mainheading">
                         Item Group Setup</h4>
                </div>
                <div class="content-header-right col-md-6 col-12">
                    <div class="btn-group float-md-right" role="group" aria-label="Button group with nested dropdown">
                            <span class="multifileupload" id="btnupload1" style="display:none" > 
                       <i class="fa fa-upload"></i>
               <input type="button" id="upload" value="Import" class="custom-file-input multifileBtn" onclick="Findclick();" />
                           <asp:FileUpload runat="server" Visible="true" ID="FileUpload" onchange="UploadFile(this);" style="display:none" />
                           <asp:Button ID="btnUpload" runat="server" OnClick="btnUpload_Click" OnClientClick="Showloader();"  style="display:none" /> 
                       </span>
                       <button type="button" id="btnnew" class="btn btn-primary">
                            <i class="fa fa-plus-square"></i> New</button>
                        <button type="button" id="btnSubmit" style="display:none"  class="btn btn-primary">
                            <i class="fa fa-save"></i> Submit</button>
                              <button type="button" id="btndesable" style="display:none"  class="btn btn-primary">
                            <i class="fa-disabled"></i>Disable</button>
                        <button type="button" id="btnback" class="btn btn-primary"  style="display:none"  >
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
            <section id="itemGroupForm" style=" display:none" >
                <div class="row match-height">
                   <div class="col-12 col-xl-12 ">                    
                    <div class="card">
                        <div class="card-content">
                        <div class="container">
                      <div class="row   mt-1 headerDropdown ">
    <div class="col-md-6 pull-left">    
    <div class="pdfexport">
   <button type="button" id="btnAdd" onclick="AddRow()" class="btn btn-outline-primary" title="Add Line">
                            <i class="fa fa-plus"></i> </button>
                            <button type="button" id="btnDeleteLine" class="btn btn-outline-primary" title="Delete Line">
                            <i class="fa fa-trash"></i> </button>
                            <button type="button" id="btnexport" class="btn btn-outline-primary" title="Export">
                            <i class="fa fa-file"></i> </button>
                            <button type="button" id="btnpdf" class="btn btn-outline-primary" title="PDF">
                            <i class="fa fa-print"></i> </button>    
                          
    </div>
  
    
    </div>
    
   <%-- <div class="col-md-3 ">
                                                <div class="form-group pull-right  ">                                                 
                                                    <label class="pr-1">Default Country</label>
<input type="text" id="ddlcountry"  autocomplete="off"  style="width: 100px;"/>
                                               
                                                </div>
                                            </div>
    <div class="col-md-3">
                                                <div class="form-group pull-right ">
                                                   <label class="pr-1">Select Entity</label>
                                                 <input type="text" id="ddlentity"  autocomplete="off"  style="width: 100px;"/>
                                                </div>
                                            </div>--%>
                                          </div>
                                              </div>
<div class="container">
          <div class="row">
    <div class="col-md-12 "> 
                           <div class="table-responsive full-width" >
                             <table  class="table table-de mb-0"  id="tblgroups">
                <thead>
                  <tr>
                 
                 <th ><input type="checkbox" id="chkAll"  onclick="InputcheckAll(this)"/>All</th>
                  <th> Group Code</th>
                    <th> Group Name</th>
                    <th>Description</th>
                       <th style="opacity: 0;"></th>   
                   
                  </tr>
                </thead>
              <tbody>
                <tr>   
               
                <td><input type="checkbox" id="chk_1" class="chk_All"></td>     
                 <td > <input type="text" id="txtgroupcode_1" class="fieldName" />      </td>    
                <td > <input type="text" id="txtgroup_1" onkeyup='Comparevalue(this)' placeholder="Enter Group Name" class="fieldName" />      </td>
                <td > <input type="text" id="txtgroupname_1" placeholder="Enter Description"  class="fieldName"  autocomplete="off" /> </td>  
                <td  style="opacity: 0;">1</td>
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
            <div class="row match-height" id="itemGroupGrid" style="display:block">
          
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
                                <%--===================== start table for content=========================--%>
                         <%-- <div style="display:none" class="table-responsive" id="pdfDiv">--%>
                            <table class="table table-de mb-0" id="pdftable" style="display:none">
                        <thead>
                            <tr>
                                
                                <th>Partner Type</th>
                                <th>Partner Name</th>
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
                            <table class="table table-de mb-0 itemGroupSetupGrid clickableRow" id="partnersgrid">
                        <thead>
                            <tr>
                                <th ><input type="checkbox" id="chkdisp"  onclick="SelectAll(this)"/> All</th>
                                <th> Entity Name</th>
                                <th> Country Name</th>
                                <th>Field Count</th>
                                <th style="display:none"></th>
                                <th style="display:none"></th>
                            </tr>
                        </thead>
                      <tbody>
                         <%--   <tr>  
                                 <td>1</td>
                                  <td>Group Code 1</td>
                                 <td>Group Name 1</td>
                                 <td>Description 1</td>
                            </tr>
                          <tr>  
                                 <td>2</td>
                                  <td>Group Code 2</td>
                                 <td>Group Name 2</td>
                                 <td>Description 2</td>
                            </tr>
                                <tr>  
                                 <td>3</td>
                                  <td>Group Code 3</td>
                                 <td>Group Name 3</td>
                                 <td>Description 3</td>
                            </tr>
                                <tr>  
                                 <td>4</td>
                                  <td>Group Code 4</td>
                                 <td>Group Name 4</td>
                                 <td>Description 4</td>
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
       <%--  <script type="text/javascript">

             jquery_1_11_3_min_p(document).ready(function () {

                 jquery_1_11_3_min_p("#btnNew").click(function () {
                     $("#itemGroupForm").css('display', 'block');
                     $("#itemGroupGrid").css('display', 'none');
                 })
             })

</script>
--%>
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

