import { Component } from '@angular/core';
import { ionicBootstrap, Platform } from 'ionic-angular';
import { StatusBar } from 'ionic-native';
import {Login} from './pages/login/login';
import { Main } from './pages/main/main';
import { TabsPage } from './pages/tabs/tabs'


@Component({
  template: '<ion-nav [root]="rootPage"></ion-nav>'
  })

export class MyApp {

  public rootPage: any;

  constructor(public platform: Platform) {
    this.rootPage = Login;
    platform.ready().then(() => {
      // Okay, so the platform is ready and our plugins are available.
      // Here you can do any higher level native things you might need.
      StatusBar.styleDefault();
    });
  }
}

ionicBootstrap(MyApp);
