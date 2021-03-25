Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0165134945A
	for <lists+uboot-stm32@lfdr.de>; Thu, 25 Mar 2021 15:41:20 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9C805C57B5E;
	Thu, 25 Mar 2021 14:41:19 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A458DC5662E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Mar 2021 14:41:16 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12PEWWTg029605; Thu, 25 Mar 2021 15:41:00 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=Y7UggVWX08yPrDALY1OeRjEIV7AvS83TBWJxbZrEWyg=;
 b=XI+vFz8gXfZx0S7QL/UHXZUewvSvlSc8iT+CT/t/JQbNcTM/XZqDtxB/Zvd1AXr2DMg1
 2jdDuUwZN8fASMfY8L2DaFWgi2p7HXi8PwSZkle09Wcxtj4MWCmKgzpENF/0yCnMgObS
 VGysSyl50vurqKC0OxgJT5hybsLvfGQ2s7THp9bWOQbTwb+pkmg8cdO4UintCTeHi+HZ
 NbC1epyt1xFHv7CU6SQQKUGVQRmGjHPKj3P72E+vBnkYDB1cliKAqCatMaWbwOLNbg3b
 TQ3cOwSm8rxBhwDLrdiGj6aKxSTPK2LZw1Gpai8wzrWw2SoDW+DL/Cf/7b5/L7ktM6b5 xQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 37d8tpw75n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Mar 2021 15:41:00 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id F195D10002A;
 Thu, 25 Mar 2021 15:40:58 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BC271270002;
 Thu, 25 Mar 2021 15:40:58 +0100 (CET)
Received: from lmecxl0573.lme.st.com (10.75.127.45) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 25 Mar
 2021 15:40:56 +0100
To: <dillon.minfei@gmail.com>, <kever.yang@rock-chips.com>,
 <andre.przywara@arm.com>, <priyanka.jain@nxp.com>,
 <jagan@amarulasolutions.com>, <narmstrong@baylibre.com>,
 <marex@denx.de>, <aford173@gmail.com>, <ioana.ciornei@nxp.com>,
 <josip.kelecic@sartura.hr>, <festevam@gmail.com>, <hs@denx.de>,
 <heiko.stuebner@theobroma-systems.com>, <u-boot@lists.denx.de>,
 <patrick.delaunay@foss.st.com>, <uboot-stm32@st-md-mailman.stormreply.com>
References: <1615445040-13757-1-git-send-email-dillon.minfei@gmail.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <102900f0-f583-2195-edd5-6d3052313de9@foss.st.com>
Date: Thu, 25 Mar 2021 15:40:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1615445040-13757-1-git-send-email-dillon.minfei@gmail.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-25_03:2021-03-24,
 2021-03-25 signatures=0
Subject: Re: [Uboot-stm32] [PATCH 0/4] Add rt-thread art-pi board support
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

One general remark, i saw that you have submitted a similar serie on kernel side
to add rt_thread art-pi board support.
On this kernel series, you split the DT pinctrl files by introducing stm32h7-pinctrl.dtsi file. 
Can you apply the same device tree files split between kernel and u-boot please.

The idea is that u-boot and kernel device tree files are in sync.

Thanks
Patrice



On 3/11/21 7:43 AM, dillon.minfei@gmail.com wrote:
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
> dillon min (4):
>   ARM: dts: stm32: split sdram pin & timing parameter into specific
>     board dts
>   ARM: dts: stm32: Add RT-Thread art-pi board support
>   board: Add rt-thread art-pi board support
>   ram: stm32: fix strsep failed on read only memory
> 
>  arch/arm/dts/Makefile                        |   3 +-
>  arch/arm/dts/stm32h7-u-boot.dtsi             |  95 --------
>  arch/arm/dts/stm32h743.dtsi                  |   8 +
>  arch/arm/dts/stm32h743i-disco-u-boot.dtsi    |  98 ++++++++
>  arch/arm/dts/stm32h743i-eval-u-boot.dtsi     |  98 ++++++++
>  arch/arm/dts/stm32h750-pinctrl.dtsi          | 319 +++++++++++++++++++++++++++
>  arch/arm/dts/stm32h750.dtsi                  |   5 +
>  arch/arm/dts/stm32h750i-art-pi-u-boot.dtsi   |  81 +++++++
>  arch/arm/dts/stm32h750i-art-pi.dts           |  75 +++++++
>  arch/arm/mach-stm32/stm32h7/Kconfig          |   4 +
>  board/st/stm32h750-art-pi/Kconfig            |  19 ++
>  board/st/stm32h750-art-pi/MAINTAINERS        |   7 +
>  board/st/stm32h750-art-pi/Makefile           |   6 +
>  board/st/stm32h750-art-pi/stm32h750-art-pi.c |  58 +++++
>  configs/stm32h750-art-pi_defconfig           |  51 +++++
>  drivers/ram/stm32_sdram.c                    |   3 +
>  include/configs/stm32h750-art-pi.h           |  48 ++++
>  include/dt-bindings/memory/stm32-sdram.h     |   2 +
>  18 files changed, 884 insertions(+), 96 deletions(-)
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
