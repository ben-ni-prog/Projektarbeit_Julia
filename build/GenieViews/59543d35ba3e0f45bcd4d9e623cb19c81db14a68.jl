# Genie_12604175801602912410 

function func_cf6388c27961924466f295c303bbda90a037a703(
    context = Genie.Renderer.vars(:context),
)::String

    """
              \n\n  function initStipple(rootSelector){\n    Stipple.init({theme: 'theme'});\n    window.Main_App_varMain_App_ReactiveModel = window.GENIEMODEL = new Vue({\"el\":rootSelector,\"mixins\":[watcherMixin, reviveMixin, eventMixin],\"data\":{\"Task_text\":\"\",\"due_date\":\"2024-06-20\",\"Table_data\":{\"data\":[{\"__id\":1,\"task\":\"Placeholder\",\"author\":\"Placeholder\",\"date\":\"2024-06-20\"}],\"columns\":[{\"name\":\"task\",\"required\":false,\"label\":\"Task\",\"align\":\"left\",\"field\":\"task\",\"sortable\":true},{\"name\":\"author\",\"required\":false,\"label\":\"Author\",\"align\":\"left\",\"field\":\"author\",\"sortable\":true},{\"name\":\"date\",\"required\":false,\"label\":\"Date\",\"align\":\"left\",\"field\":\"date\",\"sortable\":true}]},\"Datefield_due_date\":\"\",\"tab_selected\":\"home\",\"fileuploads\":{},\"task\":\"Placeholder\",\"author\":\"Placeholder\",\"isready\":false,\"isprocessing\":false,\"Button_process\":false,\"Author_text\":\"\"}});\n  } // end of initStipple\n\n    \n\n  function initWatchers(){\n      window.Main_App_varMain_App_ReactiveModel.\$watch(function(){return this.isready}, function(newVal, oldVal){Genie.WebChannels.sendMessageTo(window.CHANNEL, 'watchers', {'payload': {'field':'isready', 'newval': newVal, 'oldval': oldVal, 'sesstoken': document.querySelector(\"meta[name='sesstoken']\")?.getAttribute('content')}});}, {deep: true});\n\n\n  window.Main_App_varMain_App_ReactiveModel.\$watch(function(){return this.isprocessing}, _.debounce(function(newVal, oldVal){Genie.WebChannels.sendMessageTo(window.CHANNEL, 'watchers', {'payload': {'field':'isprocessing', 'newval': newVal, 'oldval': oldVal, 'sesstoken': document.querySelector(\"meta[name='sesstoken']\")?.getAttribute('content')}});}, 300), {deep: true});\n\n\n  window.Main_App_varMain_App_ReactiveModel.\$watch(function(){return this.fileuploads}, _.debounce(function(newVal, oldVal){Genie.WebChannels.sendMessageTo(window.CHANNEL, 'watchers', {'payload': {'field':'fileuploads', 'newval': newVal, 'oldval': oldVal, 'sesstoken': document.querySelector(\"meta[name='sesstoken']\")?.getAttribute('content')}});}, 300), {deep: true});\n\n\n  window.Main_App_varMain_App_ReactiveModel.\$watch(function(){return this.tab_selected}, _.debounce(function(newVal, oldVal){Genie.WebChannels.sendMessageTo(window.CHANNEL, 'watchers', {'payload': {'field':'tab_selected', 'newval': newVal, 'oldval': oldVal, 'sesstoken': document.querySelector(\"meta[name='sesstoken']\")?.getAttribute('content')}});}, 300), {deep: true});\n\n\n  window.Main_App_varMain_App_ReactiveModel.\$watch(function(){return this.Datefield_due_date}, _.debounce(function(newVal, oldVal){Genie.WebChannels.sendMessageTo(window.CHANNEL, 'watchers', {'payload': {'field':'Datefield_due_date', 'newval': newVal, 'oldval': oldVal, 'sesstoken': document.querySelector(\"meta[name='sesstoken']\")?.getAttribute('content')}});}, 300), {deep: true});\n\n\n  window.Main_App_varMain_App_ReactiveModel.\$watch(function(){return this.Task_text}, _.debounce(function(newVal, oldVal){Genie.WebChannels.sendMessageTo(window.CHANNEL, 'watchers', {'payload': {'field':'Task_text', 'newval': newVal, 'oldval': oldVal, 'sesstoken': document.querySelector(\"meta[name='sesstoken']\")?.getAttribute('content')}});}, 300), {deep: true});\n\n\n  window.Main_App_varMain_App_ReactiveModel.\$watch(function(){return this.Author_text}, _.debounce(function(newVal, oldVal){Genie.WebChannels.sendMessageTo(window.CHANNEL, 'watchers', {'payload': {'field':'Author_text', 'newval': newVal, 'oldval': oldVal, 'sesstoken': document.querySelector(\"meta[name='sesstoken']\")?.getAttribute('content')}});}, 300), {deep: true});\n\n\n  window.Main_App_varMain_App_ReactiveModel.\$watch(function(){return this.Button_process}, _.debounce(function(newVal, oldVal){Genie.WebChannels.sendMessageTo(window.CHANNEL, 'watchers', {'payload': {'field':'Button_process', 'newval': newVal, 'oldval': oldVal, 'sesstoken': document.querySelector(\"meta[name='sesstoken']\")?.getAttribute('content')}});}, 300), {deep: true});\n\n\n\n  } // end of initWatchers\n\n    \nwindow.parse_payload = function(payload){\n  if (payload.key) {\n     window.Main_App_varMain_App_ReactiveModel.updateField(payload.key, payload.value);\n  }\n}\n\nfunction app_ready() {\n    Main_App_varMain_App_ReactiveModel.channel_ = window.CHANNEL;\n    Main_App_varMain_App_ReactiveModel.isready = true;\n    Genie.Revivers.addReviver(window.Main_App_varMain_App_ReactiveModel.revive_jsfunction);\n    \n      try {\n        if (Genie.Settings.webchannels_keepalive_frequency > 0) {\n          setInterval(keepalive, Genie.Settings.webchannels_keepalive_frequency);\n        }\n      } catch (e) {\n        if (Genie.Settings.env === 'dev') {\n          console.error('Error setting WebSocket keepalive interval: ' + e);\n        }\n      }\n      \n\n    if (Genie.Settings.env === 'dev') {\n      console.info('App starting');\n    }\n};\n\nif ( window.autorun === undefined || window.autorun === true ) {\n  initStipple('#Main_App_varMain_App_ReactiveModel');\n  initWatchers();\n\n  Genie.WebChannels.subscriptionHandlers.push(function(event) {\n    app_ready();\n  });\n}\n
              """
end
