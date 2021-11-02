import { Injectable } from '@angular/core';
import { MessageService } from 'primeng/api';
import { Observable, throwError } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class BaseService {
  constructor(
    protected messageService: MessageService
  ) { }

  protected handleError<T>(operation = 'operation', result?: T) {
    return (error: any): Observable<T> => {
      console.error(error);
      this.log('error', `${operation} `);
      return throwError(new Error());
    };
  }

  protected log(logType: string, message: string) {
    if (logType === 'error') {
      this.messageService.clear();
      this.messageService.add({ severity: 'error', sticky: true, detail: message });
    } else {
      this.messageService.add({ severity: logType, detail: message });
    }
  }
}
