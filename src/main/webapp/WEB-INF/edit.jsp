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
	<div class="container mt-5">
		<a href="/" class="btn btn-dark btn-lg mb-5" role="button">Home</a>
		<div class="row">
			<div class="col">
				<form:form action="/books/${singleBook.id}/update" method="post"
					class="border pt-3" modelAttribute="singleBook">
					<div class="row my-5">
						<div class="col mx-auto text-center">
							<h1 class="display-1">Edit Book</h1>
						</div>
					</div>
					<div class="form-group row px-5">
						<label for="title" class="col-sm-2 col-form-label">Title:</label>
						<div class="col-sm-10">
							<form:input path="title" class="form-control" id="title"
								placeholder="ex/ War and Peace" />
							<form:errors path="title" class="text-danger" />
						</div>
					</div>
					<div class="form-group row px-5">
						<label for="description" class="col-sm-2 col-form-label">Description:</label>
						<div class="col-sm-10">
							<form:textarea path="description" class="form-control"
								id="description" placeholder="ex/ A novel about tigers..."
								rows="3"></form:textarea>
							<form:errors path="description" class="text-danger" />
						</div>
					</div>
					<div class="form-group row px-5">
						<label for="desc" class="col-sm-2 col-form-label">Language:</label>
						<div class="col-sm-10">
							<select name="language" class="custom-select">
								<option defaultValue="English">English</option>
								<option value="French">French</option>
								<option value="German">German</option>
							</select>
						</div>
					</div>
					<div class="form-group row px-5">
						<label for="numberOfPages" class="col-sm-2 col-form-label">Pages:</label>
						<div class="col-sm-10">
							<form:input path="numberOfPages" class="form-control"
								id="numberOfPages" placeholder="ex/ 356" />
						</div>
					</div>
					<div class="form-group row py-2">
						<div class="col-sm-2 ml-auto">
							<button type="submit"
							class="btn btn-outline-dark btn-sm text-uppercase">Submit</button>
						</div>
					</div>
				</form:form>
			</div>
		</div>
	</div>
</body>
</html>