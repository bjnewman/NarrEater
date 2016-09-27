import { Component } from '@angular/core';
import { NavController } from 'ionic-angular';
import { Main } from '../main/main';
import { TabsPage } from '../tabs/tabs';
import { Welcome } from '../welcome/welcome';

@Component({
  templateUrl: 'build/pages/login/login.html',
})
export class Login {
  public rootPage: any;

  constructor(private navCtrl: NavController) {
    this.rootPage = TabsPage;
  }

  login() {

    this.rootPage = TabsPage;
    this.navCtrl.push(TabsPage, {});
  }

  guestLogin() {
    this.rootPage = TabsPage;
    this.navCtrl.push(TabsPage, {});
  }
}
