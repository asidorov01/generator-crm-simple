'use strict';

angular.module('<%= module_name %>')

.directive('<%= camel_case_name %>List', function (<%= camel_case_name %>Manager, $rootScope, <%= upper_name %>_EVENTS, Preloader) {
    return {
        restrict: 'E',
        templateUrl: 'app/<%= camel_case_name %>/partials/<%= camel_case_name %>List.html',
        link: function (scope, element, attrs) {

            Preloader.show("<%= dashed_name %>-list");

            scope.currentPage   = 1;

            /** @Bug in Angular UI */
            scope.loadPage = function () {
                <%= camel_case_name %>Manager.search(null, scope.currentPage)
                    .$promise
                    .then(function(res) {
                        scope.list = res;
                    });
            }

            scope.loadPage();

            scope.removeModel = <%= camel_case_name %>Manager.remove;

            /**
             * Iteraction events
             */
            $rootScope.$on(<%= upper_name %>_EVENTS.UPDATED, function() {
                scope.list = scope.loadPage();
            });

            /**
             * Preloader events
             */
            $rootScope.$on(<%= upper_name %>_EVENTS.START_REQUEST, function() {
                Preloader.show("<%= dashed_name %>-list");
            });

            $rootScope.$on(<%= upper_name %>_EVENTS.COMPLETED_REQUEST, function() {
                Preloader.hide("<%= dashed_name %>-list");
            });

        }
    }
});
