import { Component } from '@angular/core';
import { NavController } from 'ionic-angular';
import { Main } from '../main/main';
import { TabsPage } from '../tabs/tabs';
import { ApiService } from '../../apiService';
import 'rxjs/add/operator/map';

@Component({
  templateUrl: 'build/pages/login/login.html',
})
export class Login {
  public rootPage: any;
  public loggedIn: boolean;

  constructor(private navCtrl: NavController, private api: ApiService) {
    this.rootPage = TabsPage;
    this.loggedIn = false;
  }

  login(email: string, password: string) {
    console.log('login pressed' + email)
    var response = this.api.userAuthenticate(email, password)
    response.subscribe(
      res => {
        if(res.json()['response']['login']){
          this.loggedIn = true
          this.rootPage = TabsPage;
          this.navCtrl.push(TabsPage, {});
        } else {
          this.loggedIn = false
        }
      },
      error => {
        console.log("error: " + error)
      }
    )
  }

  guestLogin() {
    this.rootPage = TabsPage;
    this.navCtrl.push(TabsPage, {});
  }
}
