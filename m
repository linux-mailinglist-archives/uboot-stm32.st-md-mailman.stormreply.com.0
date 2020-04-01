Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E19319A68C
	for <lists+uboot-stm32@lfdr.de>; Wed,  1 Apr 2020 09:49:57 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1D1BEC36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed,  1 Apr 2020 07:49:57 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 42766C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  1 Apr 2020 07:49:55 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0317lFXC032686; Wed, 1 Apr 2020 09:49:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=i4t+xD7Bd33NT5TYIdQ1vJEg7uuB0gP2U+7Rcg+kFmc=;
 b=M0pq/WiXUBDFvatdyIQ5+TN9yJkPGaLNUkZ2EkzRC8rjJb4MTdoeqEIgt6TH2Bs6PzBD
 ZWyhVNStG+sIMW1k5sE6+9U1sU5ove/V+ONhr1RJi83LFvdjsMwmRczgGg+CEz0wVHbx
 pZ0X6x8d8vHx0sEziNofRXVa/xiaaG4KsK8xchqR6Zmz/M7fjgOXYZKmbWZOFD/Mad56
 7vCovTXL0v4u43rPVZ0HIKtM5ta49h10+Yl6w+Eyy6Fce6lCAky6GhT16w3na6cXoB5t
 q0+/IrUYQOHFIJD2IGbjECjqbFfCXaf5bpau7HVq8VF8MAt15QHXH71/ELWNYwKHm5sV nw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 301vkduyre-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Apr 2020 09:49:52 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5AC6810002A;
 Wed,  1 Apr 2020 09:49:49 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 501CD21BA79;
 Wed,  1 Apr 2020 09:49:49 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 1 Apr
 2020 09:49:48 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Wed, 1 Apr 2020 09:49:48 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [Uboot-stm32] [PATCH 08/16] board: stm32mp1: update management
 of boot-led
Thread-Index: AQHWB/oeT2J9ECB910iORyojuKtx7A==
Date: Wed, 1 Apr 2020 07:49:48 +0000
Message-ID: <4e9720f0-0694-ee11-4eeb-0bf7e7b93a82@st.com>
References: <20200331180330.1.Ied6708bad5048382a57618f95d67c549aae49f42@changeid>
 <20200331180330.8.I15cb0a6245fb4cd5d23371683c2697f794adf306@changeid>
In-Reply-To: <20200331180330.8.I15cb0a6245fb4cd5d23371683c2697f794adf306@changeid>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.51]
Content-ID: <F92667672CC0BB4CB3783D589A1AF90F@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-03-31_07:2020-03-31,
 2020-03-31 signatures=0
Cc: Marek Vasut <marex@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 08/16] board: stm32mp1: update management
 of boot-led
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

Hi Patrick

On 3/31/20 6:04 PM, Patrick Delaunay wrote:
> Force boot-led ON and no more rely on default-state.
> This patch avoid device-tree modification for U-Boot.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi |  4 ----
>  arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi |  4 ----
>  board/st/stm32mp1/stm32mp1.c             | 10 ++++++++--
>  3 files changed, 8 insertions(+), 10 deletions(-)
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
> index 8ed09ae24a..6ca47509b3 100644
> --- a/board/st/stm32mp1/stm32mp1.c
> +++ b/board/st/stm32mp1/stm32mp1.c
> @@ -280,9 +280,11 @@ static int get_led(struct udevice **dev, char *led_string)
>  
>  	return 0;
>  }
> +#endif
>  
>  static int setup_led(enum led_state_t cmd)
>  {
> +#ifdef CONFIG_LED
>  	struct udevice *dev;
>  	int ret;
>  
> @@ -292,8 +294,10 @@ static int setup_led(enum led_state_t cmd)
>  
>  	ret = led_set_state(dev, cmd);
>  	return ret;
> -}
> +#else
> +	return 0;
>  #endif
> +}
>  
>  static void __maybe_unused led_error_blink(u32 nb_blink)
>  {
> @@ -648,8 +652,10 @@ int board_init(void)
>  
>  	sysconf_init();
>  
> -	if (CONFIG_IS_ENABLED(CONFIG_LED))
> +	if (CONFIG_IS_ENABLED(CONFIG_LED)) {
>  		led_default_state();
> +		setup_led(LEDST_ON);
> +	}
>  
>  	return 0;
>  }

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
