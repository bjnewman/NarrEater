import { Component } from '@angular/core';
import { NavController } from 'ionic-angular';
import { MenuView } from '../menuview/menuview';
import { Menu } from '../../models/menu';
import { TabsPage } from '../tabs/tabs';
import { CameraController } from '../cameracontroller/cameracontroller';
import { ApiService } from '../../apiService';

@Component({
  templateUrl: 'build/pages/main/main.html',
  providers: [CameraController, ApiService]
})

export class Main {
  menus: any;

  constructor(public navCtrl: NavController, private CamCont: CameraController) {

    this.menus = [
      new Menu("menu", "Hello David")
    ];
  }

  currentUser(){
    return false
  }

  menuSelected(menu){
    this.navCtrl.push(MenuView, {menu: menu});
  }
}
