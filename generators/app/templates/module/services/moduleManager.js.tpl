'use strict';

/**
 * Manager contains business logic to work with data.
 */
angular.module('<%= module_name %>')

    .factory('<%= camel_case_name %>Manager', function ($rootScope, <%= camel_case_name %>, ENV, <%= upper_name %>_END_POINT, <%= upper_name %>_EVENTS) {

        var service = {
            search: search,
            remove: remove,
            <%= camel_case_name %>: <%= camel_case_name %>,
            get: get,
            bindForm: bindForm
        };

        return service;

        /**
         * @TODO apply search criterias
         */
        function search(criteria, page) {

            $rootScope.$emit(<%= upper_name %>_EVENTS.START_REQUEST);

            if (page > 0) {
                var rPage = page -1;
            }

            return <%= camel_case_name %>.query({page: rPage}, function() {
                $rootScope.$emit(<%= upper_name %>_EVENTS.COMPLETED_REQUEST);
            });
        }

        function remove(<%= camel_case_name %>Id) {
                <%= camel_case_name %>.remove({id: <%= camel_case_name %>Id}, function () {
                $rootScope.$emit(<%= upper_name %>_EVENTS.UPDATED);
            });
        }

        function get(id) {
            return <%= camel_case_name %>.get({id: id}, function() {
                $rootScope.$emit(<%= upper_name %>_EVENTS.COMPLETED_FORM_REQUEST);
            });
        }

        function bindForm(form) {

            if(!form.objectId) {
                form.isNew = true;
                form.url = ENV.javaApiBase() + <%= upper_name %>_END_POINT;
                form.method = 'POST';

            } else {
                form.isNew = false;
                form.url = ENV.javaApiBase() + <%= upper_name %>_END_POINT +'/' + form.objectId;
                form.method = 'PATCH';

                $rootScope.$emit(<%= upper_name %>_EVENTS.START_FORM_REQUEST);
                form.object = service.get(form.objectId);
            }

            return form;
        }
    })
;