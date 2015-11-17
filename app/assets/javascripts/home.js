// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

//= require materialize-sprockets

window.UserNag = {
  ticketsNagged: [],
  nag: function(){
    var card = new SW.Card();
    card.services('helpdesk').request('tickets', {status: 'open'}).then(function(t){
      var ticketList = t['tickets'];
      for(var i=0; i < ticketList.length; i++){
        var tick = ticketList[i];
        if(tick['status'] == 'waiting') {
          card.services('helpdesk').request('comment:create', tick['id'], {
            public: true,
            body: 'Just a quick reminder that we need a little more info from you on this issue.\nWhen you get a chance, please give us an update so we can continue to help with this issue.\nThanks!'
          });
        }
      }
    });
  }
};
$('document').ready(function(){
  var card = new SW.Card();
  card.onActivate(function(envData){
    $('#auid').val(envData['app_host']['auid']);
    UserNag.site = envData['app_host']['auid'];
  });
  $('#send_nags').on('click', window.UserNag.nag);
});
