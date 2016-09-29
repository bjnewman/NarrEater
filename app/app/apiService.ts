import {Injectable} from '@angular/core';
import {Http, Headers, Response, RequestOptions} from '@angular/http';

@Injectable()
export class ApiService {
  private ipAddress = "192.168.2.85:3000"

  constructor(private http:Http) { }

  parseText(rawImage: string) {
    let body = JSON.stringify({ rawImage });
    let headers = new Headers({ 'Content-Type': 'application/json' });
    let options = new RequestOptions({ headers: headers });
    var response = this.http.post('http://' + this.ipAddress + '/menus', body, options)
    return response
  }

  userAuthenticate(email: string, password: string) {
    let body = JSON.stringify({user: {email: email, password: password} });
    let headers = new Headers({ 'Content-Type': 'application/json'});
    let options = new RequestOptions({ headers: headers });

    options.withCredentials = true

    var response = this.http.post('http://' + this.ipAddress + '/sessions', body, options)

    return response
  }
}
