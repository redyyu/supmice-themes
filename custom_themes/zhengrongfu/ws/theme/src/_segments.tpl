<!-- page -->
<sup-template id="page">
<div>
  <div class="container">
    <header>
      <h2>{{page.title || _('Title')}}</h2>
    </header>
    <div class="m-auto text-center">
      <div class="content"
           sup-bind-html="page.content"></div>
    </div>
  </div>
</div>
</sup-template>


<!-- articles -->
<sup-template id="articles">
  <div class="container-fluid"
       sup-query='post'
       perpage='1'
       ng-model="query.posts">
    <div class="carousel text-carousel slide"
         ng-if="query.posts.contents.length">
      <ol class="carousel-indicators">
        <li class="{{$first ? 'active' : ''}}"
            ng-repeat="x in [1,2,3]"></li>
        <li class="more">
          <a href="#"
             aria-label="_('More')"></a>
        </li>
      </ol>
      <div class="carousel-inner">
        <div class="carousel-item active"
             ng-init="post = query.posts.contents[0]">
          <header class="divide">
            <h2 class="text-truncate">{{post.title || _('Title')}}</h2>
          </header>
          <div class="container">
            <div class="row">
              <div class="col-md-3 offset-md-2 pb-2">
                <img class="thumbnail"
                     src="{{g.trans_4x7}}"
                     style="{{post.featured_img.src|bg_img}}"
                     alt="{{post.title}}"/>
              </div>
              <div class="col-md-5 pb-2 text-center text-md-left">
                <p class="excerpt text-clamp-3">{{post.description}}</p>
                <a class="mt-4 btn btn-ancient-primary"
                   href="#">{{_('Read Detail')}}</a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <p class="text-center text-muted"
       ng-if="!query.posts.contents.length">
      {{_('There is no post yet.')}}
    </p>
  </div>
</sup-template>


<!-- products -->
<sup-template id="products">
  <div>
    <div class="container">
      <div class="row">
        <div class="col-lg-3 col-md-6 mb-5"
             ng-repeat="item in page.series">
          <div class="text-center {{item.class}}">
            <figure class="m-auto">
              <img class="thumbnail minify"
                   ng-src="{{g.trans}}"
                   style="{{item.src|bg_img}}" />
            </figure>
            <div>
              <a class="btn btn-ancient-secondary"
                 href="#">{{_('View Detail')}}</a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</sup-template>


<!-- page story -->
<sup-template id="page-story">
  <div class="compact bg-glassy">
    <div class="container text-brighten">
      <header>
        <h2>{{page.title || _('Title')}}</h2>
        <h4 class="lead">{{page.description}}</h4>
      </header>
      <div class="row">
        <div class="col-md-6 frame d-flex align-items-center mb-5 mb-md-0">
          <div class="content"
               sup-bind-html="page.content">
          </div>
        </div>
        <div class="col-md-6 d-flex align-items-center">
          <figure>
            <img ng-src="{{page.featured_img.src}}"
                 alt="{{page.featured_img.title}}"
                 ng-if="page.featured_img.src"/>
            <img ng-src="{{g.default_img}}"
                 ng-if="!page.featured_img.src"/>
          </figure>
        </div>
      </div>
    </div>
  </div>
</sup-template>


<!-- page col2 -->
<sup-template id="page-col2">
  <div>
    <div class="container">
      <header class="divide">
        <h2 sup-bind-html="page.title"></h2>
      </header>
      <div class="row">
        <div class="col-md-6">
          <div class="content px-4"
               sup-bind-html="page.content"></div>
        </div>
        <div class="col-md-6">
          <div class="row">
            <div class="col-sm-6"
                 ng-repeat="item in page.qrcodes">
              <div class="text-center {{item.class}}">
                <figure class="m-auto">
                  <img ng-src="{{item.src}}"
                       alt="{{item.title}}"/>
                </figure>
                <div class="p-2 text-primary">
                  <h5 class="caption">{{item.title}}</h5>
                </div>
              </div>
            </div>
          </div>
          <hr>
          <p class="caption"
             sup-bind-html="page.notice"></p>
          <div class="row">
            <div class="col-sm-6"
                 ng-repeat="item in page.contacts">
              <a class="btn icon-btn text-truncate"
                 href="#">
                <img ng-src="{{item.src}}"
                     alt="{{item.title}}"/>
                <b>{{item.title}}</b>
              </a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</sup-template>
