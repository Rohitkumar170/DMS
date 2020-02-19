<%@ Page Title="" Language="C#" MasterPageFile="~/DMS.Master" AutoEventWireup="true" CodeBehind="UserForm.aspx.cs" Inherits="DMS.Master.UserForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="content-header row">
        <div class="content-header-light col-12">
            <div class="row">
                <div class="content-header-left col-md-6 col-12 mb-2">
                    <h4 class="content-header-title mainheading">
                         User Form</h4>
                </div>
                <div class="content-header-right col-md-6 col-12">
                    <div class="btn-group float-md-right" role="group" aria-label="Button group with nested dropdown">
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
           <div class="row match-height" id="NewFields"  style="display:block" >
          
                <div class="">
                    <div class="col-md-12">
                        <div class="card">
                      
                            <div class="card-content collapse show cardScroll" >
                                <div class="card-body ">
                                   
                                    <form class="form ">
                                    <div class="form-body lineSelection">
                                        <h6 class="form-section">User  Details</h6>
                                        <div class="row">
                                         <div class="col-md-3">
                                                <div class="form-group">
                                                  <label for="Partner Name">User Pin</label>
                                                    <input type="text"  id="" autocomplete="off"  class="form-control" placeholder="User Pin" />
                                                </div>
                                            </div>
                                         <div class="col-md-3">
                                                <div class="form-group">
                                                  <label for="Partner Name">Employee ID</label>
                                                   <%-- <input type="text"  id="" autocomplete="off"   class="form-control" placeholder="Employee ID" />--%>
                                                <select  name="Partners" class="form-control">
												<option value="Partners" >Emp1  </option>
												<option value="Partners">Emp2</option>												
                                                </select>
                                                    </div>
                                            </div>
                                              <div class="col-md-3">
                                                <div class="form-group">
                                                 
                                                    <label for="PartnerType">User Name</label>
                                                    <input type="text" id=""  class="form-control" placeholder="User name" />
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                 
                                                    <label for="PartnerType">Email</label>
                                                    <input type="text" id=""  class="form-control" placeholder="Email" />
                                                </div>
                                            </div>
                                           

                                        </div>
                                         <div class="row">
                                          <div class="col-md-3">
                                                <div class="form-group">
                                                  <label for="Description">Mobile</label>
                                                    <input type="text"  id="" autocomplete="off"  class="form-control" placeholder="Mobile" />
                                                </div>
                                            </div>
                                         <div class="col-md-3">
                                                <div class="form-group">
                                                  <label for="Partner Name">User Role</label>
                                                   <%-- <input type="text"   id="" autocomplete="off"  class="form-control" placeholder="User Role" />--%>
                                                <select  name="Partners" class="form-control">
												<option value="Partners" >Role1  </option>
												<option value="Partners">Role2</option>	
                                                    </select>
                                                    </div>
                                            </div>
                                        
                                        
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                  <label for="Corporate Identity">Warehouse</label>
                                                   <%-- <input type="text"  id="" autocomplete="off"  class="form-control" placeholder="Warehouse" />--%>
                                                <select  name="Partners" class="form-control">
												<option value="Partners" >Warehouse1  </option>
												<option value="Partners">Warehouse2</option>	
                                                    </select>
                                                    </div>
                                            </div>
                                                <div class="col-md-3">
                                                <div class="form-group mt-1">
                                                     <input type="checkbox" id="chkIsActive" class="checkLocation" onchange="RemoveClass()" >
                                                     <label for="Self">User Active</label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                       

                                    </form>
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
