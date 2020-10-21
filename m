Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BC8F5294C03
	for <lists+uboot-stm32@lfdr.de>; Wed, 21 Oct 2020 13:53:37 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E1D28C3FAE0;
	Wed, 21 Oct 2020 11:53:36 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 94FFAC3FAD5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Oct 2020 11:53:35 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09LBloNq029388; Wed, 21 Oct 2020 13:53:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=3V8O0WdRIHpXt5pvg5CIvOaWPcFBTFvEbNoRFl1AJyo=;
 b=EqJE9B+iZ0VYbd40dgmryFAvPCqOnNxZBOj2h+E1L+VY81lk0tfsUpznHvcjHvNtM4h5
 jBFrWD6FNrymLRoHqqoDwyZl6SupWLFHHH5/NjdHImrHWQp/ljWuv3O2cLx52/uMT5uV
 ZqRFsIMNJJIsjUnesD2F6fko4qwsGhp0nYFiUfhGWpHFIy9X7FPPA5PiB5ZHMhyX+cdR
 u7eDG3C/yzz0tZB0TSH0jKmZPUBbsjVVY68fh1buEPDqtfmAuHLtkceqQoT+aUXLIxTj
 MFbD8wWDyxlGqIuC6dpHVQdA6V8JRiqU+8BOE140o/epx8G39/FIrSFQFeOie7buB/t6 WA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 347qggabe8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Oct 2020 13:53:15 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2DB13100034;
 Wed, 21 Oct 2020 13:53:14 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node1.st.com [10.75.127.4])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1A01B2E3613;
 Wed, 21 Oct 2020 13:53:14 +0200 (CEST)
Received: from SFHDAG2NODE3.st.com (10.75.127.6) by SFHDAG2NODE1.st.com
 (10.75.127.4) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 21 Oct
 2020 13:53:13 +0200
Received: from SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c]) by
 SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c%20]) with mapi id
 15.00.1473.003; Wed, 21 Oct 2020 13:53:13 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH] MAINTAINERS: Add STM32MP1 RNG driver in stm32mp platform
Thread-Index: AQHWm9dyTLf3uC1f3UmnHSsFzKoBoqmh6EmA
Date: Wed, 21 Oct 2020 11:53:13 +0000
Message-ID: <9a8836bd-6333-1606-98d4-c899e4311458@st.com>
References: <20201006115227.19060-1-patrick.delaunay@st.com>
In-Reply-To: <20201006115227.19060-1-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.47]
Content-ID: <7E5CAA93BCC41F4CAF14E6D5B7FB9449@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.737
 definitions=2020-10-21_05:2020-10-20,
 2020-10-21 signatures=0
Cc: Anastasiia Lukianenko <anastasiia_lukianenko@epam.com>,
 Jway Lin <jway.lin@cortina-access.com>, Lokesh Vutla <lokeshvutla@ti.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>,
 Michal Simek <michal.simek@xilinx.com>,
 Amit Singh Tomar <amittomer25@gmail.com>, Stefan Bosch <stefan_b@posteo.net>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Sughosh Ganu <sughosh.ganu@linaro.org>,
 Alex Nemirovsky <alex.nemirovsky@cortina-access.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Sam Protsenko <joe.skb7@gmail.com>, Robert Marko <robert.marko@sartura.hr>
Subject: Re: [Uboot-stm32] [PATCH] MAINTAINERS: Add STM32MP1 RNG driver in
	stm32mp platform
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

On 10/6/20 1:52 PM, Patrick Delaunay wrote:
> Add the STM32MP1 RNG driver in the list of drivers supported by
> the STMicroelectronics STM32MP15x series.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 85babd1908..8628ffd2a3 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -430,6 +430,7 @@ F:	drivers/power/regulator/stpmic1.c
>  F:	drivers/ram/stm32mp1/
>  F:	drivers/remoteproc/stm32_copro.c
>  F:	drivers/reset/stm32-reset.c
> +F:	drivers/rng/stm32mp1_rng.c
>  F:	drivers/rtc/stm32_rtc.c
>  F:	drivers/serial/serial_stm32.*
>  F:	drivers/spi/stm32_qspi.c

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
