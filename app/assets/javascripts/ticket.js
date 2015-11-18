// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

window.UserNag = {
  ticketsNagged: [],
  nagTicket: function(ticketId){
    card.services('helpdesk').request('comment:create', ticketId, {
      public: true,
      body: 'Just a quick reminder that we need a little more info from you on this issue.\nWhen you get a chance, please give us an update so we can continue to help with this issue.\nThanks!'
    });
  }
};
$('document').ready(function(){
  var card = new SW.Card();
  card.onActivate(function(envData){
    UserNag.env = envData;
    $('#auid').val(envData['app_host']['auid']);
    UserNag.site = envData['app_host']['auid'];
  });
  card.services('helpdesk').on('showTicket', UserNag.nagTicket);
  $('#send_nags').on('click', window.UserNag.nag);
});
