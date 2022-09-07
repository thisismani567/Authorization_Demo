package example.authz.grpc

is_review_service {
	startswith(input.path, "/reviews/") == true
}

is_workload_allowed_to_call_reviews {
  #input.subject.sourcePrincipal == "spiffe://cluster.local/ns/default/sa/bookinfo-productpage"
  false
}

allow {
  is_review_service
  is_workload_allowed_to_call_reviews
  is_user_book_reviewer
}
