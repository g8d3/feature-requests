# This is a manifest file that'll be compiled into application.js, which will include all the files
# listed below.
#
# Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
# or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
#
# It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
# compiled file. JavaScript code in this file should be added after the last require_* statement.
#
# Read Sprockets README (https:#github.com/rails/sprockets#sprockets-directives) for details
# about supported directives.
#
#= require jquery
#= require jquery_ujs
#= require turbolinks

# require bootstrap

# from jquery-datatables-rails
# require dataTables/jquery.dataTables
# require dataTables/bootstrap/3/jquery.dataTables.bootstrap

# from rails-assets
# require datatables
# require datatables-bootstrap3-plugin
# require datatables-responsive

# from bower rails
#= require bootstrap/dist/js/bootstrap
#= require datatables.net/js/jquery.dataTables
#= require datatables.net-bs/js/dataTables.bootstrap
#= require datatables.net-responsive/js/dataTables.responsive
#= require datatables.net-responsive-bs/js/responsive.bootstrap

#= require sync
#= require jquery_nested_form
#= require_tree .

$(document).on 'turbolinks:load', ->


  # $('table').dataTable()
  window.table = $('table.dt').DataTable
    order: []
    columnDefs: [
      orderable: false, targets: [-1, -2]
    ]

  # Apply the search
  ths = 'table.dt thead tr.filters th'
  # if input is with header text
  # $("#{ths} input").on 'click', (e) -> e.stopPropagation()
  $("#{ths} input").on 'keyup change', ->
    window.column = table.column( $(this).parent().index()+':visible' )
    column.search(@value).draw()
