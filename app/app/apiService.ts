import {Injectable} from '@angular/core';
import {Http, Headers, Response, RequestOptions} from '@angular/http';
import {Observable} from 'rxjs/Rx';

@Injectable()
export class ApiService {

  constructor(private http:Http) { }

  parseText(rawImage: string) {
    let body = JSON.stringify({ rawImage });
    let headers = new Headers({ 'Content-Type': 'application/json' });
    let options = new RequestOptions({ headers: headers });
    var response = this.http.post('http://10.86.4.132:3000/menus', body, options).subscribe(
      data => {
      },
      error => console.log(error)
    )
    return response
  }

}
