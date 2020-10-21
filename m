Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A5E7294C91
	for <lists+uboot-stm32@lfdr.de>; Wed, 21 Oct 2020 14:27:48 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 27C4FC3FAE0;
	Wed, 21 Oct 2020 12:27:48 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3B5CFC3FAD5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Oct 2020 12:27:47 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09LC85FT008928; Wed, 21 Oct 2020 14:27:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=9VuFf93e/DMSEdQ7Y+rgvBtSuj4eELl3mfI3KaZJcxw=;
 b=NFez5mdufYBvTtMXNHQQOD/xZ19O5+lXcypbFJiTXQcFKmhnvJy/fvIu1zrC3wN/daLW
 Hqi+A4rOuM8LAYMmeMPeh1iCdJFY+qSEmrSkL7BZly9faQUJfsBlaMq6nBY8kipYBt/5
 mFrwfW/vkiL6v6Z98JUm9tDmwZhuIcknKKhQDis5TEmgBe9us3ALwEAi5HEIecH6P8uK
 Uonyg/LRxx/0pbxhVCVghHinZwkd+9b6/if9lebMy3svCFQOqC+A8MmpwYKMMFaMKNEP
 QackrC/csd5vIytHu/uRd+bJCDY7Sj++tmsg1o7ljrqGCXQHOcQe532NVNxc7YLLVoUX 4A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 347p30t2q8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Oct 2020 14:27:46 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 07C0710002A;
 Wed, 21 Oct 2020 14:27:46 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F327F2CA120;
 Wed, 21 Oct 2020 14:27:45 +0200 (CEST)
Received: from SFHDAG2NODE3.st.com (10.75.127.6) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 21 Oct
 2020 14:27:45 +0200
Received: from SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c]) by
 SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c%20]) with mapi id
 15.00.1473.003; Wed, 21 Oct 2020 14:27:45 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH 15/33] misc: rcc: migrate trace to dev macro
Thread-Index: AQHWogrH1vhTTOWzbE+nJCg1/rz2p6mh5YmA
Date: Wed, 21 Oct 2020 12:27:45 +0000
Message-ID: <32a43ae1-7a29-2e69-689d-6a8d80925bc1@st.com>
References: <20201014091646.4233-1-patrick.delaunay@st.com>
 <20201014091646.4233-16-patrick.delaunay@st.com>
In-Reply-To: <20201014091646.4233-16-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.44]
Content-ID: <EC660A25BEDF314BB5BF551404FB519F@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.737
 definitions=2020-10-21_05:2020-10-20,
 2020-10-21 signatures=0
Cc: "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 15/33] misc: rcc: migrate trace to dev
	macro
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
>  drivers/misc/stm32_rcc.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/misc/stm32_rcc.c b/drivers/misc/stm32_rcc.c
> index b82fe54c60..c1a99d78e2 100644
> --- a/drivers/misc/stm32_rcc.c
> +++ b/drivers/misc/stm32_rcc.c
> @@ -4,6 +4,8 @@
>   * Author(s): Patrice Chotard, <patrice.chotard@st.com> for STMicroelectronics.
>   */
>  
> +#define LOG_CATEGORY UCLASS_NOP
> +
>  #include <common.h>
>  #include <dm.h>
>  #include <log.h>
> @@ -45,10 +47,10 @@ static int stm32_rcc_bind(struct udevice *dev)
>  		(struct stm32_rcc_clk *)dev_get_driver_data(dev);
>  	int ret;
>  
> -	debug("%s(dev=%p)\n", __func__, dev);
> +	dev_dbg(dev, "RCC bind\n");
>  	drv = lists_driver_lookup_name(rcc_clk->drv_name);
>  	if (!drv) {
> -		debug("Cannot find driver '%s'\n", rcc_clk->drv_name);
> +		dev_err(dev, "Cannot find driver '%s'\n", rcc_clk->drv_name);
>  		return -ENOENT;
>  	}
>  

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
