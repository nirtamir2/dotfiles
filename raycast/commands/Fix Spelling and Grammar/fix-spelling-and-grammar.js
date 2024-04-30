#!/usr/bin/env node

// Required parameters:
// @raycast.schemaVersion 1
// @raycast.title Fix Spelling and Grammar
// @raycast.mode silent

// Optional parameters:
// @raycast.icon 🤖

// Documentation:
// @raycast.description Fix Spelling and Grammar
// @raycast.author Nir Tamir
// @raycast.authorURL https://nirtamir.com

const child_process = require('child_process');
const textFromClipboard = child_process.execSync("pbpaste").toString();


fetch('http://127.0.0.1:11434/api/generate', {
    headers: {'Content-Type': 'application/json'},
    method: 'POST',
    body: JSON.stringify({
        model: 'phi3',
        stream: false,
        prompt: `You are a grammar fixing program.
         You get an input within --- and return the fixed text in json format {"text": "YOUR_FIXED_TEXT"}.
          Revise the given text to correct any grammatical errors.
                 Fixing sentence structure, punctuation, verb tense consistency, and word usage.
                  Make it readable and clear.
                   If sentence does not have pronouns like 'I' or 'you' add them in the process of fixing.
                 if the text had spaces or new lines keep them as in original version.
                 
                 IMPORTANT: RETURN ONLY THE JSON OUTPUT! NO EXPLANATIONS!
                  
                  Example: 
                  ---I lov yu---
                  Will result: {"text": "I love you"}
                  
                  ---How are you---
                  Will result: {"text": "How are you?"}
                  
                  Your input is: ---${textFromClipboard}---`
    })
}).then(response => response.json()).then(data => {
    const fixedText = data.response;

    try {
        const {text} = JSON.parse(fixedText);
        console.log(text);

        //  Copy to clipboard
        const pbCopyProc = child_process.spawn('pbcopy');
        pbCopyProc.stdin.write(text);
        pbCopyProc.stdin.end();

    } catch (e) {
        console.log("Failed")
    }
});
