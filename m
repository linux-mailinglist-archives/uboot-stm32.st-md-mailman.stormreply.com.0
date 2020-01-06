Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B98D7131745
	for <lists+uboot-stm32@lfdr.de>; Mon,  6 Jan 2020 19:11:21 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6DCA5C36B0A
	for <lists+uboot-stm32@lfdr.de>; Mon,  6 Jan 2020 18:11:21 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1673AC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 Jan 2020 18:11:19 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 006I37cL014026; Mon, 6 Jan 2020 19:11:17 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=tcddzMVNRJlzxw4JVNwnReip3LLv+QVo0T7F+su1vhs=;
 b=adWnSSAXdsckUrrT12mkOPlAD5pE83ry5xBh7Xg5u6y0Upifh1GCXqAeOXZ0zQjLePBs
 U6QiWw7N7q+gknegoNwCgmHRAmuQP6lP1FLPLaGb3VLgDxr8907Ic39MhcZV21jqFb8T
 jMHzkLX8p2X6hgBfLxL9d2NZW/htTp8b82rYTmebMVzmIT6TskA5ugWt2VP3e/0BPGmt
 BF6MGL8pTJ7c4x4BsbZd/e0jyOJwiYujL/q8+Sh3IR17J8JB1b76bAvFK68rLtYo787m
 pHZqVdyBHhi7ktnpRc+jHXd2bOqxr5XOB5ITPAiTkD9iEQIontzkX1z5eJY/cYYxnZe7 DA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2xakvb19gs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Jan 2020 19:11:17 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 591E2100038;
 Mon,  6 Jan 2020 19:11:16 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4E41D222244;
 Mon,  6 Jan 2020 19:11:16 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 6 Jan
 2020 19:11:15 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Mon, 6 Jan 2020 19:11:15 +0100
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Thomas Hebb <tommyhebb@gmail.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH] stm32mp: remove redundant SYS_TEXT_BASE prompt
Thread-Index: AQHVt6LiHyeAAowEBUeVKk0nRq2rGKfeB/yg
Date: Mon, 6 Jan 2020 18:11:15 +0000
Message-ID: <b7a371977267481eaadb9b355e2262b1@SFHDAG6NODE3.st.com>
References: <83634bb5ffff308a693021bf2729742c0b30b2cc.1576893816.git.tommyhebb@gmail.com>
In-Reply-To: <83634bb5ffff308a693021bf2729742c0b30b2cc.1576893816.git.tommyhebb@gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.47]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2020-01-06_05:2020-01-06,2020-01-06 signatures=0
Cc: "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrice CHOTARD <patrice.chotard@st.com>
Subject: Re: [Uboot-stm32] [PATCH] stm32mp: remove redundant SYS_TEXT_BASE
	prompt
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

Hi Thomas,

> From: Thomas Hebb <tommyhebb@gmail.com>
> Sent: samedi 21 d=E9cembre 2019 03:04
> =

> The main prompt for this (defined in /Kconfig) is visible at all times, w=
hich means
> there's no reason to have an additional, machine-specific prompt to set t=
he same
> option.
> =

> Signed-off-by: Thomas Hebb <tommyhebb@gmail.com>

Yes, thanks for notice it.

It wasn't the case before the commit 278b90ce786f ('configs: Migrate CONFIG=
_SYS_TEXT_BASE')
merged before my first comit 2514c2d0e6abe (' arm: stm32: add new architect=
ure for STM32MP family').

And I miss it when I rebase my initial serie.

Acked-by: Patrick Delaunay <patrick.delaunay@st.com>

> ---
> =

>  arch/arm/mach-stm32mp/Kconfig | 5 -----
>  1 file changed, 5 deletions(-)
> =

> diff --git a/arch/arm/mach-stm32mp/Kconfig b/arch/arm/mach-stm32mp/Kconfig
> index ae28f6e206..bf8a18a0c3 100644
> --- a/arch/arm/mach-stm32mp/Kconfig
> +++ b/arch/arm/mach-stm32mp/Kconfig
> @@ -80,12 +80,7 @@ config STM32MP1_OPTEE
>  		OP-TEE monitor provides ST SMC to access to secure resources
> =

>  config SYS_TEXT_BASE
> -	prompt "U-Boot base address"
>  	default 0xC0100000
> -	help
> -		configure the U-Boot base address
> -		when DDR driver is used:
> -		  DDR + 1MB (0xC0100000)
> =

>  config NR_DRAM_BANKS
>  	default 1
> --
> 2.24.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
