Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 47AEE1CDC43
	for <lists+uboot-stm32@lfdr.de>; Mon, 11 May 2020 15:58:45 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 125E5C36B25
	for <lists+uboot-stm32@lfdr.de>; Mon, 11 May 2020 13:58:45 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7AAC8C36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 May 2020 13:58:43 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04BDQb10032491; Mon, 11 May 2020 15:58:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=V/t/sqaUVt8WYPaV6E+rwruuW+72v5FgDMKVjZ7HuIk=;
 b=BH54u/AVUU7whz762Qj71prbnE0cA+QAwSreXDIPOaInNqbplN8JELIw6aJM2KEFqMPz
 LKBrDPCtNLM/R3jMMX0jBTglsPzFloKDgXnZID4fSewJLtuj7yX/FKfU0qDA38OLXJf1
 oDVcwc090ZvTTmx+b5j1gKapLQwRom+7fTQEQ5rRtwdz94PSTVabiKkWRbcMogd2pPRr
 YR5KgqHES5d6GSfEBpFdhhVz3+ry5M4JexZPFcIHOC1Zvx+uP1YR5SzOWQqVx3OPm/iZ
 zgqafE2NPurravVNMehhiCtpb/CqNjHFZ5E0AhHCOse7qdrckMOZ+AcCCX6SHFK0zyL7 dw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30wkdgtep6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 May 2020 15:58:40 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5C80810002A;
 Mon, 11 May 2020 15:58:40 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 520152A9794;
 Mon, 11 May 2020 15:58:40 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 11 May
 2020 15:58:39 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Mon, 11 May 2020 15:58:40 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [Uboot-stm32] [PATCH v2 04/12] board: stm32mp1: update
 management of boot-led
Thread-Index: AQHWJ5xGWdVyR2PMk0+9UeLUjrMgyA==
Date: Mon, 11 May 2020 13:58:39 +0000
Message-ID: <d5b60571-4bc9-8716-fdbd-92f93c64943d@st.com>
References: <20200422122920.19340-1-patrick.delaunay@st.com>
 <20200422142834.v2.4.I15cb0a6245fb4cd5d23371683c2697f794adf306@changeid>
In-Reply-To: <20200422142834.v2.4.I15cb0a6245fb4cd5d23371683c2697f794adf306@changeid>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.51]
Content-ID: <C3D367A697746849893A397328932622@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-11_06:2020-05-11,
 2020-05-11 signatures=0
Cc: Marek Vasut <marex@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Wolfgang Denk <wd@denx.de>
Subject: Re: [Uboot-stm32] [PATCH v2 04/12] board: stm32mp1: update
 management of boot-led
X-BeenThere: uboot-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <uboot-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/uboot-stm32>, 
 <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/uboot-stm32/>
List-Post: <mailto:uboot-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32>, 
 <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


On 4/22/20 2:29 PM, Patrick Delaunay wrote:
> Force boot-led ON and no more rely on default-state.
> This patch avoid device-tree modification for U-Boot.
>
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
> Changes in v2:
> - use CONFIG_IS_ENABLED(LED) everywhere
>
>  arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi |  4 ---
>  arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi |  4 ---
>  board/st/stm32mp1/stm32mp1.c             | 33 ++++++++++++------------
>  3 files changed, 16 insertions(+), 25 deletions(-)
>
> diff --git a/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi b/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi
> index 5844d41c53..c52abeb1e7 100644
> --- a/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi
> +++ b/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi
> @@ -27,10 +27,6 @@
>  			default-state = "off";
>  			status = "okay";
>  		};
> -
> -		blue {
> -			default-state = "on";
> -		};
>  	};
>  };
>  
> diff --git a/arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi b/arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi
> index ed2f024be9..84af7fa47b 100644
> --- a/arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi
> +++ b/arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi
> @@ -28,10 +28,6 @@
>  			default-state = "off";
>  			status = "okay";
>  		};
> -
> -		blue {
> -			default-state = "on";
> -		};
>  	};
>  };
>  
> diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
> index d85a57cee2..6a3e2e64bf 100644
> --- a/board/st/stm32mp1/stm32mp1.c
> +++ b/board/st/stm32mp1/stm32mp1.c
> @@ -260,7 +260,6 @@ int g_dnl_bind_fixup(struct usb_device_descriptor *dev, const char *name)
>  
>  #endif /* CONFIG_USB_GADGET */
>  
> -#ifdef CONFIG_LED
>  static int get_led(struct udevice **dev, char *led_string)
>  {
>  	char *led_name;
> @@ -286,6 +285,9 @@ static int setup_led(enum led_state_t cmd)
>  	struct udevice *dev;
>  	int ret;
>  
> +	if (!CONFIG_IS_ENABLED(LED))
> +		return 0;
> +
>  	ret = get_led(&dev, "u-boot,boot-led");
>  	if (ret)
>  		return ret;
> @@ -293,32 +295,29 @@ static int setup_led(enum led_state_t cmd)
>  	ret = led_set_state(dev, cmd);
>  	return ret;
>  }
> -#endif
>  
>  static void __maybe_unused led_error_blink(u32 nb_blink)
>  {
> -#ifdef CONFIG_LED
>  	int ret;
>  	struct udevice *led;
>  	u32 i;
> -#endif
>  
>  	if (!nb_blink)
>  		return;
>  
> -#ifdef CONFIG_LED
> -	ret = get_led(&led, "u-boot,error-led");
> -	if (!ret) {
> -		/* make u-boot,error-led blinking */
> -		/* if U32_MAX and 125ms interval, for 17.02 years */
> -		for (i = 0; i < 2 * nb_blink; i++) {
> -			led_set_state(led, LEDST_TOGGLE);
> -			mdelay(125);
> -			WATCHDOG_RESET();
> +	if (CONFIG_IS_ENABLED(LED)) {
> +		ret = get_led(&led, "u-boot,error-led");
> +		if (!ret) {
> +			/* make u-boot,error-led blinking */
> +			/* if U32_MAX and 125ms interval, for 17.02 years */
> +			for (i = 0; i < 2 * nb_blink; i++) {
> +				led_set_state(led, LEDST_TOGGLE);
> +				mdelay(125);
> +				WATCHDOG_RESET();
> +			}
> +			led_set_state(led, LEDST_ON);
>  		}
> -		led_set_state(led, LEDST_ON);
>  	}
> -#endif
>  
>  	/* infinite: the boot process must be stopped */
>  	if (nb_blink == U32_MAX)
> @@ -651,6 +650,8 @@ int board_init(void)
>  	if (CONFIG_IS_ENABLED(LED))
>  		led_default_state();
>  
> +	setup_led(LEDST_ON);
> +
>  	return 0;
>  }
>  
> @@ -705,9 +706,7 @@ int board_late_init(void)
>  
>  void board_quiesce_devices(void)
>  {
> -#ifdef CONFIG_LED
>  	setup_led(LEDST_OFF);
> -#endif
>  }
>  
>  /* eth init function : weak called in eqos driver */

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks

Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
