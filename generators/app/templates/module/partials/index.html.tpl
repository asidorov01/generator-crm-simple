<layout>

    <div class="page-header">
        <h1>
            {{'_<%= upper_name %>_.LIST_HEADER' | translate}}
        </h1>
    </div>

    <div class="row">
        <div class="col-xs-12">
            <button type="button" <%= dashed_name %>-form class="btn btn-primary margin-bottom-10 pull-left">
                <i class="fa fa-plus margin-right-10"></i>
                {{'ADD' | translate}}
            </button>
            <div records-count class="records-count-wrapper pull-right" data-translation-block="_<%= upper_name %>_.RECORDS_COUNT" ng-model="list.page.totalElements"></div>
        </div>
    </div>

    <<%= dashed_name %>-list></<%= dashed_name %>-list>

</layout>


