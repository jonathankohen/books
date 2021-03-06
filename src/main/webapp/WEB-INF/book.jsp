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
<title>${singleBook.title}</title>
</head>
<body>
	<div class="container mt-5">
		<div class="jumbotron">
			<a href="/">Home</a>
			<h1>${singleBook.title}</h1>

			<p class="lead">
				<strong>Language: </strong><em>${singleBook.language}</em>
			</p>
			<p class="lead">
				<strong>Number of Pages: </strong><em>${singleBook.numberOfPages}</em>
			</p>
			<hr class="my-2">
			<p>
				<strong>Description: </strong><em>${singleBook.description}</em>
			</p>
			<p>
				<strong>Publishers: </strong>
			</p>
			<ul>
				<c:forEach items="${singleBook.publishers}" var="pub">
					<li><em>${pub.name}</em></li>
				</c:forEach>
			</ul>
			<form action="/addpub" method="post">
				<input type="text" name="name" /> <input type="hidden" name="book"
					value="${singleBook.id}" /> <input type="submit" value="Add"
					class="btn btn-sm btn-dark" />
				<p class="text-danger">${nameError}</p>
			</form>
			<div class="row">
				<div class="col">
					<p class="lead">
						<a href="/books/${singleBook.id}/edit" class="btn btn-dark btn-lg"
							role="button">Edit Book</a>
					</p>
				</div>

				<div class="col">
					<form:form action="/books/${singleBook.id}/delete" method="post">
						<button type="submit" class="btn btn-outline-danger btn-lg">Delete
							Book</button>
					</form:form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>