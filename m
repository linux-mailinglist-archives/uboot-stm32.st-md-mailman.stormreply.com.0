Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B36AD1A23
	for <lists+uboot-stm32@lfdr.de>; Mon,  9 Jun 2025 10:58:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 708D0C3F93A;
	Mon,  9 Jun 2025 08:58:27 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 05CA2C3F939
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Jun 2025 08:58:26 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5597m31r016958;
 Mon, 9 Jun 2025 10:57:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 SkBf+Ze/ezVc5esXxcX/rRlv6cQiZAprx3PjoXX3thE=; b=o7A1sOTvNL5STJjp
 yugzCNIzDSe8CemA0apQhsLt9+0hETw7EJ73wA6pzPgmcx95Gr/kNbuEaXGgycrP
 2vddRGI110F96rpUvlM4fB0plHXEJII2OK3ND0raqeGoPBrTVhTMGkCTV00ur9cs
 kiQ+jNrSLXM2oXrnXD48kqY8u2SWIsb5fXb6DURDaJ5JZZFaUvWsasByXaKWVG1L
 LD/xljzrJNNFy2MwQMUnO4Lb/Czbg7SJV7pMwhoHGy3Cn2K6SrTXQAjSMGuEaErm
 H4VBw7A8pOomU8m6ahiRn/Q5PcN1Y06rDq/noC5NPUKgqj1lcGi8boa0o0uy2yBa
 ILMGUQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 474cahe6k8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Jun 2025 10:57:36 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id D47754002D;
 Mon,  9 Jun 2025 10:54:22 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6CE74B6F70E;
 Mon,  9 Jun 2025 10:53:10 +0200 (CEST)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 9 Jun
 2025 10:53:08 +0200
Message-ID: <6dde0043-3331-4596-8597-7773341c2dd1@foss.st.com>
Date: Mon, 9 Jun 2025 10:53:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: <u-boot@lists.denx.de>
References: <20250527132755.2169508-1-patrice.chotard@foss.st.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20250527132755.2169508-1-patrice.chotard@foss.st.com>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_03,2025-06-05_01,2025-03-28_01
Cc: Peng Fan <peng.fan@nxp.com>, Valentin Caron <valentin.caron@foss.st.com>,
 Kongyang Liu <seashell11234455@gmail.com>,
 Casey Connolly <casey.connolly@linaro.org>,
 Mattijs Korpershoek <mkorpershoek@kernel.org>,
 Jan Kiszka <jan.kiszka@siemens.com>, Kever Yang <kever.yang@rock-chips.com>,
 Sean Anderson <seanga2@gmail.com>, Joe Hershberger <joe.hershberger@ni.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Alice Guo <alice.guo@nxp.com>,
 Lukasz Majewski <lukma@denx.de>,
 Nathan Barrett-Morrison <nathan.morrison@timesys.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Christian Marangi <ansuelsmth@gmail.com>, Joseph Chen <chenjh@rock-chips.com>,
 Ye Li <ye.li@nxp.com>, Jerome Forissier <jerome.forissier@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, Oliver Gaskell <Oliver.Gaskell@analog.com>,
 Huan Zhou <me@per1cycle.org>, Elaine Zhang <zhangqing@rock-chips.com>,
 Sumit Garg <sumit.garg@kernel.org>, Sughosh Ganu <sughosh.ganu@linaro.org>,
 Igor Opaniuk <igor.opaniuk@gmail.com>, Robert Marko <robert.marko@sartura.hr>,
 Sam Protsenko <semen.protsenko@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Leo Yu-Chi Liang <ycliang@andestech.com>, Greg Malysa <malysagreg@gmail.com>,
 Alexander Dahl <ada@thorsis.com>, Simon Glass <sjg@chromium.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Paul Barker <paul.barker.ct@bp.renesas.com>
Subject: Re: [Uboot-stm32] [PATCH v2 00/13] stm32mp25: Add clock and reset
	drivers support
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



On 5/27/25 15:27, Patrice Chotard wrote:
> 
> Add clock and reset drivers support for STM32MP2 platforms:
>   - add SCMI clock protocol v2.0 support
>   - introduce CONFIG_CLK_AUTO_ID flag to support unique clk ID
>     when several clock providers are in use.
>   - add STM32MP2 clock  driver
>   - add STM32MP2 reset driver
>   - fix clock counter
> 
> Tested with following components:
>   _ TF-A lts-v2.12.2.
>   _ SCP-firmware main branch (commit c914b3f0c756 "fwk: Refactor fwk_module_get_sub_element_count").
>   _ OP-TEE 4.6.0 + pull request https://github.com/OP-TEE/optee_os/pull/7324
> 
> 
> Changes in v2:
>     - Rename GATE_USB2 into GATE_USBH
>     - Rename RCC_USB2CFGR to RCC_USBHCFGR
> 
> Gabriel Fernandez (4):
>   clk: stm32mp25: Add clock driver support
>   clk: stm32mp25: implement clock check security function
>   clk: stm32: fix clock counter
>   reset: stm32mp25: add stm32mp25 reset driver
> 
> Patrice Chotard (2):
>   ARM: dts: stm32: switch from fixed to scmi clocks for stm32mp257f-ev1
>   configs: stm32mp25: increase SYS_MALLOC_F_LEN to 0x60000
> 
> Patrick Delaunay (6):
>   clk: add CONFIG_CLK_AUTO_ID
>   clk: sandbox: update driver for CONFIG_CLK_AUTO_ID support
>   sandbox: test: update for CONFIG_CLK_AUTO_ID support
>   clk: fixed_rate: configure clock ID with CONFIG_CLK_AUTO_ID
>   clk: scmi: manage properly the clk identifier with CCF
>   phy: stm32-usbphyc: manage properly the clk identifier with CCF
> 
> Valentin Caron (1):
>   clk: scmi: add compatibility with clock protocol 2.0
> 
>  MAINTAINERS                              |   3 +-
>  arch/arm/dts/stm32mp25-u-boot.dtsi       |   8 +
>  arch/arm/dts/stm32mp257f-ev1-u-boot.dtsi |  74 ---
>  configs/stm32mp25_defconfig              |   2 +-
>  drivers/clk/Kconfig                      |  11 +
>  drivers/clk/clk-uclass.c                 |   9 +-
>  drivers/clk/clk_fixed_rate.c             |   1 +
>  drivers/clk/clk_sandbox.c                |  30 +-
>  drivers/clk/clk_sandbox_ccf.c            |  48 +-
>  drivers/clk/clk_scmi.c                   |  62 +-
>  drivers/clk/stm32/Kconfig                |   9 +
>  drivers/clk/stm32/Makefile               |   1 +
>  drivers/clk/stm32/clk-stm32-core.c       |  73 ++-
>  drivers/clk/stm32/clk-stm32-core.h       |   2 +-
>  drivers/clk/stm32/clk-stm32mp13.c        |   2 +-
>  drivers/clk/stm32/clk-stm32mp25.c        | 782 +++++++++++++++++++++++
>  drivers/misc/stm32_rcc.c                 |  66 +-
>  drivers/phy/phy-stm32-usbphyc.c          |  19 +
>  drivers/reset/Kconfig                    |   9 +-
>  drivers/reset/Makefile                   |   4 +-
>  drivers/reset/stm32-reset.c              |  97 ---
>  drivers/reset/stm32/Kconfig              |  23 +
>  drivers/reset/stm32/Makefile             |   9 +
>  drivers/reset/stm32/stm32-reset-core.c   |  92 +++
>  drivers/reset/stm32/stm32-reset-core.h   |  31 +
>  drivers/reset/stm32/stm32-reset-mp1.c    |  55 ++
>  drivers/reset/stm32/stm32-reset-mp25.c   | 159 +++++
>  drivers/reset/stm32/stm32-reset.c        |  43 ++
>  include/clk.h                            |  24 +
>  include/linux/clk-provider.h             |   9 +-
>  include/scmi_protocols.h                 |  15 +
>  include/stm32_rcc.h                      |   7 +-
>  include/stm32mp25_rcc.h                  | 712 +++++++++++++++++++++
>  test/dm/clk_ccf.c                        |  30 +-
>  34 files changed, 2227 insertions(+), 294 deletions(-)
>  create mode 100644 drivers/clk/stm32/clk-stm32mp25.c
>  delete mode 100644 drivers/reset/stm32-reset.c
>  create mode 100644 drivers/reset/stm32/Kconfig
>  create mode 100644 drivers/reset/stm32/Makefile
>  create mode 100644 drivers/reset/stm32/stm32-reset-core.c
>  create mode 100644 drivers/reset/stm32/stm32-reset-core.h
>  create mode 100644 drivers/reset/stm32/stm32-reset-mp1.c
>  create mode 100644 drivers/reset/stm32/stm32-reset-mp25.c
>  create mode 100644 drivers/reset/stm32/stm32-reset.c
>  create mode 100644 include/stm32mp25_rcc.h
> 


For the whole series; 

Applied to u-boot-stm32/next

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
