import { Component, OnInit, ViewChild } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { FileUpload } from 'primeng/fileupload';
import { VrstaUnosa } from 'src/app/models/enums/vrsta-unosa';
import { TextDto } from 'src/app/models/text-dto';
import { WordCounterService } from 'src/app/services/word-counter.service';

@Component({
  selector: 'app-letter-counter',
  templateUrl: './letter-counter.component.html',
  styleUrls: ['./letter-counter.component.css']
})

export class LetterCounterComponent implements OnInit {

  options: { label: string, value: number }[] = [
    {
      label: `Ručni unos`,
      value: 0
    },
    {
      label: `Fajl`,
      value: 1
    },
    {
      label: `Iz baze`,
      value: 2
    }
  ];

  form: FormGroup;
  wordCount: number;
  textObj: TextDto = new TextDto();
  izracunajVisible: boolean = false;
  progressSpinner: boolean = false;
  textRequired: string = ``;

  @ViewChild(`file`) private file: FileUpload;

  constructor(private fb: FormBuilder,
    private wordCounterService: WordCounterService) { }

  ngOnInit(): void {
    this.initForm();
  }

  initForm(): void {
    this.form = this.fb.group({
      dropDown: [``, Validators.required],
      text: [``],
      wordCount: [{value: null, disabled: true}]
    });
  }

  get eForm() {
    return this.form.controls;
  }

  onDropdownValueChange(event): void {
    this.resetFormControls();
    if (event.value !== null) {
      switch (event.value.value) {
        case VrstaUnosa['Ručni unos']:
          this.disableTextArea(false);
          this.izracunajVisible = true;
          break;
        case VrstaUnosa['Fajl']:
          this.disableTextArea(true);
          this.izracunajVisible = false;
          break;
        case VrstaUnosa['Iz baze']:
          this.disableTextArea(true);
          this.izracunajVisible = true;
          break;
        default:
          break;
      }
    }
    else {
      this.izracunajVisible = false;
    }
  }

  resetFormControls(): void {
    this.eForm.text.reset();
    this.eForm.wordCount.reset();
  }

  disableTextArea(disable: boolean): void {
    disable ? this.eForm.text.disable() : this.eForm.text.enable();
  }

  uploadVisible(): boolean {
    return this.eForm.dropDown.value?.value === VrstaUnosa['Fajl'];
  }

  onCalculateWordCount(): void {
    // this.progressSpinner = true;
    const vrstaUnosa = this.eForm.dropDown.value.value;
    switch (vrstaUnosa) {
      case VrstaUnosa['Ručni unos']:
        this.manualTextEntry();
        break;
      case VrstaUnosa['Fajl']:
        this.izracunajVisible = false;
        break;
      case VrstaUnosa['Iz baze']:
        this.textFromDatabase();
        break;
      default:
        break;
    }
  }

  manualTextEntry(): void {
    const text = this.eForm.text.value;
    this.wordCounterService.getWordCount(text).subscribe(
      (x) => this.wordCount = x,
      () => this.progressSpinner = false,
      () => {
        this.eForm.wordCount.setValue(this.wordCount);
        this.progressSpinner = false;
      }
    );
  }

  textFromDatabase(): void {
    this.wordCounterService.getWordCountFromDatabase().subscribe(
      (x) => this.textObj = x,
      () => this.progressSpinner = false,
      () => {
        this.eForm.wordCount.setValue(this.textObj.wordCount);
        this.eForm.text.setValue(this.textObj.text);
        this.progressSpinner = false;
      }
    );
  }
  
  onFileUpload(event): void {
    const file = event.files[0];
    const formData: FormData = new FormData();
    formData.append('file', file, file.name);
    this.wordCounterService.getWordCountFromFile(formData).subscribe(
      (x) => this.textObj = x,
      () => {
        this.file.clear();
        this.progressSpinner = false;
      },
      () => {
        this.file.clear();
        this.eForm.wordCount.setValue(this.textObj.wordCount);
        this.eForm.text.setValue(this.textObj.text);
        this.progressSpinner = false;
      }
    );
  }
}