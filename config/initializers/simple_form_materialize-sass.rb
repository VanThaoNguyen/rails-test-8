# Use this setup block to configure all options available in SimpleForm.
SimpleForm.setup do |config|
  config.error_notification_class = 'alert alert-danger'
  config.button_class = 'waves-effect waves-light btn'
  config.boolean_label_class = nil

  # config.default_wrapper = :materialize_form
  config.wrapper_mappings = {
    check_boxes: :vertical_radio_and_checkboxes,
    radio_buttons: :vertical_radio_and_checkboxes,
    boolean: :vertical_boolean
  }

  config.wrappers :materialize_form, tag: 'div', class: 'input-field form-group', error_class: 'has-error' do |b|
    b.use :html5
    b.use :placeholder
    b.optional :maxlength
    b.optional :pattern
    b.optional :min_max
    b.optional :readonly
    b.use :input
    b.use :label
    b.use :error, wrap_with: { tag: 'span', class: 'error-block' }
    b.use :hint,  wrap_with: { tag: 'span', class: 'help-block' }
  end

  config.wrappers :vertical_boolean, tag: 'p', error_class: 'has-error' do |b|
    b.use :html5
    b.optional :readonly

    b.use :input
    b.use :label
    b.use :error, wrap_with: { tag: 'span', class: 'error-block' }
    b.use :hint,  wrap_with: { tag: 'span', class: 'help-block' }
  end

  config.wrappers :vertical_radio_and_checkboxes, tag: 'p', error_class: 'has-error' do |b|
    b.use :html5
    b.optional :readonly
    b.use :input
    b.use :label
    b.use :error, wrap_with: { tag: 'span', class: 'error-block' }
    b.use :hint,  wrap_with: { tag: 'span', class: 'help-block' }
  end

end