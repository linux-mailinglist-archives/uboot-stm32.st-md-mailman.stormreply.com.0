Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B2E294C01
	for <lists+uboot-stm32@lfdr.de>; Wed, 21 Oct 2020 13:53:20 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D6EDCC3FAE0;
	Wed, 21 Oct 2020 11:53:19 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B6543C3FAD5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Oct 2020 11:53:17 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09LBm43F023121; Wed, 21 Oct 2020 13:52:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=2E/fGOr8xnzIkGO3WZphZtoMtL+KfitUH1c/ZYooikM=;
 b=R8vSwLSpwkSAbyLz2KDiyfrPX0AVf3IXzUlVtC3aa5HyThV3HAatbof1Gj8pXPdt6adz
 dFPchUoKciD/rT1zUl/0mgDUJrQnngsEbO/rhBZmUoR5hc6aW4jfMtOxdKLOxpGV6kes
 My3wH2kOATUl2zgwMKwjYaK5BN1dGJrpScmu5eIB9Jyq9OWhyLCgGlgzeBNqm8qSh4wO
 UnYnmybr4QAngHPoFlF/i1oSn65IR46p7ao9GzF/G4WxwCutlmKUUuDcDUIAcNk6huNc
 EXZX1fbD6lXTLen43uwqQK8+n6R84HV3xUJUyGifhh4RQnCHaV/SBMgyCOO786mODTc0 Iw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 347pcx1s6x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Oct 2020 13:52:50 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2A4AF10002A;
 Wed, 21 Oct 2020 13:52:48 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0E9752E0833;
 Wed, 21 Oct 2020 13:52:48 +0200 (CEST)
Received: from SFHDAG2NODE3.st.com (10.75.127.6) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 21 Oct
 2020 13:52:47 +0200
Received: from SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c]) by
 SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c%20]) with mapi id
 15.00.1473.003; Wed, 21 Oct 2020 13:52:47 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH] MAINTAINERS: Add stm32 and stm regexp for ARM STM
 STM32MP platform
Thread-Index: AQHWm9hCRv8igO1PY0iCeNOHXjj93qmh6CmA
Date: Wed, 21 Oct 2020 11:52:47 +0000
Message-ID: <58b03ca4-91e7-544f-8f97-05382620e874@st.com>
References: <20201006115941.19533-1-patrick.delaunay@st.com>
In-Reply-To: <20201006115941.19533-1-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.47]
Content-ID: <FB0A48EEF27A7141A9D4E83EAE138631@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.737
 definitions=2020-10-21_05:2020-10-20,
 2020-10-21 signatures=0
Cc: Anastasiia Lukianenko <anastasiia_lukianenko@epam.com>,
 Lokesh Vutla <lokeshvutla@ti.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Simon Glass <sjg@chromium.org>,
 Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>,
 Michal Simek <michal.simek@xilinx.com>,
 Amit Singh Tomar <amittomer25@gmail.com>, Stefan Bosch <stefan_b@posteo.net>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Alex Nemirovsky <alex.nemirovsky@cortina-access.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Sam Protsenko <joe.skb7@gmail.com>, Robert Marko <robert.marko@sartura.hr>
Subject: Re: [Uboot-stm32] [PATCH] MAINTAINERS: Add stm32 and stm regexp for
 ARM STM STM32MP platform
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

On 10/6/20 1:59 PM, Patrick Delaunay wrote:
> Add files and directories regex "stm32" and "stm" in "ARM STM STM32MP"
> platform to avoid missing files or drivers supported by the
> STMicroelectronics series STM32MP15x.
>
> This patch adds the rules already used in Linux kernel for
> ARM/STM32 ARCHITECTURE.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  MAINTAINERS | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8628ffd2a3..b275f3d45b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -444,6 +444,8 @@ F:	include/dt-bindings/pinctrl/stm32-pinfunc.h
>  F:	include/dt-bindings/reset/stm32mp1-resets.h
>  F:	include/stm32_rcc.h
>  F:	tools/stm32image.c
> +N:	stm
> +N:	stm32
>  
>  
>  ARM STM STV0991

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
