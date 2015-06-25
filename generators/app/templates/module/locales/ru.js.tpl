'use strict';

angular.module('<%= module_name %>')

    .config(function ($translateProvider) {
        $translateProvider.translations('ru', {
            '<%= upper_name %>' : '<%= upper_name %>',
            '_<%= upper_name %>_': {
                'LIST_HEADER': 'Список <%= human_name %>',
                'ADDING': 'Добавление <%= human_name %>',
                'EDITING': 'Редактирование <%= human_name %>',
                'REMOVING': 'Удаление <%= human_name %>',
                'REMOVE_CONFIRM': 'Вы хотите удалить этот <%= human_name %>?',
                'RECORDS_COUNT': '{ count } {title, select, one{<%= human_name %>} few{<%= human_name %>а} many{<%= human_name %>ов} other{<%= human_name %>ов}} в списке'
            }
        });
    })

;
