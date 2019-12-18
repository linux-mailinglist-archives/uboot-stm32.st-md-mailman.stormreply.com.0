Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 15BD412452A
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Dec 2019 11:56:53 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D17AEC36B0B
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Dec 2019 10:56:52 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 50DC4C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Dec 2019 10:56:51 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xBIAgRN7020990; Wed, 18 Dec 2019 11:56:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=IMzDBbyCWbAXUNDXGKxrYpQooovtonpVaJqSzbWgkUA=;
 b=FEhvtAYtEwPPkwqiPCAY8NxiydGqlLGbUgjWJSHgLzRuagTFV9tXPy+sBhLULIr4ly4n
 cmzH1zKJzK3243yQS6RQrB0SgtFr5nb0+xqVF1abJGtz6NaBEo0oliaNY4+aIg0zEmLY
 USym7aB0HUcCkCj5dZj8+nygxxed8Xp6tnI+K3/mKYMpaMTCskCv43kzGVWBIyEYhkaZ
 566k4CRPelYtGWKx0K97TlL41WRd5vqyKQOpN0mbsR92u4jU0NBD+aa8fOzd0hrnNwsJ
 1pjalSWuHnI2+Q54ghyAmXPH4vYPn8bEDm5lbir4JmLEvglnltD2Roncv2/YbaQ1DOAW tg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2wvnrem0fh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Dec 2019 11:56:49 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 60E4E10002A;
 Wed, 18 Dec 2019 11:56:49 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4CDC12A8C00;
 Wed, 18 Dec 2019 11:56:49 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 18 Dec
 2019 11:56:49 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Wed, 18 Dec 2019 11:56:49 +0100
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH 1/2] stm32mp1: remove the imply BOOTSTAGE
Thread-Index: AQHVtYNY5dKs2bEX80C6U7QF04el1Ke/uHgQ
Date: Wed, 18 Dec 2019 10:56:48 +0000
Message-ID: <50e2dd32091e4ddb850ed4708c9d3aeb@SFHDAG6NODE3.st.com>
References: <20191218091259.6748-1-patrick.delaunay@st.com>
In-Reply-To: <20191218091259.6748-1-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.47]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-18_02:2019-12-17,2019-12-18 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrice CHOTARD <patrice.chotard@st.com>
Subject: Re: [Uboot-stm32] [PATCH 1/2] stm32mp1: remove the imply BOOTSTAGE
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

Hi,

> From: Patrick DELAUNAY <patrick.delaunay@st.com>
> Sent: mercredi 18 d=E9cembre 2019 10:13
> =

> This patch is only a temporarily workaround for crash introduced by commit
> ac9cd4805c8b ("bootstage: Correct relocation algorithm").
> =

> The crash occurs because the bootstage struct is not correctly aligned wh=
en
> BOOTSTAGE feature is activated.
> =

> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>

Acked-by: Patrick Delaunay <patrick.delaunay@st.com>

Applied to u-boot-stm32/master, thanks!

> ---
> Hi,
> =

> For issue analysis and patch proposal, see the patch
> =

> [U-Boot,v3] board_f.c: Insure gd->new_bootstage alignment
> http://patchwork.ozlabs.org/patch/1201452/
> =

> Patrick
> =

> =

>  arch/arm/mach-stm32mp/Kconfig | 2 --
>  1 file changed, 2 deletions(-)
> =

> diff --git a/arch/arm/mach-stm32mp/Kconfig b/arch/arm/mach-stm32mp/Kconfig
> index c9bc084194..a110522095 100644
> --- a/arch/arm/mach-stm32mp/Kconfig
> +++ b/arch/arm/mach-stm32mp/Kconfig
> @@ -46,9 +46,7 @@ config TARGET_STM32MP1
>  	select STM32_SERIAL
>  	select SYS_ARCH_TIMER
>  	imply BOOTCOUNT_LIMIT
> -	imply BOOTSTAGE
>  	imply CMD_BOOTCOUNT
> -	imply CMD_BOOTSTAGE
>  	imply DISABLE_CONSOLE
>  	imply PRE_CONSOLE_BUFFER
>  	imply SILENT_CONSOLE
> --
> 2.17.1

Regards
Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
