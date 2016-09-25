import { Component } from '@angular/core';
import { Main } from '../main/main';
import { MenuView } from '../menuview/menuview';
import { Settings } from '../settings/settings';
import { HomePage } from '../home/home';
import { Camera } from 'ionic-native';

@Component({
  templateUrl: 'build/pages/tabs/tabs.html'
})
export class TabsPage {

  public base64Image: string;
  public tab1Root: any;
  public tab2Root: any;
  public tab3Root: any;

  constructor() {
    // this tells the tabs component which Pages
    // should be each tab's root Page
    this.tab1Root = HomePage;
    this.tab2Root = Main;
    this.tab3Root = Settings;
  }

  takePicture() {
    console.log('take picture');
    Camera.getPicture({
      destinationType: Camera.DestinationType.DATA_URL,
      targetWidth: 1000,
      targetHeight: 1000
    }).then((imageData) => {
      this.base64Image = "data:image/jpeg;base64," + imageData;
    }, err => {
      console.log(err)
    })
  }
}
