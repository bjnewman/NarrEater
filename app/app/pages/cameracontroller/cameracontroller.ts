import { Component, ViewChild } from '@angular/core';
import { NavController } from 'ionic-angular';
import { Camera } from 'ionic-native';
import { MenuView } from '../menuview/menuview'
import { Menu } from '../../models/menu';
import { ApiService } from '../../apiService';

@Component({
  template: "<p>Camera You should not see this</p>",
  providers: [ApiService]
})
export class CameraController {
  public base64Image: string;
  public returnText;


  constructor(public navCtrl: NavController, private api: ApiService) {
    console.log('Initial CameraController')
  }

  takePicture() {
    Camera.getPicture({
      destinationType: Camera.DestinationType.DATA_URL,
      targetWidth: 1000,
      targetHeight: 1000
    }).then((imageData) => {
      this.base64Image = "data:image/jpeg;base64," + imageData;
      this.getText(this.base64Image)
    }, err => {
      alert('Bad or no response')
      console.log(err)
    })
  }

  getText(rawImage: string) {
    this.api.parseText(rawImage).subscribe(
      result => {
        this.returnText = result
        var newMenu = new Menu("test title", this.returnText._body)

        this.navCtrl.push(MenuView, {menu: newMenu})
      },
      error => console.log(error)
    )
    if(!this.returnText) {
      console.log('fail')
    }
  }
}
