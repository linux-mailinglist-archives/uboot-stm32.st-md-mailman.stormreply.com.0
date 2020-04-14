Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CE57B1A7B59
	for <lists+uboot-stm32@lfdr.de>; Tue, 14 Apr 2020 14:53:38 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 98ADBC36B0B
	for <lists+uboot-stm32@lfdr.de>; Tue, 14 Apr 2020 12:53:38 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4AE45C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Apr 2020 12:53:37 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03ECljQg005559; Tue, 14 Apr 2020 14:53:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=YKBhvWztEX6hqIwL+pkUs2Qy9V4brc5dT6xQKA1GUJc=;
 b=Ry3yNf9ybl8OHppaUDzEKZHhiAVR9nF/QeIzo9NEba9ErgCfBT2wZTT9glCAVInOI+rk
 5qlpA3XZ7mW2sL3GFuoPrPu6qCfFtjH6ZXVjj51rTVTSHNonf3GFXlG3dbxH8GilF99d
 WMDxO84m6pEdfMZh3WrvLU5QgwknOh0XxFGWabYsGFxM+FUMs/1esUw8QdgXmV4UdQPx
 FwF2emtJ1yuY0GYkkzy7XBtflHg1shS9h5QdROuo/rEdiN7fBGp1skBF1lxXek8rFsB5
 cZWmR3smGSfv6IMvmx9Wlo0zI3yEkTMeoDM5ZMKJtk0yIc5zpaM4c4VSdfqg2JXdYkuj Kw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30b5sjwr78-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Apr 2020 14:53:34 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3B09310003D;
 Tue, 14 Apr 2020 14:53:30 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2FED42B5C28;
 Tue, 14 Apr 2020 14:53:30 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 14 Apr
 2020 14:53:29 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Tue, 14 Apr 2020 14:53:29 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH] board: stm32mp1: correct CONFIG_IS_ENABLED usage for LED
Thread-Index: AQHWD1tvN1APDwuJTU+pJWbNkOCkDqh4dyWA
Date: Tue, 14 Apr 2020 12:53:29 +0000
Message-ID: <de16d66e-0ce1-e0f6-5c88-b5bc6ecd424e@st.com>
References: <20200410191347.1.If78ae0e92c7e52f0fc20716ccfbf7d5005f38a51@changeid>
In-Reply-To: <20200410191347.1.If78ae0e92c7e52f0fc20716ccfbf7d5005f38a51@changeid>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.45]
Content-ID: <B72B374DAAD75D48AA0A5FA6BEF033DC@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-14_05:2020-04-14,
 2020-04-14 signatures=0
Cc: Marek Vasut <marex@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH] board: stm32mp1: correct
	CONFIG_IS_ENABLED usage for LED
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

Hi

On 4/10/20 7:14 PM, Patrick Delaunay wrote:
> Use the correct macro to test presence CONFIG_LED:
> replace CONFIG_IS_ENABLED(CONFIG_LED) by CONFIG_IS_ENABLED(LED)
>
> Issue see during review unrelated patch
> "board: stm32mp1: update management of boot-led"
> http://patchwork.ozlabs.org/patch/1264823/
>
> Cc: Marek Vasut <marex@denx.de>
> Cc: Patrice Chotard <patrice.chotard@st.com>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  board/dhelectronics/dh_stm32mp1/board.c | 2 +-
>  board/st/stm32mp1/stm32mp1.c            | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/board/dhelectronics/dh_stm32mp1/board.c b/board/dhelectronics/dh_stm32mp1/board.c
> index 7bcd713a86..3c14d8206d 100644
> --- a/board/dhelectronics/dh_stm32mp1/board.c
> +++ b/board/dhelectronics/dh_stm32mp1/board.c
> @@ -398,7 +398,7 @@ int board_init(void)
>  
>  	sysconf_init();
>  
> -	if (CONFIG_IS_ENABLED(CONFIG_LED))
> +	if (CONFIG_IS_ENABLED(LED))
>  		led_default_state();
>  
>  	return 0;
> diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
> index 07f5344ec9..053c5e1f07 100644
> --- a/board/st/stm32mp1/stm32mp1.c
> +++ b/board/st/stm32mp1/stm32mp1.c
> @@ -647,7 +647,7 @@ int board_init(void)
>  
>  	sysconf_init();
>  
> -	if (CONFIG_IS_ENABLED(CONFIG_LED))
> +	if (CONFIG_IS_ENABLED(LED))
>  		led_default_state();
>  
>  	return 0;

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks

Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
