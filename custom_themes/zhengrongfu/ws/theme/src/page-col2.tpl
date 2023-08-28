{% import 'g.tpl' %}
{% include '_css.tpl' %}

<section id="{{meta.slug}}"
         class="segment {{meta.bg.class}}"
         style="{{meta.bg.style}}">
  <div sup-widget-bg
       presets="[
          {'key': 'parallax-bg', 'label': _('Parallax')},
          {'key': 'glassy', 'label': _('Glassy')},
       ]"
       ng-model="meta.bg"></div>

  <div>
    <div class="container">
      <header class="divide">
        <h2>
          <span sup-widget-text
                default="{{_('Title')}}"
                ng-model="meta.title"></span>
        </h2>
      </header>
      <div class="row">
        <div class="col-md-6">
          <div class="content px-4">
            <div sup-angular-wysiwyg
                 default="{{_('$_CONTENT')}}"
                 ng-model="content"></div>
          </div>
        </div>
        <div class="col-md-6">
          <div class="row"
               sup-widget-series
               default="{{[
                  {
                    'title': _('WeChat Buzz'),
                    'src': theme_url+'/assets/qrcode.png'
                  }
               ]}}"
               allow-fields="link"
               ng-model="meta.qrcodes">

            <div class="col-sm-6"
                 ng-repeat="item in meta.qrcodes">
              <div class="text-center {{item.class}}"
                   series-item>
                <figure class="m-auto px-5">
                  <img ng-src="{{item.src}}"
                       alt="{{item.title}}"/>
                </figure>
                <div class="p-2 text-primary">
                  <h5 class="caption">{{item.title}}</h5>
                </div>
              </div>
            </div>

            <div class="col-sm-6">
              <div class="text-center {{item.class}}"
                   series-item-create>
                <figure class="m-auto px-5">
                  <img ng-src="{{theme_url+'/assets/add_qr.png'}}"
                       alt="{{item.title}}"/>
                </figure>
                <div class="p-2 text-primary">
                  <h5 class="caption">
                    {{_('Add New QR')}}
                  </h5>
                </div>
              </div>
            </div>

          </div>
          <hr>

          <p class="caption">
            <span sup-widget-text
                  default="{{_('Notice Text is here.')}}"
                  ng-model="meta.notice"></span>
          </p>

          <div class="row"
               sup-widget-series
               default="{{[
                  {
                    'title': _('Contact Info.'),
                    'src': theme_url+'/assets/ico_tel.png'
                  }
               ]}}"
               allow-fields="link, !caption"
               ng-model="meta.contacts">

            <div class="col-sm-4 tags"
                 ng-repeat="item in meta.contacts">
              <a class="btn icon-btn text-truncate"
                 href="#"
                 series-item
                 sup-ico-inset="bottom">
                <img ng-src="{{item.src}}"
                     alt="{{item.title}}"/>
                <span class="tag">{{item.title}}</span>
              </a>
            </div>

            <div class="col-sm-4 tags">
              <a class="btn icon-btn text-truncate"
                 href="#"
                 series-item-create
                 sup-ico-inset="bottom">
                <img ng-src="{{theme_url+'/assets/add_contact.png'}}"
                     alt="{{item.title}}"/>
                <span class="tag">{{_('Add New Contact')}}</span>
              </a>
            </div>

          </div>
        </div>
      </div>
    </div>
  </div>
</section>
