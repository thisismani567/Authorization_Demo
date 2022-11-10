package example.authz.grpc

is_details_service {
	startswith(input.path, "/details/") == true
}

is_workload_allowed_to_call_details {
  input.subject.sourcePrincipal == "spiffe://cluster.local/ns/default/sa/bookinfo-productpage"
}

allow {
  false
  is_details_service
  is_workload_allowed_to_call_details
  is_user_book_viewer
}
