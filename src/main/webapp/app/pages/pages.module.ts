import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { PetstoreSwaggerComponent } from './petstore-swagger/petstore-swagger.component';
import {pagesState} from "./pages.route";

@NgModule({
  imports: [
    CommonModule,
      // pagesState
  ],
  declarations: [PetstoreSwaggerComponent],
  entryComponents: [
        PetstoreSwaggerComponent
  ]
})
export class MonoSandboxPagesModule { }
