import {Component, Input, OnInit} from '@angular/core';
import {of} from "rxjs/observable/of";
import {catchError, scan} from "rxjs/operators";
import {HttpClient, HttpHeaders, HttpParams} from '@angular/common/http';
import {Observable} from "rxjs/Observable";
import {HttpEvent} from "@angular/common/http/src/response";
import {HttpObserve} from "@angular/common/http/src/client";

@Component({
    selector: 'jhi-petstore-swagger',
    templateUrl: './petstore-swagger.component.html',
    styleUrls: [
        './api-test.css'
    ]
})
export class PetstoreSwaggerComponent implements OnInit {

    private swaggerTestUrl = 'http://petstore.swagger.io/v2';

    result: string;

    private headers: Headers;

    pets: any[]

    // variant 1
    private httpOptions = {
        headers: new HttpHeaders({'Content-Type': 'application/json'})
    };

    constructor(private http: HttpClient) {
        // variant 2
        this.headers = new Headers();
        this.headers.append('Content-Type', 'application/json');
    }

    ngOnInit() {
    }

    findByStatus(petStatus: string): void {

        this.reset();
        this.http.get<any[]>(`${this.swaggerTestUrl}/pet/findByStatus?status=${petStatus}`)
            .pipe(
                catchError(this.handleError('/findByStatus', [])))
            .subscribe(r => {
                console.log(r);
                this.pets = r
            });
    }

    getById(petId: number): void {

        this.reset();
        this.http.get<any>(`${this.swaggerTestUrl}/pet/${petId}`)
            .pipe(
                catchError(this.handleError('/pet/{:id}', [])))
            .subscribe(r => {
                this.result = JSON.stringify(r);
            });
    }

    addPet(): void {

        this.reset();
        const newPet = {
            "id": 0,
            "category": {
                "id": 10,
                "name": "small pets"
            },
            "name": "Liza",
            "photoUrls": [
                ""
            ],
            "tags": [
                {
                    "id": 1,
                    "name": "small dog"
                }
            ],
            "status": "available"
        };


        this.http.post<any>(`${this.swaggerTestUrl}/pet`, newPet, this.httpOptions)
            .pipe(catchError(this.handleError('/pet', [])));
    }

    createUser(): void {
        this.reset();

        let newUser = {
            "id": 0,
            "username": "string",
            "firstName": "string",
            "lastName": "string",
            "email": "string",
            "password": "string",
            "phone": "string",
            "userStatus": 0
        };

        let options = {
            headers: new HttpHeaders({'Content-Type': 'application/json'}),
            body: newUser,
            // observe: 'response',
            // params: new HttpParams(),
            // reportProgress: false,
            // responseType: 'json',
            // withCredentials: true
        };

        // post<HttpEvent<any>>

        this.http.request(
            'POST',
            `${this.swaggerTestUrl}/user`,
            options
        )
            .map((response: Response) => response)
            .pipe(catchError(this.handleError('/createUser', [])))
            .subscribe((result: Response) => {
                console.log(result);
            })
        ;
    }

    updateUserName(name: string): void {
        this.reset();

        let User = {
            "id": 10,
            "username": "Babay",
            "firstName": "Alex",
            "lastName": "Panov",
            "email": "",
            "password": "123",
            "phone": "123 456",
            "userStatus": 4
        };

        this.http.put(
            `${this.swaggerTestUrl}/user/${name}`,
            this.httpOptions
        )
            .map((response: Response) => response)
            .pipe(catchError(this.handleError('/updateUserName', [])))
            .subscribe((result: Response) => {
                console.log(result);
            })
        ;
    }

    deletePet(id: string): void {

        this.reset();
        this.http.delete(`${this.swaggerTestUrl}/pet/${id}`, this.httpOptions)
            .pipe(catchError(this.handleError('/deletePet', [])))
            .subscribe((result: Response) => {
                console.log(result);
            });
    }

    deleteOrder(id: number): void {

        this.reset();

        this.http.delete(`${this.swaggerTestUrl}/store/order/${id}`, {
            headers: new HttpHeaders({'Content-Type': 'application/json'}),
            observe: 'body'
        })
            .pipe(catchError(this.handleError('/deleteOrder', [])))
            .subscribe((result: Response) => {
                console.log(result);
            });
    }

    /**
     * Handle Http operation that failed.
     * Let the app continue.
     * @param operation - name of the operation that failed
     * @param result - optional value to return as the observable result
     */
    private handleError<T>(operation = 'operation', result?: T) {
        return (error: any): Observable<T> => {

            // TODO: send the error to remote logging infrastructure
            console.error(error); // log to console instead

            // TODO: better job of transforming error for user consumption
            this.log(`${operation} failed: ${error.message}`);

            // Let the app keep running by returning an empty result.
            return of(result as T);
        };
    }

    private log(error: string): void {
        console.log(error);
    }

    private reset(): void {
        this.result = '';
        this.pets = [];
    }
}
