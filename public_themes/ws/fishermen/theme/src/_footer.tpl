<!-- Footer -->
<footer class="footer">
  <div class="container">
    <div class="shareto"
         ng-hide="socials|is_empty">
      <div ng-repeat="social in socials"
           sup-bind-html="social.code">
      </div>
    </div>
    <div class="copyright">
      <span sup-bind-html="site_meta.copyright"></span>
		  <span sup-bind-html="site_meta.license"></span>
    </div>
  </div>
</footer>
<!-- #Footer -->
