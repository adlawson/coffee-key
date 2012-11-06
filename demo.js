(function($, key) {

    $.fn.demo = function () {

        var alert = $(this);

        $(window).on('keyup', function(event) {
            event.preventDefault();

            var pressed = key.get(event.which);
            alert.text(pressed ? pressed.code : 'Undefined');
        });

    };

})(jQuery, window.key);
