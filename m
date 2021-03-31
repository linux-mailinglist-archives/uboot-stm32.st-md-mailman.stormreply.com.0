Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A20BB34FC21
	for <lists+uboot-stm32@lfdr.de>; Wed, 31 Mar 2021 11:05:53 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5F157C5662E;
	Wed, 31 Mar 2021 09:05:53 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 84180C32EA7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 31 Mar 2021 09:05:50 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12V92DnF018418; Wed, 31 Mar 2021 11:05:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=9sAwgPp6ajATZSt4crkxXJ2Av2WoLQeWbnzHS1l9xyQ=;
 b=xfCK0l3JLL4INbualg5Bhtjqy6NUOJRJmJGhf4avKdo3XkTixlbCKqDAYSKjfM6Lal2L
 Up41wHzaWZVq8dIyqblyvyYN98PGbdj1gxudx3fI+C4Qb30bKr/Zy3zISTzgOrc21upP
 njRoD4HrreY24piLMkpEHNCLBA9tYvQkLTG2Aewt8e6AepetwBNMfNEQmUfZwdF8mzdd
 AJroPPUz7fbo2rEn19DezNoj5dcwpgbXFyjRXBKQBD6e7CNc67jLjWdmsgQ+0VBplPaf
 x95godzqyPvT0kvG704Cz9EColE9QQFqsQQt3pB08Q+tmyHYudmQ81aezNjfAuTABqv1 CQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 37mab5bguk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 31 Mar 2021 11:05:32 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0327410002A;
 Wed, 31 Mar 2021 11:05:28 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C36F52301CA;
 Wed, 31 Mar 2021 11:05:28 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.44) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 31 Mar
 2021 11:05:28 +0200
To: <dillon.minfei@gmail.com>, <kever.yang@rock-chips.com>,
 <andre.przywara@arm.com>, <priyanka.jain@nxp.com>,
 <jagan@amarulasolutions.com>, <narmstrong@baylibre.com>,
 <marex@denx.de>, <aford173@gmail.com>, <ioana.ciornei@nxp.com>,
 <josip.kelecic@sartura.hr>, <festevam@gmail.com>, <hs@denx.de>,
 <heiko.stuebner@theobroma-systems.com>, <u-boot@lists.denx.de>,
 <patrick.delaunay@foss.st.com>, <uboot-stm32@st-md-mailman.stormreply.com>
References: <1616987091-3432-1-git-send-email-dillon.minfei@gmail.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <cb2cd5bf-9f64-3076-6645-215769f4d271@foss.st.com>
Date: Wed, 31 Mar 2021 11:05:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1616987091-3432-1-git-send-email-dillon.minfei@gmail.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG3NODE1.st.com (10.75.127.7) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-31_03:2021-03-30,
 2021-03-31 signatures=0
Subject: Re: [Uboot-stm32] [PATCH v3 0/6] Add rt-thread art-pi board support
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

I discussed with Alexandre Torque about the pinctrl rework you did on kernel side for stm32h750.
When the kernel series will be fully accepted on kernel side, you can resubmit the equivalent on u-boot side.

Nevertheless, there is one issue i didn't spot on previous review regarding patch 4 "ram: stm32: fix strsep failed on read only memory"

Patrice

On 3/29/21 5:04 AM, dillon.minfei@gmail.com wrote:
> From: dillon min <dillon.minfei@gmail.com>
> 
> These patches aim to adds u-boot support on art-pi board.
> 
> the board resources:
> - stm32h750xbh6 128k flash, 1024k sram
> - 32MiB sdram
> - 16MiB spi flash
> - 8MiB qspi flash
> - onboard wifi, bt, fm
> 
> the detail board information can be found at:
> https://art-pi.gitee.io/website/
> 
> ---
> changes in v3:
> two mirror changes in [PATCH v3 2/6], others same to version 2
> - remove "for STMicroelectronics." from arch/arm/dts/stm32h750-pinctrl.dtsi
> - correct misspelling parameters
> you can found detail patch v2 information at link:
> https://patchwork.ozlabs.org/project/uboot/list/?series=236009
> 
> changes in v2:
> - fix wrong author/date in previous submit
> - sync with kernel device tree files
> - add st,stm32h750-pinctrl in doc and pinctrl driver
> 
> 
> *** BLURB HERE ***
> 
> dillon min (6):
>   ARM: dts: stm32: split sdram pin & timing parameter into specific
>     board dts
>   ARM: dts: stm32: Add RT-Thread art-pi board support
>   board: Add rt-thread art-pi board support
>   ram: stm32: fix strsep failed on read only memory
>   dt-bindings: pinctrl: stm32: Add st,stm32h750-pinctrl for stm32h750
>     soc
>   pinctrl: stm32: Add st,stm32h750-pinctrl compatible string
> 
>  arch/arm/dts/Makefile                              |   3 +-
>  arch/arm/dts/stm32h7-pinctrl.dtsi                  | 340 +++++++++++++++++++++
>  arch/arm/dts/stm32h7-u-boot.dtsi                   | 100 +-----
>  arch/arm/dts/stm32h743-pinctrl.dtsi                | 307 +------------------
>  arch/arm/dts/stm32h743.dtsi                        | 168 +++++++++-
>  arch/arm/dts/stm32h743i-disco-u-boot.dtsi          |  98 ++++++
>  arch/arm/dts/stm32h743i-eval-u-boot.dtsi           |  98 ++++++
>  arch/arm/dts/stm32h750-pinctrl.dtsi                |  11 +
>  arch/arm/dts/stm32h750.dtsi                        |   5 +
>  arch/arm/dts/stm32h750i-art-pi-u-boot.dtsi         |  81 +++++
>  arch/arm/dts/stm32h750i-art-pi.dts                 | 188 ++++++++++++
>  arch/arm/mach-stm32/stm32h7/Kconfig                |   4 +
>  board/st/stm32h750-art-pi/Kconfig                  |  19 ++
>  board/st/stm32h750-art-pi/MAINTAINERS              |   7 +
>  board/st/stm32h750-art-pi/Makefile                 |   6 +
>  board/st/stm32h750-art-pi/stm32h750-art-pi.c       |  58 ++++
>  configs/stm32h750-art-pi_defconfig                 |  51 ++++
>  .../pinctrl/st,stm32-pinctrl.txt                   |   1 +
>  drivers/pinctrl/pinctrl_stm32.c                    |   1 +
>  drivers/ram/stm32_sdram.c                          |   3 +
>  include/configs/stm32h750-art-pi.h                 |  48 +++
>  include/dt-bindings/memory/stm32-sdram.h           |   2 +
>  22 files changed, 1198 insertions(+), 401 deletions(-)
>  create mode 100644 arch/arm/dts/stm32h7-pinctrl.dtsi
>  create mode 100644 arch/arm/dts/stm32h750-pinctrl.dtsi
>  create mode 100644 arch/arm/dts/stm32h750.dtsi
>  create mode 100644 arch/arm/dts/stm32h750i-art-pi-u-boot.dtsi
>  create mode 100644 arch/arm/dts/stm32h750i-art-pi.dts
>  create mode 100644 board/st/stm32h750-art-pi/Kconfig
>  create mode 100644 board/st/stm32h750-art-pi/MAINTAINERS
>  create mode 100644 board/st/stm32h750-art-pi/Makefile
>  create mode 100644 board/st/stm32h750-art-pi/stm32h750-art-pi.c
>  create mode 100644 configs/stm32h750-art-pi_defconfig
>  create mode 100644 include/configs/stm32h750-art-pi.h
> 
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
