# Genie_17283492703731715208 

function func_8c1d585b33a997a840b90d001730af90b7345ae9(
    context = Genie.Renderer.vars(:context),
    model = Genie.Renderer.vars(:model),
)::String

    """
              \n\n  function initStipple(rootSelector){\n    Stipple.init({theme: 'theme'});\n    window.Main_App_varMain_App_ReactiveModel = window.GENIEMODEL = new Vue({\"el\":rootSelector,\"mixins\":[watcherMixin, reviveMixin, eventMixin],\"data\":{\"Completed_data\":{\"data\":[],\"columns\":[{\"name\":\"ID\",\"required\":false,\"label\":\"ID\",\"align\":\"left\",\"field\":\"ID\",\"sortable\":true},{\"name\":\"task\",\"required\":false,\"label\":\"Task\",\"align\":\"left\",\"field\":\"task\",\"sortable\":true},{\"name\":\"author\",\"required\":false,\"label\":\"Author\",\"align\":\"left\",\"field\":\"author\",\"sortable\":true},{\"name\":\"due_date\",\"required\":false,\"label\":\"Due date\",\"align\":\"left\",\"field\":\"due_date\",\"sortable\":true}]},\"success_message\":\"Placeholder\",\"Button_refresh_progress\":0.0,\"tab_selected\":\"home\",\"Table_pagination\":{\"rowsPerPage\":10,\"page\":1,\"descending\":false,\"sortBy\":\"desc\"},\"delete_message\":\"Placeholder\",\"fileuploads\":{},\"error_message\":\"Placeholder\",\"Button_complete\":false,\"Tasks_data\":{\"data\":[{\"__id\":1,\"ID\":1,\"task\":\"delete test\",\"author\":\"Benni\",\"due_date\":\"2024-06-12\"}],\"columns\":[{\"name\":\"ID\",\"required\":false,\"label\":\"ID\",\"align\":\"left\",\"field\":\"ID\",\"sortable\":true},{\"name\":\"task\",\"required\":false,\"label\":\"Task\",\"align\":\"left\",\"field\":\"task\",\"sortable\":true},{\"name\":\"author\",\"required\":false,\"label\":\"Author\",\"align\":\"left\",\"field\":\"author\",\"sortable\":true},{\"name\":\"due_date\",\"required\":false,\"label\":\"Due date\",\"align\":\"left\",\"field\":\"due_date\",\"sortable\":true}]},\"isready\":false,\"isprocessing\":false,\"show_error\":false,\"Button_todos\":false,\"Task_text\":\"\",\"Button_submit\":false,\"Button_refresh\":false,\"show_completed\":false,\"show_selection\":false,\"Button_delete\":false,\"Datefield_due_date\":\"\",\"Urgent_data\":{\"data\":[{\"__id\":1,\"ID\":1,\"task\":\"delete test\",\"author\":\"Benni\",\"due_date\":\"2024-06-12\"}],\"columns\":[{\"name\":\"ID\",\"required\":false,\"label\":\"ID\",\"align\":\"left\",\"field\":\"ID\",\"sortable\":true},{\"name\":\"task\",\"required\":false,\"label\":\"Task\",\"align\":\"left\",\"field\":\"task\",\"sortable\":true},{\"name\":\"author\",\"required\":false,\"label\":\"Author\",\"align\":\"left\",\"field\":\"author\",\"sortable\":true},{\"name\":\"due_date\",\"required\":false,\"label\":\"Due date\",\"align\":\"left\",\"field\":\"due_date\",\"sortable\":true}]},\"completed_message\":\"Placeholder\",\"Button_completed_tasks\":false,\"ID_text\":0,\"show_element\":false,\"show_delete\":false,\"Author_text\":\"\"}});\n  } // end of initStipple\n\n    \n\n  function initWatchers(){\n      window.Main_App_varMain_App_ReactiveModel.\$watch(function(){return this.isready}, function(newVal, oldVal){Genie.WebChannels.sendMessageTo(window.CHANNEL, 'watchers', {'payload': {'field':'isready', 'newval': newVal, 'oldval': oldVal, 'sesstoken': document.querySelector(\"meta[name='sesstoken']\")?.getAttribute('content')}});}, {deep: true});\n\n\n  window.Main_App_varMain_App_ReactiveModel.\$watch(function(){return this.isprocessing}, _.debounce(function(newVal, oldVal){Genie.WebChannels.sendMessageTo(window.CHANNEL, 'watchers', {'payload': {'field':'isprocessing', 'newval': newVal, 'oldval': oldVal, 'sesstoken': document.querySelector(\"meta[name='sesstoken']\")?.getAttribute('content')}});}, 300), {deep: true});\n\n\n  window.Main_App_varMain_App_ReactiveModel.\$watch(function(){return this.fileuploads}, _.debounce(function(newVal, oldVal){Genie.WebChannels.sendMessageTo(window.CHANNEL, 'watchers', {'payload': {'field':'fileuploads', 'newval': newVal, 'oldval': oldVal, 'sesstoken': document.querySelector(\"meta[name='sesstoken']\")?.getAttribute('content')}});}, 300), {deep: true});\n\n\n  window.Main_App_varMain_App_ReactiveModel.\$watch(function(){return this.tab_selected}, _.debounce(function(newVal, oldVal){Genie.WebChannels.sendMessageTo(window.CHANNEL, 'watchers', {'payload': {'field':'tab_selected', 'newval': newVal, 'oldval': oldVal, 'sesstoken': document.querySelector(\"meta[name='sesstoken']\")?.getAttribute('content')}});}, 300), {deep: true});\n\n\n  window.Main_App_varMain_App_ReactiveModel.\$watch(function(){return this.Datefield_due_date}, _.debounce(function(newVal, oldVal){Genie.WebChannels.sendMessageTo(window.CHANNEL, 'watchers', {'payload': {'field':'Datefield_due_date', 'newval': newVal, 'oldval': oldVal, 'sesstoken': document.querySelector(\"meta[name='sesstoken']\")?.getAttribute('content')}});}, 300), {deep: true});\n\n\n  window.Main_App_varMain_App_ReactiveModel.\$watch(function(){return this.Task_text}, _.debounce(function(newVal, oldVal){Genie.WebChannels.sendMessageTo(window.CHANNEL, 'watchers', {'payload': {'field':'Task_text', 'newval': newVal, 'oldval': oldVal, 'sesstoken': document.querySelector(\"meta[name='sesstoken']\")?.getAttribute('content')}});}, 300), {deep: true});\n\n\n  window.Main_App_varMain_App_ReactiveModel.\$watch(function(){return this.Author_text}, _.debounce(function(newVal, oldVal){Genie.WebChannels.sendMessageTo(window.CHANNEL, 'watchers', {'payload': {'field':'Author_text', 'newval': newVal, 'oldval': oldVal, 'sesstoken': document.querySelector(\"meta[name='sesstoken']\")?.getAttribute('content')}});}, 300), {deep: true});\n\n\n  window.Main_App_varMain_App_ReactiveModel.\$watch(function(){return this.ID_text}, _.debounce(function(newVal, oldVal){Genie.WebChannels.sendMessageTo(window.CHANNEL, 'watchers', {'payload': {'field':'ID_text', 'newval': newVal, 'oldval': oldVal, 'sesstoken': document.querySelector(\"meta[name='sesstoken']\")?.getAttribute('content')}});}, 300), {deep: true});\n\n\n  window.Main_App_varMain_App_ReactiveModel.\$watch(function(){return this.Button_submit}, _.debounce(function(newVal, oldVal){Genie.WebChannels.sendMessageTo(window.CHANNEL, 'watchers', {'payload': {'field':'Button_submit', 'newval': newVal, 'oldval': oldVal, 'sesstoken': document.querySelector(\"meta[name='sesstoken']\")?.getAttribute('content')}});}, 300), {deep: true});\n\n\n  window.Main_App_varMain_App_ReactiveModel.\$watch(function(){return this.show_element}, _.debounce(function(newVal, oldVal){Genie.WebChannels.sendMessageTo(window.CHANNEL, 'watchers', {'payload': {'field':'show_element', 'newval': newVal, 'oldval': oldVal, 'sesstoken': document.querySelector(\"meta[name='sesstoken']\")?.getAttribute('content')}});}, 300), {deep: true});\n\n\n  window.Main_App_varMain_App_ReactiveModel.\$watch(function(){return this.Tasks_data}, _.debounce(function(newVal, oldVal){Genie.WebChannels.sendMessageTo(window.CHANNEL, 'watchers', {'payload': {'field':'Tasks_data', 'newval': newVal, 'oldval': oldVal, 'sesstoken': document.querySelector(\"meta[name='sesstoken']\")?.getAttribute('content')}});}, 300), {deep: true});\n\n\n  window.Main_App_varMain_App_ReactiveModel.\$watch(function(){return this.Completed_data}, _.debounce(function(newVal, oldVal){Genie.WebChannels.sendMessageTo(window.CHANNEL, 'watchers', {'payload': {'field':'Completed_data', 'newval': newVal, 'oldval': oldVal, 'sesstoken': document.querySelector(\"meta[name='sesstoken']\")?.getAttribute('content')}});}, 300), {deep: true});\n\n\n  window.Main_App_varMain_App_ReactiveModel.\$watch(function(){return this.Urgent_data}, _.debounce(function(newVal, oldVal){Genie.WebChannels.sendMessageTo(window.CHANNEL, 'watchers', {'payload': {'field':'Urgent_data', 'newval': newVal, 'oldval': oldVal, 'sesstoken': document.querySelector(\"meta[name='sesstoken']\")?.getAttribute('content')}});}, 300), {deep: true});\n\n\n  window.Main_App_varMain_App_ReactiveModel.\$watch(function(){return this.Table_pagination}, _.debounce(function(newVal, oldVal){Genie.WebChannels.sendMessageTo(window.CHANNEL, 'watchers', {'payload': {'field':'Table_pagination', 'newval': newVal, 'oldval': oldVal, 'sesstoken': document.querySelector(\"meta[name='sesstoken']\")?.getAttribute('content')}});}, 300), {deep: true});\n\n\n  window.Main_App_varMain_App_ReactiveModel.\$watch(function(){return this.Button_refresh}, _.debounce(function(newVal, oldVal){Genie.WebChannels.sendMessageTo(window.CHANNEL, 'watchers', {'payload': {'field':'Button_refresh', 'newval': newVal, 'oldval': oldVal, 'sesstoken': document.querySelector(\"meta[name='sesstoken']\")?.getAttribute('content')}});}, 300), {deep: true});\n\n\n  window.Main_App_varMain_App_ReactiveModel.\$watch(function(){return this.Button_refresh_progress}, _.debounce(function(newVal, oldVal){Genie.WebChannels.sendMessageTo(window.CHANNEL, 'watchers', {'payload': {'field':'Button_refresh_progress', 'newval': newVal, 'oldval': oldVal, 'sesstoken': document.querySelector(\"meta[name='sesstoken']\")?.getAttribute('content')}});}, 300), {deep: true});\n\n\n  window.Main_App_varMain_App_ReactiveModel.\$watch(function(){return this.Button_delete}, _.debounce(function(newVal, oldVal){Genie.WebChannels.sendMessageTo(window.CHANNEL, 'watchers', {'payload': {'field':'Button_delete', 'newval': newVal, 'oldval': oldVal, 'sesstoken': document.querySelector(\"meta[name='sesstoken']\")?.getAttribute('content')}});}, 300), {deep: true});\n\n\n  window.Main_App_varMain_App_ReactiveModel.\$watch(function(){return this.show_selection}, _.debounce(function(newVal, oldVal){Genie.WebChannels.sendMessageTo(window.CHANNEL, 'watchers', {'payload': {'field':'show_selection', 'newval': newVal, 'oldval': oldVal, 'sesstoken': document.querySelector(\"meta[name='sesstoken']\")?.getAttribute('content')}});}, 300), {deep: true});\n\n\n  window.Main_App_varMain_App_ReactiveModel.\$watch(function(){return this.show_delete}, _.debounce(function(newVal, oldVal){Genie.WebChannels.sendMessageTo(window.CHANNEL, 'watchers', {'payload': {'field':'show_delete', 'newval': newVal, 'oldval': oldVal, 'sesstoken': document.querySelector(\"meta[name='sesstoken']\")?.getAttribute('content')}});}, 300), {deep: true});\n\n\n  window.Main_App_varMain_App_ReactiveModel.\$watch(function(){return this.show_error}, _.debounce(function(newVal, oldVal){Genie.WebChannels.sendMessageTo(window.CHANNEL, 'watchers', {'payload': {'field':'show_error', 'newval': newVal, 'oldval': oldVal, 'sesstoken': document.querySelector(\"meta[name='sesstoken']\")?.getAttribute('content')}});}, 300), {deep: true});\n\n\n  window.Main_App_varMain_App_ReactiveModel.\$watch(function(){return this.Button_todos}, _.debounce(function(newVal, oldVal){Genie.WebChannels.sendMessageTo(window.CHANNEL, 'watchers', {'payload': {'field':'Button_todos', 'newval': newVal, 'oldval': oldVal, 'sesstoken': document.querySelector(\"meta[name='sesstoken']\")?.getAttribute('content')}});}, 300), {deep: true});\n\n\n  window.Main_App_varMain_App_ReactiveModel.\$watch(function(){return this.Button_completed_tasks}, _.debounce(function(newVal, oldVal){Genie.WebChannels.sendMessageTo(window.CHANNEL, 'watchers', {'payload': {'field':'Button_completed_tasks', 'newval': newVal, 'oldval': oldVal, 'sesstoken': document.querySelector(\"meta[name='sesstoken']\")?.getAttribute('content')}});}, 300), {deep: true});\n\n\n  window.Main_App_varMain_App_ReactiveModel.\$watch(function(){return this.Button_complete}, _.debounce(function(newVal, oldVal){Genie.WebChannels.sendMessageTo(window.CHANNEL, 'watchers', {'payload': {'field':'Button_complete', 'newval': newVal, 'oldval': oldVal, 'sesstoken': document.querySelector(\"meta[name='sesstoken']\")?.getAttribute('content')}});}, 300), {deep: true});\n\n\n  window.Main_App_varMain_App_ReactiveModel.\$watch(function(){return this.show_completed}, _.debounce(function(newVal, oldVal){Genie.WebChannels.sendMessageTo(window.CHANNEL, 'watchers', {'payload': {'field':'show_completed', 'newval': newVal, 'oldval': oldVal, 'sesstoken': document.querySelector(\"meta[name='sesstoken']\")?.getAttribute('content')}});}, 300), {deep: true});\n\n\n\n  } // end of initWatchers\n\n    \nwindow.parse_payload = function(payload){\n  if (payload.key) {\n     window.Main_App_varMain_App_ReactiveModel.updateField(payload.key, payload.value);\n  }\n}\n\nfunction app_ready() {\n    Main_App_varMain_App_ReactiveModel.channel_ = window.CHANNEL;\n    Main_App_varMain_App_ReactiveModel.isready = true;\n    Genie.Revivers.addReviver(window.Main_App_varMain_App_ReactiveModel.revive_jsfunction);\n    \n      try {\n        if (Genie.Settings.webchannels_keepalive_frequency > 0) {\n          setInterval(keepalive, Genie.Settings.webchannels_keepalive_frequency);\n        }\n      } catch (e) {\n        if (Genie.Settings.env === 'dev') {\n          console.error('Error setting WebSocket keepalive interval: ' + e);\n        }\n      }\n      \n\n    if (Genie.Settings.env === 'dev') {\n      console.info('App starting');\n    }\n};\n\nif ( window.autorun === undefined || window.autorun === true ) {\n  initStipple('#Main_App_varMain_App_ReactiveModel');\n  initWatchers();\n\n  Genie.WebChannels.subscriptionHandlers.push(function(event) {\n    app_ready();\n  });\n}\n
              """
end
