Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3697A33D4D9
	for <lists+uboot-stm32@lfdr.de>; Tue, 16 Mar 2021 14:28:53 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ED696C57B77;
	Tue, 16 Mar 2021 13:28:52 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9CDA3C57B5A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Mar 2021 13:28:51 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12GDM1Dm032516; Tue, 16 Mar 2021 14:28:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=hJP1RCDs0hKojpA5Z2OquSwI3xcHpnl/2Fv+J3Iygl8=;
 b=Pnq04Hx9UCyh2nn/zgbbV1VR3Wgwkd2JA8Pi2mbXNi5aFbBedHnl4Ip+NtnNppZvKDQ2
 Nw191xPh2jq5u8tfhPIyofA0PDrCGBJtfKDRGqmbarZ4S61P+h/pkksrdMJEcU+iqq8s
 FTQXYs/XjpoArmksnBgFirn9rKlDQfKlbNCpH4TzD9YSft8mQ+zVw827PCjMnm8bPXKX
 AN9SjhiosTuK/XCHTyij7j1gJoxSwQfxkk/iOALHncdX6NXKNmgbBBI/2G3MCWzecjiB
 SbwoCULVYzH1xXXjohclQMIW11V+x/VOma0cYMwk+UlsaNNyZuY7hWTGHk7xh9Ir7YrT yg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 378pr5rq1m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Mar 2021 14:28:49 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BEB1710002A;
 Tue, 16 Mar 2021 14:28:48 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 97185231DDC;
 Tue, 16 Mar 2021 14:28:48 +0100 (CET)
Received: from lmecxl0994.lme.st.com (10.75.127.44) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 16 Mar
 2021 14:28:48 +0100
To: Jagan Teki <jagan@amarulasolutions.com>, Patrice Chotard
 <patrice.chotard@foss.st.com>, Matteo Lisi <matteo.lisi@engicam.com>
References: <20210315173256.103731-1-jagan@amarulasolutions.com>
 <20210315173256.103731-4-jagan@amarulasolutions.com>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <39e108c0-d355-f7b4-77dd-0bc259f141bb@foss.st.com>
Date: Tue, 16 Mar 2021 14:28:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210315173256.103731-4-jagan@amarulasolutions.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-16_04:2021-03-16,
 2021-03-16 signatures=0
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 linux-amarula@amarulasolutions.com
Subject: Re: [Uboot-stm32] [PATCH v2 3/9] ARM: stm32: Imply SPL_SPI_LOAD
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


On 3/15/21 6:32 PM, Jagan Teki wrote:
> SPI Load isn't mandatory for STM32 builds.
>
> Let's imply instead of select it to get rid of build
> issues for non-SPI defconfigs.
>
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
> Changes for v2:
> - collect Patrice r-b
>
>   arch/arm/mach-stm32mp/Kconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/mach-stm32mp/Kconfig b/arch/arm/mach-stm32mp/Kconfig
> index f538d7cb83..79ffd5191d 100644
> --- a/arch/arm/mach-stm32mp/Kconfig
> +++ b/arch/arm/mach-stm32mp/Kconfig
> @@ -16,13 +16,13 @@ config SPL
>   	select SPL_REGMAP
>   	select SPL_DM_RESET
>   	select SPL_SERIAL_SUPPORT
> -	select SPL_SPI_LOAD
>   	select SPL_SYSCON
>   	select SPL_WATCHDOG_SUPPORT if WATCHDOG
>   	imply BOOTSTAGE_STASH if SPL_BOOTSTAGE
>   	imply SPL_BOOTSTAGE if BOOTSTAGE
>   	imply SPL_DISPLAY_PRINT
>   	imply SPL_LIBDISK_SUPPORT
> +	imply SPL_SPI_LOAD

cosmetic: you can add dependency ?

	imply SPL_SPI_LOAD if SPL_SPI_SUPPORT

>   
>   config SYS_SOC
>   	default "stm32mp"


Anyway



Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks
Patrick



_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
