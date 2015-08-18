'use strict';

/**
 * Manager contains business logic to work with data.
 */
angular.module('<%= module_name %>')

    .factory('<%= classify_name %>Manager', function ($rootScope, <%= classify_name %>, ENV, <%= upper_name %>_END_POINT, <%= upper_name %>_EVENTS) {

        var service = {
            search: search,
            remove: remove,
            <%= classify_name %>: <%= classify_name %>,
            get: get,
            bindForm: bindForm,
            generateLink: generateLink
        };

        return service;

        /**
         * @TODO apply search criterias
         */
        function search(criteria, page) {

            $rootScope.$broadcast(<%= upper_name %>_EVENTS.START_REQUEST);

            if (page > 0) {
                var rPage = page -1;
            }
            var searchCriterias = angular.extend({}, criteria, {page: rPage});

            return <%= classify_name %>.query(searchCriterias, function() {
                $rootScope.$broadcast(<%= upper_name %>_EVENTS.COMPLETED_REQUEST);
            });
        }

        function remove(<%= camel_case_name %>Id) {
                <%= classify_name %>.remove({id: <%= camel_case_name %>Id}, function () {
                $rootScope.$broadcast(<%= upper_name %>_EVENTS.UPDATED);
            });
        }

        function get(id) {
            return <%= classify_name %>.get({id: id}, function() {
                $rootScope.$broadcast(<%= upper_name %>_EVENTS.COMPLETED_FORM_REQUEST);
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

                $rootScope.$broadcast(<%= upper_name %>_EVENTS.START_FORM_REQUEST);
                form.object = service.get(form.objectId);
            }

            return form;
        }

        function generateLink(id) {
            return ENV.apiBase() + <%= upper_name %>_END_POINT + "/"+id;
        }

    })
;
