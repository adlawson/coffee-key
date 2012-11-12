(function($, key) {

    $.fn.demo = function () {
        var settings = {
            input: '[data-role="input"]',
            output: '[data-role="output"]',
            overflow: '[data-role="overflow"]',
            placeholder: '[data-role="placeholder"]'
        };

        var control = $(this);
        var input = control.find(settings.input).eq(0);
        var output = control.find(settings.output).eq(0);
        var overflow = control.find(settings.overflow).eq(0);
        var placeholder = control.find(settings.placeholder).eq(0);

        var feedback = function(event) {
            event.preventDefault();

            var pressed = key.get(event.which);

            if (key.code.special.esc === pressed) {
                overflow.html('');
                output.html(placeholder);
            } else {
                var href = 'https://github.com/adlawson/key/issues/new?';
                    href += 'title=Key%20' + event.which + '%20wasn%27t%20recognised';
                placeholder.remove();
                overflow.html($.trim(output.html() + "\n" + overflow.html()));
                output.html(pressed ? JSON.stringify(pressed) : 'Key undefined. <a href="' + href + '">Submit an issue!</a>');
            }
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

    $.fn.expander = function () {
        var settings = {
            classOn: 'is-expanded',
            classOff: 'is-not-expanded',
            overflow: '[data-role="overflow"]'
        };

        var modified = false;
        var control = $(this);
        var overflow = control.find(settings.overflow).eq(0);

        $(window).on('keydown', function(event) {
            if (key.is(key.code.special.ctrl, event.which)) {
                modified = true;
            } else if (modified === true && key.is(key.code.arrow.down, event.which)) {
                event.preventDefault();
                control.addClass(settings.classOn);
                control.removeClass(settings.classOff);
            } else if (modified === true && key.is(key.code.arrow.up, event.which)) {
                event.preventDefault();
                control.removeClass(settings.classOn);
                control.addClass(settings.classOff);
            }
        });

        $(window).on('keyup', function(event) {
            if (key.is(key.code.special.ctrl, event.which)) {
                modified = false;
            }
        });

    };

})(jQuery, key);