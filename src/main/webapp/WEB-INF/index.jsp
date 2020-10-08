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
		<div class="row my-5">
			<div class="col mx-auto text-center">
				<h1 class="display-1">Books</h1>
			</div>
		</div>

		<div class="row">
			<div class="col-sm-7">
				<table class="table table-hover table-bordered table-striped">
					<thead class="thead-dark">
						<tr>
							<th>Title</th>
							<th>Description</th>
							<th>Language</th>
							<th>Pages</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="book" items="${books}">
							<tr>
								<td><a href="books/${book.id}">${book.title}</a></td>
								<td>${book.description}</td>
								<td>${book.language}</td>
								<td>${book.numberOfPages}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>

			<div class="col-sm-5">
				<form:form action="/books" method="post" class="border"
					modelAttribute="newBook">
					<h6 class="bg-dark text-white px-2 py-3">
						<strong>Create a Book</strong>
					</h6>
					<div class="form-group row px-4">
						<label for="title" class="col-sm-2 col-form-label">Title:</label>
						<div class="col-sm-10">
							<form:input path="title" class="form-control" id="title"
								placeholder="ex/ War and Peace" />
							<form:errors path="title" class="text-danger" />
						</div>
					</div>
					<div class="form-group row px-4">
						<label for="description" class="col-sm-2 col-form-label">Description:</label>
						<div class="col-sm-10">
							<form:textarea path="description" class="form-control"
								id="description" placeholder="ex/ A novel about tigers..."
								rows="3"></form:textarea>
							<form:errors path="description" class="text-danger" />
						</div>
					</div>
					<div class="form-group row px-4">
						<label for="desc" class="col-sm-2 col-form-label">Language:</label>
						<div class="col-sm-10">
							<select name="language" class="custom-select">
								<option defaultValue="English">English</option>
								<option value="French">French</option>
								<option value="German">German</option>
							</select>
						</div>
					</div>
					<div class="form-group row px-4">
						<label for="numberOfPages" class="col-sm-2 col-form-label">Pages:</label>
						<div class="col-sm-10">
							<form:input path="numberOfPages" class="form-control"
								id="numberOfPages" min="100" step="1" placeholder="ex/ 356" />
							<form:errors path="numberOfPages" class="text-danger" />
						</div>
					</div>
					
					<div class="form-group row pl-4 py-2">
						<button type="submit"
							class="btn btn-outline-dark btn-sm text-uppercase">Add
							Book</button>
					</div>
				</form:form>
			</div>
		</div>
	</div>
</body>
</html>