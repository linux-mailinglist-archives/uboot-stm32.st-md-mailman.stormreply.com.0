Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E4F2FCF25
	for <lists+uboot-stm32@lfdr.de>; Wed, 20 Jan 2021 12:36:58 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 80A9EC3FAD8;
	Wed, 20 Jan 2021 11:36:58 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3C1B3C36B25
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 Jan 2021 11:36:55 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 10KBXF1u003307; Wed, 20 Jan 2021 12:36:53 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to :
 references : cc : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=2ULRzaW3pm0yWPGGi/xqGFf1dS1I1nitNho0qWOkOac=;
 b=in4jfaJaLtAZCg9Vu5zMbvzZaT/5EecXQmTt84iWLgP7SKuFS1FtZ0aiNJgvaMnsvz6N
 7pe9/P8A/oCz+a2qHAsaAs1hYlM6IlKkvDnridoRf8X2iTFdm9hM/H0z53qzz2Vw7lmZ
 kwyAtmL5n+Pgz+4WIcukEjdNgfyyxyQuwKZHxORdWTLg/WDYCnu1Y34PNQJz07JQ6axD
 35ISMMRziAjNzbIl3zvUsfkYvtcxn9HHDqk7s6VqvOj17lNkORVXjNPapo9A95GnrRIc
 pkCknhTnQ80qKe3fg/nEgniIlQGrtMgePgMq/BMDy5zvo/Gle+Xl2SyrPZ4ZUAJdiIem Ag== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3668pdm2fj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Jan 2021 12:36:53 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 132C810002A;
 Wed, 20 Jan 2021 12:36:52 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id ED686236929;
 Wed, 20 Jan 2021 12:36:51 +0100 (CET)
Received: from lmecxl0994.lme.st.com (10.75.127.47) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 20 Jan
 2021 12:36:51 +0100
To: Fabrice GIRARDOT <fabrice.girardot@flowbird.group>, U-Boot Mailing List
 <u-boot@lists.denx.de>
References: <1610715301-17734-1-git-send-email-fabrice.girardot@flowbird.group>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <34ac8f7a-5e14-70a9-9924-232e40624d73@foss.st.com>
Date: Wed, 20 Jan 2021 12:36:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1610715301-17734-1-git-send-email-fabrice.girardot@flowbird.group>
Content-Language: en-US
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG3NODE1.st.com (10.75.127.7) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-20_02:2021-01-18,
 2021-01-20 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH] ARM: dts: stm32: Fix cosmetic typo: use
 'kHz' as kilohertz abbreviation
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

Hi,

On 1/15/21 1:55 PM, Fabrice GIRARDOT wrote:
> The kilohertz unit abbreviation should read 'kHz'.
> Note to STM32 team: modified files were generated, it may be worth
> to fix STM32CubeMX tool.
>
> Signed-off-by: Fabrice GIRARDOT <fabrice.girardot@flowbird.group>
> ---
>   arch/arm/dts/stm32mp15-ddr3-1x4Gb-1066-binG.dtsi | 2 +-
>   arch/arm/dts/stm32mp15-ddr3-2x4Gb-1066-binG.dtsi | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>

Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

I also request this modification in CubeMX tool.

Thanks

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
