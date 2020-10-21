Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DE31D294CA4
	for <lists+uboot-stm32@lfdr.de>; Wed, 21 Oct 2020 14:33:00 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A9B6FC3FAE0;
	Wed, 21 Oct 2020 12:33:00 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DD146C3FAD5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Oct 2020 12:32:58 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09LCS7vd019797; Wed, 21 Oct 2020 14:32:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=zqMIy2M/hG1O/cY6a1xDy9giA4U40byYXwNCInVmLao=;
 b=0nDXclSsq052YjvzLZOKKZOlvNBiBOXrUH5VzHR9252emTzHMx8I0NxVa3NyRykK7wmy
 WcKJbIgow0gPMzKm39xsZ8jFd8LCr9EFiV/2MDNqGVpZSm9n1lOg4scTaS9ja5sdNqM7
 4Ka2l9BDu+vqAyGuNq+wPl7tVsMMVFImVRau8bYROQ567FZwAeXRp1nyduBFVN4YyGc2
 ocbU7wyTk9KplCDZPKpBHtmHZ9BtOxBUUDp4E8YPmGkGMZB0s8Ltb4hHqOmlh8OpgcXS
 AHsVmSEa68krwGBIf7NxmEkyhBavc4iE/Y6N6MBmNooB9a9ZeSTkp0amL9m9mafDb+g4 xA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 347pcx20p8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Oct 2020 14:32:57 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4F13A100034;
 Wed, 21 Oct 2020 14:32:57 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 456502E847E;
 Wed, 21 Oct 2020 14:32:57 +0200 (CEST)
Received: from SFHDAG2NODE3.st.com (10.75.127.6) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 21 Oct
 2020 14:32:56 +0200
Received: from SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c]) by
 SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c%20]) with mapi id
 15.00.1473.003; Wed, 21 Oct 2020 14:32:56 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH 20/33] reset: stm32-reset: migrate trace to dev and log
 macro
Thread-Index: AQHWogrKUmDr4R1QJUGO/JAWVuoHfamh5vsA
Date: Wed, 21 Oct 2020 12:32:56 +0000
Message-ID: <834808b2-a266-1c23-a6d9-ca6abc866813@st.com>
References: <20201014091646.4233-1-patrick.delaunay@st.com>
 <20201014091646.4233-21-patrick.delaunay@st.com>
In-Reply-To: <20201014091646.4233-21-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.47]
Content-ID: <87E6E0293163024ABFAEA25C438E3ABE@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.737
 definitions=2020-10-21_05:2020-10-20,
 2020-10-21 signatures=0
Cc: "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 20/33] reset: stm32-reset: migrate trace
 to dev and log macro
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
> Change debug to dev_dbg macro and define LOG_CATEGORY.
>
> Remove the "%s:" __func__  header as it is managed by dev macro
> (dev->name is displayed).
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  drivers/reset/stm32-reset.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/reset/stm32-reset.c b/drivers/reset/stm32-reset.c
> index 64a11cfcfc..c3af06c6f5 100644
> --- a/drivers/reset/stm32-reset.c
> +++ b/drivers/reset/stm32-reset.c
> @@ -4,6 +4,8 @@
>   * Author(s): Patrice Chotard, <patrice.chotard@st.com> for STMicroelectronics.
>   */
>  
> +#define LOG_CATEGORY UCLASS_RESET
> +
>  #include <common.h>
>  #include <dm.h>
>  #include <errno.h>
> @@ -12,6 +14,7 @@
>  #include <reset-uclass.h>
>  #include <stm32_rcc.h>
>  #include <asm/io.h>
> +#include <dm/device_compat.h>
>  #include <linux/bitops.h>
>  
>  /* reset clear offset for STM32MP RCC */
> @@ -36,8 +39,9 @@ static int stm32_reset_assert(struct reset_ctl *reset_ctl)
>  	struct stm32_reset_priv *priv = dev_get_priv(reset_ctl->dev);
>  	int bank = (reset_ctl->id / BITS_PER_LONG) * 4;
>  	int offset = reset_ctl->id % BITS_PER_LONG;
> -	debug("%s: reset id = %ld bank = %d offset = %d)\n", __func__,
> -	      reset_ctl->id, bank, offset);
> +
> +	dev_dbg(reset_ctl->dev, "reset id = %ld bank = %d offset = %d)\n",
> +		reset_ctl->id, bank, offset);
>  
>  	if (dev_get_driver_data(reset_ctl->dev) == STM32MP1)
>  		/* reset assert is done in rcc set register */
> @@ -53,8 +57,9 @@ static int stm32_reset_deassert(struct reset_ctl *reset_ctl)
>  	struct stm32_reset_priv *priv = dev_get_priv(reset_ctl->dev);
>  	int bank = (reset_ctl->id / BITS_PER_LONG) * 4;
>  	int offset = reset_ctl->id % BITS_PER_LONG;
> -	debug("%s: reset id = %ld bank = %d offset = %d)\n", __func__,
> -	      reset_ctl->id, bank, offset);
> +
> +	dev_dbg(reset_ctl->dev, "reset id = %ld bank = %d offset = %d)\n",
> +		reset_ctl->id, bank, offset);
>  
>  	if (dev_get_driver_data(reset_ctl->dev) == STM32MP1)
>  		/* reset deassert is done in rcc clr register */

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
