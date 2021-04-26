import { LightningElement, api, track, wire } from 'lwc';
import { loadScript } from 'lightning/platformResourceLoader';
import markedJs from '@salesforce/resourceUrl/markdownParser';
import { getRecord } from 'lightning/uiRecordApi';

export default class MarkdownParser extends LightningElement {
    isRendered = false;

    @api recordId;
    @api objectApiName;

    @api fieldName;
    @track fields = [];

    @api icon;
    @api title;

    @track empty = false;

    @track body;

    connectedCallback() {
        this.fields = [this.objectApiName + '.' + this.fieldName];
    }

    renderedCallback() {
        if (!this.isRendered) {
            this.isRendered = true;

            loadScript(this, markedJs).then(() => {
                this.renderMarkdown();
            });
        }
    }

    @wire(getRecord, { recordId: '$recordId', optionalFields: '$fields' })
    wiredRecord({ error, data }) {
        if (data) {
            this.body = data.fields[this.fieldName].value;
            this.renderMarkdown();
        }
    }

    renderMarkdown() {
        try {
            if (this.body === null) {
                this.empty = true;
            }
            let formattedData = marked(this.body);
            var last = formattedData.substr(formattedData.length - 5);
            if (!last.includes('</p>')) {
                formattedData += '<p></p>';
            }
            this.template.querySelector('div').innerHTML = formattedData;
        } catch (error) {}
    }
}
