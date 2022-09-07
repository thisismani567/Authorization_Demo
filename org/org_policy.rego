package org

import data.org.org_admins

is_org_admin {
        lower(input.subject.user) == org_admins[_]
}
