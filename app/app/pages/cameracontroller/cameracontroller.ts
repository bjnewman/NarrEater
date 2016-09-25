import { Component } from '@angular/core';
import { NavController } from 'ionic-angular';
import { Http } from '@angular/http';
import { Headers, RequestOptions } from '@angular/http';
import { Camera } from 'ionic-native';
import { MenuView } from '../menuview/menuview'
import { Menu } from '../../models/menu';

@Component({
  template: "<p>Camera You should not see this</p>"
})
export class CameraController {
  public base64Image: string;
  public returnText;

  constructor(public navCtrl: NavController, private http: Http) {
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
      // this.navCtrl.parent.select(1);
    })
  }

  getText(rawImage: string) {
    let body = JSON.stringify({ rawImage });
    let headers = new Headers({ 'Content-Type': 'application/json' });
    let options = new RequestOptions({ headers: headers });
    var response = this.http.post('http://192.168.2.85:3000/users', body, options).subscribe(
      data => this.returnText = data,
      error => console.log(error)
    )
    this.navCtrl.push(MenuView, {picture: this.base64Image, text: this.returnText._body});
    // var newMenu = new Menu("test title", this.returnText._body)
    // this.navCtrl.push(MenuView, {menu: newMenu})
  }
}
