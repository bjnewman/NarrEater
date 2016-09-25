import { Component } from '@angular/core';
import { Main } from '../main/main';
import { MenuView } from '../menuview/menuview';
import { Settings } from '../settings/settings';

@Component({
  templateUrl: 'build/pages/tabs/tabs.html'
})
export class TabsPage {

  public tab1Root: any;
  public tab2Root: any;
  public tab3Root: any;

  constructor() {
    // this tells the tabs component which Pages
    // should be each tab's root Page
    this.tab2Root = Main;
    this.tab3Root = Settings;
  }
}
