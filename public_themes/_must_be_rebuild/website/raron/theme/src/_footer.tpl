<div class="footer">
  <div class="wrap">
    <div class="footer-left">
      <div class="copy">
      <p>
        <span ng-bind="site_meta.copyright"></span>
        <span ng-bind="site_meta.license"></span>
      </p>
      </div>
    </div>
    <div class="social_icons social">
      <ul>
        <li ng-repeat="s in socials" class="{{s.code}}"><a ng-href="{{s.url}}"><span> </span></a></li>
      </ul>
    </div>
    <div class="clear"> </div>
  </div>
  <a ng-href="#" id="toTop" style="display: block;"><span id="toTopHover" style="opacity: 1;"></span></a>
</div>