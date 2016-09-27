import { Component } from '@angular/core';
import { NavController } from 'ionic-angular';
import {NavParams} from 'ionic-angular';
import { Menu } from '../../models/menu';
import { TextToSpeech } from 'ionic-native';
import { TabsPage } from '../tabs/tabs';
import { Main } from '../main/main';

@Component({
  templateUrl: 'build/pages/menuview/menuview.html'
})
export class MenuView {
  private title;
  private content;
  public rootPage: any;

  constructor(public navCtrl: NavController, private navParams: NavParams) {
    this.rootPage = TabsPage;
    this.title = this.navParams.get('menu').title;
    this.content = this.navParams.get('menu').content;
  }

  textToSpeech(){
    TextToSpeech.speak({
      text: this.content,
      locale: 'en-GB',
      rate: 1
    })
  }

  goBack(){
    this.navCtrl.pop(Main)
  }
}
