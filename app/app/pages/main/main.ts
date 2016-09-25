import { Component } from '@angular/core';
import { NavController } from 'ionic-angular';
import { MenuView } from '../menuview/menuview';
import { Menu } from '../../models/menu';

@Component({
  templateUrl: 'build/pages/main/main.html'
})
export class Main {
  menus: any;
  constructor(public navCtrl: NavController) {
    this.menus = [
      new Menu('menu1', 'content1'),
      new Menu('menu2', 'content2'),
      new Menu('menu3', 'content3')
    ];
  }
  menuSelected(menu){
    this.navCtrl.push(MenuView, {menu: menu});
  }
}
