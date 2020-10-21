Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 40469294C8B
	for <lists+uboot-stm32@lfdr.de>; Wed, 21 Oct 2020 14:26:36 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8F2F0C3FAE0;
	Wed, 21 Oct 2020 12:26:35 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 086A6C3FAD5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Oct 2020 12:26:34 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09LC84CT023361; Wed, 21 Oct 2020 14:26:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=B+KnwvKV2kNYZNFIUQxmxf+OB7R4y83RcAhhZqt872Y=;
 b=xZUZ3eBqRF6zlSRF23AVHrkls0zQtbsC6QhmSwN7yq5vphBEF4hhqxBx5AUUBQ7L8tUv
 umVCJrfeSINzhzyaih3HB8rDdDNWeQfMXHZmBFUPFGi9JV1Ips3HqJWyRRd7vhU3MMcV
 1DcnyO5vlUXcLZOaX9ewuEGQTfaELfj1SsPAp0JgqbHLKuTKM0WiQRBfxB9hs5r/4BWz
 4nc9WpP0/j+maM/eDAuGt4xmI72DVFGGej2etGpXZaErzvf5vd+8yZH6Jhc2tZY6eRQC
 4wWHBk/00szZLWaAVJJ3+K83ptzpF7BkqG/okr3WNQdvzDuOXFZdpvXTNUru48vc9plI XA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 347pcx1yee-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Oct 2020 14:26:33 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D861310002A;
 Wed, 21 Oct 2020 14:26:32 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CFAFE2E8453;
 Wed, 21 Oct 2020 14:26:32 +0200 (CEST)
Received: from SFHDAG2NODE3.st.com (10.75.127.6) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 21 Oct
 2020 14:26:32 +0200
Received: from SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c]) by
 SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c%20]) with mapi id
 15.00.1473.003; Wed, 21 Oct 2020 14:26:32 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH 11/33] hwspinlock: stm32: migrate trace to log macro
Thread-Index: AQHWogrE9ahNHQJhrkaB3mU6R6FFtKmh5TCA
Date: Wed, 21 Oct 2020 12:26:32 +0000
Message-ID: <3a01e473-7491-55f5-b1c5-9e410cdf6293@st.com>
References: <20201014091646.4233-1-patrick.delaunay@st.com>
 <20201014091646.4233-12-patrick.delaunay@st.com>
In-Reply-To: <20201014091646.4233-12-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.44]
Content-ID: <5F7D57E263C3E244960F12A067C675DB@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.737
 definitions=2020-10-21_05:2020-10-20,
 2020-10-21 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 11/33] hwspinlock: stm32: migrate trace to
	log macro
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
> Define LOG_CATEGORY to allow filtering with log command.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  drivers/hwspinlock/stm32_hwspinlock.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/hwspinlock/stm32_hwspinlock.c b/drivers/hwspinlock/stm32_hwspinlock.c
> index 8be585a0c8..c3edca72ef 100644
> --- a/drivers/hwspinlock/stm32_hwspinlock.c
> +++ b/drivers/hwspinlock/stm32_hwspinlock.c
> @@ -3,6 +3,8 @@
>   * Copyright (C) 2018, STMicroelectronics - All Rights Reserved
>   */
>  
> +#define LOG_CATEGORY UCLASS_HWSPINLOCK
> +
>  #include <common.h>
>  #include <clk.h>
>  #include <dm.h>

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
