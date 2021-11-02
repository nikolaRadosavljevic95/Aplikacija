import { HttpClient, HttpHeaders, HttpParams } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { MessageService } from 'primeng/api';
import { Observable } from 'rxjs';
import { environment } from 'src/environments/environment';
import { BaseService } from './base.service';
import { catchError } from 'rxjs/operators';
import { TextDto } from '../models/text-dto';

const headers = new HttpHeaders({ 'Content-Type': 'application/json' });

@Injectable({
  providedIn: 'root'
})
export class WordCounterService extends BaseService {

  private apiUrl = environment.appUrl + '/api/word-count';

  constructor(protected messageService: MessageService, private http: HttpClient) {
    super(messageService);
  }

  getWordCount(word: string): Observable<number> {
    const params = new HttpParams({ fromObject: { word } });
    const httpOptions = { params, headers };
    return this.http.get<number>(this.apiUrl, httpOptions)
      .pipe(
        catchError(this.handleError<number>('Greška prilikom dohvatanja broja reči'))
      );
  }

  getWordCountFromDatabase(): Observable<TextDto> {
    return this.http.get<TextDto>(`${this.apiUrl}/from-database`)
      .pipe(
        catchError(this.handleError<TextDto>('Greška prilikom dohvatanja broja reči iz baze'))
      );
  }

  getWordCountFromFile(file): Observable<TextDto> {
    return this.http.post<TextDto>(`${this.apiUrl}/from-file`, file).pipe(
      catchError(this.handleError<TextDto>('Greška prilikom dohvatanja broja reči iz fajla'))
    );
  }
}
