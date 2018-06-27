import { NgModule } from '@angular/core';
import { MySharedLibComponent } from './my-shared-lib.component';

@NgModule({
  imports: [
  ],
  declarations: [MySharedLibComponent],
  exports: [MySharedLibComponent]
})
export class MySharedLibModule { }
