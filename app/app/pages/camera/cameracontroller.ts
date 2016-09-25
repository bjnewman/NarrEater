import { Component } from '@angular/core';
import { NavController } from 'ionic-angular';

@Component({
    
})

export class CameraController {
  constructor(public navCtrl: NavController) {
    this.navCtrl.parent.select(1);
  }
}
