Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD11294DB3
	for <lists+uboot-stm32@lfdr.de>; Wed, 21 Oct 2020 15:38:04 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6015AC3FAE0;
	Wed, 21 Oct 2020 13:38:04 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AC5D0C3FAD5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Oct 2020 13:38:02 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09LDVohf025619; Wed, 21 Oct 2020 15:37:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=RYi7kKIMkRjkMyYlfr+XqazKWTJCl6DLxGOsX1FOUfI=;
 b=qvzGRodQkBVPdiNyDcBb8qZC/CLGM59fuLTDHsOdc0rR/G/05HDFN77FsceQoXyDuV4h
 BlEw65cJiknx61Yud5hh5utH9ZKY10G/pPkxlilQ5zLgn0pZ8mYPOX8ncysuEmKUzecS
 anQy5sYfFu3VLZlBsPOYRgncgdWI/vTfkyN0IiLud8Je+53LMe/nW3DucbLRPQtxgjVT
 v0SVzn7k+CgJaFTEMuPEPtpzwqk1cKOusvZrVfTG54/f0J7Gjz/eG/GxKu3rDx0+B9hY
 yeA+sEO/v1Kk2C9ca6TLd6IdNU02WJ8TlLPfVaP6P3GLRVS4vPbP8T8MDiQYJJhVCJUb bA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 347qggay73-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Oct 2020 15:37:39 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2DFDC10002A;
 Wed, 21 Oct 2020 15:37:37 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1064F2B8319;
 Wed, 21 Oct 2020 15:37:37 +0200 (CEST)
Received: from SFHDAG2NODE3.st.com (10.75.127.6) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 21 Oct
 2020 15:37:36 +0200
Received: from SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c]) by
 SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c%20]) with mapi id
 15.00.1473.003; Wed, 21 Oct 2020 15:37:36 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH] MAINTAINERS: Add STM32MP1 RNG driver in stm32mp platform
Thread-Index: AQHWm9dEYEDJfkdZwEqRA8z6ZNuMUqmiJtTw
Date: Wed, 21 Oct 2020 13:37:36 +0000
Message-ID: <fc4d6489fed7468fb418d7e6b1d97cfc@SFHDAG2NODE3.st.com>
References: <20201006115227.19060-1-patrick.delaunay@st.com>
In-Reply-To: <20201006115227.19060-1-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.50]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.737
 definitions=2020-10-21_06:2020-10-20,
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

Hi,

> From: Patrick DELAUNAY <patrick.delaunay@st.com>
> Sent: mardi 6 octobre 2020 13:52
> 
> Add the STM32MP1 RNG driver in the list of drivers supported by the
> STMicroelectronics STM32MP15x series.
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
> --
> 2.17.1

Applied to u-boot-stm/master, thanks!

Regards

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
