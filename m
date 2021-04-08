Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B7784358501
	for <lists+uboot-stm32@lfdr.de>; Thu,  8 Apr 2021 15:43:05 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7F8DEC5718B;
	Thu,  8 Apr 2021 13:43:05 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 19EC3C32E8F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 Apr 2021 13:43:03 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 138DfeNe004194; Thu, 8 Apr 2021 15:42:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=Kp8Fc4o7FNi4AUikz8/BpkICB8DqDs56X4K7AOrqS5Q=;
 b=pJTEvla+GBtDzSijxlmx3SK5LoFiv6MrU5r3vt01TJjCJ4DcMPceon4aR2xRj1L4ZFuM
 HhI4er2TJHKMBUQCxtYUSh/1NqR1q1wl6/EG55cTBo5peLQUIbr6Fy7GUpjAN74RRdgr
 abUA9MVqRMuZgHPNIO14kZusvwU5a3BXZOldzeVx3adnNCV7KU2NJjNqOKT4LKuFxrsj
 QA2c3MXbLqn3YqT7Wzuc8D2FX0iazKeQNiUwIhBuzZ+DS4TtHUpWRCgCQgklMn4Fp34E
 ARVRmRnATgNW1/0cpj0iu6vkFsA7XkSV6kEhabDWa/cCzq/hcfbtOgCz/ozaGvfXvkXf Kg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 37ssm3k2wu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Apr 2021 15:42:53 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C582F10002A;
 Thu,  8 Apr 2021 15:42:52 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A1A82237045;
 Thu,  8 Apr 2021 15:42:52 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.50) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 8 Apr
 2021 15:42:52 +0200
To: <dillon.minfei@gmail.com>, <kever.yang@rock-chips.com>,
 <andre.przywara@arm.com>, <priyanka.jain@nxp.com>,
 <jagan@amarulasolutions.com>, <narmstrong@baylibre.com>,
 <marex@denx.de>, <aford173@gmail.com>, <ioana.ciornei@nxp.com>,
 <josip.kelecic@sartura.hr>, <festevam@gmail.com>, <hs@denx.de>,
 <heiko.stuebner@theobroma-systems.com>, <u-boot@lists.denx.de>,
 <patrick.delaunay@foss.st.com>,
 <uboot-stm32@st-md-mailman.stormreply.com>, <sjg@chromium.org>
References: <1617352961-20550-1-git-send-email-dillon.minfei@gmail.com>
 <1617352961-20550-5-git-send-email-dillon.minfei@gmail.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <d333a686-1fb9-16e4-01d2-02edfcb8ddf3@foss.st.com>
Date: Thu, 8 Apr 2021 15:42:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1617352961-20550-5-git-send-email-dillon.minfei@gmail.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-08_03:2021-04-08,
 2021-04-08 signatures=0
Subject: Re: [Uboot-stm32] [PATCH v4 4/7] ARM: dts: stm32: fix i2c node typo
 in stm32h743, update dmamux1 register
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

Hi Dillon
 4/2/21 10:42 AM, dillon.minfei@gmail.com wrote:
> From: dillon min <dillon.minfei@gmail.com>
> 
> Replace upper case by lower case in i2c nodes name.
> update dmamux1 register range.
> 
> Signed-off-by: dillon min <dillon.minfei@gmail.com>
> ---
> v4: sync with kernel side commit
> link:
> https://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32.git/commit/?h=stm32-dt-for-v5.13&id=978783f90ab71f830207b7e9b49ab819cfd89dd4
> 
>  arch/arm/dts/stm32h743.dtsi | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm/dts/stm32h743.dtsi b/arch/arm/dts/stm32h743.dtsi
> index 77a8aef..ed68575 100644
> --- a/arch/arm/dts/stm32h743.dtsi
> +++ b/arch/arm/dts/stm32h743.dtsi
> @@ -139,7 +139,7 @@
>  			status = "disabled";
>  		};
>  
> -		i2c3: i2c@40005C00 {
> +		i2c3: i2c@40005c00 {
>  			compatible = "st,stm32f7-i2c";
>  			#address-cells = <1>;
>  			#size-cells = <0>;
> @@ -254,7 +254,7 @@
>  
>  		dmamux1: dma-router@40020800 {
>  			compatible = "st,stm32h7-dmamux";
> -			reg = <0x40020800 0x1c>;
> +			reg = <0x40020800 0x40>;
>  			#dma-cells = <3>;
>  			dma-channels = <16>;
>  			dma-requests = <128>;
> @@ -386,7 +386,7 @@
>  			status = "disabled";
>  		};
>  
> -		i2c4: i2c@58001C00 {
> +		i2c4: i2c@58001c00 {
>  			compatible = "st,stm32f7-i2c";
>  			#address-cells = <1>;
>  			#size-cells = <0>;
> 

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
