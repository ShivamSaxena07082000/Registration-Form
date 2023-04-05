import QtQuick 2.15
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.3
import QtQuick.Dialogs 1.3
ColumnLayout{
    id:columnlayoutID;
    anchors.centerIn: parent;
    spacing: 14;
    anchors.margins: 25;
    Layout.fillWidth:true;
    Layout.fillHeight: true;
    states: [
        State{
            name: "portrait" ;
            PropertyChanges {target: columnlayoutID;Layout.alignment: Qt.AlignLeft}
        },
        State{
            name: "landscape" ;
            PropertyChanges {target: columnlayoutID; }
        }
    ]
    Text{
        id:textID;
        text:"Registration Form"
        font.pointSize: 25;
        font.family:"Arial";
        color:"black";
        Layout.alignment: Qt.AlignHCenter;
    }
    Row{
        x:420;
        spacing:60;
        Label{
            id:firstLabelID;
            text:"User_id";
            font.pointSize: 12;
            font.family: "Helvetica";
            y:10;
        }
        TextField{
            id:firstTextID;
            width:350;
            height:50;
            placeholderText: "Required and must be of length 5 to 12 only Integers";
            onEditingFinished:   {
                if(firstTextID.text == "")
                {
                    inputMask=firstTextID.text;
                    onTextChanged: acceptableInput ? label1firstID.text = qsTr("User ID is required") : label1firstID.text = qsTr("User ID is required")
                }
                else
                {
                    if(firstTextID.text.length>5 && firstTextID.text.length<12)
                    {
                        for(var i=0;i<firstTextID.text.length;i++)
                        {
                            var user_check=  /^[0-9]*$/;
                            if(user_check.test(firstTextID.text))
                            {
                                user=1;
                            }
                            else
                            {
                                user=0;
                                break;
                            }
                        }
                        if(user==1)
                        {
                            label1firstID.text="";
                            inputMask= firstTextID.text;
                            onTextChanged: acceptableInput ? firstsecondID.text = qsTr("User ID is acceptable") : firstsecondID.text = qsTr("User ID not acceptable")
                        }
                        else{
                            firstTextID.text="";
                            inputMask=firstTextID.text
                            onTextChanged: acceptableInput ? label1firstID.text = qsTr("Enter a digits only") : label1firstID.text = qsTr("Enter a digits only")
                        }
                    }
                    else{
                        firstTextID.text="";
                        inputMask=firstTextID.text
                        onTextChanged: acceptableInput ? label1firstID.text = qsTr("User ID not acceptable length should be 5-12") : label1firstID.text = qsTr("User ID not acceptable length should be 5-12")
                    }
                }
            }
        }
        Item{
            x:480;y:10;
            Label{
                id:firstsecondID;
                font.pointSize: 10;
                font.family: "Helvetica"
                y:10;
                color:"green";
            }
            Label{
                id:label1firstID;
                font.pointSize: 10;
                font.family: "Helvetica";
                y:10;
                color:"red";
            }
        }
    }
    Row{
        x:220;
        spacing:40;
        Label{
            id:secondLabelID;
            text:"Password"
            font.pointSize: 12;
            font.family: "Helvetica";
            y:10;
        }
        TextField{
            id:secondTextID;
            width:350;
            height:50;
            placeholderText: "Required and must be of length 7 to 12"
            echoMode: TextInput.Password;
            onEditingFinished: {
                if(secondTextID.text == "")
                {
                    inputMask=secondTextID.text
                    onTextChanged: acceptableInput ? label1secondID.text = qsTr("Password is Required") : label1secondID.text = qsTr("Password is not required")
                }
                else{
                    if(secondTextID.text.length>7 && secondTextID.text.length<12 )
                    {
                        label1secondID.text="";
                        inputMask=secondTextID.text
                        onTextChanged: acceptableInput ? labelsecondID.text = qsTr("Password acceptable") : labelsecondID.text = qsTr("Password not acceptable")
                    }
                    else{
                        secondTextID.text="";
                        inputMask=secondTextID.text
                        onTextChanged: acceptableInput ? label1secondID.text = qsTr("Password not acceptable length(7-12)") : label1secondID.text = qsTr("Password not acceptable")
                    }
                }
            }
        }
        Item{
            x:480;y:12;
            Label{
                id:labelsecondID;
                font.pointSize: 10;
                font.family: "Helvetica"
                y:10;
                color:"green"
            }
            Label{
                id:label1secondID;
                font.pointSize: 10;
                font.family: "Helvetica"
                y:10;
                color:"red"
            }
        }
    }
    Row{
        x:10;
        spacing:70;
        Label{
            id:thirdLabelID;
            text:"Name"
            font.pointSize: 12;
            font.family: "Helvetica"
            y:10;
        }
        TextField{
            id:thirdTextID;
            width:350;
            height:50;
            placeholderText: "Required an alphabets only"
            onEditingFinished:{
                if(thirdTextID.text == "")
                {
                    inputMask=thirdTextID.text
                    onTextChanged: acceptableInput ? label21secondID.text = qsTr("Name is Required") : label21secondID.text = qsTr("Name is not required")
                }
                else
                {
                    for(var i=0;i<thirdTextID.length;i++)
                    {
                        var name_check=  /^[a-zA-Z]*$/;
                        if(name_check.test(thirdTextID.text))
                        {
                            a=1;
                        }
                        else{
                            a=0;
                            break;
                        }
                    }
                    if(a==1)
                    {
                        label21secondID.text="";
                        inputMask=thirdTextID.text
                        onTextChanged: acceptableInput ? label2secondID.text = qsTr("Name is acceptable") : label2secondID.text = qsTr("Name is not acceptable")
                    }
                    else{
                        thirdTextID.text="";
                        inputMask=thirdTextID.text
                        onTextChanged: acceptableInput ? label21secondID.text = qsTr("Enter alphabets only") : label21secondID.text = qsTr("Enter Alphabets only")
                    }
                }
            }
        }
        Item{
            x:480;y:14;
            Label{
                id:label2secondID;
                font.pointSize: 10;
                font.family: "Helvetica"
                y:6;
                color:"green"
            }
            Label{
                id:label21secondID;
                font.pointSize: 10;
                font.family: "Helvetica"
                y:10;
                color:"red"
            }
        }
    }
    Row{
        x:220;
        spacing:50;
        Label{
            id:fourthLabelID;
            text:"Address"
            font.pointSize: 12;
            font.family: "Helvetica"
            y:10;
        }
        TextField{
            id:fourthTextID;
            width:350;
            height:50;
            placeholderText: "Optional"
            onEditingFinished: {
                if(fourthTextID.text == "")
                {
                    inputMask=fourthTextID.text
                    onTextChanged: acceptableInput ? label41fourthID.text = qsTr("Address is empty") : label41fourthID.text = qsTr("Address is empty")
                }
                else{
                    label41fourthID.text="";
                    inputMask=fourthTextID.text
                    onTextChanged: acceptableInput ? label4fourthID.text = qsTr("Address filled") : label4fourthID.text = qsTr("It is optional")
                }
            }
        }
        Item{
            x:480;y:16;
            Label{
                id:label4fourthID;
                font.pointSize: 10;
                font.family: "Helvetica"
                y:6;
                color:"green"
            }
            Label{
                id:label41fourthID;
                font.pointSize: 10;
                font.family: "Helvetica"
                y:6;
                color:"red"
            }
        }
    }
    Row{
        x:220;
        spacing:50;
        Label{
            id:fifthLabelID;
            text:"Country"
            font.pointSize: 12;
            font.family: "Helvetica"
            y:10;
        }
        ComboBox{
            id:fifthTextID;
            currentIndex: -1;
            model : ListModel {
                id:listmodelID;
                ListElement { text:"India" }
                ListElement { text:"China"}
                ListElement { text:"Russia"}
                ListElement { text:"Europe"}
                ListElement {text:"Australia"}
                ListElement {text:"United States"}
                ListElement {text:"Indonesia"}
                ListElement {text:"Pakistan"}
                ListElement { text:"Brazil" }
                ListElement { text:"Nigeria"}
                ListElement { text:"Bangladesh"}
                ListElement { text:"Mexico"}
                ListElement {text:"Japan"}
                ListElement {text:"Ethiopia"}
                ListElement {text:"Philippines"}
                ListElement {text:"Egypt"}
            }
            onCurrentIndexChanged: {
                country_str=listmodelID.get(fifthTextID.currentIndex).text
            }
            width:350;
            height:50;
            x:150;
            TextField{
                id:comboTextID;
                width:310;
                height:50;
            }
        }
    }
    Row{
        x:220;
        spacing:40;
        Label{
            id:sixthLabelID;
            text:"ZIP_Code"
            font.pointSize: 12;
            font.family: "Helvetica"
            y:10;
        }
        TextField{
            id:sixthTextID;
            placeholderText: "Required must be numeric only"
            width:350;
            height:50;
            onEditingFinished: {
                if(sixthTextID.text=="")
                {
                    inputMask=sixthTextID.text
                    onTextChanged: acceptableInput ? label61sixthID.text = qsTr("ZIP Code is Required") : label61sixthID.text = qsTr("ZIP Code is Required")
                }
                else
                {
                    for(var i=0;i<sixthTextID.length;i++)
                    {
                        var zip_check=  /^[0-9]*$/;
                        if(zip_check.test(sixthTextID.text))
                        {
                            a=1;
                        }
                        else{
                            a=0;
                            break;
                        }
                    }
                    if(a==1)
                    {
                        label61sixthID.text="";
                        inputMask=sixthTextID.text
                        onTextChanged: acceptableInput ? label6sixthID.text = qsTr("ZIP Code acceptable") : label6sixthID.text = qsTr("ZIP Code not  acceptable")
                    }
                    else{
                        sixthTextID.text="";
                        inputMask=sixthTextID.text
                        onTextChanged: acceptableInput ? label61sixthID.text = qsTr("Enter Numeric Values Only") : label61sixthID.text = qsTr("Enter Numeric Values Only")
                    }
                }
            }
        }
        Item{
            x:480;y:18;
            Label{
                id:label6sixthID;
                font.pointSize: 10;
                font.family: "Helvetica"
                y:6;
                color:"green"
            }
            Label{
                id:label61sixthID;
                font.pointSize: 10;
                font.family: "Helvetica"
                y:6;
                color:"red"
            }
        }
    }
    Row{
        x:220;
        spacing:70;
        Label{
            id:seventhLabelID;
            text:"Email"
            font.pointSize: 12;
            font.family: "Helvetica"
            y:10;
        }
        TextField{
            id:seventhTextID;
            placeholderText: "Required must be valid email only"
            width:350;
            height:50;
            onEditingFinished: {
                if(seventhTextID.text == "")
                {
                    inputMask=seventhTextID.text
                    onTextChanged: acceptableInput ? label71seventhID.text = qsTr("Email is Required") : label71seventhID.text = qsTr("Email is not required")
                }
                else
                {
                    var email_check= new RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$");
                    console.log(email_check.test(seventhTextID.text));
                    if(email_check.test(seventhTextID.text))
                    {
                        label71seventhID.text="";
                        inputMask=seventhTextID.text
                        onTextChanged: acceptableInput ? label7seventhID.text = qsTr("Email is acceptable") : label7seventhID.text = qsTr("Email is  acceptable")
                    }
                    else
                    {
                        label71seventhID.text="";
                        seventhTextID.text="";
                        inputMask=seventhTextID.text
                        onTextChanged: acceptableInput ? label71seventhID.text = qsTr("Enter a valid email") : label71seventhID.text = qsTr("Enter a valid email");
                    }
                }
            }
        }
        Item{
            x:480;y:20;
            Label{
                id:label7seventhID;
                font.pointSize: 10;
                font.family: "Helvetica";
                y:6;
                color:"green";
            }
            Label{
                id:label71seventhID;
                font.pointSize: 10;
                font.family: "Helvetica";
                y:6;
                color:"red";
            }
        }
    }
    Row{
        x:220;
        spacing:130;
        Label{
            id:eightLabelID;
            text:"Sex";
            font.pointSize: 12;
            font.family: "Helvetica"
            y:10;
        }
        RadioButton{
            id:maleID;
            text:"Male"
            onClicked: {
                if(maleID.checked)
                {
                    radio_str = maleID.checked ? maleID.text : femaleID.text;
                }
            }
        }
        RadioButton{
            id:femaleID;
            text:"Female";
            onClicked:{
                if(femaleID.checked){
                    radio_str = femaleID.checked ? femaleID.text : maleID.text;
                }
            }
        }
    }
    Row{
        x:220;
        spacing:100;
        Label{
            id:ninthLabelID;
            text:"Language"
            font.pointSize: 12;
            font.family: "Helvetica";
            y:10;
        }
        CheckBox{
            text:"English"
            id:firstCheckID;
            onClicked: {
                if(firstCheckID.checked){
                    check_str = firstCheckID.checked ? firstCheckID.text : secondCheckID.text;
                }
            }
        }
        CheckBox{
            text:"Non English"
            id:secondCheckID;
            onClicked:{
                if(secondCheckID.checked)
                {
                    check_str = secondCheckID.checked ? secondCheckID.text : firstCheckID.text;
                }
            }
        }
    }
    Row{
        x:220;
        spacing:60;
        Label{
            id:tenthLabelID;
            text:"About"
            font.pointSize: 12;
            font.family: "Helvetica"
            y:10;
        }
        TextField{
            id:textareaID;
            width:350;
            height:150;
            placeholderText: "Optional"
            font.family: "Helvetica"
            font.pointSize: 12
        }
    }
    Row{
        x:1220;
        spacing:60;
        Layout.alignment: Qt.AlignHCenter;
        Button{
            id:buttonID;
            width:150;
            height:50;
            text:"Submit"
            font.bold: true
            font.pointSize: 12
            Layout.fillWidth: true;
            Layout.fillHeight: true;
            onClicked:{
                if(firstTextID.text=="" || secondTextID.text=="" || thirdTextID.text=="" || fourthTextID.text=="" || country_str=="" || sixthTextID.text=="" || seventhTextID.text=="" || radio_str=="" || check_str=="" || textareaID.text=="")
                {
                    messageID1.open();
                }
                else
                {
                    messageID.open();
                    classA.addvalues(firstTextID.text,secondTextID.text,thirdTextID.text,fourthTextID.text,country_str,sixthTextID.text,seventhTextID.text,radio_str,check_str,textareaID.text);
                    classA.showvalues();
                    stackview.push("TableContents.qml");
                }
            }
        }
    }
    StackView{
        id:stackview;
    }
    MessageDialog{
        id:messageID;
        title:"Registration Form"
        text:"Your form has been submitted.\n Thank You!!"
        standardButtons: Dialog.Ok
    }
    MessageDialog{
        id:messageID1;
        title:"Registration Form"
        text:"All fields are required"
        standardButtons: Dialog.Ok
    }
}

