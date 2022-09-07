package example.authz.http

is_review_service {
	startswith(input.path, "/reviews/") == true
}

allow {
	is_review_service
	is_user_book_reviewer
}
