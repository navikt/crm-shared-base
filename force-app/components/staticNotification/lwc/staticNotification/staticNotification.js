import { LightningElement, api, wire, track } from 'lwc';
import { getRecord } from 'lightning/uiRecordApi';

export default class staticNotification extends LightningElement {
    @api recordId;
    @api objectApiName;
    @track fields = [];

    @api title;
    @api field;
    @api variant;
    @api icon;
    @api titleOnTop;

    @track message;
    @track mainCss = 'slds-notify slds-notify_alert slds-theme_alert-texture round ';
    @track titleCss = 'slds-text-title_caps slds-var-m-left_x-small ';

    connectedCallback() {
        if (this.variant === 'error') {
            this.mainCss += 'slds-theme_error';
            this.titleCss += 'slds-text-color_inverse';
        } else if (this.variant === 'info') {
            this.mainCss += 'slds-theme_info';
            this.titleCss += 'slds-text-color_inverse';
        } else {
            // warning as fallback
            this.mainCss += 'slds-theme_warning';
        }

        this.fields = [this.objectApiName + '.' + this.field];
    }

    @wire(getRecord, { recordId: '$recordId', optionalFields: '$fields' })
    wiredRecord({ error, data }) {
        if (data) {
            this.message = data.fields[this.field].value;
        }
    }

    get titleSize() {
        return this.titleOnTop ? 12 : undefined;
    }
}
