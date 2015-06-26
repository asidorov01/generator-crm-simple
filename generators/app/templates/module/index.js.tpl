'use strict';

angular.module('<%= module_name %>', [])

    // Routes
    .config(function ($routeProvider) {
        $routeProvider.when('/<%= dashed_name %>s', {
            templateUrl: 'app/<%= camel_case_name %>/partials/index.html',
            security: true
        });
    })
    .constant('<%= upper_name %>_END_POINT', '<%= camel_case_name %>s')
    .constant('<%= upper_name %>_EVENTS', {
        UPDATED: '<%= camel_case_name %>.list.updated',
        START_REQUEST: '<%= camel_case_name %>.list.start_request',
        COMPLETED_REQUEST: '<%= camel_case_name %>.list.COMPLETED_REQUEST',
        START_FORM_REQUEST: '<%= camel_case_name %>.FORM.START_FORM_REQUEST',
        COMPLETED_FORM_REQUEST: '<%= camel_case_name %>.list.COMPLETED_FORM_REQUEST'
    })
;
