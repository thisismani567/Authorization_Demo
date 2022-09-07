package example.authz.grpc

default allow := false

is_review_service {
	startswith(input.path, "/reviews/") == true
}

is_workload_allowed {
  input.subject.sourcePrincipal == "spiffe://cluster.local/ns/default/sa/bookinfo-productpage"
}

allow {
  is_review_service
  is_workload_allowed
  is_user_book_reviewer
}
