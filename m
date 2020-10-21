Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D24294C8F
	for <lists+uboot-stm32@lfdr.de>; Wed, 21 Oct 2020 14:27:29 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C4F84C3FAE0;
	Wed, 21 Oct 2020 12:27:28 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7F5C4C3FAD5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Oct 2020 12:27:26 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09LCRCQI026574; Wed, 21 Oct 2020 14:27:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=0xdRiX465kDiPsedNwSwgmmGXaBgsRO69OfCuCsUblY=;
 b=xxNQnnQleqR1kcRw9/ch7pGJwjN9Ebpwk5cxsiMGvpjD5nzNYOPgJrM2nk0heRy44TX8
 FVTXo8MFpgSB2/sSp3BDP2R18qTXn65eq74N00JPphrEBIKQSTziYOY1iXxTZN+/thLD
 2SWJZjyPSIawaPAk28Ms+f8SPlX5rjpTBFax05PEPlwGhnFY+cTahW7AG2fgOEspJKCw
 4RCAnUopshvkC/BFWzfkP/tDOjJ6rF0a4oYbM+ZTN2zYAulu5Z+P33bYPCmacp/FveZA
 P0TH7J/msHTSxbD8JdhuffLYXmoz6nGXvtVAhkyfsnddwZd3cYQOabTZko+ZA8F33WNj JA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 347nr8k0bm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Oct 2020 14:27:26 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7B48E10002A;
 Wed, 21 Oct 2020 14:27:25 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 72D9C2E8457;
 Wed, 21 Oct 2020 14:27:25 +0200 (CEST)
Received: from SFHDAG2NODE3.st.com (10.75.127.6) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 21 Oct
 2020 14:27:24 +0200
Received: from SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c]) by
 SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c%20]) with mapi id
 15.00.1473.003; Wed, 21 Oct 2020 14:27:24 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH 13/33] watchdog: stm32mp: migrate trace to dev macro
Thread-Index: AQHWogrG/lr7jtYdzkukPD2kQYAwzamh5XAA
Date: Wed, 21 Oct 2020 12:27:24 +0000
Message-ID: <c4995014-8f12-324b-e5d5-e4a9be3b0cfd@st.com>
References: <20201014091646.4233-1-patrick.delaunay@st.com>
 <20201014091646.4233-14-patrick.delaunay@st.com>
In-Reply-To: <20201014091646.4233-14-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.44]
Content-ID: <504B7FC1A582514BBA040C8C8CC8FCA1@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.737
 definitions=2020-10-21_05:2020-10-20,
 2020-10-21 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 13/33] watchdog: stm32mp: migrate trace to
	dev macro
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

On 10/14/20 11:16 AM, Patrick Delaunay wrote:
> Change debug and pr_err to dev macro and define LOG_CATEGORY.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  drivers/watchdog/stm32mp_wdt.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/watchdog/stm32mp_wdt.c b/drivers/watchdog/stm32mp_wdt.c
> index f673fce327..109adc8332 100644
> --- a/drivers/watchdog/stm32mp_wdt.c
> +++ b/drivers/watchdog/stm32mp_wdt.c
> @@ -3,6 +3,8 @@
>   * Copyright (C) 2019, STMicroelectronics - All Rights Reserved
>   */
>  
> +#define LOG_CATEGORY UCLASS_WDT
> +
>  #include <common.h>
>  #include <clk.h>
>  #include <dm.h>
> @@ -10,6 +12,7 @@
>  #include <syscon.h>
>  #include <wdt.h>
>  #include <asm/io.h>
> +#include <dm/device_compat.h>
>  #include <linux/bitops.h>
>  #include <linux/iopoll.h>
>  
> @@ -77,7 +80,7 @@ static int stm32mp_wdt_start(struct udevice *dev, u64 timeout_ms, ulong flags)
>  				 val & (SR_PVU | SR_RVU), CONFIG_SYS_HZ);
>  
>  	if (ret < 0) {
> -		pr_err("Updating IWDG registers timeout");
> +		dev_err(dev, "Updating IWDG registers timeout");
>  		return -ETIMEDOUT;
>  	}
>  
> @@ -90,7 +93,7 @@ static int stm32mp_wdt_probe(struct udevice *dev)
>  	struct clk clk;
>  	int ret;
>  
> -	debug("IWDG init\n");
> +	dev_dbg(dev, "IWDG init\n");
>  
>  	priv->base = dev_read_addr(dev);
>  	if (priv->base == FDT_ADDR_T_NONE)
> @@ -112,7 +115,7 @@ static int stm32mp_wdt_probe(struct udevice *dev)
>  
>  	priv->wdt_clk_rate = clk_get_rate(&clk);
>  
> -	debug("IWDG init done\n");
> +	dev_dbg(dev, "IWDG init done\n");
>  
>  	return 0;
>  }

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
