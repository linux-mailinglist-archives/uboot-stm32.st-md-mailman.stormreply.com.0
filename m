Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A97294CA5
	for <lists+uboot-stm32@lfdr.de>; Wed, 21 Oct 2020 14:33:12 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B38D6C3FAE0;
	Wed, 21 Oct 2020 12:33:12 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5A347C3FAD5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Oct 2020 12:33:11 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09LCRoNL004666; Wed, 21 Oct 2020 14:33:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=Lwp5cEQ506cAIZSR+u270lTX9oZZ7AFJCtHrxiZks54=;
 b=AngMHogy7+EE5WJahk3KjFGz8Kp3b5BwmB3QahVSsezu3zfsFikDZty17aoU/dUsPrI9
 RE+8r8LFynFmXsRVeRFBP8B7/zE4bnjwY/fvWiixjBKy3zafmzvejkg099Gb88tXrNxS
 HHE+8PuX8jUnQaR/wKFHpaZLjWkVH0ur5pjxIAhkeZYQxUwYhEcNRDtpvXMMmzGMPUko
 85mB9+cMFwL9exQul3j7P5rM1rnQvejRTc7Ba3JxEfKedbZyHSL7mbW0fxxHB12Wse81
 AQ2yx08aa8qEm3/1oGU5hADJf5O4PlM7eMJS4+VuNS/s0+Bz/zvejGUYhZwqZWqjErR5 UA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 347qggajvx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Oct 2020 14:33:10 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 40EE810002A;
 Wed, 21 Oct 2020 14:33:10 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 373B92E847E;
 Wed, 21 Oct 2020 14:33:10 +0200 (CEST)
Received: from SFHDAG2NODE3.st.com (10.75.127.6) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 21 Oct
 2020 14:33:09 +0200
Received: from SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c]) by
 SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c%20]) with mapi id
 15.00.1473.003; Wed, 21 Oct 2020 14:33:09 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH 21/33] mailbox: stm32-ipcc: migrate trace to dev and log
 macro
Thread-Index: AQHWogrLOPm6GPHbUUWJ6N4PfOfVh6mh5wuA
Date: Wed, 21 Oct 2020 12:33:09 +0000
Message-ID: <371461bc-58fa-b929-a7b2-780d43fa5c99@st.com>
References: <20201014091646.4233-1-patrick.delaunay@st.com>
 <20201014091646.4233-22-patrick.delaunay@st.com>
In-Reply-To: <20201014091646.4233-22-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.44]
Content-ID: <7ACEEA1A6E3F0D4AAAEA95479413FD62@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.737
 definitions=2020-10-21_05:2020-10-20,
 2020-10-21 signatures=0
Cc: "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 21/33] mailbox: stm32-ipcc: migrate trace
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
> (dev->name is displayed) or log macro (CONFIG_LOGF_FUNC).
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  drivers/mailbox/stm32-ipcc.c | 16 +++++++++-------
>  1 file changed, 9 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/mailbox/stm32-ipcc.c b/drivers/mailbox/stm32-ipcc.c
> index 81a4115986..990b853d34 100644
> --- a/drivers/mailbox/stm32-ipcc.c
> +++ b/drivers/mailbox/stm32-ipcc.c
> @@ -3,6 +3,8 @@
>   * Copyright (C) STMicroelectronics 2019 - All Rights Reserved
>   */
>  
> +#define LOG_CATEGORY UCLASS_MAILBOX
> +
>  #include <common.h>
>  #include <clk.h>
>  #include <dm.h>
> @@ -44,11 +46,11 @@ static int stm32_ipcc_request(struct mbox_chan *chan)
>  {
>  	struct stm32_ipcc *ipcc = dev_get_priv(chan->dev);
>  
> -	debug("%s(chan=%p)\n", __func__, chan);
> +	dev_dbg(chan->dev, "chan=%p\n", chan);
>  
>  	if (chan->id >= ipcc->n_chans) {
> -		debug("%s failed to request channel: %ld\n",
> -		      __func__, chan->id);
> +		dev_dbg(chan->dev, "failed to request channel: %ld\n",
> +			chan->id);
>  		return -EINVAL;
>  	}
>  
> @@ -57,7 +59,7 @@ static int stm32_ipcc_request(struct mbox_chan *chan)
>  
>  static int stm32_ipcc_free(struct mbox_chan *chan)
>  {
> -	debug("%s(chan=%p)\n", __func__, chan);
> +	dev_dbg(chan->dev, "chan=%p\n", chan);
>  
>  	return 0;
>  }
> @@ -66,7 +68,7 @@ static int stm32_ipcc_send(struct mbox_chan *chan, const void *data)
>  {
>  	struct stm32_ipcc *ipcc = dev_get_priv(chan->dev);
>  
> -	debug("%s(chan=%p, data=%p)\n", __func__, chan, data);
> +	dev_dbg(chan->dev, "chan=%p, data=%p\n", chan, data);
>  
>  	if (readl(ipcc->reg_proc + IPCC_XTOYSR) & BIT(chan->id))
>  		return -EBUSY;
> @@ -83,7 +85,7 @@ static int stm32_ipcc_recv(struct mbox_chan *chan, void *data)
>  	u32 val;
>  	int proc_offset;
>  
> -	debug("%s(chan=%p, data=%p)\n", __func__, chan, data);
> +	dev_dbg(chan->dev, "chan=%p, data=%p\n", chan, data);
>  
>  	/* read 'channel occupied' status from other proc */
>  	proc_offset = ipcc->proc_id ? -IPCC_PROC_OFFST : IPCC_PROC_OFFST;
> @@ -104,7 +106,7 @@ static int stm32_ipcc_probe(struct udevice *dev)
>  	struct clk clk;
>  	int ret;
>  
> -	debug("%s(dev=%p)\n", __func__, dev);
> +	dev_dbg(dev, "\n");
>  
>  	addr = dev_read_addr(dev);
>  	if (addr == FDT_ADDR_T_NONE)

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
