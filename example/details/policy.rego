package example.authz.http

is_details_service {
	startswith(input.path, "/details/") == true
}

allow {
	is_details_service
	is_user_book_viewer
}
