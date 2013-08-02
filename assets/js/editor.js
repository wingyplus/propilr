(function($) {
  var TAB = 9;
  $('#code').keydown(function(event) {
    if (event.keyCode == TAB) {
      event.preventDefault();
      var $this = $(this);
      var end = $this.selectionEnd;
      var value = $this.val();

      $this.val(value.substring(end) + '\t');
    }
  });
})(jQuery);
