'use strict';

/**
 * Resource represents remote enrty point for data storage.
 */
angular.module('<%= module_name %>')

    .factory('<%= classify_name %>', function($resource, ENV, <%= upper_name %>_END_POINT, springResourceFactoryTransformer) {
        return function() {

            return $resource(ENV.javaApiBase() + <%= upper_name %>_END_POINT +'/:id', {id: '@id'}, {
                'query': {
                    isArray: false,
                    cache: false,
                    transformResponse: springResourceFactoryTransformer
                }
            });
        }();
    });
