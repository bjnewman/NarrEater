import { Component } from '@angular/core';
import { NavController } from 'ionic-angular';
import { NavParams } from 'ionic-angular';

@Component({
  templateUrl: 'build/pages/menuview/menuview.html'
})
export class MenuView {

  constructor(public navCtrl: NavController, private navParams: NavParams) {
    let base64Image = navParams.get('picture');
  }
}
