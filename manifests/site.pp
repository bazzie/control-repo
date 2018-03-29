File { backup => false }
node default {

  lookup('classes', {merge => unique}).include

}
