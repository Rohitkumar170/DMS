<%@ Page Title="" Language="C#" MasterPageFile="~/DMS.Master" AutoEventWireup="true" CodeBehind="Employee.aspx.cs" Inherits="DMS.Master.Employee" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content-header row">
        <div class="content-header-light col-12">
            <div class="row">
                <div class="content-header-left col-md-6 col-12 mb-2">
                    <h4 class="content-header-title mainheading">
                         Employee</h4>
                </div>
                <div class="content-header-right col-md-6 col-12">
                    <div class="btn-group float-md-right" role="group" aria-label="Button group with nested dropdown">
                           <span class="multifileupload" id="btnupload" > 
                       <i class="fa fa-upload"></i>
                  <%--   <input type="file" id='FileUpload' runat="server" class="custom-file-input multifileBtn" onchange="UploadFile(this);" />--%>
                           <input type="button" id="upload" value="Import" class="custom-file-input multifileBtn" />
                           <asp:FileUpload runat="server" Visible="true" ID="FileUpload"  style="display:none" />
                           <asp:Button ID="btnUpload" runat="server" style="display:none" /> 
                       </span>
                       <button type="button" id="btnnew" class="btn btn-primary">
                            <i class="fa fa-plus-square"></i> New</button>
                             <button type="button" style="display:none" id="btnSubmit" class="btn btn-primary">
                            <i class="fa fa-save"></i> Submit</button>
                              <button type="button" id="btndesable" style="display:none"  class="btn btn-primary">
                            <i class="fa-disabled"></i> Disable</button>
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
           <div class="row match-height" id="NewFields"  style="display:none" >
          
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
                            <button type="button" id="Button1" class="btn btn-outline-primary" title="Export">
                            <i class="fa fa-file"></i> </button>
                            <button type="button" id="Button2" class="btn btn-outline-primary" title="PDF">
                            <i class="fa fa-print"></i> </button>    
                          
    </div>
  
    
    </div>
   <%-- 
    <div class="col-md-3 ">
                                                <div class=" pull-right  ">                                                 
                                                    <label class="pr-1">Default Country</label>
<input type="text" id="ddlcountry"  autocomplete="off"  style="width: 100px;"/>
                                              
                                                </div>
                                            </div>
    <div class="col-md-3">
                                                <div class=" pull-right ">
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
                             <table  class="table table-de mb-0"  id="tblFields">
                <thead>
                  <tr>
                 <%-- <th style="display:none">1</th>--%>
                 <th style="display:none"></th>
                 <th ><input type="checkbox" id="chkAll" onclick="InputcheckAll(this)"/>All</th>
                    <th>Employee Name</th>
                    <th>Mobile</th>
                  <th>Email</th>
                   <th>Address</th>
                  </tr>
                </thead>
              <tbody>
                <tr>   
                <td style="display:none">1</td>
                <td><input type="checkbox" id="chk_1" class="chk_All"></td>         
                <td >  <input type="text" id="txtField_1" placeholder="Employee Name" class="fieldName"  autocomplete="off" />  </td>
                <td > <input type="text" id=""  class="fieldName" placeholder=" Mobile" autocomplete="off" />  </td>  
                 <td > <input type="text" id=""  class="fieldName" placeholder=" Email" autocomplete="off" />  </td>  
                     <td > <input type="text" id=""  class="fieldName" placeholder=" Address" autocomplete="off" />
                                                </td>  
                </tr>
                   <tr>   
                <td style="display:none">1</td>
                <td><input type="checkbox" id="chk_1" class="chk_All"></td>         
                <td >  <input type="text" id="txtField_1" placeholder="Employee Name" class="fieldName"  autocomplete="off" />  </td>
                <td > <input type="text" id=""  class="fieldName" placeholder=" Mobile" autocomplete="off" />  </td>  
                 <td > <input type="text" id=""  class="fieldName" placeholder=" Email" autocomplete="off" />  </td>  
                     <td > <input type="text" id=""  class="fieldName" placeholder=" Address" autocomplete="off" />
                                                </td>  
                </tr>
                   <tr>   
                <td style="display:none">1</td>
                <td><input type="checkbox" id="chk_1" class="chk_All"></td>         
                <td >  <input type="text" id="txtField_1" placeholder="Employee Name" class="fieldName"  autocomplete="off" />  </td>
                <td > <input type="text" id=""  class="fieldName" placeholder=" Mobile" autocomplete="off" />  </td>  
                 <td > <input type="text" id=""  class="fieldName" placeholder=" Email" autocomplete="off" />  </td>  
                     <td > <input type="text" id=""  class="fieldName" placeholder=" Address" autocomplete="off" />
                                                </td>  
                </tr>
                   <tr>   
                <td style="display:none">1</td>
                <td><input type="checkbox" id="chk_1" class="chk_All"></td>         
                <td >  <input type="text" id="txtField_1" placeholder="Employee Name" class="fieldName"  autocomplete="off" />  </td>
                <td > <input type="text" id=""  class="fieldName" placeholder=" Mobile" autocomplete="off" />  </td>  
                 <td > <input type="text" id=""  class="fieldName" placeholder=" Email" autocomplete="off" />  </td>  
                     <td > <input type="text" id=""  class="fieldName" placeholder=" Address" autocomplete="off" />
                                                </td>  
                </tr>
              </tbody>
              </table>

              </div>
 </div> </div>
                         </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row match-height" id="SetUpGrid" >
          
                <div class="col-12 col-xl-12 ">                    
                    <div class="card">
                        <div class="card-content">
                       <div class="container">
                     <div class="row">
    <div class="col-md-8 ">    
    <div class="pdfexport">
   <button type="button" id="btnExport" class="btn btn-outline-primary" title="Export">
                            <i class="fa fa-file-excel-o"></i> </button>
                            <button type="button" id="btnPdf" class="btn btn-outline-primary" title="PDF">
                            <i class="fa fa-file-pdf-o"></i> </button>
                             <button type="button" id="btnUpdate" style="display:none" disabled class="btn btn-outline-primary" title="Edit">
                            <i class="fa fa-edit"></i> </button>
                          
                          
    </div>
    
    
    </div>
    <div class="col-md-2">   <div class="searchDropdown">
         
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
                             <table  class="table table-de mb-0 clickableRow" id="">
                <thead>
                  <tr>
                 
                 <th ><input type="checkbox" id="chkAll" onclick="checkAll(this)"> All</th>
                    <th id='' class='' >Employee Name</th>
                    <th id='' class='' >Mobile</th>
                   <th id='' class='' >Email</th>
                    <th id='' class='' >Address</th>
                  </tr>
                </thead>
               <tbody>
                   <tr>
                       <td><input type="checkbox" id="chkAll" ></td>
                        <td>Abhishek</td>
                        <td>+918885256</td>
                        <td>abhi@gmail.com</td>
                        <td>noida</td>
                   </tr>
                    <tr>
                       <td><input type="checkbox" id="chkAll" ></td>
                        <td>Abhishek</td>
                        <td>+918885256</td>
                        <td>abhi@gmail.com</td>
                        <td>noida</td>
                   </tr>
                    <tr>
                       <td><input type="checkbox" id="chkAll" ></td>
                        <td>Abhishek</td>
                        <td>+918885256</td>
                        <td>abhi@gmail.com</td>
                        <td>noida</td>
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
    
    </div>
     <label id="lblUserId" runat="server" style="display: none">
        </label>
    </div>
    <script type="text/javascript">

                           jquery_1_11_3_min_p(document).ready(function () {

                               jquery_1_11_3_min_p("#btnnew").click(function () {
                                   $("#NewFields").css('display', 'block');
                                   $("#SetUpGrid").css('display', 'none');
                                                })
                                                jquery_1_11_3_min_p("#btnback").click(function () {
                                                    $("#NewFields").css('display', 'none');
                                                    $("#SetUpGrid").css('display', 'block');
                                                })
                           })

</script>
</asp:Content>
