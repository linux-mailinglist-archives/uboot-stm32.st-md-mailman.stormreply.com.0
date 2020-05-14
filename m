Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 25FE91D2BA8
	for <lists+uboot-stm32@lfdr.de>; Thu, 14 May 2020 11:43:09 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E8511C36B10
	for <lists+uboot-stm32@lfdr.de>; Thu, 14 May 2020 09:43:08 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 172EAC36B0E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 May 2020 09:43:08 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04E9gUJP032557; Thu, 14 May 2020 11:43:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=YaYFlO1/44NmmgxZ8j265xwEqKyWtElc+PGnuqdcCWU=;
 b=TM2WRICWqwacRWYPuBilemNNlLcct9uFz0/+GoDiNnX+mrK3k33f2R0+N73ufWg8VRd5
 xbLGN6HhSseDTMfJ/liuDaKWax2NSIAuG2OhZibXnFDD6ECKhFjZNTwndlZW+EC8bf5U
 +0dhtS3Aj8unG/stKBqf9YTd+mL47149cI0JOxMbvBmkcVM3tG0jgfz+WqefNjGNmG4T
 Uamqp9gFBuBafMUq+kKPMuyMEg7iVKU1nJ3OMWbSu3ExnC32PaSI46jy1A2uzUFRlkKe
 iS4Sw0ROkyDAj2cyWkIQA85v36ikfZSwCQLrLui9sqpGtR+Flpv6QSiZLpsSYP08LqdT xQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3100vqj6b1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 May 2020 11:43:05 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 14369100034;
 Thu, 14 May 2020 11:43:05 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 03F592B0A26;
 Thu, 14 May 2020 11:43:05 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 14 May
 2020 11:43:04 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Thu, 14 May 2020 11:43:04 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH] ARM: dts: stm32mp1: DT alignment with Linux 5.7-rc2
Thread-Index: AQHWHvaiHKidjujJwEi0sdqzAh/Ffainafsg
Date: Thu, 14 May 2020 09:43:04 +0000
Message-ID: <025b63a592fd47d5a7e79d57f831fd0f@SFHDAG6NODE3.st.com>
References: <20200430155234.1.If8f63efaa47eb0830ce241e3a62b2aa420e0883a@changeid>
In-Reply-To: <20200430155234.1.If8f63efaa47eb0830ce241e3a62b2aa420e0883a@changeid>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.51]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-14_02:2020-05-13,
 2020-05-14 signatures=0
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH] ARM: dts: stm32mp1: DT alignment with
	Linux 5.7-rc2
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
> Sent: jeudi 30 avril 2020 15:53
> To: u-boot@lists.denx.de
> Cc: Patrick DELAUNAY <patrick.delaunay@st.com>; Marek Vasut
> <marex@denx.de>; Tom Rini <trini@konsulko.com>; U-Boot STM32 <uboot-
> stm32@st-md-mailman.stormreply.com>
> Subject: [PATCH] ARM: dts: stm32mp1: DT alignment with Linux 5.7-rc2
> Importance: High
> 
> DT alignment with Linux 5.7-rc2, including the kernel commits
> 
> 431c89e6f323 ARM: dts: stm32: use correct vqmmc regu for eMMC on stm32mp1
> ED1/EV1 boards
> 79e965053872 ARM: dts: stm32: add disable-wp property for SD-card on
> STM32MP1 boards
> 877db62ea516 ARM: dts: stm32: add cd-gpios properties for SD-cards on
> STM32MP1 boards
> 7519e95ba5f8 ARM: dts: stm32: Do clean up in stmpic nodes on stm32mp15
> boards f68e2dbc591a ARM: dts: stm32: Rename stmfx joystick pins on
> stm32mp157c-ev1 d6210da4f8bf ARM: dts: stm32: add cpu clock-frequency
> property on stm32mp15x
> b65b6fc56925 ARM: dts: stm32: add wakeup-source in all I2C nodes of
> stm32mp157c 1c1cf5996cfb ARM: dts: stm32: add i2c4 sleep pinctrl on
> stm32mp157c-ed1
> bef15fc0fad9 ARM: dts: stm32: add i2c2/i2c5 sleep pinctrl on stm32mp157c-ev1
> b7fc0a87b9ac ARM: dts: stm32: add i2c4 sleep pinctrl on stm32mp15xx-dkx
> a5e557655285 ARM: dts: stm32: set i2c4 bus freq to 400KHz on stm32mp15 DK
> boards
> 8bc631b650a6 ARM: dts: stm32: set i2c4 bus freq to 400KHz on stm32mp157c-
> ed1
> fccd6a577bb3 ARM: dts: stm32: Correct stmfx node name on stm32mp157c-ev1
> board
> cc775a83db65 ARM: dts: stm32: add resets property on all DMA nodes on
> stm32mp151 c5fae093511b ARM: dts: stm32: enable USB OTG Dual Role on
> stm32mp157c-ev1
> 9879e2165758 ARM: dts: stm32: add USB OTG pinctrl to stm32mp15
> 82ac8a81f985 ARM: dts: stm32: add USB OTG full support on stm32mp151
> 8714b26e2863 ARM: dts: stm32: remove useless properties in stm32mp157a-
> avenger96 stmpic node a7959919709e ARM: dts: stm32: Add UART8 pins A
> pinmux entry on stm32mp1 4d7c53a684da ARM: dts: stm32: Add USART3 pins A
> pinmux entry on stm32mp1 80ab128332ee ARM: dts: stm32: Add SAI2A pins B
> pinmux entry on stm32mp1
> ab7f98c0c546 ARM: dts: stm32: Add Ethernet0 RMII pins A pinmux entry on
> stm32mp1
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
> Hi,
> 
> Dependency with correction of GPIO support in SPL:
> 
> [v2,09/12] gpio: stm32: support gpio ops in SPL
> http://patchwork.ozlabs.org/project/uboot/patch/20200422142834.v2.9.I355ddbc80
> 4eba6047ea147d830be57a5b9c4a87e@changeid/
> 
> Patrick
> 
> 
>  arch/arm/dts/stm32mp15-pinctrl.dtsi | 92 +++++++++++++++++++++++++++++
>  arch/arm/dts/stm32mp151.dtsi        | 13 +++-
>  arch/arm/dts/stm32mp153.dtsi        |  1 +
>  arch/arm/dts/stm32mp157c-ed1.dts    | 12 ++--
>  arch/arm/dts/stm32mp157c-ev1.dts    | 13 ++--
>  arch/arm/dts/stm32mp15xx-dhcom.dtsi |  3 +-  arch/arm/dts/stm32mp15xx-
> dhcor.dtsi |  8 ---
>  arch/arm/dts/stm32mp15xx-dkx.dtsi   | 10 ++--
>  8 files changed, 126 insertions(+), 26 deletions(-)
> 

Applied to u-boot-stm/master, thanks!

Regards

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
