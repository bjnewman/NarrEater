import { Component } from '@angular/core';
import { ionicBootstrap, Platform } from 'ionic-angular';
import { StatusBar } from 'ionic-native';

import { Main } from './pages/main/main';


@Component({
  template: '<ion-nav [root]="rootPage"></ion-nav>'
})
export class MyApp {
  rootPage: any = Main;

  constructor(public platform: Platform) {
    platform.ready().then(() => {
      // Okay, so the platform is ready and our plugins are available.
      // Here you can do any higher level native things you might need.
      StatusBar.styleDefault();
    });
  }
}

ionicBootstrap(MyApp);
