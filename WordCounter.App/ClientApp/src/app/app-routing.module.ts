import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { LetterCounterComponent } from './components/letter-counter/letter-counter.component';

const routes: Routes = [
  { path: '', component: LetterCounterComponent, pathMatch: 'full' }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
