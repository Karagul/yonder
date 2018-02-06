var rangeInputBinding = new Shiny.InputBinding();

$.extend(rangeInputBinding, {
  find: function(scope) {
    return $(scope).find(".dull-range-input[id]");
  },
  initialize: (el) => {
    let $el = $(el);
    let $input = $el.find("input[type='text']");

    $input.ionRangeSlider();

    let bgclasses = $el.attr("class")
        .split(/\s+/)
        .filter(c => /^bg-[a-z-]+|(lighten|darken)-[1234]/.test(c))
        .join(" ");

    if (bgclasses) {
      $el
        .find(".irs-slider,.irs-bar,.irs-bar-edge,.irs-to,.irs-from,.irs-single,.irs-slider")
        .addClass(bgclasses);
    }
  },
  getId: function(el) {
    return el.id;
  },
  getValue: function(el) {
    var $input = $("input[type='text']", el);
    var data = $input.data("ionRangeSlider");

    if ($input.data("type") == "double") {
      return {
        from: data.result.from,
        to: data.result.to
      };
    } else if ($input.data("type") == "single") {
      if (data.result.from_value !== null) {
        return data.result.from_value.replace("&#44;", ",");
      } else {
        return data.result.from;
      }
    }
  },
  getState: function(el, data) {
    return { value: this.getValue(el) };
  },
  subscribe: function(el, callback) {
    $(el).on("change.rangeInputBinding", function(e) {
      callback();
    });
  },
  unsubscribe: function(el) {
    $(el).off(".rangeInputBinding");
  },
  dispose: function(el) {
    var $input = $("input[type='text']", el);

    $input.data("ionRangeSlider").destroy();
  }
});

Shiny.inputBindings.register(rangeInputBinding, "dull.rangeInput");
