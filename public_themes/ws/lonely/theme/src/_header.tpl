<!-- Navigation -->
<div id="navigation">
  <nav class="navbar navbar-custom" role="navigation">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <!-- Brand and toggle get grouped for better mobile display -->
          <div class="navbar-header">
            <div class="navbar-brand">{{site_meta.title}}</div>
            <button type="button"
                    class="navbar-toggle"
                    data-toggle="collapse"
                    data-target="#menu">
              <i class="fa fa-bars"></i>
            </button>
          </div>

          <div class="collapse navbar-collapse" id="menu">
            <ul class="nav navbar-nav">
              <li ng-repeat="menu in menu.primary">
                <a href="#"
                   class="{{menu.class}}">
                  {{menu.name}}
                </a>
              </li>
            </ul>
          </div>
          <!-- /.Navbar-collapse -->
        </div>
      </div>
    </div>
    <!-- /.container -->
  </nav>
</div>
<!-- /Navigation -->
