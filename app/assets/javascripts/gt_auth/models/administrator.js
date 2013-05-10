App.Administrator = DS.Model.extend({
  name: DS.attr('string'),
  password: DS.attr('string'),
  password_confirmation: DS.attr('string')
});
