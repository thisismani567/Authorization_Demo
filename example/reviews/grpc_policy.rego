package example.authz.grpc
import data.example.premium_users

is_review_service {
	startswith(input.path, "/reviews/") == true
}

is_workload_allowed_to_call_reviews {
  #input.subject.sourcePrincipal == "spiffe://cluster.local/ns/default/sa/bookinfo-productpage"
  false
}

is_user_book_reviewer {
	lower(input.subject.user) == premium_users[_]
}

allow {
  is_review_service
  is_workload_allowed_to_call_reviews
  is_user_book_reviewer
}
