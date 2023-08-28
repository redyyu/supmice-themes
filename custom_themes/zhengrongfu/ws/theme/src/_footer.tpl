<footer class="footer">
  <div class="container">
    <div class="pt-4 pb-2">
      <img class="logo"
           ng-if="meta.logo.src || site_meta.logo"
           ng-src="{{meta.logo.src || site_meta.logo}}" />
      <div ng-if="!meta.logo.src && !site_meta.logo">
        {% include 'inc/logo.inc' %}
      </div>
    </div>
    <div class="certificate">
      <p sup-bind-html="site_meta.copyright"></p>
      <p sup-bind-html="site_meta.license"></p>
    </div>
  </div>
</footer>
