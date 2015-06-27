'use strict';

/**
 * FormFactory, contain logic to render and interact form.
 */
angular.module('<%= module_name %>')

    .factory('<%= camel_case_name %>FormFactory', function (ENV, $aside, $translate, $rootScope, <%= camel_case_name %>, $q, <%= camel_case_name %>Manager, <%= upper_name %>_EVENTS, Preloader) {

        function FormFactory (config) {

            var form = {};

            // Config options
            var scope = config.scope;

            scope.form = {
                object: {},
                objectId: config.<%= camel_case_name %>Id
            };

            //@TODO Move representation into the Template
            if (scope.form.objectId) {
                scope.title = $translate.instant('_<%= upper_name %>_.EDITING');
            } else {
                scope.title = $translate.instant('_<%= upper_name %>_.ADDING');
            }

            var aside = $aside({
                title: scope.title,
                contentTemplate: 'app/<%= camel_case_name %>/partials/<%= camel_case_name %>Form.html',
                scope: scope,
                show: false
            });

            scope.onSuccess = function () {
                $rootScope.$emit(<%= upper_name %>_EVENTS.UPDATED);
                form.hide();
            };

            form.show = function () {
                aside.$promise.then(function () {
                    aside.show();

                    scope.form = <%= camel_case_name %>Manager.bindForm(scope.form);
                });
            };

            form.hide = function () {
                scope.$destroy();
                aside.hide();
            };

            /**
             * Preloaders
             */
            $rootScope.$on(<%= upper_name %>_EVENTS.START_FORM_REQUEST, function() {
                Preloader.show("<%= dashed_name %>-form");
            });

            $rootScope.$on(<%= upper_name %>_EVENTS.COMPLETED_FORM_REQUEST, function() {
                Preloader.hide("<%= dashed_name %>-form");
            });

            return form;
        }

        return FormFactory;
    })

;
