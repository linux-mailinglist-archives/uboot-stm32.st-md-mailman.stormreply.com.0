Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 41909573507
	for <lists+uboot-stm32@lfdr.de>; Wed, 13 Jul 2022 13:13:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 017CBC64100;
	Wed, 13 Jul 2022 11:13:09 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5989CC640FC
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 Jul 2022 11:13:07 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26D8uJu6023228;
 Wed, 13 Jul 2022 13:13:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=selector1;
 bh=9OQhHONRzFVV84RJHqxMo4wlQKy76Nj04yZU/9SKwlM=;
 b=vRHvVZScwhm4XzHRucP4VBEKfMGNYgNKU/4gm65yMRR60fkvdCSIIKnjveA5ROoaPTkz
 UTPIJHz3ahwKHqYiSYtik1HTpCYbXf+hyGH7WSJUZCtabnh8DrDWAKxwOrewRctYLnEb
 t2I/SBZnPEwc9/A959yZcVYOLhoeyasNtCDagOaH2/doy5rmI3nz3hwSa8U/kOuliovw
 d7vcnEBgYEDTY7uUURDMoW/94DwHuAk6l2t6Yn7LokOOaCX12hHeueZjO2Y3zKWlgWjL
 e9flcMfmDlmPB1wRDXAYojnaTWnzkUweKkdyrrl+Dpn9LeqnFokeo/du67XxbfEYtJWc aQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3h94gughxk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Jul 2022 13:13:05 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 834B0100038;
 Wed, 13 Jul 2022 13:13:04 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node6.st.com [10.75.129.135])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7E5DC21B52C;
 Wed, 13 Jul 2022 13:13:04 +0200 (CEST)
Received: from localhost (10.75.127.44) by EQNDAG1NODE6.st.com (10.75.129.135)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Wed, 13 Jul
 2022 13:13:04 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>, Patrick Delaunay <patrick.delaunay@foss.st.com>
Date: Wed, 13 Jul 2022 13:12:52 +0200
Message-ID: <165771069387.1352308.10283747647998238246.b4-ty@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220705165545.1.If6846005f2384c6cc800089ee2d23466c0b2054f@changeid>
References: <20220705165545.1.If6846005f2384c6cc800089ee2d23466c0b2054f@changeid>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To EQNDAG1NODE6.st.com
 (10.75.129.135)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-12_14,2022-07-13_02,2022-06-22_01
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 Alexandre TORGUE <alexandre.torgue@foss.st.com>,
 Gabriel FERNANDEZ <gabriel.fernandez@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Etienne CARRIERE <etienne.carriere@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH 1/4] ARM: dts: stm32mp15: alignment with
	v5.19
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

On Tue, 5 Jul 2022 16:55:54 +0200, Patrick Delaunay wrote:
> Device tree alignment with Linux kernel v5.19-rc1
> 
> - ARM: dts: stm32: Add alternate pinmux for ethernet0 pins
> - ARM: dts: stm32: Add alternate pinmux for mco2 pins
> - ARM: dts: stm32: fix pinctrl node name warnings (MPU soc)
> - ARM: dts: stm32: stm32mp15-pinctrl: add spi1-1 pinmux group
> - dt-bindings: clock: add IDs for SCMI clocks on stm32mp15
> - dt-bindings: reset: add IDs for SCMI reset domains on stm32mp15
> - dt-bindings: clock: stm32mp15: rename CK_SCMI define
> - dt-bindings: reset: stm32mp15: rename RST_SCMI define
> - dt-bindings: reset: add MCU HOLD BOOT ID for SCMI reset domains
>   on stm32mp15
> - dt-bindings: clk: cleanup comments
> - ARM: dts: align SPI NOR node name with dtschema
> - ARM: dts: stm32: enable optee firmware and SCMI support on STM32MP15
> - ARM: dts: stm32: Add SCMI version of STM32 boards (DK1/DK2/ED1/EV1)
> - ARM: dts: stm32: move SCMI related nodes in a dedicated file for
>   stm32mp15
> 
> [...]

Applied to stm32/master, thanks!

[1/4] ARM: dts: stm32mp15: alignment with v5.19
      commit: 69ef98b209e7e392d4a31d99cb4fa249f8a58ac0
[2/4] clk: stm32: add support compatible st, stm32mp1-rcc-secure
      commit: 43872790d8eeb2055aebc13b09fba3dbb2f8dcaf
[3/4] configs: stm32mp15: increase malloc size for pre-reloc
      commit: 7f4de655c0ff460c1a4ee6ea00208327ab54e22d
[4/4] ARM: dts: stm32: add SCMI version of STM32 boards (DK1/DK2/ED1/EV1)
      commit: 6cccc8d396bfd68bbf695b3b3c92e60b8bdf8b77

Best regards,
-- 
Patrick Delaunay <patrick.delaunay@foss.st.com>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
