import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { PetstoreSwaggerComponent } from './petstore-swagger/petstore-swagger.component';
import {pagesState} from "./pages.route";
import {RouterModule} from "@angular/router";
import {PrettyJsonModule} from "angular2-prettyjson";

@NgModule({
  imports: [
    CommonModule,
    PrettyJsonModule,
    RouterModule.forChild(
        pagesState
    )
  ],
  declarations: [
      PetstoreSwaggerComponent
  ],
  // providers: [
  //     someService
  // ],
  entryComponents: [
        PetstoreSwaggerComponent
  ]
})
export class MonoSandboxPagesModule { }
