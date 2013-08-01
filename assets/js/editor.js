(function($) {
  $('#code').keydown(function(event) {
    if (event.keyCode == 9) {
      event.preventDefault();
      var $this = $(this);
      var end = $this.selectionEnd;
      var value = $this.val();

      $this.val(value.substring(end) + '\t');
    }
  });
})(jQuery);
