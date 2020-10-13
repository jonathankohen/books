<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="/webjars/bootstrap/4.5.0/css/bootstrap.min.css" />
<title>Home</title>
</head>
<body>
	<div class="container-fluid">
		<a href="/">Home</a>
		<div class="row my-5">
			<div class="col mx-auto text-center">
				<h1 class="display-1">Books</h1>
			</div>
		</div>

		<div class="row">
			<div class="col">
				<form:form action="/pubs" method="post" class="border"
					modelAttribute="newPub">
					<h6 class="bg-dark text-white px-2 py-3">
						<strong>Create a Publisher</strong>
					</h6>
					<div class="form-group row px-4">
						<label for="name" class="col-sm-2 col-form-label">Publisher Name:</label>
						<div class="col-sm-10">
							<form:input path="name" class="form-control" id="name"
								placeholder="ex/ Penguin" />
							<form:errors path="name" class="text-danger" />
						</div>
					</div>
					<div class="form-group row px-4">
						<label for="book" class="col-sm-2 col-form-label">Book:</label>
						<div class="col-sm-10">
							<select name="book" class="custom-select" id="book">
								<c:forEach items="${allBooks}" var="book">
									<option value="${book.id}">${book.title}</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="form-group row pl-4 py-2">
						<button type="submit"
							class="btn btn-outline-dark btn-sm text-uppercase">Add
							Publisher</button>
					</div>
				</form:form>
			</div>
		</div>
	</div>
</body>
</html>