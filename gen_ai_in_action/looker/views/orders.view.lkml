
view: orders {
  sql_table_name: "PRESENTATION"."ORDERS"
    ;;

  drill_fields: [
    order_header_id,
    po_number,
    commodities.commodity_level_1,
    order_header_status,
    suppliers.name,
    created_date,
    sum_order_line_reporting_total
  ]

  view_label: "Orders"

  dimension: order_detail_id {
    type: string
    sql: ${TABLE}."ORDER_DETAIL_ID" ;;
    hidden: yes
    primary_key: yes
  }

  dimension: account_id {
    type: number
    hidden: yes
    sql: ${TABLE}."ACCOUNT_ID" ;;
  }

  dimension: account_type_id {
    type: number
    hidden: yes
    sql: ${TABLE}."ACCOUNT_TYPE_ID" ;;
  }

  dimension: accounting_total_currency_id {
    type: number
    hidden: yes
    sql: ${TABLE}."ACCOUNTING_TOTAL_CURRENCY_ID" ;;
  }

  dimension_group: acknowledged {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."ACKNOWLEDGED_AT" ;;
    group_label: "Order Acknowledged Date"
    label: "Order Acknowledged"
  }

  dimension: allocation_count {
    type: number
    sql: ${TABLE}."ALLOCATION_COUNT" ;;
    label: "Order Line Allocation Count"
  }

  dimension: commodity_id {
    type: number
    hidden: yes
    sql: ${TABLE}."COMMODITY_ID" ;;
  }

  dimension: confirmed_amount {
    type: number
    sql: ${TABLE}."CONFIRMED_AMOUNT" ;;
    label: "Confirmed Amount"
    description: "Amount (in transaction currency) of the service that was confirmed."
  }

  dimension: confirmed_quantity {
    type: number
    sql: ${TABLE}."CONFIRMED_QUANTITY" ;;
    label: "Confirmed Quantity"
  }

  dimension: contract_id {
    type: number
    hidden: yes
    sql: ${TABLE}."CONTRACT_ID" ;;
  }

  dimension: coupa_accelerate_status {
    type: string
    sql: ${TABLE}."COUPA_ACCELERATE_STATUS" ;;
    label: "Static Discounting Status"
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."CREATED_AT" ;;
    group_label: "Order Date"
    label: "Order"
  }

  dimension: created_by {
    type: number
    label: "Order Created by ID"
    sql: ${TABLE}."CREATED_BY" ;;
  }

  dimension: currency_code {
    type: string
    sql: ${TABLE}."CURRENCY_CODE" ;;
    label: "Order Line Currency Code"
  }

  dimension: currency_name {
    type: string
    sql: ${TABLE}."CURRENCY_NAME" ;;
    label: "Order Line Currency Name"
  }

  dimension: current_committed_amount {
    type: number
    sql: ${TABLE}."CURRENT_COMMITTED_AMOUNT" ;;
    label: "Current Committed Amount"
  }

  dimension: department_id {
    type: number
    hidden: yes
    sql: ${TABLE}."DEPARTMENT_ID" ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}."DESCRIPTION" ;;
    label: "Order Line Description"
  }

  dimension: electronic_po {
    type: number
    sql: ${TABLE}."ELECTRONIC_PO" ;;
    label: "Electronic PO"
    description: "Indicates if the order was sent electronically, for example, through cXML, email, or the CSP."
  }

  dimension: extra_line_attribute_id {
    type: number
    sql: ${TABLE}."EXTRA_LINE_ATTRIBUTE_ID" ;;
    label: "Extra Attribute ID"
    group_label: "More Fields"
  }

  dimension: form_response_id {
    type: number
    hidden: yes
    sql: ${TABLE}."FORM_RESPONSE_ID" ;;
  }

  dimension_group: gather_supplier_review_notification_sent {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."GATHER_SUPPLIER_REVIEW_NOTIFICATION_SENT_AT" ;;
    group_label: "Gather Supplier Review Notification Sent Date"
    label: "Gather Supplier Review Notification Sent"
  }

  dimension: initial_accounting_total {
    type: number
    sql: ${TABLE}."INITIAL_ACCOUNTING_TOTAL" ;;
    label: "Order Line Initial Accounting Total"
    description: "Amount (in accounting currency) on the first version of the order line."
  }

  dimension: initial_price {
    type: number
    sql: ${TABLE}."INITIAL_PRICE" ;;
    label: "Order Line Initial Price"
  }

  dimension: initial_quantity {
    type: number
    sql: ${TABLE}."INITIAL_QUANTITY" ;;
    label: "Order Line Initial Quantity"
  }

  dimension: initial_total {
    type: number
    sql: ${TABLE}."INITIAL_TOTAL" ;;
    label: "Order Line Initial Total"
  }

  dimension: invoiced_amount {
    type: number
    sql: ${TABLE}."INVOICED_AMOUNT" ;;
    label: "Order Invoiced Amount"
  }

  dimension: item_id {
    type: number
    hidden: yes
    sql: ${TABLE}."ITEM_ID" ;;
  }

  dimension_group: last_exported {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."LAST_EXPORTED_AT" ;;
    group_label: "Order Last Exported Date"
    label: "Order Last Exported"
  }

  dimension_group: last_opened {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."LAST_OPENED_AT" ;;
    group_label: "Order Last Opened Date"
    label: "Order Last Opened"
  }

  dimension: line_count {
    type: number
    sql: ${TABLE}."LINE_COUNT" ;;
    label: "Order Line Count"
  }

  dimension: line_num {
    type: string
    sql: ${TABLE}."LINE_NUM" ;;
    label: "Order Line Number"
  }

  dimension_group: need_by {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."NEED_BY_DATE" ;;
    group_label: "Order Need by Date"
    label: "Order Need by"
  }

  dimension_group: need_by_notification_sent {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."NEED_BY_NOTIFICATION_SENT_AT" ;;
    group_label: "Order Need by Notification Sent Date"
    label: "Order Need by Notification Sent"
  }

  dimension: online_order_number {
    type: string
    sql: ${TABLE}."ONLINE_ORDER_NUMBER" ;;
    label: "Online Order Number"
    group_label: "More Fields"
  }

  dimension: order_all_pending_approval_amount {
    type: number
    sql: ${TABLE}."ORDER_ALL_PENDING_APPROVAL_AMOUNT" ;;
    label: "Order All Pending Approval Amount"
    group_label: "More Fields"
  }

  dimension: order_all_pending_approval_quantity {
    type: number
    sql: ${TABLE}."ORDER_ALL_PENDING_APPROVAL_QUANTITY" ;;
    label: "Order All Pending Approval Quantity"
    group_label: "More Fields"
  }

  dimension: order_channel {
    type: string
    sql: ${TABLE}."ORDER_CHANNEL" ;;
    label: "Order Channel"
    description: "Channel through which the order was sent to the supplier, for example, cXML or the CSP."
  }

  dimension: order_discarded_amount {
    type: number
    sql: ${TABLE}."ORDER_DISCARDED_AMOUNT" ;;
    label: "Order Discarded Amount"
    group_label: "More Fields"
  }

  dimension: order_discarded_quantity {
    type: number
    sql: ${TABLE}."ORDER_DISCARDED_QUANTITY" ;;
    label: "Order Discarded Quantity"
    group_label: "More Fields"
  }


  dimension: order_header_id {
    type: number
    sql: ${TABLE}."ORDER_HEADER_ID" ;;
    label: "Order Header ID"
    link: {
      label: "Open Order Header {{ value }}"
      url: "https://{{ _user_attributes['customer_id'] }}/order_headers/{{ value }}"
      icon_url: "/favicon.ico"
    }
  }

  dimension: order_header_invoice_stop {
    type: string
    sql: ${TABLE}."ORDER_HEADER_INVOICE_STOP" ;;
    label: "Order Header Invoice Stop"
    group_label: "More Fields"
  }

  dimension: order_header_status {
    type: string
    sql: ${TABLE}."ORDER_HEADER_STATUS" ;;
    label: "Order Header Status"
    description: "Status of the order, for example, issued, closed, canceled, or buyer hold."
  }

  dimension: order_header_version {
    type: number
    sql: ${TABLE}."ORDER_HEADER_VERSION" ;;
    label: "Order Header Version"
  }

  dimension: order_line_accounting_total {
    type: number
    sql: ${TABLE}."ORDER_LINE_ACCOUNTING_TOTAL" ;;
    label: "Order Line Accounting Total"
  }

  dimension: order_line_allocation_id {
    type: number
    sql: ${TABLE}."ORDER_LINE_ALLOCATION_ID" ;;
    label: "Order Line Allocation ID"
  }

  dimension: order_line_amount {
    type: number
    sql: ${TABLE}."ORDER_LINE_AMOUNT" ;;
    label: "Order Line Amount"
  }


  dimension: order_line_id {
    type: number
    sql: ${TABLE}."ORDER_LINE_ID" ;;
    label: "Order Line ID"
  }

  dimension: order_line_invoice_stop {
    type: string
    sql: ${TABLE}."ORDER_LINE_INVOICE_STOP" ;;
    label: "Order Line Invoice Stop"
  }

  dimension: order_line_invoiced {
    type: number
    sql: ${TABLE}."ORDER_LINE_INVOICED" ;;
    label: "Order Line Invoiced"
  }

  dimension: order_line_price {
    type: number
    sql: ${TABLE}."ORDER_LINE_PRICE" ;;
    label: "Order Line Price"
  }

  dimension: order_line_quantity {
    type: number
    sql: ${TABLE}."ORDER_LINE_QUANTITY" ;;
    label: "Order Line Quantity"
  }

  dimension: order_line_received_amount {
    type: number
    sql: ${TABLE}."ORDER_LINE_RECEIVED_AMOUNT" ;;
    label: "Order Line Received Amount"
  }

  dimension: order_line_received_quantity {
    type: number
    sql: ${TABLE}."ORDER_LINE_RECEIVED_QUANTITY" ;;
    label: "Order Line Received Quantity"
  }

  dimension: order_line_reporting_total {
    type: number
    sql: ${TABLE}."ORDER_LINE_REPORTING_TOTAL" ;;
    label: "Order Line Reporting Total"
  }

  dimension: order_line_status {
    type: string
    sql: ${TABLE}."ORDER_LINE_STATUS" ;;
    label: "Order Line Status"
  }

  dimension: order_line_version {
    type: number
    sql: ${TABLE}."ORDER_LINE_VERSION" ;;
    label: "Order Line Version"
    group_label: "More Fields"
  }

  dimension: order_pad_line_id {
    type: number
    hidden: yes
    sql: ${TABLE}."ORDER_PAD_LINE_ID" ;;
  }

  dimension: order_reporting_savings_amount {
    type: number
    sql: ${TABLE}."ORDER_REPORTING_SAVINGS_AMOUNT" ;;
    label: "Order Line Reporting Savings Amount"
  }

  dimension: order_rework_not_started_amount {
    type: number
    sql: ${TABLE}."ORDER_REWORK_NOT_STARTED_AMOUNT" ;;
    label: "Order Rework Not Started Amount"
  }

  dimension: order_rework_not_started_quantity {
    type: number
    sql: ${TABLE}."ORDER_REWORK_NOT_STARTED_QUANTITY" ;;
    label: "Order Rework Not Started Quantity"
    group_label: "More Fields"
  }

  dimension: order_source {
    type: string
    sql: ${TABLE}."ORDER_SOURCE" ;;
    label: "Order Line Source"
    description: "Requisition channel through which the requisition was created, for example, catalog, easy form, web form, punchout, sourced, or web store. If there is an item ID on the order line, the order line source is catalog."
  }

  dimension_group: order_window_delivery {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."ORDER_WINDOW_DELIVERY" ;;
    group_label: "Order Window Delivery Date"
    label: "Order Window Delivery"
  }

  dimension: order_window_id {
    type: number
    hidden: yes
    sql: ${TABLE}."ORDER_WINDOW_ID" ;;
  }

  dimension: payment_method {
    type: string
    sql: ${TABLE}."PAYMENT_METHOD" ;;
    label: "Order Payment Method"
  }

  dimension: payment_term_id {
    type: number
    hidden: yes
    sql: ${TABLE}."PAYMENT_TERM_ID" ;;
  }

  dimension: period_id {
    type: number
    hidden: yes
    sql: ${TABLE}."PERIOD_ID" ;;
  }

  dimension: po_number {
    type: string
    sql: ${TABLE}."PO_NUMBER" ;;
    label: "PO Number"
  }

  dimension: requisition_header_id {
    type: number
    hidden: yes
    sql: ${TABLE}."REQUISITION_HEADER_ID" ;;
  }

  dimension: requisition_line_id {
    type: number
    hidden: yes
    sql: ${TABLE}."REQUISITION_LINE_ID" ;;
  }

  dimension: rfq_form_response_id {
    type: number
    hidden: yes
    sql: ${TABLE}."RFQ_FORM_RESPONSE_ID" ;;
  }

  dimension: savings_percentage {
    type: number
    sql: ${TABLE}."SAVINGS_PERCENTAGE" ;;
    label: "Order Line Savings Percentage"
  }

  dimension: ship_to_address_id {
    type: number
    hidden: yes
    sql: ${TABLE}."SHIP_TO_ADDRESS_ID" ;;
  }

  dimension: ship_to_attention {
    type: string
    sql: ${TABLE}."SHIP_TO_ATTENTION" ;;
    label: "Ship to Attention"
  }

  dimension: ship_to_user_id {
    type: number
    hidden: yes
    sql: ${TABLE}."SHIP_TO_USER_ID" ;;
  }

  dimension: shipping_term_id {
    type: number
    hidden: yes
    sql: ${TABLE}."SHIPPING_TERM_ID" ;;
  }

  dimension: source_part_num {
    type: string
    sql: ${TABLE}."SOURCE_PART_NUM" ;;
    label: "Supplier Part Number"
  }

  dimension: sub_line_num {
    type: number
    sql: ${TABLE}."SUB_LINE_NUM" ;;
    label: "Sub Line Number"
    group_label: "More Fields"
  }

  dimension: supplier_id {
    type: number
    hidden: yes
    sql: ${TABLE}."SUPPLIER_ID" ;;
  }

  dimension: supplier_order_number {
    type: string
    sql: ${TABLE}."SUPPLIER_ORDER_NUMBER" ;;
    label: "Supplier Order Number"
  }

  dimension: type {
    type: string
    sql: ${TABLE}."TYPE" ;;
    label: "Order Line Type"
  }

  dimension: uom_name {
    type: string
    sql: ${TABLE}."UOM_NAME" ;;
    label: "Order Line UOM Name"
  }

  dimension_group: updated {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."UPDATED_AT" ;;
    group_label: "Order Updated Date"
    label: "Order Updated"
  }

  dimension: updated_by {
    type: number
    label: "Order Updated by ID"
    sql: ${TABLE}."UPDATED_BY" ;;
    group_label: "More Fields"
  }

  dimension: user_id {
    type: number
    hidden: yes
    sql: ${TABLE}."USER_ID" ;;
  }

  dimension: extra_attribute_type {
    type: string
    sql: ${TABLE}."EXTRA_ATTRIBUTE_TYPE" ;;
    label: "Extra Attribute Type"
    group_label: "More Fields"
  }

  dimension: extra_attribute_manager_id {
    type: number
    sql: ${TABLE}."EXTRA_ATTRIBUTE_MANAGER_ID" ;;
    label: "Service Manager ID"
    group_label: "More Fields"
  }

  dimension: extra_attribute_completed {
    type: string
    sql: ${TABLE}."EXTRA_ATTRIBUTE_COMPLETED" ;;
    label: "Extra Attribute Completed"
  }

  dimension: extra_attribute_created_by {
    type: number
    sql: ${TABLE}."EXTRA_ATTRIBUTE_CREATED_BY" ;;
    hidden: yes
  }

  dimension: extra_attribute_updated_by {
    type: number
    sql: ${TABLE}."EXTRA_ATTRIBUTE_UPDATED_BY" ;;
    hidden: yes
  }

  dimension: work_confirmer_email {
    type: string
    sql: ${TABLE}."WORK_CONFIRMER_EMAIL" ;;
    label: "Service Manager Email"
    group_label: "More Fields"
  }

  dimension: extra_attribute_percentage {
    type: number
    sql: ${TABLE}."EXTRA_ATTRIBUTE_PERCENTAGE" ;;
    label: "Extra Attribute Percentage"
    group_label: "More Fields"
  }

  dimension: extra_attribute_quantity {
    type: number
    sql: ${TABLE}."EXTRA_ATTRIBUTE_QUANTITY" ;;
    label: "Extra Attribute Quantity"
    group_label: "More Fields"
  }

  dimension: extra_attribute_line_number {
    type: number
    sql: ${TABLE}."EXTRA_ATTRIBUTE_LINE_NUMBER" ;;
    label: "Extra Attribute Line Number"
  }

  dimension: extra_attribute_description {
    type: string
    sql: ${TABLE}."EXTRA_ATTRIBUTE_DESCRIPTION" ;;
    label: "Extra Attribute Description"
    group_label: "More Fields"
  }

  dimension_group: extra_attribute_created_at {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."EXTRA_ATTRIBUTE_CREATED_AT" ;;
    group_label: "Extra Attribute Created Date"
    label: "Extra Attribute Created"
  }

  dimension_group: extra_attribute_updated_at {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."EXTRA_ATTRIBUTE_UPDATED_AT" ;;
    group_label: "Extra Attribute Updated Date"
    label: "Extra Attribute Updated"
  }


  dimension_group: extra_attribute_start_date {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."EXTRA_ATTRIBUTE_START_DATE" ;;
    group_label: "Extra Attribute Start Date"
    label: "Extra Attribute Start"
  }

  dimension_group: extra_attribute_end_date {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."EXTRA_ATTRIBUTE_END_DATE" ;;
    group_label: "Extra Attribute End Date"
    label: "Extra Attribute End"
  }

  dimension: po_is_service {
    type: string
    sql: ${TABLE}."PO_IS_SERVICE" ;;
    label: "PO Is Service"
  }

  dimension: order_contract_status {
    type: string
    sql: CASE WHEN ${TABLE}."CONTRACT_ID" IS NOT NULL THEN 'On Contract' ELSE 'Off Contract' END ;;
    label: "Order Contract Status"
    description: "Indicates if the order line is associated with a contract, that is, if the order line is on contract or off contract."
  }

  dimension: order_created_by_name {
    type: string
    sql: ${TABLE}."ORDER_CREATED_BY_NAME" ;;
    label: "Order Created by Name"
  }

  dimension: order_updated_by_name {
    type: string
    sql: ${TABLE}."ORDER_UPDATED_BY_NAME" ;;
    label: "Order Updated by Name"
  }

  dimension: classification {
    type: string
    sql: ${TABLE}."CLASSIFICATION" ;;
    label: "Order Classification"
    description: "Classification of contingent workforce (CCW) orders: MSP or supplier."
  }

  dimension: external_reference_number {
    type: string
    sql: ${TABLE}."EXTERNAL_REFERENCE_NUMBER" ;;
    label: "Order External Reference Number"
    group_label: "More Fields"
  }

  dimension: external_reference_type {
    type: string
    sql: ${TABLE}."EXTERNAL_REFERENCE_TYPE" ;;
    label: "Order External Reference Type"
    group_label: "More Fields"
  }

  dimension: supp_aux_part_num {
    type: string
    sql: ${TABLE}."SUPP_AUX_PART_NUM" ;;
    label: "Supplier Aux Part Number"
  }

  dimension: service_manager_name {
    type: string
    sql: ${TABLE}."SERVICE_MANAGER_NAME" ;;
    label: "Service Manager Name "
    group_label: "More Fields"
  }

  dimension: after_the_fact {
    type: string
    sql: ${TABLE}."AFTER_THE_FACT" ;;
    label: "Order After the Fact"
    description: "Indicates if the order was created after the invoice date, on the day of the invoice date, or before the invoice date."
  }

  dimension: third_party_supplier_name {
    type: string
    sql: ${TABLE}."THIRD_PARTY_SUPPLIER_NAME" ;;
    label: "Third-Party Supplier Name"
    description: "Third-party supplier name on the contingent workforce (CCW) order."
  }

  dimension: allocation_pct {
    type: number
    sql: ${TABLE}."ALLOCATION_PCT" ;;
    label: "Order Line Allocation Percentage"
  }

  dimension: order_header_type {
    type: string
    sql: ${TABLE}."ORDER_HEADER_TYPE" ;;
    label: "Order Header Type"
    description: "Type of the order header, for example, internal order header or external order header."
  }

  dimension: has_invoice {
    type: string
    sql: ${TABLE}."HAS_INVOICE" ;;
    label: "Order Line Has Invoice"
  }

  dimension: receipt_reporting_total {
    type: number
    sql: ${TABLE}."RECEIPT_REPORTING_TOTAL" ;;
    label: "Receipt Reporting Total"
  }

  dimension: receipt_quantity {
    type: number
    sql: ${TABLE}."RECEIPT_QUANTITY" ;;
    label: "Receipt Quantity"
  }

  dimension: po_savings_from_sourcing {
    type: number
    sql: ${TABLE}."PO_SAVINGS_FROM_SOURCING" ;;
    label: "PO Savings from Sourcing"
    group_label: "More Fields"
  }

  dimension: uom_code {
    type: string
    sql: ${TABLE}."UOM_CODE" ;;
    label: "Order Line UOM Code"
  }

  dimension: period_name {
    type: string
    sql: ${TABLE}."PERIOD_NAME" ;;
    label: "Order Budget Period Name"
  }

  dimension: order_header_total {
    type: number
    sql: ${TABLE}."ORDER_HEADER_TOTAL" ;;
    label: "Order Header Total"
  }

  dimension: order_header_reporting_total {
    type: number
    sql: ${TABLE}."ORDER_HEADER_REPORTING_TOTAL" ;;
    label: "Order Header Reporting Total"
  }

  dimension: price_hidden {
    type: string
    sql: ${TABLE}."PRICE_HIDDEN" ;;
    label: "Price Hidden"
  }

  dimension: shipping_method {
    type: string
    sql: ${TABLE}."SHIPPING_METHOD" ;;
    label: "Order Shipping Method"
  }

  dimension: shipping_method_description {
    type: string
    sql: ${TABLE}."SHIPPING_METHOD_DESCRIPTION" ;;
    label: "Order Shipping Method Description"
    group_label: "More Fields"
  }

  dimension: receipt_count {
    type: number
    sql: ${TABLE}."RECEIPT_COUNT" ;;
    label: "Number of Receipts"
  }

  dimension: order_line_reporting_invoiced_amount {
    type: number
    sql: ${TABLE}."ORDER_LINE_REPORTING_INVOICED" ;;
    label: "Order Line Invoiced Reporting Amount"
    description: "Amount (in reporting currency) of all the invoices associated with the order line, where the order line type is order amount line. If the order line type is order quantity line, this value is 0."
  }

  dimension: reporting_invoiced_amount {
    type: number
    sql: ${TABLE}."REPORTING_INVOICED_AMOUNT" ;;
    label: "Order Invoiced Reporting Amount"
  }

  dimension: manufacturer_part_number {
    type: string
    sql: ${TABLE}."MANUFACTURER_PART_NUMBER" ;;
    label: "Manufacturer Part Number"
  }

  dimension: manufacturer_name {
    type: string
    sql: ${TABLE}."MANUFACTURER_NAME" ;;
    label: "Manufacturer Name"
  }

  dimension_group: last_receipt {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."LAST_RECEIPT_DATE" ;;
    group_label: "Last Receipt Date"
    label: "Last Receipt"
  }

  dimension_group: last_invoice {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."LAST_INVOICE_DATE" ;;
    group_label: "Last Invoice Date"
    label: "Last Invoice"
  }

  dimension: order_header_delivery_status{
    type: string
    sql: ${TABLE}."ORDER_HEADER_DELIVERY_STATUS" ;;
    label: "Order Header Delivery Status"
  }

  dimension: order_line_delivery_status{
    type: string
    sql: ${TABLE}."ORDER_LINE_DELIVERY_STATUS" ;;
    label: "Order Line Delivery Status"
  }

  dimension_group: order_header_last_revision {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."ORDER_HEADER_LAST_REVISION_DATE" ;;
    group_label: "Order Header Last Revision Date"
    label: "Order Header Last Revision"
  }

  dimension: po_change_type{
    type: string
    sql: ${TABLE}."PO_CHANGE_TYPE" ;;
    label: "PO Change Type"
  }

  dimension: po_total_initial_version {
    type: number
    sql: ${TABLE}."PO_TOTAL_INITIAL_VERSION" ;;
    label: "PO Total Initial Version"
  }

  dimension: change_in_po_total_from_initial_version {
    type: number
    sql: ${TABLE}."CHANGE_IN_PO_TOTAL_FROM_INITIAL_VERSION" ;;
    label: "Change in PO Total from Initial Version"
  }

  dimension: minimum_order_quantity {
    type: number
    sql: ${TABLE}."MINIMUM_ORDER_QUANTITY" ;;
    label: "Minimum Order Quantity"
  }

  dimension: order_line_estimated_tax_amount{
    type: number
    sql: ${TABLE}."ORDER_LINE_ESTIMATED_TAX_AMOUNT" ;;
    label: "Order Line Estimated Tax Amount"
  }

  dimension: order_header_estimated_tax_amount {
    type: number
    sql: ${TABLE}."ORDER_HEADER_ESTIMATED_TAX_AMOUNT" ;;
    label: "Order Header Estimated Tax Amount"
  }

  dimension: order_line_reporting_estimated_tax_amount{
    type: number
    sql: ${TABLE}."ORDER_LINE_REPORTING_ESTIMATED_TAX_AMOUNT" ;;
    label: "Order Line Reporting Estimated Tax Amount"
  }

  dimension: order_header_reporting_estimated_tax_amount {
    type: number
    sql: ${TABLE}."ORDER_HEADER_REPORTING_ESTIMATED_TAX_AMOUNT" ;;
    label: "Order Header Reporting Estimated Tax Amount"
  }

  # ----- Measures ------
  measure: count_order_line_id {
    type: count_distinct
    sql: ${TABLE}."ORDER_LINE_ID" ;;
    label: "Order Line ID"
    group_label: "Line Level Measures"
  }

  measure: count_order_header_id {
    type: count_distinct
    sql: ${TABLE}."ORDER_HEADER_ID" ;;
    label: "Order Header ID"
    group_label: "Line Level Measures"
  }

  measure: count_extra_line_attribute_id {
    type: count_distinct
    sql: ${TABLE}."EXTRA_LINE_ATTRIBUTE_ID" ;;
    label: "Extra Attribute ID"
    group_label: "Line Level Measures"
  }

  measure: sum_confirmed_amount {
    type: sum
    sql: ${TABLE}."CONFIRMED_AMOUNT" ;;
    label: "Confirmed Amount"
    description: "Amount (in transaction currency) of the service that was confirmed."
    group_label: "Line Level Measures"
  }

  measure: sum_confirmed_quantity {
    type: sum
    sql: ${TABLE}."CONFIRMED_QUANTITY" ;;
    label: "Confirmed Quantity"
    group_label: "Line Level Measures"
  }

  measure: sum_current_committed_amount {
    type: sum
    sql: ${TABLE}."CURRENT_COMMITTED_AMOUNT" ;;
    label: "Current Committed Amount"
    group_label: "Line Level Measures"
  }

  measure: sum_initial_accounting_total {
    type: sum
    sql: ${TABLE}."INITIAL_ACCOUNTING_TOTAL" ;;
    label: "Order Line Initial Accounting Total"
    description: "Amount (in accounting currency) on the first version of the order line."
    group_label: "Line Level Measures"
  }

  measure: sum_initial_price {
    type: sum
    sql: ${TABLE}."INITIAL_PRICE" ;;
    label: "Order Line Initial Price"
    group_label: "Line Level Measures"
  }

  measure: sum_initial_quantity {
    type: sum
    sql: ${TABLE}."INITIAL_QUANTITY" ;;
    label: "Order Line Initial Quantity"
    group_label: "Line Level Measures"
  }

  measure: sum_initial_total {
    type: sum
    sql: ${TABLE}."INITIAL_TOTAL" ;;
    label: "Order Line Initial Total"
    group_label: "Line Level Measures"
  }

  measure: sum_invoiced_amount {
    type: sum
    sql: ${TABLE}."INVOICED_AMOUNT" ;;
    label: "Order Invoiced Amount"
    hidden: yes
  }

  measure: sum_order_all_pending_approval_amount {
    type: sum
    sql: ${TABLE}."ORDER_ALL_PENDING_APPROVAL_AMOUNT" ;;
    label: "Order All Pending Approval Amount"
    group_label: "Line Level Measures"
  }

  measure: sum_order_all_pending_approval_quantity {
    type: sum
    sql: ${TABLE}."ORDER_ALL_PENDING_APPROVAL_QUANTITY" ;;
    label: "Order All Pending Approval Quantity"
    group_label: "Line Level Measures"
  }

  measure: sum_order_discarded_amount {
    type: sum
    sql: ${TABLE}."ORDER_DISCARDED_AMOUNT" ;;
    label: "Order Discarded Amount"
    group_label: "Line Level Measures"
  }

  measure: sum_order_discarded_quantity {
    type: sum
    sql: ${TABLE}."ORDER_DISCARDED_QUANTITY" ;;
    label: "Order Discarded Quantity"
    group_label: "Line Level Measures"
  }

  measure: sum_order_line_accounting_total {
    type: sum
    sql: ${TABLE}."ORDER_LINE_ACCOUNTING_TOTAL" ;;
    label: "Order Line Accounting Total"
    group_label: "Line Level Measures"
  }

  measure: sum_order_line_amount {
    type: sum
    sql: ${TABLE}."ORDER_LINE_AMOUNT" ;;
    label: "Order Line Amount"
    group_label: "Line Level Measures"
  }

  measure: sum_order_line_invoiced {
    type: sum
    sql: ${TABLE}."ORDER_LINE_INVOICED" ;;
    label: "Order Line Invoiced"
    group_label: "Line Level Measures"
  }

  measure: sum_order_line_price {
    type: sum
    sql: ${TABLE}."ORDER_LINE_PRICE" ;;
    label: "Order Line Price"
    group_label: "Line Level Measures"
  }

  measure: sum_order_line_quantity {
    type: sum
    sql: ${TABLE}."ORDER_LINE_QUANTITY" ;;
    label: "Order Line Quantity"
    group_label: "Line Level Measures"
  }

  measure: sum_order_line_received_amount {
    type: sum
    sql: ${TABLE}."ORDER_LINE_RECEIVED_AMOUNT" ;;
    label: "Order Line Received Amount"
    group_label: "Line Level Measures"
  }

  measure: sum_order_line_received_quantity {
    type: sum
    sql: ${TABLE}."ORDER_LINE_RECEIVED_QUANTITY" ;;
    label: "Order Line Received Quantity"
    group_label: "Line Level Measures"
  }

  measure: sum_order_line_reporting_total_on_contract {
    type: sum
    filters: [order_contract_status: "On Contract"]
    sql: ${TABLE}."ORDER_LINE_REPORTING_TOTAL" ;;
    label: "PO Spend on Contract"
    group_label: "Line Level Measures"
  }

  measure: po_spend_rate  {
    type: number
    label: "On-Contract PO Rate"
    sql: ${sum_order_line_reporting_total_on_contract}/${sum_order_line_reporting_total} * 100 ;;
    group_label: "Line Level Measures"
  }

  measure: sum_order_line_reporting_total {
    type: sum
    sql: ${TABLE}."ORDER_LINE_REPORTING_TOTAL" ;;
    label: "Order Line Reporting Total"
    group_label: "Line Level Measures"
    drill_fields: [sum_order_line_reporting_total, created_month]
    link: {
      label: "PO Spend"
      url: "
      {% assign vis_config = '{
      \"show_value_labels\" : true,
      \"label_density\" : 25,
      \"legend_position\" : \"center\",
      \"x_axis_gridlines\" : false,
      \"y_axis_gridlines\" : false,
      \"y_axis_combined\" : true,
      \"show_y_axis_labels\" : true,
      \"show_y_axis_ticks\" : true,
      \"y_axis_tick_density\" : \"default\",
      \"y_axis_tick_density_custom\": 5,
      \"show_x_axis_label\" : true,
      \"show_x_axis_ticks\" : true,
      \"x_axis_scale\" : \"auto\",
      \"y_axis_scale_mode\" : \"linear\",
      \"show_null_points\" : true,
      \"point_style\" : \"circle\",
      \"ordering\" : \"none\",
      \"show_null_labels\" : false,
      \"show_totals_labels\" : false,
      \"show_silhouette\" : false,
      \"totals_color\" : \"808080\",
      \"type\" : \"looker_column\",
      \"interpolation\" : \"linear\",
      \"series_types\" : {},
      \"colors\": [
      \"palette: Coupa Default\"
      ],
      \"series_colors\" : {},
      \"x_axis_datetime_tick_count\": null,
      \"trend_lines\": [
      {
      \"color\" : \"#3F8EE6\",
      \"label_position\" : \"left\",
      \"period\" : 30,
      \"regression_type\" : \"average\",
      \"series_index\" : 1,
      \"show_label\" : false,
      \"label_type\" : \"string\",
      \"label\" : \" \"
      }
      ]
      }' %}
      {{ link }}&vis_config={{ vis_config | encode_uri }}&toggle=dat,pik,vis&limit=50"
    }
  }

  measure: sum_order_reporting_savings_amount {
    type: sum
    sql: ${TABLE}."ORDER_REPORTING_SAVINGS_AMOUNT" ;;
    label: "Order Line Reporting Savings Amount"
    group_label: "Line Level Measures"
  }

  measure: sum_order_rework_not_started_amount {
    type: sum
    sql: ${TABLE}."ORDER_REWORK_NOT_STARTED_AMOUNT" ;;
    label: "Order Rework Not Started Amount"
    group_label: "Line Level Measures"
  }

  measure: sum_order_rework_not_started_quantity {
    type: sum
    sql: ${TABLE}."ORDER_REWORK_NOT_STARTED_QUANTITY" ;;
    label: "Order Rework Not Started Quantity"
    group_label: "Line Level Measures"
  }

  measure: sum_extra_attribute_quantity {
    type: sum
    sql: ${TABLE}."EXTRA_ATTRIBUTE_QUANTITY" ;;
    label: "Extra Attribute Quantity"
    group_label: "Line Level Measures"
  }

  measure: sum_order_line_reporting_invoiced_amount {
    type: sum
    sql: ${TABLE}."ORDER_LINE_REPORTING_INVOICED" ;;
    label: "Order Line Invoiced Reporting Amount"
    description: "Amount (in reporting currency) of all the invoices associated with the order line, where the order line type is order amount line. If the order line type is order quantity line, this value is 0."
    group_label: "Line Level Measures"
  }

  measure: count_of_electronic_po  {
    type: count_distinct
    filters: [electronic_po: "1"]
    sql: ${TABLE}."ORDER_HEADER_ID" ;;
    label: "Electronic PO Count"
    group_label: "Line Level Measures"
  }

  measure: rate_of_electronic_po {
    type: number
    label: "Electronic PO Rate"
    sql: ${count_of_electronic_po}/ ${count_order_header_id} * 100 ;;
    group_label: "Line Level Measures"
  }
  # Success Metrics
  measure: spend_capture_goal {
    type: number
    sql: (SELECT SUCCESS_METRICS."CURRENT_YEAR_GOAL" FROM PRESENTATION.SUCCESS_METRICS SUCCESS_METRICS WHERE SUCCESS_METRICS."SUCCESS_METRIC_NAME" = 'spend_capture') ;;
    label: "Spend Capture Rate"
    group_label: "Success Metrics"
  }

  measure: catalog_spend_goal {
    type: number
    sql: (SELECT SUCCESS_METRICS."CURRENT_YEAR_GOAL" FROM PRESENTATION.SUCCESS_METRICS SUCCESS_METRICS WHERE SUCCESS_METRICS."SUCCESS_METRIC_NAME" = 'catalog_spend') ;;
    label: "Catalog (Punchout and Catalog) Rate by Amount/Count"
    group_label: "Success Metrics"
  }

  measure: epo_goal {
    type: number
    sql: (SELECT SUCCESS_METRICS."CURRENT_YEAR_GOAL" FROM PRESENTATION.SUCCESS_METRICS SUCCESS_METRICS WHERE SUCCESS_METRICS."SUCCESS_METRIC_NAME" = 'po_sent_electronically') ;;
    label: "Electronic PO Sent Rate by Order Amount/Count"
    group_label: "Success Metrics"
  }

  measure: managed_spend_goal {
    type: number
    sql: (SELECT SUCCESS_METRICS."CURRENT_YEAR_GOAL" FROM PRESENTATION.SUCCESS_METRICS SUCCESS_METRICS WHERE SUCCESS_METRICS."SUCCESS_METRIC_NAME" = 'managed_spend') ;;
    label: "Managed Spend"
    group_label: "Success Metrics"
  }

  measure: on_contract_goal {
    type: number
    sql: (SELECT SUCCESS_METRICS."CURRENT_YEAR_GOAL" FROM PRESENTATION.SUCCESS_METRICS SUCCESS_METRICS WHERE SUCCESS_METRICS."SUCCESS_METRIC_NAME" = 'contracts_spend') ;;
    label: "On-Contract Rate by Order Amount/Count"
    group_label: "Success Metrics"
  }

  measure: savings_rate_goal {
    type: number
    sql: (SELECT SUCCESS_METRICS."CURRENT_YEAR_GOAL" FROM PRESENTATION.SUCCESS_METRICS SUCCESS_METRICS WHERE SUCCESS_METRICS."SUCCESS_METRIC_NAME" = 'average_savings_rate') ;;
    label: "Average Savings Rate"
    group_label: "Success Metrics"
  }

  measure: supplier_adoption_goal {
    type: number
    sql: (SELECT SUCCESS_METRICS."CURRENT_YEAR_GOAL" FROM PRESENTATION.SUCCESS_METRICS SUCCESS_METRICS WHERE SUCCESS_METRICS."SUCCESS_METRIC_NAME" = 'supplier_adoption') ;;
    label: "Active Supplier Rate"
    group_label: "Success Metrics"
  }

  measure: targeted_spend_goal {
    type: number
    sql: (SELECT SUCCESS_METRICS."CURRENT_YEAR_GOAL" FROM PRESENTATION.SUCCESS_METRICS SUCCESS_METRICS WHERE SUCCESS_METRICS."SUCCESS_METRIC_NAME" = 'geted_spend') ;;
    label: "Targeted Spend"
    group_label: "Success Metrics"
  }

  measure: sum_receipt_reporting_total {
    type: sum
    sql: ${TABLE}."RECEIPT_REPORTING_TOTAL" ;;
    label: "Receipt Reporting Total"
    group_label: "Line Level Measures"
  }

  measure: sum_receipt_quantity {
    type: sum
    sql: ${TABLE}."RECEIPT_QUANTITY" ;;
    label: "Receipt Quantity"
    group_label: "Line Level Measures"
  }

  measure: sum_po_savings_from_sourcing {
    type: sum
    sql: ${TABLE}."PO_SAVINGS_FROM_SOURCING" ;;
    label: "PO Savings from Sourcing"
    group_label: "Line Level Measures"
  }

  measure: count_receipts {
    type: sum
    sql: ${TABLE}."RECEIPT_COUNT" ;;
    label: "Number of Receipts"
    group_label: "Line Level Measures"
  }

  # Business Value Insights Metrics
  measure: contract_savings_rate {
    type: average
    sql: (SELECT METRIC_VALUES."VALUE" FROM PRESENTATION.METRIC_VALUES METRIC_VALUES WHERE METRIC_VALUES."KEY" = 'benchmark_contract_savings_rate') ;;
    label: "Contract Savings Rate"
    group_label: "Business Value Insights"
  }

  measure: preapproved_spend_savings_rate {
    type: average
    sql: (SELECT METRIC_VALUES."VALUE" FROM PRESENTATION.METRIC_VALUES METRIC_VALUES WHERE METRIC_VALUES."KEY" = 'benchmark_preapproved_spend_savings_rate') ;;
    label: "Pre-Approved Spend Savings Rate"
    group_label: "Business Value Insights"
  }

  measure: leakage_rate {
    type: average
    sql: (SELECT METRIC_VALUES."VALUE" FROM PRESENTATION.METRIC_VALUES METRIC_VALUES WHERE METRIC_VALUES."KEY" = 'benchmark_leakage_rate') ;;
    label: "Leakage Rate"
    group_label: "Business Value Insights"
  }

  measure: on_contract_rate {
    type: average
    sql: (SELECT METRIC_VALUES."VALUE" FROM PRESENTATION.METRIC_VALUES METRIC_VALUES WHERE METRIC_VALUES."KEY" = 'benchmark_on_contract_rate') ;;
    label: "On Contract Rate"
    group_label: "Business Value Insights"
  }

  measure: average_contract_savings_rate {
    type: average
    sql: (SELECT METRIC_VALUES."VALUE" FROM PRESENTATION.METRIC_VALUES METRIC_VALUES WHERE METRIC_VALUES."KEY" = 'benchmark_average_contract_savings_rate') ;;
    label: "Average Contract Savings Rate"
    group_label: "Business Value Insights"
  }

  measure: electronic_po_savings_rate {
    type: average
    sql: (SELECT METRIC_VALUES."VALUE" FROM PRESENTATION.METRIC_VALUES METRIC_VALUES WHERE METRIC_VALUES."KEY" = 'benchmark_electronic_po_savings_rate') ;;
    label: "Electronic PO Savings Rate"
    group_label: "Business Value Insights"
  }

  measure: sum_order_line_estimated_tax_amount {
    type: number
    sql: ${TABLE}."ORDER_LINE_ESTIMATED_TAX_AMOUNT" ;;
    label: "Order Line Estimated Tax Amount"
    group_label: "Line Level Measures"
  }

  measure: sum_order_line_reporting_estimated_tax_amount{
    type: number
    sql: ${TABLE}."ORDER_LINE_REPORTING_ESTIMATED_TAX_AMOUNT" ;;
    label: "Order Line Reporting Estimated Tax Amount"
    group_label: "Line Level Measures"
  }
}
