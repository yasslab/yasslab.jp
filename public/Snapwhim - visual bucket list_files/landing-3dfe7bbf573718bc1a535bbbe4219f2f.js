(function() {
  var $;

  $ = jQuery;

  $(function() {
    var match, props;
    match = window.location.search.match(/welcome=([^&_]+)_([^&]+)/);
    props = match ? {
      utm_source: match[1],
      name: match[2]
    } : {};
    return typeof analytics !== "undefined" && analytics !== null ? analytics.track("Landing Page Loaded", props) : void 0;
  });

}).call(this);
