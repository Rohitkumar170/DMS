﻿<%@ Page Language="C#" MasterPageFile="~/DMS.Master" AutoEventWireup="true" CodeBehind="SystemParameterSetup.aspx.cs" Inherits="DMS.Master.SystemParameterSetup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="content-header row">
        <div class="content-header-light col-12">
            <div class="row">
                <div class="content-header-left col-md-6 col-12 mb-2">
                    <h4 class="content-header-title mainheading">
                        System Parameter Setup</h4>
                </div>
                <div class="content-header-right col-md-6 col-12">
                    <div class="btn-group float-md-right" role="group" aria-label="Button group with nested dropdown">
                       <button type="button" id="btnnew" class="btn btn-primary">
                            <i class="fa fa-plus-square"></i> New</button>
                            
                              
                        <button type="button"  id="btnback"  class="btn btn-primary" >
                           <i class="fa fa-arrow-left"></i> Back</button>
                                 <%--    <button type="button" id="btnsummary" data-toggle="modal" data-target="#AllLeaveRequestPopup" class="btn btn-primary">
                            <i class="fa fa-arrow-left"></i> pop</button>--%>
                      
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
<%--<input type="text" id="ddlcountry"  autocomplete="off"  style="width: 100px;"/>--%>
  
                                                  <select id="Select9" class="Operator">
												
													
												<option value="Textbox">India</option>
                                                <option value="Textbox">Russia</option>
												<option value="Textbox">Pakistan</option>
                                                </select>     
                                             
                                                </div>
                                            </div>
                                          <div class="col-md-3">
                                                <div class="form-group pull-right pr-1">
                                                   <label class="pr-1">Select Entity</label>
                                                <%-- <input type="text" id="ddlentity"  autocomplete="off"  style="width: 100px;"/>--%>
                                                  <select id="Select4" name="interested" class="Operator">
												<option value="Textbox">Amy Softech</option>
                                                <option value="Textbox">Yoeki Soft</option>
												<option value="Textbox">IACE</option>	
												
                                                 </select>
                                                </div>
                                            </div>

                                             <div class="col-md-3">
                                                <div class="form-group pull-right pr-1">
                                                   <label class="pr-1"> Parameter</label>
                                                   
                                             <%--    <input type="text" id="ddlOrgPara"  autocomplete="off"  style="width: 100px;"/>--%>
                                               
                                                  <select id="Select9" class="Operator">
												
													
												<option value="Textbox">Parameter1</option>
                                                <option value="Textbox">Parameter2</option>
												<option value="Textbox">Parameter3</option>
                                                </select>     
                                                </div>
                                            </div>
                                            </div>
<div class="form-body ">
                                        <h6 class="form-section">Parameter Type</h6>
                                        <div class="row">
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                   
                                                   
                                                     <input type="checkbox"  class="" >
                                                     <label for="Self">Self Managed</label>
                                                </div>
                                            </div>
                                              <div class="col-md-3">
                                                <div class="form-group">
                                                   
                                                      <input type="checkbox"  class="" >
                                                     <label for="Entity">Entity Managed</label>
                                                </div>
                                            </div>
                                          
                                           
                                        </div>
                                     
                                  <div class="row ">
                                       <div class="col-md-12">
                                        <button type="button" id="Button1" class="btn btn-primary pull-right mt-1 " >
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

    <div class="col-md-8 pull-left">    
    <div class="pdfexport">
   <button type="button" id="btnExport" class="btn btn-primary waves-effect waves-light">
                            <i class="fa fa-file"></i> Export</button>
                            <button type="button" id="btnPdf" class="btn btn-primary waves-effect waves-light">
                            <i class="fa fa-print"></i> PDF</button>
                             <button type="button" id="btnUpdate" style="display:none" disabled class="btn btn-primary waves-effect waves-light">
                            <i class="fa fa-edit"></i> Edit</button>
                          
                          
    </div>
    
    
    </div>
    <div class="col-md-2 pull-left">   <div class="searchDropdown">
         
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
    <div class="col-md-2 pull-right ">
    
                           
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
                
                 <th ><input type="checkbox" id="chkAll" onclick="checkAll(this)"> All</th>
                    <th >Entity Name</th>
                    <th >Country</th>
                   <th >Parameter Name</th>
                   <th >Parameter Type</th>
                  </tr>
                </thead>
               <tbody>
               <tr>
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
     <script>
         jquery_1_11_3_min_p(document).ready(function () {
             jquery_1_11_3_min_p(".footerDropdown").hide();
         });
</script>
   <script type="text/javascript">

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

</script>
</asp:Content>

