/*
 * EnGenius EAP350 board support
 *
 * Copyright (C) 2017 Robert Marko <robimarko@gmail.com>
 *
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License version 2 as published
 * by the Free Software Foundation.
 */
 
#include <linux/gpio.h>
#include <linux/mtd/mtd.h>
#include <linux/mtd/partitions.h>
#include <linux/platform_device.h>

#include <asm/mach-ath79/ar71xx_regs.h>
#include <asm/mach-ath79/ath79.h>

#include "common.h"
#include "dev-eth.h"
#include "dev-gpio-buttons.h"
#include "dev-leds-gpio.h"
#include "dev-m25p80.h"
#include "dev-wmac.h"
#include "machtypes.h"
/*
#define EAP350_KEYS_POLL_INTERVAL     20
#define EAP350_KEYS_DEBOUNCE_INTERVAL	(3 * EAP300V2_KEYS_POLL_INTERVAL)

tatic struct gpio_led eap350_leds_gpio[] __initdata = {
	{
		.name		= "engenius:blue:power",
		.gpio		= EAP300V2_GPIO_LED_POWER,
		.active_low	= 1,
	}, {
		.name		= "engenius:blue:lan",
		.gpio		= EAP300V2_GPIO_LED_LAN,
		.active_low	= 1,
	}, {
		.name		= "engenius:blue:wlan",
		.gpio		= EAP300V2_GPIO_LED_WLAN,
		.active_low	= 1,
	}
};

static struct gpio_keys_button eap350_gpio_keys[] __initdata = {
	{
		.desc		= "reset",
		.type		= EV_KEY,
		.code		= KEY_RESTART,
		.debounce_interval = EAP350_KEYS_DEBOUNCE_INTERVAL,
		.gpio		= EAP350_GPIO_BTN_RESET,
		.active_low	= 1,
	}
};
*/
static void __init eap350_setup(void)
{
