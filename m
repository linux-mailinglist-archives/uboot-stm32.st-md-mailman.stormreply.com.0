Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 236C6294C80
	for <lists+uboot-stm32@lfdr.de>; Wed, 21 Oct 2020 14:25:40 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DE1A3C3FAE0;
	Wed, 21 Oct 2020 12:25:39 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2AA6CC3FAD5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Oct 2020 12:25:38 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09LC89Nm023380; Wed, 21 Oct 2020 14:25:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=xDJIF5XkLUTER+zm9RtFwSxfBn5mDqPgv1al/cbG6MQ=;
 b=lpW+zX6CXYcxonptibd0Z7Hw1ODBmd3n6d76/+l3e91B9M9+ANZI3SqLH/t2ukI/qwZG
 8j6acQEjGCv4ZcKawb4iWk01X0dQOo2KYVcalA8chRzcECUrsTZ2KH7ZD9jL1AnTxFVw
 kf530pAAYZsSkzRQ9exSgX8lY/uyXbdngV4KPqMLpHJ7HizfOCV6eOebRhgZ7Qts0s4X
 6IqwEE9F/S+wVUsZL6l5W9UwdNwswolaTxoCmUlxwP51qsaDnfPr/aetadgbyA3b9ac6
 IVE1qgMmctopEuStblOWYBfC9jb5jTHUFYpC4qe9uLVxUdRY/ECR3hGkExqwVVEVkIEH nQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 347pcx1y8e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Oct 2020 14:25:36 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8A205100038;
 Wed, 21 Oct 2020 14:25:36 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node1.st.com [10.75.127.4])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7F7942E8450;
 Wed, 21 Oct 2020 14:25:36 +0200 (CEST)
Received: from SFHDAG2NODE3.st.com (10.75.127.6) by SFHDAG2NODE1.st.com
 (10.75.127.4) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 21 Oct
 2020 14:25:36 +0200
Received: from SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c]) by
 SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c%20]) with mapi id
 15.00.1473.003; Wed, 21 Oct 2020 14:25:36 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [Uboot-stm32] [PATCH 07/33] ram: stm32: migrate trace to log
 macro
Thread-Index: AQHWogrIsE6GIuHO9ECizy+b+kcM16mh5O6A
Date: Wed, 21 Oct 2020 12:25:35 +0000
Message-ID: <cd654e00-050c-b39b-e1dd-f1070c439a00@st.com>
References: <20201014091646.4233-1-patrick.delaunay@st.com>
 <20201014091646.4233-8-patrick.delaunay@st.com>
In-Reply-To: <20201014091646.4233-8-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.44]
Content-ID: <92B3EFC62113FA4CAE84AE1B6B43A8B1@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.737
 definitions=2020-10-21_05:2020-10-20,
 2020-10-21 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>
Subject: Re: [Uboot-stm32] [PATCH 07/33] ram: stm32: migrate trace to log
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
> Define LOG_CATEGORY, change debug to dev_dbg and remove "%s:" __func__
> header as it is managed by dev macro (dev->name is displayed)
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  drivers/ram/stm32_sdram.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/ram/stm32_sdram.c b/drivers/ram/stm32_sdram.c
> index 3fddf4df96..9e0e70ca97 100644
> --- a/drivers/ram/stm32_sdram.c
> +++ b/drivers/ram/stm32_sdram.c
> @@ -4,6 +4,8 @@
>   * Author(s): Vikas Manocha, <vikas.manocha@st.com> for STMicroelectronics.
>   */
>  
> +#define LOG_CATEGORY UCLASS_RAM
> +
>  #include <common.h>
>  #include <clk.h>
>  #include <dm.h>
> @@ -272,7 +274,7 @@ static int stm32_fmc_ofdata_to_platdata(struct udevice *dev)
>  	ret = dev_read_phandle_with_args(dev, "st,syscfg", NULL, 0, 0,
>  						 &args);
>  	if (ret) {
> -		dev_dbg(dev, "%s: can't find syscon device (%d)\n", __func__, ret);
> +		dev_dbg(dev, "can't find syscon device (%d)\n", ret);
>  	} else {
>  		syscfg_base = (u32 *)ofnode_get_addr(args.node);
>  
> @@ -281,7 +283,7 @@ static int stm32_fmc_ofdata_to_platdata(struct udevice *dev)
>  			/* set memory mapping selection */
>  			clrsetbits_le32(syscfg_base, MEM_MODE_MASK, mem_remap);
>  		} else {
> -			dev_dbg(dev, "%s: cannot find st,mem_remap property\n", __func__);
> +			dev_dbg(dev, "cannot find st,mem_remap property\n");
>  		}
>  		
>  		swp_fmc = dev_read_u32_default(dev, "st,swp_fmc", NOT_FOUND);
> @@ -289,7 +291,7 @@ static int stm32_fmc_ofdata_to_platdata(struct udevice *dev)
>  			/* set fmc swapping selection */
>  			clrsetbits_le32(syscfg_base, SWP_FMC_MASK, swp_fmc << SWP_FMC_OFFSET);
>  		} else {
> -			dev_dbg(dev, "%s: cannot find st,swp_fmc property\n", __func__);
> +			dev_dbg(dev, "cannot find st,swp_fmc property\n");
>  		}
>  
>  		dev_dbg(dev, "syscfg %x = %x\n", (u32)syscfg_base, *syscfg_base);
> @@ -348,7 +350,7 @@ static int stm32_fmc_ofdata_to_platdata(struct udevice *dev)
>  	}
>  
>  	params->no_sdram_banks = bank;
> -	debug("%s, no of banks = %d\n", __func__, params->no_sdram_banks);
> +	dev_dbg(dev, "no of banks = %d\n", params->no_sdram_banks);
>  
>  	return 0;
>  }

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
