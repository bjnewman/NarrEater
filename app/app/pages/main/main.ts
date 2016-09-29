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
      new Menu("Pete's Pizza", "Cheese Pizza World Famous Chicago-Style Deep Dish or Thin Crust.The Lou Spinach mix (enhanced with garlic, basil & onion), mushrooms and sliced Roma tomatoes covered with three cheeses, on a garlic Buttercrust.The Malnati Chicago Classic Made with Lou's lean sausage, some extra cheese and vine-ripened tomato sauce on Buttercrust.Crustless Pizza Lou's lean sausage as the base and topped with our gooey mozzarella cheese, tomato, and those same favorite toppings. House Salad Iceberg and Romaine lettuce, red cabbage, tomatoes...Malnati Salad Romaine lettuce, tomatoes, black olives, mushrooms, Volpi salami bits and gorgonzola cheese with our Sweet Vinaigrette and romano cheese. Bottled Malnati's Sweet Vinaigrette A 16-oz. bottle of Lou Malnati's Sweet Vinaigrette Salad Dressing. The perfect compliment to your favorite salads."
),
      new Menu("Alyssa's Karaoke Bar & Grill", "I'm sorry Dave, I can't let you do that."),
      new Menu("Matt Bake Me A Cake", "Hello David"),
      new Menu("Duke Greens", "Hello David"),
      new Menu("Ellie's Eatery", "Hello David"),
      new Menu("Av's Naan", "Hello David")
    ];
  }



  menuSelected(menu){
    this.navCtrl.push(MenuView, {menu: menu});
  }
}
