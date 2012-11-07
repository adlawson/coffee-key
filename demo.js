(function($, key) {

    $.fn.demo = function () {


        settings = {
            alert: '[data-role="alert"] span',
            debug: '[data-role="debug"]',
            input: '[data-role="input"]'
        };


        var container = $(this);
        var alert = container.find(settings.alert).eq(0);
        var debug = container.find(settings.debug).eq(0);
        var input = container.find(settings.input).eq(0);


        // Update feedback info
        var feedback = function(event) {
            event.preventDefault();

            var pressed = key.get(event.which);

            alert.html(pressed ? '"' + pressed.name + '"' : '<em>undefined</em>');
            debug.html(pressed ? JSON.stringify(pressed) : '<a href="https://github.com/adlawson/key/issues">Send a pull request</a> to add this key to the library');
        };


        // Listen to most keys on keyup
        $(input).on('keyup', feedback);

        // Some keys should be listened to on keydown
        $(input).on('keydown', function(event) {
            if (key.is(key.code.special.tab, event.which)) {
                feedback(event);
            }
        });

    };

})(jQuery, window.key);
