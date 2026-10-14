# views
include: "/views/analytics/custom_fields_dev/*.view"

# analytics mappings views
include: "/views/analytics_mapping_dev/*.view"
include: "/views/analytics_mapping_sbx/*.view"
include: "/views/analytics_mapping_prd/*.view"

# models
include: "/models/access_grant_model_dev.model"
include: "/models/access_grant_model_sbx.model"
include: "/models/access_grant_model_prd.model"

#dashboards
include: "/dashboards/Analytics/**/*.dashboard"

# Getting Connection from connectin.model
include: "/models/connection.model"

# Analytics explores
include: "/explores/analytics/invoices.explore"
include: "/explores/analytics/orders.explore"
include: "/explores/analytics/requisitions.explore"
include: "/explores/analytics/expenses.explore"
include: "/explores/analytics/sourcing.explore"
include: "/explores/analytics/charges.explore"
include: "/explores/analytics/suppliers.explore"
include: "/explores/analytics/budgets.explore"
include: "/explores/analytics/forms.explore"
include: "/explores/analytics/contracts.explore"
include: "/explores/analytics/projects.explore"
include: "/explores/analytics/spend_guard_suspicious_activities.explore"
include: "/explores/analytics/receipts.explore"
include: "/explores/analytics/pay_payments.explore"
include: "/explores/analytics/commodities.explore"
include: "/explores/analytics/payable_allocations.explore"
include: "/explores/analytics/users.explore"
include: "/explores/analytics/procurement_milestones.explore"
include: "/explores/analytics/work_confirmations.explore"
include: "/explores/analytics/custom_field_attributes.explore"
include: "/explores/analytics/lookups.explore"
include: "/explores/analytics/accounts.explore"
include: "/explores/analytics/items.explore"
include: "/explores/analytics/approvals.explore"
include: "/explores/analytics/warehouses.explore"
include: "/explores/analytics/data_table_views.explore"
include: "/explores/analytics/forecast_collaboration.explore"
include: "/explores/analytics/custom_objects.explore"


# Custom Objects Explores
include: "/explores/analytics/custom_objects/*.explore"

label: "Standard Spend Analysis"

datagroup: coupa_analytics_default_datagroup { max_cache_age: "2 hour" }
persist_with: coupa_analytics_default_datagroup
# aggregate_awareness: yes


access_grant: coupa_version_32 {
  user_attribute: coupa_version
  allowed_values: ["32","33","34","35","36","37", "38", "39"]
}

access_grant: analytics_user {
  user_attribute: analytics_user
  allowed_values: ["1"]
}

access_grant: risk_assess_user {
  user_attribute: risk_assess_user
  allowed_values: ["1"]
}

# below section is of quick start guides
include: "/explores/analytics/quick_start_guides/*.explore"
# Below section is for custom_field_grant_access


access_grant: d37caaf3d1a45ddbb6b217c92dd0f6a6b88d14871273011f426369e4dbfeb8fc_cf_tmp {
  # CD-273766
  user_attribute: custom_field_id
  allowed_values: ["d37caaf3d1a45ddbb6b217c92dd0f6a6b88d14871273011f426369e4dbfeb8fc"]
}

access_grant: ba6ae2780cd4d333730be5bc989d83a63dfd66cc855030cb2592eee75fcd097f_cf_tmp {
  # CD-275057
  user_attribute: custom_field_id
  allowed_values: ["ba6ae2780cd4d333730be5bc989d83a63dfd66cc855030cb2592eee75fcd097f"]
}

access_grant: 031d5d3f5cbbf379cebb278a74d230ed323781963fc1754f96d6627f067a69eb_cf_tmp {
  # CD-275054
  user_attribute: custom_field_id
  allowed_values: ["031d5d3f5cbbf379cebb278a74d230ed323781963fc1754f96d6627f067a69eb"]
}