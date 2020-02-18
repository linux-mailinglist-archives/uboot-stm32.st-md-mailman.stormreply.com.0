Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C96162D7A
	for <lists+uboot-stm32@lfdr.de>; Tue, 18 Feb 2020 18:53:37 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2FD26C36B0A
	for <lists+uboot-stm32@lfdr.de>; Tue, 18 Feb 2020 17:53:37 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 029BFC36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Feb 2020 17:53:36 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 48MT3z0CR5z1qrLr;
 Tue, 18 Feb 2020 18:53:35 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 48MT3y5y4Xz1qqkk;
 Tue, 18 Feb 2020 18:53:34 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id m6xTWEfLN9bu; Tue, 18 Feb 2020 18:53:31 +0100 (CET)
X-Auth-Info: HLKc3wMmUtXE5C1wohRZPb3osmKYhk8fBjeh5Dd6xRg=
Received: from [IPv6:::1] (unknown [195.140.253.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Tue, 18 Feb 2020 18:53:31 +0100 (CET)
To: Patrick Delaunay <patrick.delaunay@st.com>, u-boot@lists.denx.de
References: <20200218083503.5468-1-patrick.delaunay@st.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <6ca7cd1f-c86e-aa38-adf8-8b9ee3f56dd8@denx.de>
Date: Tue, 18 Feb 2020 18:44:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200218083503.5468-1-patrick.delaunay@st.com>
Content-Language: en-US
Cc: Peng Fan <peng.fan@nxp.com>,
 Daniel Schwierzeck <daniel.schwierzeck@gmail.com>,
 Simon Glass <sjg@chromium.org>, simon.k.r.goldschmidt@gmail.com,
 Sekhar Nori <nsekhar@ti.com>, Lukasz Majewski <lukma@denx.de>,
 ley.foon.tan@intel.com, b.galvani@gmail.com,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Jean-Jacques Hiblot <jjhiblot@ti.com>, Michal Suchanek <msuchanek@suse.de>
Subject: Re: [Uboot-stm32] [PATCH v4 0/5] usb: host: dwc2: use driver model
 for PHY and CLOCK
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

On 2/18/20 9:34 AM, Patrick Delaunay wrote:
> 
> In this serie I update the DWC2 host driver to use the device tree
> information and the associated PHY and CLOCK drivers when they are
> availables.
> 
> The V4 is rebased on latest master (v2020.04-rc2).
> CI-Tavis build is OK:
>     https://travis-ci.org/patrickdelaunay/u-boot/builds/651479714
> 
> NB: CI-Travis build was OK for all target after V3:
>     https://travis-ci.org/patrickdelaunay/u-boot/builds/609496187
>     As in V2, I cause the warnings for some boards:
>     drivers/usb/host/built-in.o: In function `dwc2_usb_remove':
>     drivers/usb/host/dwc2.c:1441: undefined reference to `clk_disable_bulk'
> 
> I test this serie on stm32mp157c-ev1 board, with PHY and CLK
> support
> 
> The U-CLASS are provided by:
> - PHY by USBPHYC driver = ./drivers/phy/phy-stm32-usbphyc.c
> - CLOCK by RCC clock driver = drivers/clk/clk_stm32mp1.c
> - RESET by RCC reset driver = drivers/reset/stm32-reset.c
> 
> And I activate the configuration
> +CONFIG_USB_DWC2=y

Simon, can you test this on SOCFPGA ?

[...]
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
