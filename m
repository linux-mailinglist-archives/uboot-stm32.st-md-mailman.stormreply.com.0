Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 84CF03B8E28
	for <lists+uboot-stm32@lfdr.de>; Thu,  1 Jul 2021 09:27:12 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4E512C59783;
	Thu,  1 Jul 2021 07:27:12 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 21488C59781
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  1 Jul 2021 07:27:11 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1617QxgD018740; Thu, 1 Jul 2021 09:27:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=PTXblxjrnHC4n3v9G6obqf2S+GoqGuKjN+WRXgmO4Bs=;
 b=bJxRwqkaW8xBYThEE7GuUu/uVufTO5l7b9WH78HNm9Rj8VOvWii0uw0Yr2BiRd/Bax8w
 qTrsPcuu/svxiGCXspGmrnlow3YmaxcHGvGuuYuzpcGiISIys1b71H/k07e4JPQhtQQE
 u1Z1ZKU0AwntFHxjfrkO9nl0BUMUhDS9mE6f09XilFFjhXUwPmHtUbMRO5MKNzEHEhz5
 0/1ZILcKlbJFLc/H4XmNMHOQr7M6E9HRXbBypn2thR4yx8a30QgLtxDwCJ9heBo0skU8
 REKpb9Cy0c215ghAv0bxV/UroHS3/TFWVegroWG9oUWbmWyv4rg8rG6wR07Tm+Fd+GTF 7Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 39gnbpu2p5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Jul 2021 09:27:09 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5D53710002A;
 Thu,  1 Jul 2021 09:27:09 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5266B212FAE;
 Thu,  1 Jul 2021 09:27:09 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.47) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 1 Jul
 2021 09:27:08 +0200
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20210629120417.1.I711fb255292d0f086a2632041897c48c163403bd@changeid>
 <20210629120417.2.I6cc80b366a817fee3a61c5c284a208ca1a2d6188@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <10e3ca8b-c9f9-6b66-058b-0ada38547cee@foss.st.com>
Date: Thu, 1 Jul 2021 09:27:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210629120417.2.I6cc80b366a817fee3a61c5c284a208ca1a2d6188@changeid>
Content-Language: en-US
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-01_01:2021-06-30,
 2021-07-01 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 2/2] stm32mp: syscon: manage clock when
 present in device tree
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

On 6/29/21 12:04 PM, Patrick Delaunay wrote:
> Enable the clocks during syscon probe when they are present in device tree.
> 
> This patch avoids a freeze when the SYSCFG clock is not enabled by
> TF-A / OP-TEE.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  arch/arm/mach-stm32mp/syscon.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/arch/arm/mach-stm32mp/syscon.c b/arch/arm/mach-stm32mp/syscon.c
> index 3e61ce4097..a0e8e1dfdc 100644
> --- a/arch/arm/mach-stm32mp/syscon.c
> +++ b/arch/arm/mach-stm32mp/syscon.c
> @@ -4,6 +4,7 @@
>   */
>  
>  #include <common.h>
> +#include <clk.h>
>  #include <dm.h>
>  #include <syscon.h>
>  #include <asm/arch/stm32.h>
> @@ -14,9 +15,22 @@ static const struct udevice_id stm32mp_syscon_ids[] = {
>  	{ }
>  };
>  
> +static int stm32mp_syscon_probe(struct udevice *dev)
> +{
> +	struct clk_bulk clk_bulk;
> +	int ret;
> +
> +	ret = clk_get_bulk(dev, &clk_bulk);
> +	if (!ret)
> +		clk_enable_bulk(&clk_bulk);
> +
> +	return 0;
> +}
> +
>  U_BOOT_DRIVER(syscon_stm32mp) = {
>  	.name = "stmp32mp_syscon",
>  	.id = UCLASS_SYSCON,
>  	.of_match = stm32mp_syscon_ids,
>  	.bind = dm_scan_fdt_dev,
> +	.probe = stm32mp_syscon_probe,
>  };
> 

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
