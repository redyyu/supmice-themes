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
         ng-if="field.type == 'select'">
      <label>{{field.label}}</label>
      <select field="{{field.type}}"
              name="{{field.name}}"
              label="{{field.label}}"
              class="form-control"
              placeholder="{{field.placeholder}}"
              {{form_status[field.status]}}/>
        <option value="{{item.key}}"
                ng-repeat="item in filed.options">{{item.value}}</option>
      </select>
      <div class="tip">{{field.hint}}</div>
    </div>

    <div field="{{field.type}}"
         name="{{field.name}}"
         label="{{field.label}}"
         class="checkbox"
         ng-if="field.type == 'checkbox' || field.type == 'radio'">
      <label ng-repeat="item in field.options">
        <input type="{{field.type}}"
               name="{{field.key}}"
               value="{{item.value}}">&nbsp;{{item.value}}
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
