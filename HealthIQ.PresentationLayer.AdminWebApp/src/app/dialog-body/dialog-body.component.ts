import { Component, OnInit, Inject } from '@angular/core';
import { MatDialogRef, MAT_DIALOG_DATA } from "@angular/material/dialog";
import { UserMaster } from '../shared/components/user/user.model';

@Component({

  selector: "dialog-b",
  templateUrl: './dialog-body.component.html',
  styleUrls: ['./dialog-body.component.css']
})
export class DialogBodyComponent {
  data: UserMaster;
  cancelButtonText = "Cancel"
  constructor(

    @Inject(MAT_DIALOG_DATA) private injecteddata: UserMaster,
    private dialogRef: MatDialogRef<DialogBodyComponent>) {
      debugger;
    if (injecteddata) {
      this.data = injecteddata
      
    }
//    this.dialogRef.updateSize('50%','50%')
  }

  onConfirmClick(): void {
    this.dialogRef.close(true);
  }

}
