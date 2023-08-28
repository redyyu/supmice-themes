<sup-set ng-model="g.default_img"         value="{{theme_url+'/styles/default_img.jpg'}}"></sup-set><sup-set ng-model="g.opts" object="theme_meta.options"></sup-set>
<!-- bootstrap -->
<link ng-href="{{theme_url}}/styles/bootstrap.min.css" rel="stylesheet">
<!-- plugin -->
<link ng-href="{{theme_url}}/styles/animate.min.css" rel="stylesheet">
<link ng-href="{{theme_url}}/styles/magnific-popup.css" rel="stylesheet">
<!-- custom -->
<link ng-href="{{theme_url}}/styles/style.css" rel="stylesheet">
<link ng-href="{{theme_url}}/styles/editor.css" rel="stylesheet">

<!-- custom styles -->
<style ng-bind-html="theme_meta.styles"></style>

<nav id="primary-nav"

     class="navbar navbar-default navbar-fixed-top"

     ng-class="{'affix': meta.template!='index'}">

  <div class="container-fluid">

  <!-- Brand and toggle get grouped for better mobile display -->

    <div class="navbar-header">

      <button type="button"

              class="navbar-toggle collapsed"

              data-toggle="collapse"

              data-target="#primary-navbar">

        <span class="sr-only">{{_('Toggle navigation')}}</span>

        <span class="icon-bar"></span>

        <span class="icon-bar"></span>

        <span class="icon-bar"></span>

      </button>

      <a class="navbar-brand"

         href="#">

           <img class="logo"

                ng-src="{{site_meta.logo}}"

                ng-if="site_meta.logo"/>

           {{site_meta.logo?'':site_meta.title}}

      </a>

    </div>



    <div class="collapse navbar-collapse" id="primary-navbar">

      <ul class="nav navbar-nav navbar-right">

        <li ng-repeat="menu in menu.primary">

          <a href="#"

             class="{{menu.class}}"

             target="{{menu.target}}">{{menu.title}}</a>

        </li>

      </ul>

    </div>

    <!-- /.navbar-collapse -->

  </div>

  <!-- /.container-fluid -->

</nav>

<section class="ribbon {{meta.hero.class}}"
         style="{{meta.hero.style}}"
         sup-widget-bg
         ng-model="meta.hero">
  <div class="container">
    <div class="row">
      <div class="col-lg-8 col-lg-offset-2 text-center">
        <h2 class="section-heading">
          <span sup-widget-text
               default="{{_('Title')}}"
               ng-model="meta.title"></span>
        </h2>
      </div>
    </div>
  </div>
</section>

<section>
  <div class="container">
    <div class="row">
      <div class="col-md-8 col-md-offset-2"
           sup-widget-form
           ng-model="meta.form">
        <div ng-if="meta.form.type == 'custom'"
             ng-bind-html="meta.form.custom|trust">
        </div>
        <div ng-if="meta.form.type != 'custom'">
          <form name="try_form"
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
                <div class="tip">{{field.hint}}</div>
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
                <div class="tip">{{field.hint}}</div>
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
                <div class="tip">{{field.hint}}</div>
              </div>
          
              <div field="{{field.type}}"
                   name="{{field.name}}"
                   label="{{field.label}}"
                   class="checkbox"
                   ng-if="field.type == 'checkbox' || field.type == 'radio'">
                <label ng-repeat="item in filed.value">
                  <input type="{{field.type}}"
                         name="{{field.name}}"
                         value="{{item.key}}">&nbsp;{{item.text}}
                </label>
                <div class="tip">{{field.hint}}</div>
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
      </div>
    </div>
  </div>
</section>
<footer>
	<div class="container">
		<div class="row">
			<div class="text-center">
				<p>
					<span ng-bind-html="site_meta.copyright"></span>
					<span ng-bind-html="site_meta.license"></span>
				</p>
			</div>
		</div>
	</div>
</footer>

