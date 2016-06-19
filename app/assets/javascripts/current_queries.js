function getCurrentQueries(){
  $.ajax({
    url: location.href,
    dataType: "JSON",
    error: function(msg){
      //alert(msg.statusText);
      console.log(msg)
      return msg;
    },
    success: function(data){
      updateCurrentQueries(data)
      setTimeout(getCurrentQueries, 1000)
    }
  });
};

function updateCurrentQueries(data) {
  window.templateRow = $('#table-row')
  $('.table-body > .table-row').remove()

  $.each(data, function(i, obj) {
    // copy data
    var $row;
    i==0 ? $row = window.templateRow : $row = window.templateRow.clone()
    $row.find('*[data-pid]').html(obj.pid);
    $row.find('*[data-dbname]').html(obj.database.name);
    $row.find('*[data-starttime]').html(obj.start_time);
    $row.find('*[data-query]').html(obj.query);
    $row.find('*[data-state]').html(obj.state);
    $('.table-body').append($row);

  });
};

getCurrentQueries();