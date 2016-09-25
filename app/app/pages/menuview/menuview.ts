import { Component } from '@angular/core';
import { NavController } from 'ionic-angular';
import { NavParams } from 'ionic-angular';

@Component({
  templateUrl: 'build/pages/menuview/menuview.html'
})
export class MenuView {

  private base64Image: string;
  private speechText: string;

  constructor(public navCtrl: NavController, private navParams: NavParams) {
    this.base64Image = this.navParams.get('picture');
    this.speechText = this.navParams.get('text');
  }
}
