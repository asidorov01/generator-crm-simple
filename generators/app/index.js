'use strict';
var yeoman = require('yeoman-generator');
var chalk = require('chalk');
var yosay = require('yosay');
var _ = require('underscore.string');


var dst_prefix = 'src/app/';
function convert_name(name) {
  var packagePrefix = "crm.";

  return {
      module_name: packagePrefix + _.camelize(name),
      camel_case_name: _.camelize(name),
      upper_name: _.swapCase(_.underscored(name)),
      classify_name: _.classify(name),
      dashed_name: _.dasherize(name),
      human_name: _.humanize(name)
  }
}
module.exports = yeoman.generators.NamedBase.extend({

  packagePrefix: "crm.",

  writing: {

    /**
     * Handle templates for directives
     */
    directives: function () {
      this.fs.copyTpl(
        this.templatePath('module/directives/menuFormDirective.js.tpl'),
        this.destinationPath(dst_prefix+_.camelize(this.name)+'/directives/'+_.camelize(this.name)+'Form.js'),
        convert_name(this.name)
      );

      this.fs.copyTpl(
        this.templatePath('module/directives/listDirective.js.tpl'),
        this.destinationPath(dst_prefix+_.camelize(this.name)+'/directives/'+_.camelize(this.name)+'List.js'),
        convert_name(this.name)
      );
    },

    /**
     * Locales
     */
    locales: function () {
      this.fs.copyTpl(
        this.templatePath('module/locales/ru.js.tpl'),
        this.destinationPath(dst_prefix+_.camelize(this.name)+'/locales/ru.js'),
        convert_name(this.name)
      );

    },

    /**
     * Templates
     */
    templates: function () {
      this.fs.copyTpl(
        this.templatePath('module/partials/index.html.tpl'),
        this.destinationPath(dst_prefix+_.camelize(this.name)+'/partials/index.html'),
        convert_name(this.name)
      );

      this.fs.copyTpl(
          this.templatePath('module/partials/moduleForm.html.tpl'),
          this.destinationPath(dst_prefix+_.camelize(this.name)+'/partials/'+_.camelize(this.name)+'Form.html'),
          convert_name(this.name)
      );

      this.fs.copyTpl(
          this.templatePath('module/partials/moduleList.html.tpl'),
          this.destinationPath(dst_prefix+_.camelize(this.name)+'/partials/'+_.camelize(this.name)+'List.html'),
          convert_name(this.name)
      );
    },

    /**
     * Services
     */
    services: function () {
      this.fs.copyTpl(
          this.templatePath('module/services/Resource.js.tpl'),
          this.destinationPath(dst_prefix+_.camelize(this.name)+'/services/'+_.camelize(this.name)+'.js'),
          convert_name(this.name)
      );

      this.fs.copyTpl(
          this.templatePath('module/services/moduleFormFactory.js.tpl'),
          this.destinationPath(dst_prefix+_.camelize(this.name)+'/services/'+_.camelize(this.name)+'FormFactory.js'),
          convert_name(this.name)
      );

      this.fs.copyTpl(
          this.templatePath('module/services/moduleManager.js.tpl'),
          this.destinationPath(dst_prefix+_.camelize(this.name)+'/services/'+_.camelize(this.name)+'Manager.js'),
          convert_name(this.name)
      );

    },


    /**
     * Module
     */
    module: function () {
        this.fs.copyTpl(
            this.templatePath('module/index.js.tpl'),
            this.destinationPath(dst_prefix + _.camelize(this.name) + '/index.js'),
            convert_name(this.name)
        );
    }
  },

  install: function () {

    // Have Yeoman greet the user.
    this.log(yosay(
      'Don\'t forget to add module  in ' + chalk.red('src/app/index.js') + ' !'
    ));

    this.log("angular.module('zemland', [\n"+
        "...\n"+
        "\n"+
        "\n"+
        "'crm."+_.camelize(this.name)+"',"+
        "\n"+
        "...\n"+
        "];"
    );

    // Have Yeoman greet the user.
    this.log(yosay(
      'Add href to menu: ' +
      chalk.red('#/'+_.dasherize(this.name)) +"\n" +
      'Add menu title: '+
      chalk.red(_.swapCase(_.underscored((this.name)))  + ' ')
    ));



    //this.installDependencies();
    //console.log('This is, ' + this.name);
    //console.log(_.slugify(this.name));
    //console.log(_.humanize(this.name));
    //console.log(_.capitalize(this.name));
    //console.log(_.capitalize(this.name));
    //console.log(_.dasherize(this.name));
    //console.log(_.underscored(this.name));

  }
});
