import 'dart:convert';

import 'package:flutter/material.dart';

const imagePickOptions = ["Open Camera", "Pick From Gallery"];

extension ContextMethods on BuildContext {
  isThereCurrentDialogShowing() => ModalRoute.of(this)?.isCurrent != true;
}
extension JsonOps on JsonCodec {
  Map? tryDecode(String source){
    try{
      return json.decode(source);
    }catch(e){
      return null;
    }
  }
}