<layout>

    <div class="page-header">
        <h1>
            {{'_<%= upper_name %>_.LIST_HEADER' | translate}}
        </h1>
    </div>

    <div class="row">
        <div class="col-xs-12">
            <button type="button" <%= dashed_name %>-form class="btn btn-primary margin-bottom-10">
                <i class="fa fa-plus margin-right-10"></i>
                {{'ADD' | translate}}
            </button>
        </div>
    </div>

    <<%= dashed_name %>-list></<%= dashed_name %>-list>

</layout>


