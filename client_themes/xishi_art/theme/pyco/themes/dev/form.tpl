<sup-set ng-model="g.ver"         value="{{theme_meta.version}}"></sup-set><sup-set ng-model="g.opts"         value="{{theme_meta.options}}"></sup-set><sup-set ng-model="g.default_logo"         value="{{theme_url+'/styles/logo.png'}}"></sup-set><sup-set ng-model="g.default_img"         value="{{theme_url+'/styles/default_img.png'}}"></sup-set><sup-set ng-model="g.default_cover"         value="{{theme_url+'/styles/default_cover.png'}}"></sup-set><sup-set ng-model="g.default_qr"         value="{{theme_url+'/styles/qr.png'}}"></sup-set><sup-set ng-model="g.img_holder"         object="{'px': theme_url+'/styles/trans.png',                  '16x10': theme_url+'/styles/trans_16x10.png',                  '18x10': theme_url+'/styles/trans_18x10.png',                  '20x10': theme_url+'/styles/trans_20x10.png',                  '30x10': theme_url+'/styles/trans_30x10.png'}"></sup-set>
<!-- bootstrap -->
<link ng-href="{{theme_url}}/libs/bootstrap/bootstrap.min.css?{{g.ver}}"
      rel="stylesheet">
<!-- custom -->
<link ng-href="{{theme_url}}/styles/sup.css?{{g.ver}}" rel="stylesheet">
<link ng-href="{{theme_url}}/styles/style.css?{{g.ver}}" rel="stylesheet">

<!-- custom styles -->
<style ng-bind-html="theme_meta.styles"></style>

<header ng-class="{'free':meta.hero.src}">

  <div sup-widget-media

       ng-model="meta.hero">

    <img ng-src="{{meta.hero.src || site_meta.logo || g.default_logo}}" />

  </div>

</header>

<div class="container">
  <div class="row">
    <div class="col-md-8 col-md-offset-2">
      <h1 class="text-center">
        <span sup-widget-text
              ng-model="meta.title"
              default="{{_('Title')}}"></span>
      </h1>
      <article sup-wx-broadcast class="content">
        <div style="text-align: justify;">
          <div sup-angular-wysiwyg
               ng-model="content"
               default="{{_('$_CONTENT')}}"></div>
        </div>
      </article>
      <hr>
      <aside sup-widget-form
             ng-model="meta.form">

        <div ng-if="meta.form.type == 'custom'"
             ng-bind-html="meta.form.custom|trustHtml">
        </div>
        <div ng-if="meta.form.type != 'custom'">
          <form name="skipper_form"
                type="{{meta.form.type}}"
                ng-init="form_status = ['', 'required', 'disabled']">
            <div ng-repeat="field in meta.form.fields">
              <div class="form-group"
                   ng-if="field.type == 'text' || field.type == 'date'">
                <label>{{field.label}}</label>
                <input type="{{field.type}}"
                       field="{{field.type}}"
                       name="{{field.name}}"
                       label="{{field.label}}"
                       class="form-control"
                       placeholder="{{field.placeholder}}"
                       {{form_status[field.status]}}/>
                <div class="tip">{{field.tip}}</div>
              </div>
          
              <div class="form-group"
                   ng-if="field.type == 'textarea'">
                <label>{{field.label}}</label>
                <textarea field="{{field.type}}"
                          name="{{field.name}}"
                          label="{{field.label}}"
                          class="form-control"
                          placeholder="{{field.placeholder}}"
                          {{form_status[field.status]}}></textarea>
                <div class="tip">{{field.tip}}</div>
              </div>
          
              <div class="form-group"
                   ng-if="field.type == 'selector' || field.type == 'multi-selector'">
                <label>{{field.label}}</label>
                <select field="{{field.type}}"
                        name="{{field.name}}"
                        label="{{field.label}}"
                        class="form-control"
                        placeholder="{{field.placeholder}}"
                        {{form_status[field.status]}}/>
                  <option value="{{item.key}}"
                          ng-repeat="item in filed.value">{{item.text}}</option>
                </select>
                <div class="tip">{{field.tip}}</div>
              </div>
          
              <div field="{{field.type}}"
                   name="{{field.name}}"
                   label="{{field.label}}"
                   class="checkbox"
                   ng-if="field.type == 'checkbox' || field.type == 'radio'">
                <label ng-repeat="item in filed.value">
                  <input type="{{field.type}}"}}>&nbsp;{{item.text}}
                </label>
                <div class="tip">{{field.tip}}</div>
              </div>
          
              <p ng-if="field.type == 'content'">{{field.value}}</p>
          
            </div>
          
            <div class="text-center">
              <button type="submit"
                      class="btn btn-primary btn-xl">
                {{_('Submit')}}
              </button>
            </div>
          
          </form>
        </div>
        <div ng-if="!meta.form || !meta.form.type">
          <p class="text-center">
            {{_('Please Click here to add a form.')}}
          </p>
        </div>

      </aside>
    </div>
  </div>
</div>

<footer>

  <p>

    <span ng-bind-html="site_meta.copyright"></span>

    <span ng-bind-html="site_meta.license"></span>

  </p>

  <hr>

  <p class="count">

    {{site_meta.visit.page}}

  </p>

<footer>
