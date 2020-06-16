Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F7421FAABF
	for <lists+uboot-stm32@lfdr.de>; Tue, 16 Jun 2020 10:08:06 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A71DAC36B0D
	for <lists+uboot-stm32@lfdr.de>; Tue, 16 Jun 2020 08:08:05 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 56F31C36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Jun 2020 08:08:00 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05G840p5017847; Tue, 16 Jun 2020 10:07:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=vzjQot9RF6PiqR88pq/dqjHsDP8Nvk9P04DVFe7T428=;
 b=jqVI0ToQrKB0/hpC1qwG4cZCo+BsT+f8DQP670SLG8aMWY6BXunvxgLUFDI/eel7bH1e
 FgvdAgSqj8eR4J9fCC3mGZlLXKksU4YxJRZ9cs6eFSR9aBmz69IcAn0Z5aWJ/tp4a7LH
 t1U6Nyd3+wXPuJV6DFg+fkSUx/qhkJCJkQBSeOKs9lyzCmS+gKwKCZdRKq7cQmfTXc7O
 OGuO0IdACKDz0HEw/pPFwDhZbI7mTxkg9mGx+4/6gY1BkJjo3+/qOdRbyPGwwS8CYUQi
 x++pkNpBvBHuIZ86J9/8pSkzVCfZAndfF3JAKIe79FvSAWAeH+0Izf7xNmmqbnSXUzMX MA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31mm91p1wq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Jun 2020 10:07:53 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CD172100034;
 Tue, 16 Jun 2020 10:07:52 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C27A42B1860;
 Tue, 16 Jun 2020 10:07:52 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 16 Jun
 2020 10:07:52 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Tue, 16 Jun 2020 10:07:52 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH 1/2] board: stm32mp1: fix handling of DT OP-TEE reserved
 memory nodes
Thread-Index: AQHWOwpeoAE7HE78nkyoxAo3C5JX/aja0tmA
Date: Tue, 16 Jun 2020 08:07:52 +0000
Message-ID: <acb6b981-c9a5-eab1-7239-8a19ad46d494@st.com>
References: <20200605092427.1.I393865d4202eca31c111da33b792596f130b73d2@changeid>
In-Reply-To: <20200605092427.1.I393865d4202eca31c111da33b792596f130b73d2@changeid>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.44]
Content-ID: <7E714B25598A274086C578FA916A970F@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-16_02:2020-06-15,
 2020-06-16 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Etienne Carriere <etienne.carriere@linaro.org>
Subject: Re: [Uboot-stm32] [PATCH 1/2] board: stm32mp1: fix handling of DT
 OP-TEE reserved memory nodes
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

On 6/5/20 9:24 AM, Patrick Delaunay wrote:
> From: Etienne Carriere <etienne.carriere@linaro.org>
>
> Fix the sequence in stm32mp1 fdt.c that disables OP-TEE resources
> defined in FDT when U-boot detects OP-TEE firmware is not present.
>
> Before this change, helper function stm32_fdt_disable_optee()
> set property status to "disabled" for the OP-TEE reserved memory
> nodes but this has no impact since Linux kernel does not consider
> the status property for reserved-memory subnodes. This change
> make U-Boot to attempt to delete the node instead.
>
> Fixes: 4a1b975dac02 ("board: stm32mp1: reserve memory for OP-TEE in device tree")
> Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  arch/arm/mach-stm32mp/fdt.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
>
> diff --git a/arch/arm/mach-stm32mp/fdt.c b/arch/arm/mach-stm32mp/fdt.c
> index c723b223e0..959f12efe1 100644
> --- a/arch/arm/mach-stm32mp/fdt.c
> +++ b/arch/arm/mach-stm32mp/fdt.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0+ OR BSD-3-Clause
>  /*
> - * Copyright (C) 2019, STMicroelectronics - All Rights Reserved
> + * Copyright (C) 2019-2020, STMicroelectronics - All Rights Reserved
>   */
>  
>  #include <common.h>
> @@ -224,19 +224,23 @@ static void stm32_fdt_disable_optee(void *blob)
>  {
>  	int off, node;
>  
> +	/* Delete "optee" firmware node */
>  	off = fdt_node_offset_by_compatible(blob, -1, "linaro,optee-tz");
>  	if (off >= 0 && fdtdec_get_is_enabled(blob, off))
> -		fdt_status_disabled(blob, off);
> +		fdt_del_node(blob, off);
>  
> -	/* Disabled "optee@..." reserved-memory node */
> +	/* Delete "optee@..." reserved-memory node */
>  	off = fdt_path_offset(blob, "/reserved-memory/");
>  	if (off < 0)
>  		return;
>  	for (node = fdt_first_subnode(blob, off);
>  	     node >= 0;
>  	     node = fdt_next_subnode(blob, node)) {
> -		if (!strncmp(fdt_get_name(blob, node, NULL), "optee@", 6))
> -			fdt_status_disabled(blob, node);
> +		if (strncmp(fdt_get_name(blob, node, NULL), "optee@", 6))
> +			continue;
> +
> +		if (fdt_del_node(blob, node))
> +			printf("Failed to remove optee reserved-memory node\n");
>  	}
>  }
>  

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
