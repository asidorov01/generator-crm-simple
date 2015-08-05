<div class="aside-header clearfix">
    <button type="button" class="close" ng-click="$hide()">&times;</button>
    <h3 class="aside-title">
        {{title}}
    </h3>
</div>

<preloader type="<%= dashed_name %>-form"></preloader>
<form class="form-horizontal input-width" server-form url="{{form.url}}" method="{{form.method}}" on-success="onSuccess" ng-="sendForm">

    <div class="aside-body one-columns">

        <div class="row">
            <div class="col-xs-12">

                <form-field ng-model="form.object.name" name="name" type="text" template="input-vertical">
                    <label>{{'NAME' | translate}}:</label>
                </form-field>

            </div>
        </div>

        <div class="row">
            <div class="col-xs-12">
                <div class="text-right">
                    <button type="submit" class="btn btn-primary">
                        <i class="fa fa-save margin-right-10"></i>{{'SAVE' | translate}}
                    </button>
                </div>
            </div>
        </div>

    </div>
</form>
