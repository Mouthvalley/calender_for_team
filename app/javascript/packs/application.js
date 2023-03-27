// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

import "jquery";
import "popper.js";
import "bootstrap";
import "../stylesheets/application"
import '@fortawesome/fontawesome-free/js/all'

Rails.start()
Turbolinks.start()
ActiveStorage.start()


require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

import 'bootstrap/dist/js/bootstrap';
import 'bootstrap/dist/css/bootstrap';
import 'jquery-ui/ui/widgets/draggable';
import 'jquery-ui/ui/widgets/droppable';
import 'jquery-ui/themes/base/core.css';
import 'jquery-ui/themes/base/draggable.css';
import 'jquery-ui/themes/base/droppable.css';
import 'jquery-ui/themes/base/theme.css';

import 'moment/moment';
import 'moment/locale/ja';
import 'tempusdominus-bootstrap-4/build/css/tempusdominus-bootstrap-4.min.css';
import 'tempusdominus-bootstrap-4/build/js/tempusdominus-bootstrap-4.min';
import 'fullcalendar/main.css';
import 'fullcalendar';