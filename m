Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 618302D30FF
	for <lists+uboot-stm32@lfdr.de>; Tue,  8 Dec 2020 18:27:54 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1E453C3FAE0;
	Tue,  8 Dec 2020 17:27:54 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1E952C3FADB
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  7 Dec 2020 15:25:14 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0B7FDgPd028145; Mon, 7 Dec 2020 16:24:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=N5N98zAXHLBn7rluy3RY5YUObMgbxh5CJ2ohBj0luFw=;
 b=gISLXFOhKE1F0SJ0Wh7RFMoJy3FMs9hmK3FXwt9PdcAN6Ol+7I9jKdxJOd77nDuWyZ3u
 /z70yh4NFNBvUxWqURllc90ZFcpCLbXPZemOd2LEOEN1IdRuOgqtpt434mzOU6HwxkfF
 c0GSbkJ3yvhyduLxo4keiXc34RixoY+ZALzg6Q84I3LTD46KJeozYBTVNy+sc7zXkeiq
 xEUtA0307cmVXgjjWuhxFxzxJISCpBS3zSXR/mXRuNEPZt6frrVp9Qk/NhyaYHpKJuEv
 EiSRIVKi7Sy+k+MQwQc+lP3IFGPr+tmNO89UONLBzhCToknMaD0RGqSRaWqkI9FGGFg1 IA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3583h3jv4v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Dec 2020 16:24:46 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3B2A0100472;
 Mon,  7 Dec 2020 16:09:12 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 183D32BA2C7;
 Mon,  7 Dec 2020 16:09:12 +0100 (CET)
Received: from SFHDAG2NODE3.st.com (10.75.127.6) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 7 Dec
 2020 16:09:11 +0100
Received: from SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c]) by
 SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c%20]) with mapi id
 15.00.1473.003; Mon, 7 Dec 2020 16:09:11 +0100
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Patrice CHOTARD - foss <patrice.chotard@foss.st.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH v2 1/3] MAINTAINERS: Update ARM STI and ARM STM STM32MP
 Arch maintainers emails
Thread-Index: AQHWyNM5a8t9fgthO0ieslLS6+RfWanrxBCw
Date: Mon, 7 Dec 2020 15:09:11 +0000
Message-ID: <8e17e9a05e224169884f6405bf5d28e8@SFHDAG2NODE3.st.com>
References: <20201202174731.9503-1-patrice.chotard@foss.st.com>
In-Reply-To: <20201202174731.9503-1-patrice.chotard@foss.st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.48]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-07_11:2020-12-04,
 2020-12-07 signatures=0
X-Mailman-Approved-At: Tue, 08 Dec 2020 17:27:52 +0000
Cc: Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon
 Glass <sjg@chromium.org>, Sean Anderson <seanga2@gmail.com>,
 Stefan Bosch <stefan_b@posteo.net>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Alex Nemirovsky <alex.nemirovsky@cortina-access.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Sam Protsenko <joe.skb7@gmail.com>, Robert Marko <robert.marko@sartura.hr>,
 Lokesh Vutla <lokeshvutla@ti.com>
Subject: Re: [Uboot-stm32] [PATCH v2 1/3] MAINTAINERS: Update ARM STI and
 ARM STM STM32MP Arch maintainers emails
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

Hi Patrice,

> From: Patrice CHOTARD - foss <patrice.chotard@foss.st.com>
> Sent: mercredi 2 d=E9cembre 2020 18:47
> =

> Update Patrick and my email address with the one dedicated to upstream
> activities.
> =

> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
> =

> (no changes since v1)
> =

>  MAINTAINERS | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> =

> diff --git a/MAINTAINERS b/MAINTAINERS
> index 874cf2c0e5..ed5d7c3ab6 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -385,7 +385,7 @@ F:	drivers/smem/msm_smem.c
>  F:	drivers/usb/host/ehci-msm.c
> =

>  ARM STI
> -M:	Patrice Chotard <patrice.chotard@st.com>
> +M:	Patrice Chotard <patrice.chotard@foss.st.com>
>  S:	Maintained
>  T:	git https://gitlab.denx.de/u-boot/custodians/u-boot-stm.git
>  F:	arch/arm/mach-sti/
> @@ -411,8 +411,8 @@ F:	arch/arm/cpu/arm926ejs/spear/
>  F:	arch/arm/include/asm/arch-spear/
> =

>  ARM STM STM32MP
> -M:	Patrick Delaunay <patrick.delaunay@st.com>
> -M:	Patrice Chotard <patrice.chotard@st.com>
> +M:	Patrick Delaunay <patrick.delaunay@foss.st.com>
> +M:	Patrice Chotard <patrice.chotard@foss.st.com>
>  L:	uboot-stm32@st-md-mailman.stormreply.com (moderated for non-
> subscribers)
>  T:	git https://gitlab.denx.de/u-boot/custodians/u-boot-stm.git
>  S:	Maintained
> --
> 2.17.1

Reviewed-by: Patrick Delaunay <patrick.delaunay@st.com>

Thanks

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
