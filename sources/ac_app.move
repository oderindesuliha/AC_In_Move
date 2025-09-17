/// Module: ac_app
module ac_app::ac_app {

use std::string::String;



public struct Airconditioner has store, drop {
    isOn: bool,
    default_temperature: u8,
}

public fun new(ac_isOn: bool): Airconditioner {
    Airconditioner {
        isOn: ac_isOn,
        default_temperature: 24,
    }
}

public fun turnOn(ac: &mut Airconditioner): bool {
    if(ac.isOn == false){
        ac.isOn = true;
        true
    } else {
        false
    }

}

public fun turnOff(ac: &mut Airconditioner): bool {
    if(ac.isOn == true){
        ac.isOn = false;
        false
    } else {
        true
    }

}
public fun ac_state(ac: &Airconditioner): bool {
    if (ac.isOn) {
        true
    } else {
        false
    }
}   

public fun increase_temperature(ac: &mut Airconditioner): String {
    if (!ac.isOn) {
        return std::string::utf8(b"Invalid Operation")
    };
    if (ac.default_temperature >= 30) {
        abort 1
    };
    ac.default_temperature = ac.default_temperature + 1;
    ac.default_temperature.to_string()
}
   
public fun temperature(ac: &Airconditioner): u8 {
    ac.default_temperature
}

public fun decrease_temperature(ac: &mut Airconditioner): String {
    if (!ac.isOn) {
        return std::string::utf8(b"Invalid Operation")
    };
    if (ac.default_temperature <= 16) {
        abort 2
    };
    ac.default_temperature = ac.default_temperature - 1;
    ac.default_temperature.to_string()

    }
}