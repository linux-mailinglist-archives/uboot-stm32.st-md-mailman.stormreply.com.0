Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E78319A6CA
	for <lists+uboot-stm32@lfdr.de>; Wed,  1 Apr 2020 10:06:33 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 49F83C36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed,  1 Apr 2020 08:06:33 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 75158C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  1 Apr 2020 08:06:31 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03181wjb031888; Wed, 1 Apr 2020 10:06:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=AIk/o8sQpVyemqjCtzjrFTIAuCi162VhAF0vmxETQmE=;
 b=VaQUlVyndmz+jX6lTTd6ji2RN/5uLkzYPHJi5jSx8WFLSxt25K4+r15Tu13aDgFke6Mm
 hfBkvQ6HjAGQYs0h9l57YloS7RHgdhKJPzz1rGrxIYUrRzzUXe1LH3GP3FjQpPQluMIb
 OtknlkNrcDkkl058YgM3mA9bbWWzq34bcq4gO8rt52CpsCqwsYkD8Sjb3bGkIC4SmDCq
 DM6e5GX0HjGgAe0kfiJ02PTupLN/Roe0qXxkJe7PUFLoAo1+tI0Bp6V0gKcxENWMu/jO
 1NwG9uSctKX09JPNd31TaHkm7lCKq/bK6Fo0rumLS8fM0Xcoq7T1TeH+2mSEZADsHFFT eA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 301w813nke-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Apr 2020 10:06:30 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4079210002A;
 Wed,  1 Apr 2020 10:06:26 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 37A062123DB;
 Wed,  1 Apr 2020 10:06:26 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 1 Apr
 2020 10:06:25 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Wed, 1 Apr 2020 10:06:25 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [Uboot-stm32] [PATCH 11/16] board: stm32mp1: check env_get
 result in board_late_init
Thread-Index: AQHWB/xwcSr9Nkt9T0yHvzMfxqL3MA==
Date: Wed, 1 Apr 2020 08:06:25 +0000
Message-ID: <87880f12-8e14-c730-1f85-af097405881d@st.com>
References: <20200331180330.1.Ied6708bad5048382a57618f95d67c549aae49f42@changeid>
 <20200331180330.11.Ic051e25812481db408f2431c7962da1db1f198fb@changeid>
In-Reply-To: <20200331180330.11.Ic051e25812481db408f2431c7962da1db1f198fb@changeid>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.44]
Content-ID: <F26F22CDD4C4E44EAE38155ED1369422@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-03-31_07:2020-03-31,
 2020-03-31 signatures=0
Cc: Marek Vasut <marex@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 11/16] board: stm32mp1: check env_get
 result in board_late_init
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
> This patch avoids crash in strcmp when the boot_device is not
> present in environment (this case should be never occur)
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  board/st/stm32mp1/stm32mp1.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
> index 89a088cd28..fff4cef2c2 100644
> --- a/board/st/stm32mp1/stm32mp1.c
> +++ b/board/st/stm32mp1/stm32mp1.c
> @@ -753,7 +753,8 @@ int board_late_init(void)
>  
>  	/* Check the boot-source to disable bootdelay */
>  	boot_device = env_get("boot_device");
> -	if (!strcmp(boot_device, "serial") || !strcmp(boot_device, "usb"))
> +	if (boot_device &&
> +	    (!strcmp(boot_device, "serial") || !strcmp(boot_device, "usb")))
>  		env_set("bootdelay", "0");
>  
>  	return 0;

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
