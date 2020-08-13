Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4359C2434DB
	for <lists+uboot-stm32@lfdr.de>; Thu, 13 Aug 2020 09:22:20 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0F0F2C36B24
	for <lists+uboot-stm32@lfdr.de>; Thu, 13 Aug 2020 07:22:20 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 920B1C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Aug 2020 07:22:18 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07D2NINx022636; Thu, 13 Aug 2020 09:22:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=SROG+3ufjA57/lRV3uY3jWC6c3n8Dk1uShgN5lUct7E=;
 b=EDPzrCuTiCts6PNn3+TecPF+mn5dwqu/Fu4aspsumu2uWHmXpnzX/hIQboZmwA6QANjC
 6UA4KUTwoiy/4rX0QjlJCWuHbIuL3dM5v7DznNJlCdckWArXbO49NH9ny3HKs/RE/QjP
 /n7R4hKYIDmMwHp7s0A5x54dup6RhgXuQIrJq7h4QaoS1/jb14Kh2n56sVS00yg0PkRg
 ogJTk0Sujq+eiciQNJY6vchfQ+NkTAws+/unQW11cvLuvCmvWfYWGhcFRwNsKUkX4f9E
 ftbd92QR/wljFmDQjLpGF39Fr35Jq05e6dyj6DT9ZGlwN0jrhoZCoNhFdcDrmCRNpH5x KQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 32uj532wr2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Aug 2020 09:22:17 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4C51910002A;
 Thu, 13 Aug 2020 09:22:17 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4501F21F66F;
 Thu, 13 Aug 2020 09:22:17 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 13 Aug
 2020 09:22:16 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Thu, 13 Aug 2020 09:22:16 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [Uboot-stm32] [PATCH 03/11] board: stm32mp1: use IS_ENABLED to
 prevent ifdef in board_check_usb_power
Thread-Index: AQHWcUJ56LO4yodcnkWBAITDJbgmQQ==
Date: Thu, 13 Aug 2020 07:22:16 +0000
Message-ID: <b5564408-7c4a-1fb3-f220-ff71d5a76371@st.com>
References: <20200731143152.8812-1-patrick.delaunay@st.com>
 <20200731143152.8812-3-patrick.delaunay@st.com>
In-Reply-To: <20200731143152.8812-3-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.46]
Content-ID: <B3614DB1996C504984BE25F1288B03CC@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-13_02:2020-08-11,
 2020-08-13 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 03/11] board: stm32mp1: use IS_ENABLED to
 prevent ifdef in board_check_usb_power
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

On 7/31/20 4:31 PM, Patrick Delaunay wrote:
> Use IS_ENABLED to prevent ifdef in board_check_usb_power.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  board/st/stm32mp1/stm32mp1.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
> index 5c84b09c3e..3182f44598 100644
> --- a/board/st/stm32mp1/stm32mp1.c
> +++ b/board/st/stm32mp1/stm32mp1.c
> @@ -288,7 +288,6 @@ static void __maybe_unused led_error_blink(u32 nb_blink)
>  		hang();
>  }
>  
> -#ifdef CONFIG_ADC
>  static int board_check_usb_power(void)
>  {
>  	struct ofnode_phandle_args adc_args;
> @@ -300,6 +299,10 @@ static int board_check_usb_power(void)
>  	int ret, uV, adc_count;
>  	u32 nb_blink;
>  	u8 i;
> +
> +	if (!IS_ENABLED(CONFIG_ADC))
> +		return -ENODEV;
> +
>  	node = ofnode_path("/config");
>  	if (!ofnode_valid(node)) {
>  		debug("%s: no /config node?\n", __func__);
> @@ -422,7 +425,6 @@ static int board_check_usb_power(void)
>  
>  	return 0;
>  }
> -#endif /* CONFIG_ADC */
>  
>  static void sysconf_init(void)
>  {
> @@ -699,10 +701,8 @@ int board_late_init(void)
>  	}
>  #endif
>  
> -#ifdef CONFIG_ADC
>  	/* for DK1/DK2 boards */
>  	board_check_usb_power();
> -#endif /* CONFIG_ADC */
>  
>  	return 0;
>  }

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks

Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
