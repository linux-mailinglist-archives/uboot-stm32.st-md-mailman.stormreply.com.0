Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D85E211C96
	for <lists+uboot-stm32@lfdr.de>; Thu,  2 Jul 2020 09:23:00 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E3F66C36B24
	for <lists+uboot-stm32@lfdr.de>; Thu,  2 Jul 2020 07:22:59 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C1CA2C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  2 Jul 2020 07:22:58 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0627JIvo012520; Thu, 2 Jul 2020 09:22:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=6IX3drWGnvkbuEL4xoXsOgCs0BQQSXBZSNYCHmvKkzw=;
 b=eIBJE93uGEU+hFah8LrVbTNszb7wAeLknnJM6xu+TyVNR1CPHkgfMxmsvlECD76yxGfL
 QQf1bdc51swb1OAW1wSwGJyexu/tbqHr7YhKkLNFlLWtoC/nIaK+RXFH1FHHsch7LZiz
 PCcB17XGk+PT9VRwwJlFhP0xV4tYcMtX8MzLEpJnvAtjHMNWwfthaVuS0iFUmysupdvm
 C/lA8sN/LvMuI310l/bk77zGIhE1/G8yVWs8stY2p8y1Z14SfVw4toyFIKxdANLpKAUC
 3foWRW+mGVLIKousFnxD8bEqfAo2qzxnIJEKgkHY0KuUwuZsXf0bb5lvY0BjvOfSa7mT Ng== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31wu89xvt0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Jul 2020 09:22:54 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C7ED710002A;
 Thu,  2 Jul 2020 09:22:53 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BECB621CA91;
 Thu,  2 Jul 2020 09:22:53 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Thu, 2 Jul
 2020 09:22:53 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Thu, 2 Jul 2020 09:22:53 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH 2/2] stm32mp1: use the command env info in env_check
Thread-Index: AQHWQvwgMYrFkk4oakyaoz26uXEfxKjz27IA
Date: Thu, 2 Jul 2020 07:22:53 +0000
Message-ID: <2d155aff-9fa9-252f-386e-72d3fa698338@st.com>
References: <20200615100246.19616-1-patrick.delaunay@st.com>
 <20200615100246.19616-2-patrick.delaunay@st.com>
In-Reply-To: <20200615100246.19616-2-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.51]
Content-ID: <EEC6F6A77007E34F8113F6C6B244BA8D@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-02_03:2020-07-01,
 2020-07-02 signatures=0
Cc: Marek Vasut <marex@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 2/2] stm32mp1: use the command env info in
	env_check
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


On 6/15/20 12:02 PM, Patrick Delaunay wrote:
> Activate CMD_NVEDIT_INFO and use the new command "env info -d -p -q"
> to automatically save the environment on first boot.
>
> This patch allows to remove the env_default variable.
>
>
>
> Previously sent in serie
> cmd: env: add option for quiet output on env info
> http://patchwork.ozlabs.org/project/uboot/list/?series=158105
>
> Resend as separate serie without the "-q" option.
>
> END

Remove END

You can add my reviewed-by when commit will be fixed

Thanks

>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  arch/arm/mach-stm32mp/Kconfig | 1 +
>  include/configs/stm32mp1.h    | 4 +---
>  2 files changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm/mach-stm32mp/Kconfig b/arch/arm/mach-stm32mp/Kconfig
> index 6c995ed8d8..478fd2f17d 100644
> --- a/arch/arm/mach-stm32mp/Kconfig
> +++ b/arch/arm/mach-stm32mp/Kconfig
> @@ -46,6 +46,7 @@ config STM32MP15x
>  	select STM32_RESET
>  	select STM32_SERIAL
>  	select SYS_ARCH_TIMER
> +	imply CMD_NVEDIT_INFO
>  	imply SYSRESET_PSCI if TFABOOT
>  	imply SYSRESET_SYSCON if !TFABOOT
>  	help
> diff --git a/include/configs/stm32mp1.h b/include/configs/stm32mp1.h
> index f271b84a59..e927787be0 100644
> --- a/include/configs/stm32mp1.h
> +++ b/include/configs/stm32mp1.h
> @@ -155,9 +155,7 @@
>  	"splashimage=0xc4300000\0"  \
>  	"ramdisk_addr_r=0xc4400000\0" \
>  	"altbootcmd=run bootcmd\0" \
> -	"env_default=1\0" \
> -	"env_check=if test $env_default -eq 1;"\
> -		" then env set env_default 0;env save;fi\0" \
> +	"env_check=if env info -p -d; then env save; fi\0" \
>  	STM32MP_BOOTCMD \
>  	BOOTENV \
>  	"boot_net_usb_start=true\0"
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
