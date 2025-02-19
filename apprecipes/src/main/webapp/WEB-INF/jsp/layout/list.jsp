<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<c:import url="/WEB-INF/jsp/templates/body.jsp"></c:import>
    
    <!-- Start Content-->
    <div class="container-fluid">

        <!-- start page title -->
        <div class="row">
            <div class="col-12">
                <div class="page-title-box">
                    <div class="page-title-right">
                        <ol class="breadcrumb m-0">
                            <li class="breadcrumb-item"><a href="javascript: void(0);">App</a></li>
                            <li class="breadcrumb-item"><a href="javascript: void(0);">Consultancy</a></li>
                            <li class="breadcrumb-item active">Layout</li>
                        </ol>
                    </div>
                    <h4 class="page-title">Lista das Consultorias de Layout</h4>
                </div>
            </div>
        </div>
        <!-- end page title -->

        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-body">
                        
                        <c:if test="${empty layouts}">
                        	<div class="clearfix">
		                        <div class="float-start">
		                            <h5 class="page-title">N�o existem consultorias cadastradas!</h5>
		                        </div>
		                        <div class="float-end">
		                            <a href="/consultancy/layout"> <button type="button" class="btn btn-primary btn-md">
		                                <i class="mdi mdi-plus-thick"></i> Cadastrar </button>
		                            </a>
		                        </div>
		                    </div>
                        </c:if>
                        <c:if test="${not empty layouts}">
                        <div class="row mb-2">
                            <div class="col-sm-4">
	                            <h5 class="page-title">Quantidade de consultorias cadastradas: ${layouts.size()}!</h5>
	                        </div>
	                        <div class="col-sm-8">
                                <div class="text-sm-end">
		                            <a href="/consultancy/layout"> <button type="button" class="btn btn-primary btn-md">
		                                <i class="mdi mdi-plus-thick"></i> Cadastrar </button>
		                            </a>
		                        </div>
	                        </div>
	                    </div>                                 

                        <div class="table-responsive">
                            <table class="table table-centered w-100 dt-responsive nowrap" id="products-datatable">
                                <thead class="table-light">
                                    <tr>
                                        <th class="all">ID</th>
                                        <th>Tipo do layout</th>
                                        <th>Tipo da cozinha</th>
                                        <th>Delivery</th>
                                        <th>Tipo de contrato</th>
                                        <th>N�mero de horas</th>
                                        <th>Custo da consultoria</th>
                                        <th style="width: 75px;">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                	<c:forEach var="u" items="${layouts}">
                                     <tr>
                                     	<td>${u.id}</td>
                                         <td>${u.layoutType}</td>
                                         <td>${u.kitchenType}</td>
                                         <c:if test="${not u.delivery}">
                                         	<td>N�o</td>
                                         </c:if>
                                         <c:if test="${u.delivery}">
                                         	<td>Sim</td>
                                         </c:if>
                                         <td>${u.contractType}</td>
                                         <td>${u.qtyHours}</td>
                                         <td>${u.cost}</td>
                                         <td>
                                             <a href="javascript:void(0);" class="action-icon"> <i class="mdi mdi-square-edit-outline"></i></a>
                                             <a href="#danger-alert-modal-${u.id}" data-bs-toggle="modal" class="action-icon"> <i class="mdi mdi-delete"></i></a>
                                         </td>
                                     </tr>
                                     
                                     <!-- Danger Alert Modal -->
									 <div id="danger-alert-modal-${u.id}" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
									    <div class="modal-dialog modal-sm">
									        <div class="modal-content modal-filled bg-danger">
									            <div class="modal-body p-4">
									                <div class="text-center">
									                    <i class="dripicons-wrong h1"></i>
									                    <h4 class="mt-2">Aten��o!</h4>
									                    <p class="mt-3">A ${u.name} ser� deletada, confirma?</p>
									                    
									                    <button type="button" class="btn btn-light" data-bs-dismiss="modal">Close</button>
									                    <a href="/consultancy/layout/${u.id}/delete">
									                    	<button type="button" class="btn btn-light my-2" data-bs-dismiss="modal">Confirma</button>
								                    	</a>
								                    	
									                </div>
									            </div>
									        </div><!-- /.modal-content -->
									    </div><!-- /.modal-dialog -->
									 </div><!-- /.modal -->
                                     
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    	</c:if>
                    </div> <!-- end card-body-->
                </div> <!-- end card-->
            </div> <!-- end col -->
        </div>
        <!-- end row -->

    </div>
    <!-- container -->
    
    

<c:import url="/WEB-INF/jsp/templates/footer.jsp"></c:import>