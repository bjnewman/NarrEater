import { Component } from '@angular/core';
import { NavController } from 'ionic-angular';
import { Camera } from 'ionic-native';

@Component({
  template: "<p>Camera You should not see this</p>"
})
export class CameraController {
  public base64Image: string;

  constructor(public navCtrl: NavController) {
    console.log('Initial CameraController')
  }

  takePicture() {
      console.log('take picture');
      console.log("this" + this);
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
