package example.authz.grpc

import data.example.all_authenticated_users
import data.example.premium_users

default allow := false

is_paid_user {
	lower(input.subject.user) == premium_users[_]
}

is_free_user {
	lower(input.subject.user) == all_authenticated_users[_]
}

is_user_book_reviewer {
	is_paid_user
}
#OR
is_user_book_reviewer {
	data.org.is_org_admin
}

is_user_book_viewer {
	is_free_user
}
#OR
is_user_book_viewer {
	data.org.is_org_admin
}
