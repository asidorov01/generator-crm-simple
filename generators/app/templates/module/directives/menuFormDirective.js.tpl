'use strict';

angular.module('<%= module_name %>')

    .directive('<%= camel_case_name %>Form', function (<%= classify_name %>FormFactory) {
        return {
            restrict: 'A',
            link: function (scope, element, attrs) {

                element.click(function () {
                    <%= classify_name %>FormFactory({
                        scope: scope,
                        <%= camel_case_name %>Id: attrs.<%= camel_case_name %>Id
                    }).show();
                });

            }
        }
    })

;
