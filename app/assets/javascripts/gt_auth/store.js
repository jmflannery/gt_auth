App.Store = DS.Store.extend({
  revision: 11
});

DS.RESTAdapter.reopen({
  namespace: 'gt_auth'
});
