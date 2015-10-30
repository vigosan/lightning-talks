# encoding: utf-8

center <<-EOS
  \e[1mIntroduction to Ember\e[0m

  Vicent Gozalbes
EOS

block <<-EOS
  What is Ember?

    * Ember is a front end framework for creating ambitious apps
    * Provides a lot of functionality that is common for web applications
EOS

block <<-EOS
  Why Ember?

    * Logical code organization
    * Easy persistence
    * Auto updating templates
    * Helpful Object APIs
    * Testing
EOS

block <<-EOS
  ember-cli

    * Command line tool for building ember apps
    * Support to work with ES6 Modules rather than globals
    * More at http://www.ember-cli.com

    > npm install -g ember-cli
EOS

code <<-EOS, :bash
  Your first ember app:

  > ember new flywiretv
  installing app
    create .bowerrc
    create .editorconfig
    create .ember-cli
    create .jshintrc
    create .travis.yml
    create .watchmanconfig
    create README.md
    create app/app.js
    create app/components/.gitkeep
    create app/controllers/.gitkeep
    create app/helpers/.gitkeep
    create app/index.html
    create app/models/.gitkeep
    create app/router.js
    create app/routes/.gitkeep
    create app/styles/app.css
    create app/templates/application.hbs
    create app/templates/components/.gitkeep
    create bower.json
    create config/environment.js
    create ember-cli-build.js
    create .gitignore
    create package.json
    create public/crossdomain.xml
    create public/robots.txt
    create testem.json
    create tests/.jshintrc
    create tests/helpers/resolver.js
    create tests/helpers/start-app.js
    create tests/index.html
    create tests/test-helper.js
    create tests/unit/.gitkeep
    create vendor/.gitkeep
  Installed packages for tooling via npm.
  Installed browser packages via Bower.
  Successfully initialized git.
EOS

code <<-EOS, :bash
  Running your app:

  flywiretv > ember serve
  Livereload server on http://localhost:49152
  Serving on http://localhost:4200/

  Build successful - 2981ms.

  Slowest Trees                                 | Total
  ----------------------------------------------+---------------------
  ConcatWithMaps                                | 2250ms

  Slowest Trees (cumulative)                    | Total (avg)
  ----------------------------------------------+---------------------
  ConcatWithMaps (4)                            | 2272ms (568 ms)
  Babel (3)                                     | 193ms (64 ms)
EOS

code <<-EOS, 'html+handlebars'
  <!-- app/templates/application.hbs -->

  <h2 id="title">Welcome to Ember</h2>

  {{input type="text" value=name placeholder="Enter your name"}}
  {{# if name}}
  <h3>My name is {{name}} and I want to learn Ember!</h3>
  {{/if}}

  {{outlet}}
EOS

code <<-EOS, :bash
  >  ember g resource videos title:string uri:string publishedDate:date

  installing model
    create app/models/video.js
  installing model-test
    create tests/unit/models/video-test.js
  installing route
    create app/routes/videos.js
    create app/templates/videos.hbs
  updating router
    add route videos
  installing route-test
    create tests/unit/routes/videos-test.js

EOS

block <<-EOS
  Models

    * Represents the data you want to display
    * Think of them as the database data
    * Obtained via the `model` hook in the route

EOS

code <<-EOS, :javascript
  // app/models/video.js

  import DS from 'ember-data';

  export default DS.Model.extend({
    title: DS.attr('string'),
    uri: DS.attr('string'),
    publishedDate: DS.attr('date')
  });

EOS

block <<-EOS
  Router

    * There is the Router, and then there are routes
    * Routes are the URL representations of the application’s objects
    * The goal of routes is to query the model, from their `model` hook
    * Also be used to set properties in controllers

EOS

code <<-EOS, :javascript
  // app/router.js

  import Ember from 'ember';
  import config from './config/environment';

  var Router = Ember.Router.extend({
    location: config.locationType
  });

  Router.map(function() {
    this.route('videos');
  });

EOS

code <<-EOS, :javascript
  // app/routes/videos.js

  import Ember from 'ember';

  export default Ember.Route.extend({
  });

EOS

block <<-EOS
  Templates

    * Associated to a route by the controller
    * Display data from the route's model
    * HTML + Handlebars

EOS

code <<-EOS, "html+handlebars"
  <!-- app/templates/videos.hbs -->

  {{outlet}}
EOS

code <<-EOS, :javascript
  // app/models/video-fixtures.js

  export default [{
    id: "1",
    title: "Wubot",
    url: "https://drive.google.com/a/peertransfer.com/file/d/0B3M9wB1jIlHlOVMxY3NyWC1LcGc/preview",
    publishedDate: new Date('2015-03-17')
  }, {
    id: "2",
    title: "Disallow cloning",
    url: "https://drive.google.com/a/peertransfer.com/file/d/0B3M9wB1jIlHlTTFnYmx6SEl0dVk/preview",
    publishedDate: new Date('2015-04-28')
  }, {
    id: "3",
    title: "Living Expenses",
    url: "https://drive.google.com/a/peertransfer.com/file/d/0B3M9wB1jIlHldENHdXpXbjJZdlU/preview",
    publishedDate: new Date('2015-04-28')
  }, {
    id: "4",
    title: "Living Expenses Wizard",
    url: "https://drive.google.com/a/peertransfer.com/file/d/0B3M9wB1jIlHlM1BkdmJBVmhfeVU/preview",
    publishedDate: new Date('2015-05-20')
  }];

EOS

code <<-EOS, :javascript
  // app/routes/videos.js

  import Ember from 'ember';
  import videos from '../models/video-fixtures';

  export default Ember.Route.extend({
    model: function () {
      return videos;
    }
  });

EOS

code <<-EOS, 'html+handlebars'
  <!-- app/templates/videos.hbs -->

  <h1>Videos</h1>

  {{#each model as |video|}}
  <h2>{{video.title}} <small>{{video.publishedDate}}</small></h2>
  {{/each}}

EOS

section "Working with JS libraries" do
  code <<-EOS, :javascript
    > bower install moment --save

  EOS

  code <<-EOS
    /* ember-cli-build.js */

    /* global require, module */
    var EmberApp = require('ember-cli/lib/broccoli/ember-app');

    module.exports = function(defaults) {
      var app = new EmberApp(defaults, {
        // Add options here
      });

      // Use `app.import` to add additional libraries to the generated
      // output files.
      //
      // If you need to use different assets in different
      // environments, specify an object as the first parameter. That
      // object's keys should be the environment name and the values
      // should be the asset to use in that environment.
      //
      // If the library that you are including contains AMD or ES6
      // modules that you would like to import into your application
      // please specify an object with the list of modules as keys
      // along with the exports of each module as its value.

      app.import('bower_components/moment/moment.js');

      return app.toTree();
    };

  EOS

  block <<-EOS
    Moment.js

    * Now if you type `moment()` in console, you should have access to the `moment` object
    * It is because moment.js is not writted as ES6 module, it is global

  EOS

  code <<-EOS, :javascript
    > ember g helper formatted-date
    installing helper
      create app/helpers/formatted-date.js
    installing helper-test
      create tests/unit/helpers/formatted-date-test.js

  EOS

  code <<-EOS, :javascript
    // app/helpers/formatted-date.js

    /* globals moment */
    import Ember from 'ember';

    export function formattedDate([date, format='LL']) {
      return window.moment(date).format(format);
    }

    export default Ember.Helper.helper(formattedDate);    
  EOS

  code <<-EOS, 'html+handlebars'
    <!-- app/templates/videos.hbs -->

    <h1>Videos</h1>

    {{#each model as |video|}}
    <h2>{{video.title}} <small>{{formatted-date video.publishedDate}}</small></h2>
    {{/each}}
  EOS
end

code <<-EOS, :bash
  > ember g route videos/show --path=:video_id
  installing route
    create app/routes/videos/show.js
    create app/templates/videos/show.hbs
  updating router
    add route videos/show
  installing route-test
    create tests/unit/routes/videos/show-test.js

EOS

code <<-EOS, :javascript
  // app/router.js

  import Ember from 'ember';
  import config from './config/environment';

  var Router = Ember.Router.extend({
    location: config.locationType
  });

  Router.map(function() {
    this.route('videos', function() {
      this.route('show', {
        path: ':video_id'
      });
    });
  });

  export default Router;
EOS

code <<-EOS, 'html+handlebars'
  <!-- app/templates/videos.hbs  -->
  <h1>Videos</h1>

  {{#each model as |video|}}
  <h2>
    {{#link-to 'videos.show' video}}{{video.title}}{{/link-to}}
    <small>{{formatted-date video.publishedDate}}</small>
  </h2>
  {{/each}}

  {{outlet}}
EOS

section "That's all, thanks!" do
end
