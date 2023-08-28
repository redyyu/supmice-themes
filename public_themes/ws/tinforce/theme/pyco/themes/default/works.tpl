<sup-set ng-model="g.default_img"
         value="{{theme_url+'/assets/default.jpg'}}"></sup-set>

<sup-set ng-model="g.add_img"
         value="{{theme_url+'/assets/add.png'}}"></sup-set>

<sup-set ng-model="g.trans"
         value="{{theme_url+'/assets/trans.png'}}"></sup-set>

<!-- webfonts -->
<link ng-href="{{res_url}}/font/lato/lato.css"
      rel="stylesheet"
      type="text/css">

<!-- bootstrap -->
<link ng-href="{{theme_url}}/assets/bootstrap.min.css"
      rel="stylesheet"
      type="text/css">

<!-- styles -->
<link ng-href="{{theme_url}}/assets/main.css"
      rel="stylesheet"
      type="text/css">

<!-- custom -->
<style ng-bind="theme_meta.styles"></style>

<header class="fixed-top">
  <nav class="navbar affix">
    <a class="navbar-brand"
       href="#">
      {{site_meta.title}}
    </a>
    <div class="d-flex flex-fill justify-content-end">
      <ul class="navbar-nav flex-row">
        <li class="nav-item">
          <a class="nav-link history-back"
             href="#">
            <svg width="24" height="24" viewBox="0 0 24 24"><path d="M0 0h24v24H0z" fill="none"/><path d="M20 11H7.83l5.59-5.59L12 4l-8 8 8 8 1.41-1.41L7.83 13H20v-2z"/></svg>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link"
             href="#">
            <svg width="24" height="24" viewBox="0 0 24 24"><path d="M4 11h5V5H4v6zm0 7h5v-6H4v6zm6 0h5v-6h-5v6zm6 0h5v-6h-5v6zm-6-7h5V5h-5v6zm6-6v6h5V5h-5z"/><path d="M0 0h24v24H0z" fill="none"/></svg>
          </a>
        </li>
      </ul>
    </div>
  </nav>
</header>

<div class="container mt-5 pt-5">
  <div class="row">
    <article class="col-md-6 mb-4 offset-md-1">
      <header>
        <h1 sup-widget-text
            ng-model="meta.title"
            default="{{_('Title')}}"></h1>
      </header>
      <div class="mb-2">
        <p class="caption"
           sup-widget-text
           ng-model="meta.description"
           default="{{_('Description text here.')}}">
          {{meta.description}}
        </p>
      </div>
      <hr>
      <div class="content mb-2"
           sup-angular-wysiwyg
           ng-model="content"
           default="{{_('$_CONTENT')}}"></div>
    </article>

    <aside class="col-md-4 mb-4">
      <figure sup-widget-media
              ng-model="meta.featured_img">
        <img class="w-100"
             ng-src="{{meta.featured_img.src || g.default_img}}"
             alt="{{meta.featured_img.title}}" />
      </figure>

      <div class="my-2">
        <div class="tags">
          <div class="d-inline"
               ng-repeat="tag in meta.tags">
            <span class="tag">{{tag|capitalize}}</span> {{$last ? '' : '/' }}
          </div>
        </div>
      </div>
      <hr>
      <div class="my-2"
           sup-widget-attrs
           ng-model="meta.task"
           structure="[{
            'label': _('Creator'),
            'key': 'creator',
            'value': _('No Body')
           },
           {
            'label': _('Time of Creation'),
            'key': 'creation',
            'value': _('Long Long Ago')
           },
           {
            'label': _('Task Status'),
            'key': 'status',
            'type': 'select',
            'value': _('In progress'),
            'options': [_('In progress'), _('Complete'), _('On the wings')]
           }]">
        <p class="caption">
          <b>{{_('Creator')}}</b>
          <span class="hl">&rang;</span>
          <span>{{meta.task.creator}}</span>
        </p>
        <p class="caption">
          <b>{{_('Time of Creation')}}</b>
          <span class="hl">&rang;</span>
          <span>{{meta.task.creation}}</span>
        </p>
        <p class="caption">
          <b>{{_('Task Status')}}</b>
          <span class="hl">&rang;</span>
          <span>{{ meta.task.status }}</span>
        </p>
      </div>
      <hr>
      <div class="my-2">
        <p class="caption text-break"
           sup-widget-link
           ng-model="meta.referrer"
           allow-fields="name">
          <a href="#">
            {{ meta.referrer.name || meta.referrer.link || _('Link here')}}
          </a>
        </p>
      </div>

      <hr>

      <div class="row media-gallery"
           sup-widget-series
           allow-fields="!caption"
           ng-model="meta.series">
        <figure class="col-4"
                ng-repeat="item in meta.series">
          <div series-item>
            <a class="open-image"
               href="#">
              <div class="flip">
                <svg width="24" height="24" viewBox="0 0 24 24"><path d="M15.5 14h-.79l-.28-.27C15.41 12.59 16 11.11 16 9.5 16 5.91 13.09 3 9.5 3S3 5.91 3 9.5 5.91 16 9.5 16c1.61 0 3.09-.59 4.23-1.57l.27.28v.79l5 4.99L20.49 19l-4.99-5zm-6 0C7.01 14 5 11.99 5 9.5S7.01 5 9.5 5 14 7.01 14 9.5 11.99 14 9.5 14z"/><path fill="none" d="M0 0h24v24H0V0z"/><path d="M12 10h-2v2H9v-2H7V9h2V7h1v2h2v1z"/></svg>
              </div>
              <img class="{{item.class}}"
                   ng-src="{{g.trans}}"
                   style="{{item.src|thumbnail|bg_img}}" />
            </a>
          </div>
        </figure>
        <figure class="col-4">
          <div series-item-create>
            <a class="open-image"
               href="#">
              <div class="flip">
                <svg width="24" height="24" viewBox="0 0 24 24"><path d="M15.5 14h-.79l-.28-.27C15.41 12.59 16 11.11 16 9.5 16 5.91 13.09 3 9.5 3S3 5.91 3 9.5 5.91 16 9.5 16c1.61 0 3.09-.59 4.23-1.57l.27.28v.79l5 4.99L20.49 19l-4.99-5zm-6 0C7.01 14 5 11.99 5 9.5S7.01 5 9.5 5 14 7.01 14 9.5 11.99 14 9.5 14z"/><path fill="none" d="M0 0h24v24H0V0z"/><path d="M12 10h-2v2H9v-2H7V9h2V7h1v2h2v1z"/></svg>
              </div>
              <img ng-src="{{g.add_img}}"
                   alt="{{_('Add')}}" />
            </a>
          </div>
        </figure>
      </div>

    </aside>
  </div>
</div>

<!-- Footer -->
<footer class="footer container">
  <hr>
  <div class="text-center">
    <span sup-bind-html="site_meta.copyright"></span>
    <span sup-bind-html="site_meta.license"></span>
  </div>
</footer>
