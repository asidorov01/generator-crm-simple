<div class="form-inline">
    <div class="table-responsive table-border-radius">
        <preloader type="<%= dashed_name %>-list"></preloader>
        <table class="table table-striped table-bordered table-hover no-footer">
            <thead>
            <tr>
                <th class="col-xs-11">{{'<%= upper_name %>' | translate}}</th>
                <th class="col-xs-1 text-center">{{'ACTION' | translate}}</th>
            </tr>
            </thead>

            <tbody>
            <tr ng-repeat="<%= camel_case_name %> in list._embedded.<%= camel_case_name %>s">
                <td>{{<%= camel_case_name %>.name}}</td>
                <td class="text-center">
                    <button class="btn btn-xs btn-primary" <%= dashed_name %>-form <%= dashed_name %>-id="{{<%= camel_case_name %>.id}}">
                        <i class="fa fa-pencil bigger-120"></i>
                    </button>

                    <button class="btn btn-xs btn-danger"
                            confirmation
                            title="{{'_<%= upper_name %>_.REMOVING' | translate}}"
                            message="{{'_<%= upper_name %>_.REMOVE_CONFIRM' | translate}}"
                            action="removeModel(<%= camel_case_name %>.id)">
                        <i class="fa fa-trash-o bigger-120"></i>
                    </button>
                </td>
            </tr>
            </tbody>
        </table>
    </div>
</div>

<div class="row">
    <div class="col-xs-12">

        <div class="pull-right">
            <pagination class="pagination-sm" ng-show="list.page.totalPages > 1"
                        num-pages="list.page.totalPages"
                        total-items="list.page.totalElements"
                        items-per-page="list.page.size"
                        ng-model="currentPage"
                        ng-change="loadPage()"
                        direction-links="false"
                    />
        </div>
    </div>
</div>
