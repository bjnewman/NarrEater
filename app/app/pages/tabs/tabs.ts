// Ionic imports
import { Component, ViewChild } from '@angular/core';
import { Camera } from 'ionic-native';
// Page imports
import { Main } from '../main/main';
import { MenuView } from '../menuview/menuview';
import { Settings } from '../settings/settings';
import { CameraController } from '../cameracontroller/cameracontroller'
import { ApiService } from '../../apiService';

@Component({
  templateUrl: 'build/pages/tabs/tabs.html',
  providers: [CameraController, ApiService]
})
export class TabsPage {
  // @ViewChild('navTabs') tabRef: Tabs

  public base64Image: string;
  public tab1Root: any;
  public tab2Root: any;
  public tab3Root: any;

  constructor(private CamCont: CameraController) {
    // this tells the tabs component which Pages
    // should be each tab's root Page
    this.tab1Root = Settings;
    this.tab2Root = Main;
    this.tab3Root = CameraController;
  }
}
