App.AdministratorsRoute = Ember.Route.extend({
  renderTemplate: function() {
    this.render('gt_auth/administrators/index');
  },
  model: function() { return App.Administrator.find(); }
});

App.AdministratorsNewRoute = Ember.Route.extend({
  renderTemplate: function() {
    this.render('gt_auth/administrators/new');
  }
});
