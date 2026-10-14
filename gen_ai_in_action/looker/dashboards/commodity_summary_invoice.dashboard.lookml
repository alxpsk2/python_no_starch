
- dashboard: commodity__summary_invoice
  title: Commodity - Summary Invoice
  layout: newspaper
  preferred_viewer: dashboards-next
  elements:
  - title: Spend Amount
    name: Spend Amount
    model: coupa_analytics
    explore: invoices
    type: single_value
    fields: [invoices.sum_invoice_line_reporting_total]
    filters:
      invoices.status: approved
    limit: 500

    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    value_format: '#,##0, "K"'
    defaults_version: 1
    listen:
      Commodity: commodities.commodity_level_1
      Supplier Name: suppliers.name
      Invoice Date: invoices.invoice_date
      Chart of Account: account_types.name
      Account Segment 1 Name: accounts.segment_1_name
    row: 0
    col: 0
    width: 6
    height: 4
  - title: "% On Contract by Count"
    name: "% On Contract by Count"
    model: coupa_analytics
    explore: invoices
    type: single_value
    fields: [count_on_contract_invoices, invoices.count_invoice_header_id]
    filters:
      invoices.status: approved
    limit: 500
    dynamic_fields: [{measure: count_on_contract_invoices, based_on: invoices.count_invoice_header_id,
        type: count_distinct, label: Count On Contract Invoices, value_format: !!null '',
        value_format_name: !!null '', _kind_hint: measure, _type_hint: number, filter_expression: '${invoices.invoice_contract_status}
          = "On Contract"'}, {table_calculation: on_contract, label: "% On Contract",
        expression: "${count_on_contract_invoices}\n/\n${invoices.count_invoice_header_id}",
        value_format: !!null '', value_format_name: percent_0, _kind_hint: measure,
        _type_hint: number}]

    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields: [count_on_contract_invoices, invoices.count_invoice_header_id]
    series_types: {}
    listen:
      Commodity: commodities.commodity_level_1
      Supplier Name: suppliers.name
      Invoice Date: invoices.invoice_date
      Chart of Account: account_types.name
      Account Segment 1 Name: accounts.segment_1_name
    row: 0
    col: 18
    width: 6
    height: 4
  - title: Top 10 On Contract Spend by Commodity
    name: Top 10 On Contract Spend by Commodity
    model: coupa_analytics
    explore: invoices
    type: looker_column
    fields: [invoices.sum_invoice_line_reporting_total, invoices.sum_invoice_reporting_savings_amount,
      invoices.sum_invoice_line_reporting_total_off_contract, invoices.sum_invoice_line_reporting_total_on_contract,
      commodities.commodity_level_1]
    filters:
      invoices.status: approved
    sorts: [invoices.sum_invoice_line_reporting_total_on_contract desc]
    limit: 10
    total: true
    dynamic_fields: [{table_calculation: total, label: "% Total", expression: "${invoices.sum_invoice_line_reporting_total}\
          \ / \n${invoices.sum_invoice_line_reporting_total:total}", value_format: !!null '',
        value_format_name: percent_2, _kind_hint: measure, _type_hint: number}, {
        table_calculation: savings, label: Savings %, expression: "${invoices.sum_invoice_reporting_savings_amount}\
          \ /\n(${invoices.sum_invoice_line_reporting_total}\n+ ${invoices.sum_invoice_reporting_savings_amount})",
        value_format: !!null '', value_format_name: percent_2, _kind_hint: measure,
        _type_hint: number}]

    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: invoices.sum_invoice_line_reporting_total_off_contract,
            id: invoices.sum_invoice_line_reporting_total_off_contract, name: Invoice
              Line Reporting Total Off Contract}, {axisId: invoices.sum_invoice_line_reporting_total_on_contract,
            id: invoices.sum_invoice_line_reporting_total_on_contract, name: Invoice
              Line Reporting Total On Contract}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear},
      {label: !!null '', orientation: right, series: [{axisId: total, id: total, name: "%\
              \ Total"}, {axisId: savings, id: savings, name: Savings %}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_label: Commodity
    series_types:
      total: scatter
      savings: scatter
    series_colors:
      total: "#F27921"
      savings: "#157A1D"
      invoices.sum_invoice_line_reporting_total_off_contract: "#1867CD"
      invoices.sum_invoice_line_reporting_total_on_contract: "#268ECD"
    series_labels:
      invoices.sum_invoice_line_reporting_total_off_contract: Off Contract
      invoices.sum_invoice_line_reporting_total_on_contract: On Contract
    defaults_version: 1
    hidden_fields: [invoices.sum_invoice_line_reporting_total, invoices.sum_invoice_reporting_savings_amount]
    listen:
      Commodity: commodities.commodity_level_1
      Supplier Name: suppliers.name
      Invoice Date: invoices.invoice_date
      Chart of Account: account_types.name
      Account Segment 1 Name: accounts.segment_1_name
    row: 4
    col: 0
    width: 12
    height: 9
  - title: "% On Contract by Amount"
    name: "% On Contract by Amount"
    model: coupa_analytics
    explore: invoices
    type: single_value
    fields: [invoices.sum_invoice_line_reporting_total, invoices.sum_invoice_line_reporting_total_on_contract]
    filters:
      invoices.status: approved
    limit: 500
    dynamic_fields: [{table_calculation: on_contract, label: "% On Contract", expression: "${invoices.sum_invoice_line_reporting_total_on_contract}\
          \ /\n${invoices.sum_invoice_line_reporting_total}\n", value_format: !!null '',
        value_format_name: percent_0, _kind_hint: measure, _type_hint: number}]

    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    value_format: ''
    defaults_version: 1
    hidden_fields: [invoices.sum_invoice_line_reporting_total, invoices.sum_invoice_line_reporting_total_on_contract]
    listen:
      Commodity: commodities.commodity_level_1
      Supplier Name: suppliers.name
      Invoice Date: invoices.invoice_date
      Chart of Account: account_types.name
      Account Segment 1 Name: accounts.segment_1_name
    row: 0
    col: 12
    width: 6
    height: 4
  - title: Top 10 Off Contract Spend by Commodity
    name: Top 10 Off Contract Spend by Commodity
    model: coupa_analytics
    explore: invoices
    type: looker_column
    fields: [invoices.sum_invoice_line_reporting_total, invoices.sum_invoice_reporting_savings_amount,
      invoices.sum_invoice_line_reporting_total_off_contract, invoices.sum_invoice_line_reporting_total_on_contract,
      commodities.commodity_level_1]
    filters:
      invoices.status: approved
    sorts: [invoices.sum_invoice_line_reporting_total_off_contract desc]
    limit: 10
    total: true
    dynamic_fields: [{table_calculation: total, label: "% Total", expression: "${invoices.sum_invoice_line_reporting_total}\
          \ / \n${invoices.sum_invoice_line_reporting_total:total}", value_format: !!null '',
        value_format_name: percent_0, _kind_hint: measure, _type_hint: number}, {
        table_calculation: savings, label: Savings %, expression: "${invoices.sum_invoice_reporting_savings_amount}\
          \ /\n(${invoices.sum_invoice_line_reporting_total}\n+ ${invoices.sum_invoice_reporting_savings_amount})",
        value_format: !!null '', value_format_name: percent_0, _kind_hint: measure,
        _type_hint: number}]

    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: invoices.sum_invoice_line_reporting_total_off_contract,
            id: invoices.sum_invoice_line_reporting_total_off_contract, name: Invoice
              Line Reporting Total Off Contract}, {axisId: invoices.sum_invoice_line_reporting_total_on_contract,
            id: invoices.sum_invoice_line_reporting_total_on_contract, name: Invoice
              Line Reporting Total On Contract}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear},
      {label: !!null '', orientation: right, series: [{axisId: total, id: total, name: "%\
              \ Total"}, {axisId: savings, id: savings, name: Savings %}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_label: Commodity
    series_types:
      total: scatter
      savings: scatter
    series_colors:
      total: "#F27921"
      savings: "#157A1D"
      invoices.sum_invoice_line_reporting_total_off_contract: "#1867CD"
      invoices.sum_invoice_line_reporting_total_on_contract: "#268ECD"
    series_labels:
      invoices.sum_invoice_line_reporting_total_off_contract: Off Contract
      invoices.sum_invoice_line_reporting_total_on_contract: On Contract
    defaults_version: 1
    hidden_fields: [invoices.sum_invoice_line_reporting_total, invoices.sum_invoice_reporting_savings_amount]
    listen:
      Commodity: commodities.commodity_level_1
      Supplier Name: suppliers.name
      Invoice Date: invoices.invoice_date
      Chart of Account: account_types.name
      Account Segment 1 Name: accounts.segment_1_name
    row: 4
    col: 12
    width: 12
    height: 9
  - title: Top Suppliers by Commodity
    name: Top Suppliers by Commodity
    model: coupa_analytics
    explore: invoices
    type: looker_grid
    fields: [commodities.commodity_level_1, invoices.sum_invoice_line_reporting_total,
      invoices.count_invoice_header_id, invoices.sum_invoice_reporting_savings_amount,
      invoices.sum_invoice_line_reporting_total_on_contract, suppliers.name]
    filters:
      invoices.status: approved
    sorts: [invoices.sum_invoice_line_reporting_total desc]
    limit: 500
    dynamic_fields: [{table_calculation: savings, label: Savings %, expression: "${invoices.sum_invoice_reporting_savings_amount}\n\
          /\n(\n  ${invoices.sum_invoice_reporting_savings_amount}\n  + ${invoices.sum_invoice_line_reporting_total}\n\
          )", value_format: !!null '', value_format_name: percent_0, _kind_hint: measure,
        _type_hint: number}, {table_calculation: on_contract, label: On COntract %,
        expression: "${invoices.sum_invoice_line_reporting_total_on_contract}\n/\n\
          ${invoices.sum_invoice_line_reporting_total}", value_format: !!null '',
        value_format_name: percent_0, _kind_hint: measure, _type_hint: number}]

    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_labels:
      suppliers.name: Supplier
      commodities.commodity_level_1: Commodity
      invoices.sum_invoice_line_reporting_total: Spend Amount
      invoices.count_invoice_header_id: Number of Invoices
    series_column_widths:
      invoices.sum_invoice_line_reporting_total: 250
      invoices.count_invoice_header_id: 200
      savings: 100
      on_contract: 130
    series_cell_visualizations:
      invoices.sum_invoice_line_reporting_total:
        is_active: true
      invoices.count_invoice_header_id:
        is_active: true
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    hidden_fields: [invoices.sum_invoice_reporting_savings_amount, invoices.sum_invoice_line_reporting_total_on_contract]
    listen:
      Commodity: commodities.commodity_level_1
      Supplier Name: suppliers.name
      Invoice Date: invoices.invoice_date
      Chart of Account: account_types.name
      Account Segment 1 Name: accounts.segment_1_name
    row: 22
    col: 0
    width: 24
    height: 10
  - title: Savings Amount
    name: Savings Amount
    model: coupa_analytics
    explore: invoices
    type: single_value
    fields: [invoices.sum_invoice_reporting_savings_amount]
    filters:
      invoices.status: approved
      invoices.invoice_reporting_savings_amount: ">=0"
    limit: 500

    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    value_format: '#,##0, "K"'
    defaults_version: 1
    listen:
      Commodity: commodities.commodity_level_1
      Supplier Name: suppliers.name
      Invoice Date: invoices.invoice_date
      Chart of Account: account_types.name
      Account Segment 1 Name: accounts.segment_1_name
    row: 0
    col: 6
    width: 6
    height: 2
  - title: Savings %
    name: Savings %
    model: coupa_analytics
    explore: invoices
    type: single_value
    fields: [invoices.sum_invoice_line_reporting_total, savings_amount]
    filters:
      invoices.status: approved
      invoices.invoice_reporting_savings_amount: ">=0"
    limit: 500
    dynamic_fields: [{table_calculation: savings, label: Savings %, expression: "${savings_amount}/\
          \ \n(${invoices.sum_invoice_line_reporting_total}\n+ ${savings_amount})\n",
        value_format: !!null '', value_format_name: percent_0, _kind_hint: measure,
        _type_hint: number}, {measure: savings_amount, based_on: invoices.sum_invoice_reporting_savings_amount,
        type: count_distinct, label: Savings Amount, value_format: !!null '', value_format_name: !!null '',
        _kind_hint: measure, _type_hint: number, filter_expression: "if(\n  is_null(${invoices.invoice_reporting_savings_amount})\n\
          \  , 0\n  , ${invoices.invoice_reporting_savings_amount}\n) > 0"}]

    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    value_format: ''
    defaults_version: 1
    hidden_fields: [invoices.sum_invoice_line_reporting_total, savings_amount]
    listen:
      Commodity: commodities.commodity_level_1
      Supplier Name: suppliers.name
      Invoice Date: invoices.invoice_date
      Chart of Account: account_types.name
      Account Segment 1 Name: accounts.segment_1_name
    row: 2
    col: 6
    width: 6
    height: 2
  - title: Top 20 Commodity Spend Share vs. Savings Rate
    name: Top 20 Commodity Spend Share vs Savings Rate
    model: coupa_analytics
    explore: invoices
    type: looker_column
    fields: [invoices.sum_invoice_line_reporting_total, invoices.sum_invoice_reporting_savings_amount,
      invoices.sum_invoice_line_reporting_total_off_contract, invoices.sum_invoice_line_reporting_total_on_contract,
      commodities.commodity_level_1]
    filters:
      invoices.status: approved
    sorts: [invoices.sum_invoice_line_reporting_total desc]
    limit: 20
    total: true
    dynamic_fields: [{table_calculation: total, label: "% Total", expression: "${invoices.sum_invoice_line_reporting_total}\
          \ / \n${invoices.sum_invoice_line_reporting_total:total}", value_format: !!null '',
        value_format_name: percent_0, _kind_hint: measure, _type_hint: number}, {
        table_calculation: savings, label: Savings %, expression: "${invoices.sum_invoice_reporting_savings_amount}\
          \ /\n(${invoices.sum_invoice_line_reporting_total}\n+ ${invoices.sum_invoice_reporting_savings_amount})",
        value_format: !!null '', value_format_name: percent_0, _kind_hint: measure,
        _type_hint: number}]

    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: invoices.sum_invoice_line_reporting_total_off_contract,
            id: invoices.sum_invoice_line_reporting_total_off_contract, name: Invoice
              Line Reporting Total Off Contract}, {axisId: invoices.sum_invoice_line_reporting_total_on_contract,
            id: invoices.sum_invoice_line_reporting_total_on_contract, name: Invoice
              Line Reporting Total On Contract}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear},
      {label: !!null '', orientation: right, series: [{axisId: total, id: total, name: "%\
              \ Total"}, {axisId: savings, id: savings, name: Savings %}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_label: Commodity
    series_types:
      total: scatter
      savings: scatter
    series_colors:
      total: "#F27921"
      savings: "#157A1D"
      invoices.sum_invoice_line_reporting_total_off_contract: "#1867CD"
      invoices.sum_invoice_line_reporting_total_on_contract: "#268ECD"
    series_labels:
      invoices.sum_invoice_line_reporting_total_off_contract: Off Contract
      invoices.sum_invoice_line_reporting_total_on_contract: On Contract
      invoices.sum_invoice_line_reporting_total: Spend Amount
    defaults_version: 1
    hidden_fields: [invoices.sum_invoice_reporting_savings_amount, invoices.sum_invoice_line_reporting_total]
    listen:
      Commodity: commodities.commodity_level_1
      Supplier Name: suppliers.name
      Invoice Date: invoices.invoice_date
      Chart of Account: account_types.name
      Account Segment 1 Name: accounts.segment_1_name
    row: 13
    col: 0
    width: 24
    height: 9
  filters:
  - name: Invoice Date
    title: Invoice Date
    type: field_filter
    default_value: 12 months
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: coupa_analytics
    explore: invoices
    listens_to_filters: []
    field: invoices.invoice_date
  - name: Supplier Name
    title: Supplier Name
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
      options: []
    model: coupa_analytics
    explore: invoices
    listens_to_filters: []
    field: suppliers.name
  - name: Commodity
    title: Commodity
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
      options: []
    model: coupa_analytics
    explore: invoices
    listens_to_filters: []
    field: commodities.commodity_level_1
  - name: Chart of Account
    title: Chart of Account
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
      options: []
    model: coupa_analytics
    explore: invoices
    listens_to_filters: []
    field: account_types.name
  - name: Account Segment 1 Name
    title: Account Segment 1 Name
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
      options: []
    model: coupa_analytics
    explore: invoices
    listens_to_filters: []
    field: accounts.segment_1_name
