include: "/views/analytics/orders.view"
include: "/views/analytics/account_filter.view"
include: "/views/analytics/account_types.view"
include: "/views/analytics/account_types_legal_entities.view"
include: "/views/analytics/accounts.view"
include: "/views/analytics/active_suppliers.view"
include: "/views/analytics/addresses.view"
include: "/views/analytics/amount_components.view"
include: "/views/analytics/analytics_mapping.view"
include: "/views/analytics/analytics_mapping_coa.view"
include: "/views/analytics/business_group_filter.view"
include: "/views/analytics/charges.view"
include: "/views/analytics/commodities.view"
include: "/views/analytics/contract_spend_adjustments.view"
include: "/views/analytics/contracts.view"
include: "/views/analytics/coupa_taxonomy_transaction_summary.view"
include: "/views/analytics/departments.view"
include: "/views/analytics/early_payment_requests.view"
include: "/views/analytics/inventory_requests.view"
include: "/views/analytics/invoices.view"
include: "/views/analytics/items.view"
include: "/views/analytics/order_header_change_history.view"
include: "/views/analytics/order_header_changes.view"
include: "/views/analytics/order_header_measures.view"
include: "/views/analytics/order_history.view"
include: "/views/analytics/order_line_changes.view"
include: "/views/analytics/order_line_versions.view"
include: "/views/analytics/pay_invoices.view"
include: "/views/analytics/pay_payment_details.view"
include: "/views/analytics/pay_payments.view"
include: "/views/analytics/payment_terms.view"
include: "/views/analytics/procurement_milestones.view"
include: "/views/analytics/receipts.view"
include: "/views/analytics/req_to_sourcing.view"
include: "/views/analytics/requisitions.view"
include: "/views/analytics/sourcing.view"
include: "/views/analytics/statements.view"
include: "/views/analytics/supplier_enrichment.view"
include: "/views/analytics/supplier_informations.view"
include: "/views/analytics/supplier_metrics.view"
include: "/views/analytics/supplier_risk.view"
include: "/views/analytics/supplier_sites.view"
include: "/views/analytics/suppliers.view"
include: "/views/analytics/users.view"
include: "/views/analytics/virtual_cards.view"
include: "/views/analytics/work_confirmations.view"
include: "/views/analytics/po_pareto.view"
include: "/views/analytics/po_pareto_by_supplier.view"
include: "/views/analytics/po_pareto_total_spend.view"
include: "/views/analytics/asn.view"
include: "/views/analytics/order_confirmations.view"
include: "/views/analytics/clma_reviews.view"
include: "/views/analytics/order_header_versions.view"
include: "/views/analytics/event_response_mapping.view"
include: "/views/analytics/requisition_buyer_review_reasons.view"
include: "/views/analytics/business_classification_details.view"
include: "/views/analytics/business_enterprise_details.view"
include: "/views/analytics/business_insurance_details.view"
include: "/views/analytics/business_risk_details.view"
include: "/views/analytics/business_tax_details.view"
include: "/views/analytics/warehouses.view"
include: "/views/analytics/estimated_tax_lines.view"

explore: orders {
  view_label: "Orders"
  label: "Orders"

  required_access_grants: [analytics_user]

  access_filter: {
    field: account_filter.user_id
    user_attribute: account_filter
  }

  join: invoice_account_filter {
    from: account_filter
    view_label: "invoice account filter"
    type: left_outer
    sql_on: ${invoice_account_filter.account_id} = ${invoices.account_id} ;;
    relationship: many_to_one
  }

  join: requisition_account_filter {
    from: account_filter
    view_label: "requisition account filter"
    type: left_outer
    sql_on: ${requisition_account_filter.account_id} = ${requisitions.account_id} ;;
    relationship: many_to_one
  }

  join: account_filter {
    type: inner
    sql_on: ${account_filter.account_id} = ${orders.account_id} and ${account_filter.user_id} = {{ _user_attributes["account_filter"] }} ;;
    relationship: many_to_one
  }

  join: invoices {
    view_label: "Invoices"
    type: left_outer
    sql_on: ${orders.order_line_id} = ${invoices.order_line_id} ;;
    relationship: many_to_many
    sql_where: (${orders.has_invoice} = 'False' or coalesce(${invoice_account_filter.user_id}, -1) = {{ _user_attributes["account_filter"] }}) ;;
  }

  join: requisitions {
    view_label: "Requisitions"
    type: left_outer
    sql_on: ${orders.requisition_line_id} = ${requisitions.requisition_line_id} ;;
    relationship: many_to_many
    sql_where: (${orders.requisition_line_id} is null or coalesce(${requisition_account_filter.user_id}, -1) = {{ _user_attributes["account_filter"] }}) ;;
  }

  join: receipts {
    view_label: "Receipts"
    type: left_outer
    sql_on: ${orders.order_line_id} = ${receipts.order_line_id} ;;
    relationship: many_to_many
  }

  join: addresses {
    view_label: "Ship to Addresses"
    type: left_outer
    sql_on: ${orders.ship_to_address_id} = ${addresses.id} ;;
    relationship: many_to_one
  }

  join: req_to_sourcing {
    type: left_outer
    sql_on: ${requisitions.requisition_line_id} = ${req_to_sourcing.requisition_line_id} ;;
    relationship: many_to_many
  }

  join: sourcing {
    view_label: "Sourcing"
    type: left_outer
    sql_on: ${req_to_sourcing.quote_response_line_id} = ${sourcing.quote_response_line_id}
      and (${sourcing_business_filter.user_id} = {{ _user_attributes["business_group_filter"] }} or upper(${sourcing.content_groups}) = 'EVERYONE') ;;
    relationship: many_to_many
  }

  join: sourcing_business_filter {
    from: business_group_filter
    view_label: "sourcing business filter"
    type: left_outer
    sql_on: (${sourcing_business_filter.securable_id} = ${event_response_mapping.quote_request_id}
      and ${sourcing_business_filter.securable_type} = 'QuoteRequest'
      and ${sourcing_business_filter.user_id} = {{ _user_attributes["business_group_filter"] }}) ;;
    relationship: one_to_many
  }

  join: event_response_mapping {
    view_label: "event response mapping"
    type: left_outer
    sql_on: ${req_to_sourcing.quote_response_line_id} = ${event_response_mapping.quote_response_line_id} ;;
    relationship: many_to_many
  }

  join: payment_terms {
    view_label: "Payment Terms"
    type: left_outer
    sql_on: ${orders.payment_term_id} = ${payment_terms.id} ;;
    relationship: many_to_one
  }

  join: items {
    view_label: "Items"
    type: left_outer
    sql_on: ${orders.item_id} = ${items.id} ;;
    relationship: many_to_one
  }

  join: contracts {
    view_label: "Contracts"
    type: left_outer
    sql_on: ${orders.contract_id} = ${contracts.id}
      and (${contract_business_filter.user_id} = {{ _user_attributes["business_group_filter"] }} or  upper(${contracts.content_groups}) = 'EVERYONE') ;;
    relationship: many_to_one
  }

  join: contract_business_filter {
    from: business_group_filter
    view_label: "order contract business filter"
    type: left_outer
    sql_on: ${contract_business_filter.securable_id} = ${orders.contract_id} and ${contract_business_filter.securable_type} = 'Contract'
      and (${contract_business_filter.user_id} = {{ _user_attributes["business_group_filter"] }} or  upper(${contract_business_filter.content_groups}) = 'EVERYONE') ;;
    relationship: many_to_one
  }

  join: contract_name {
    from: contracts
    view_label: "Orders"
    type: left_outer
    sql_on: ${orders.contract_id} = ${contract_name.id};;
    relationship: many_to_one
    fields: [name]
  }

  join: departments {
    view_label: "Departments"
    type: left_outer
    sql_on: ${orders.department_id} = ${departments.id} ;;
    relationship: many_to_one
  }

  join: commodities {
    view_label: "Commodities"
    type: left_outer
    sql_on: ${orders.commodity_id} = ${commodities.commodity_id} ;;
    relationship: many_to_one
  }

  join: suppliers {
    view_label: "Suppliers"
    type: left_outer
    sql_on: ${orders.supplier_id} = ${suppliers.id}
      and (${supplier_business_filter.user_id} = {{ _user_attributes["business_group_filter"] }} or upper(${suppliers.content_groups}) = 'EVERYONE');;
    relationship: many_to_one
  }

  join: supplier_business_filter {
    from: business_group_filter
    view_label: "orders supplier business filter"
    type: left_outer
    sql_on: ${supplier_business_filter.securable_id} = ${orders.supplier_id}
      and ${supplier_business_filter.securable_type} = 'Supplier'
      and ${supplier_business_filter.user_id} = {{ _user_attributes["business_group_filter"] }} ;;
    relationship: many_to_one
  }

  join: supplier_name {
    from: suppliers
    view_label: "Orders"
    type: left_outer
    sql_on: ${orders.supplier_id} = ${supplier_name.id};;
    relationship: many_to_one
    fields: [name]
  }

  join: supplier_metrics {
    view_label: "Supplier Metrics"
    type: left_outer
    sql_on: ${orders.supplier_id} = ${supplier_metrics.supplier_id} ;;
    relationship: many_to_one
  }

  join: supplier_risk {
    view_label: "Supplier Risks"
    type: left_outer
    sql_on: ${orders.supplier_id} = ${supplier_risk.supplier_id} ;;
    relationship: many_to_one
  }

  join: supplier_sites {
    view_label: "Supplier Sites"
    type: left_outer
    sql_on: ${supplier_sites.supplier_id} = ${suppliers.id} ;;
    relationship: many_to_many
  }

  join: accounts {
    view_label: "Accounts"
    type: left_outer
    sql_on: ${orders.account_id} = ${accounts.account_id} ;;
    relationship: many_to_one
  }

  join: account_types {
    view_label: "Chart of Accounts"
    type: left_outer
    sql_on: ${orders.account_type_id} = ${account_types.id} ;;
    relationship: many_to_one
  }

  join: analytics_mapping_coa {
    view_label: "Analytics Mappings"
    type: left_outer
    sql_on: ${orders.account_type_id} = ${analytics_mapping_coa.coa_id} ;;
    relationship: many_to_one
  }

  join: work_confirmations {
    view_label: "Service Sheets"
    type: left_outer
    sql_on: ${orders.order_line_id} = ${work_confirmations.order_line_id} ;;
    relationship: many_to_many
  }

  join: virtual_cards {
    view_label: "Virtual Cards"
    type: left_outer
    sql_on: ${virtual_cards.document_id} = ${orders.order_header_id}
      and ${virtual_cards.document_type} = 'OrderHeader' ;;
    relationship: many_to_many
  }

  join: charges {
    view_label: "Charges"
    type: left_outer
    sql_on: ${charges.virtual_card_id} = ${virtual_cards.id} ;;
    relationship: many_to_one
  }

  join: statements {
    view_label: "Statements"
    type: left_outer
    sql_on: ${statements.id} = ${charges.statement_id} ;;
    relationship: one_to_many
  }

  join: order_history {
    view_label: "Order History"
    type: left_outer
    sql_on: ${orders.order_header_id} = ${order_history.order_header_id} ;;
    relationship: many_to_many
  }

  join: pay_invoices {
    view_label: "Pay Invoices"
    type: left_outer
    sql_on: ${pay_invoices.invoice_header_id} = ${invoices.invoice_header_id} ;;
    relationship: many_to_many
  }

  join: early_payment_requests {
    view_label: "Early Payment Requests"
    type: left_outer
    sql_on: ${early_payment_requests.pay_invoice_id} = ${pay_invoices.id} ;;
    relationship: many_to_many
  }

  join: pay_payment_details {
    view_label: "Pay Payment Details"
    type: left_outer
    sql_on: ${pay_payment_details.order_header_id} = ${orders.order_header_id} ;;
    relationship: many_to_many
  }

  join: pay_payments {
    view_label: "Pay Payments"
    type: left_outer
    sql_on: ${pay_payments.pay_payment_id} = ${pay_payment_details.payment_id} ;;
    relationship: many_to_many
  }

  join: procurement_milestones {
    view_label: "Procurement Milestones"
    type: left_outer
    sql_on: ${procurement_milestones.milestonable_id} = ${orders.order_header_id}
      and ${procurement_milestones.milestonable_type} = 'OrderHeader' ;;
    relationship: many_to_many
  }

  join: order_line_changes {
    view_label: "Order Line Changes"
    type: left_outer
    sql_on: ${order_line_changes.order_line_id} = ${orders.order_line_id} ;;
    relationship: one_to_many
  }

  join: order_line_versions {
    view_label: "Order Line Versions"
    type: left_outer
    sql_on: ${order_line_versions.order_line_id} = ${orders.order_line_id} ;;
    relationship: one_to_many
  }

  join: order_header_changes {
    view_label: "Order Header Changes"
    type: left_outer
    sql_on: ${order_header_changes.order_header_id} = ${orders.order_header_id} ;;
    relationship: many_to_many
  }

  join: requested_by_user {
    view_label: "Requested by Users"
    from: users
    type: left_outer
    sql_on: ${orders.user_id} = ${requested_by_user.id};;
    relationship: many_to_one
  }

  join: ship_to_user {
    view_label: "Ship to Users"
    from: users
    type: left_outer
    sql_on: ${orders.ship_to_user_id} = ${ship_to_user.id};;
    relationship: many_to_one
  }

  join: analytics_mapping {
    view_label: "Analytics Mappings"
    type: left_outer
    sql_on: ${analytics_mapping.account_id} = ${orders.account_id} ;;
    relationship: many_to_one
  }

  join: account_types_legal_entities {
    view_label: "Chart of Accounts Legal Entities"
    type: left_outer
    sql_on: ${account_types.id} = ${account_types_legal_entities.account_type_id} ;;
    relationship: many_to_many
  }

  join: amount_components {
    view_label: "Amount Components"
    type: left_outer
    sql_on: ${amount_components.order_line_id} = ${orders.order_line_id} ;;
    relationship: many_to_many
  }

  join: contract_spend_adjustments {
    view_label: "Contract Spend Adjustments"
    type: left_outer
    sql_on: ${contract_spend_adjustments.order_line_id} = ${orders.order_line_id} ;;
    relationship: many_to_many
  }

  join: order_header_change_history {
    view_label: "Order Header Change History"
    type: left_outer
    sql_on: ${order_header_change_history.order_header_change_id} = ${order_header_changes.id} ;;
    relationship: many_to_many
  }

  join: supplier_enrichment {
    view_label: "Suppliers"
    type: left_outer
    sql_on: ${supplier_enrichment.suppliers_id} = ${orders.supplier_id} ;;
    relationship: many_to_one
  }

  join: supplier_informations {
    view_label: "Supplier Information"
    type: left_outer
    sql_on: ${supplier_informations.supplier_id} = ${orders.supplier_id} ;;
    relationship: many_to_one
  }

  join: order_header_measures {
    view_label: "Orders"
    type: left_outer
    sql_on: ${orders.order_header_id} = ${order_header_measures.order_header_id} ;;
    relationship: many_to_one
  }

  join: coupa_taxonomy_transaction_summary {
    view_label: "Orders"
    type: left_outer
    sql_on: ${orders.order_line_id} = ${coupa_taxonomy_transaction_summary.order_line_id};;
    relationship: many_to_one
  }

  join: active_suppliers {
    view_label: "Suppliers"
    type: left_outer
    sql_on: ${active_suppliers.supplier_id} = ${orders.supplier_id} ;;
    relationship: many_to_one
  }

  join: inventory_requests {
    view_label: "Inventory Requests"
    type: left_outer
    sql_on: ${orders.order_line_id} = ${inventory_requests.order_line_id} ;;
    relationship: many_to_one
  }

  join: po_pareto {
    type: left_outer
    sql_on: ${orders.supplier_id} = ${po_pareto.supplier_id} ;;
    relationship: many_to_one
  }

  join: po_pareto_by_supplier {
    view_label: "Suppliers"
    type: left_outer
    sql_on: ${orders.supplier_id} = ${po_pareto_by_supplier.supplier_id} ;;
    relationship: many_to_one
  }

  join: po_pareto_total_spend {
    type: cross
    relationship: one_to_one
  }

  join: asn {
    view_label: "ASN"
    type: left_outer
    sql_on: ${orders.order_line_id} = ${asn.order_line_id} ;;
    relationship: one_to_many
  }

  join: order_confirmations {
    view_label: "Order Confirmations"
    type: left_outer
    sql_on: ${order_confirmations.order_line_id} = ${orders.order_line_id} ;;
    relationship: many_to_many
  }

  join: clma_reviews {
    view_label: "Contracts"
    type: left_outer
    sql_on: ${contracts.id} = ${clma_reviews.contract_id} ;;
    relationship: many_to_one
  }

  join: order_header_versions {
    view_label: "Order Header Versions"
    type: left_outer
    sql_on: ${order_header_versions.order_header_id} = ${orders.order_header_id} ;;
    relationship: many_to_many
  }

  join: requisition_buyer_review_reasons {
    view_label: "Requisition Buyer Review Reasons"
    type: left_outer
    sql_on: ${requisitions.requisition_header_id} = ${requisition_buyer_review_reasons.requisition_header_id} ;;
    relationship: one_to_many
  }

  join: business_classification_details {
    view_label: "Supplier Classification"
    type: left_outer
    sql_on: ${business_classification_details.linked_to_id} = ${suppliers.id}
      and ${business_classification_details.business_classification_detail_type} = 'SupplierClassificationDetail' ;;
    relationship: many_to_one
  }

  join: business_enterprise_details {
    view_label: "Enterprise Supplier Data"
    type: left_outer
    sql_on: ${business_enterprise_details.linked_to_id} = ${suppliers.id}
      and ${business_enterprise_details.business_enterprise_detail_type} = 'SupplierEnterpriseDetail' ;;
    relationship: many_to_one
  }

  join: business_insurance_details {
    view_label: "Insurance"
    type: left_outer
    sql_on: ${business_insurance_details.linked_to_id} = ${suppliers.id}
      and ${business_insurance_details.business_insurance_detail_type} = 'SupplierInsuranceDetail' ;;
    relationship: many_to_one
  }

  join: business_risk_details {
    view_label: "Risk"
    type: left_outer
    sql_on: ${business_risk_details.linked_to_id} = ${suppliers.id}
      and ${business_risk_details.business_risk_detail_type} = 'SupplierRiskDetail' ;;
    relationship: many_to_one
  }

  join: business_tax_details {
    view_label: "Tax"
    type: left_outer
    sql_on: ${business_tax_details.linked_to_id} = ${suppliers.id}
      and ${business_tax_details.business_tax_detail_type} = 'SupplierTaxDetail' ;;
    relationship: many_to_one
  }

  join: from_warehouse {
    from: warehouses
    view_label: "From Warehouses"
    type: left_outer
    sql_on: ${receipts.from_warehouse_id} = ${from_warehouse.warehouse_id} ;;
    relationship: many_to_many
  }

  join: to_warehouse {
    from: warehouses
    view_label: "To Warehouses"
    type: left_outer
    sql_on: ${receipts.to_warehouse_id} = ${to_warehouse.warehouse_id} ;;
    relationship: many_to_many
  }

  join: estimated_tax_lines {
    type: left_outer
    view_label: "Estimated Tax Lines"
    sql_on: ${orders.order_line_id} = ${estimated_tax_lines.taxable_id}
      and ${estimated_tax_lines.taxable_type} = 'OrderLine' ;;
    relationship: many_to_many
  }
}