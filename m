Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F5E91CDC52
	for <lists+uboot-stm32@lfdr.de>; Mon, 11 May 2020 15:59:03 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 68072C36B25
	for <lists+uboot-stm32@lfdr.de>; Mon, 11 May 2020 13:59:02 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4936FC36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 May 2020 13:59:00 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04BDS0Xx024949; Mon, 11 May 2020 15:58:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=at6iaV7QwxqOBQlsOEQjgr/BfkHFEj0T0bptq613brk=;
 b=In/clCP7CW71KjtGQWpXdTZmvj8//XiKJ3nQmVJm9ZwtC5VbuGqodNeVay2EtHtCeUY3
 VdHfVhG+5nBOTza7dHi/9i6svOkwgYXcCPTR1jusom8coA1jeYYAP9WJUDN+exX6F+0F
 8ZeTxR0XaZbdYWr6Qxk2oyXAGKN6ZerKqZV1ySgJIIcCeTnnfBtiq+5Xj6mq3wvhbpMF
 qzRgtsbxSdnPJ9uxiRxzI+O0XLOEfBWdSyiv8mnSgdJz7TjdOGYfZTLNpMDbxD4hLXR+
 1s+z2QOBV9QGd0fKEaGlLDP4MqnGoCq2IBWrpyMgdEgxPoRb1VIA+s7xpr9R4WYaPRHy Eg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30whn9at9b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 May 2020 15:58:58 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6759610002A;
 Mon, 11 May 2020 15:58:58 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5E2342A9794;
 Mon, 11 May 2020 15:58:58 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 11 May
 2020 15:58:58 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Mon, 11 May 2020 15:58:58 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH v2 02/12] arm: stm32mp: spl: update error management in
 board_init_f
Thread-Index: AQHWGKGnRqESGiOcjkGhvTnxvS9Kr6ii5daA
Date: Mon, 11 May 2020 13:58:58 +0000
Message-ID: <c2dc5bb9-64fa-318c-271f-bd467df80975@st.com>
References: <20200422122920.19340-1-patrick.delaunay@st.com>
 <20200422142834.v2.2.I703cbd885066981e3bab374021d5578dce7cb035@changeid>
In-Reply-To: <20200422142834.v2.2.I703cbd885066981e3bab374021d5578dce7cb035@changeid>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.50]
Content-ID: <5660B3A2E4B8A04EBC21FB2BED08B796@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-11_06:2020-05-11,
 2020-05-11 signatures=0
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Wolfgang Denk <wd@denx.de>
Subject: Re: [Uboot-stm32] [PATCH v2 02/12] arm: stm32mp: spl: update error
 management in board_init_f
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
> Call hang when an error is detected for probe of any driver
> needed for console or DDR init: clk, reset and pincontrol
>
> NB: previous behavior with a return in board_init_f() was not correct;
>     DDR is not initialized and SPL execution can't continue
>
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
> Changes in v2:
> - simplify patch after Wolfgang review, as console init alway failed when
>   drivers can't probe (remove printf after preloader_console_init call)
>
>  arch/arm/mach-stm32mp/spl.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm/mach-stm32mp/spl.c b/arch/arm/mach-stm32mp/spl.c
> index ca4231cd0d..445c5a231c 100644
> --- a/arch/arm/mach-stm32mp/spl.c
> +++ b/arch/arm/mach-stm32mp/spl.c
> @@ -92,19 +92,19 @@ void board_init_f(ulong dummy)
>  	ret = uclass_get_device(UCLASS_CLK, 0, &dev);
>  	if (ret) {
>  		debug("Clock init failed: %d\n", ret);
> -		return;
> +		hang();
>  	}
>  
>  	ret = uclass_get_device(UCLASS_RESET, 0, &dev);
>  	if (ret) {
>  		debug("Reset init failed: %d\n", ret);
> -		return;
> +		hang();
>  	}
>  
>  	ret = uclass_get_device(UCLASS_PINCTRL, 0, &dev);
>  	if (ret) {
>  		debug("%s: Cannot find pinctrl device\n", __func__);
> -		return;
> +		hang();
>  	}
>  
>  	/* enable console uart printing */

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks

Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
