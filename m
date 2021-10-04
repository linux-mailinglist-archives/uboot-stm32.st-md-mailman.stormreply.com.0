Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F15C1420856
	for <lists+uboot-stm32@lfdr.de>; Mon,  4 Oct 2021 11:33:47 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A2EAAC5AB62;
	Mon,  4 Oct 2021 09:33:47 +0000 (UTC)
Received: from sibelius.xs4all.nl (sibelius.xs4all.nl [83.163.83.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DE3ACC57182
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 Oct 2021 09:33:46 +0000 (UTC)
Received: from localhost (bloch.sibelius.xs4all.nl [local])
 by bloch.sibelius.xs4all.nl (OpenSMTPD) with ESMTPA id 90e2e1a0;
 Mon, 4 Oct 2021 11:33:45 +0200 (CEST)
Date: Mon, 4 Oct 2021 11:33:45 +0200 (CEST)
From: Mark Kettenis <mark.kettenis@xs4all.nl>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
In-Reply-To: <20211004112322.1.Ibee20141b9082ea184cc316944070e647a60fc92@changeid>
 (message from Patrick Delaunay on Mon, 4 Oct 2021 11:23:41 +0200)
References: <20211004112322.1.Ibee20141b9082ea184cc316944070e647a60fc92@changeid>
Message-ID: <d3ca34b4c49eb8d4@bloch.sibelius.xs4all.nl>
Cc: marex@denx.de, oleksandr.suvorov@toradex.com, mbrugger@suse.com,
 sebastian.reichel@collabora.com, ian.ray@ge.com, sjg@chromium.org,
 lukma@denx.de, rick@andestech.com, jh80.chung@samsung.com,
 u-boot@lists.denx.de, uboot-stm32@st-md-mailman.stormreply.com,
 a-govindraju@ti.com, jagan@amarulasolutions.com, patrick.delaunay@foss.st.com,
 seanga2@gmail.com
Subject: Re: [Uboot-stm32] [PATCH] configs: Move some usb config in defconfig
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

> From: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Date: Mon, 4 Oct 2021 11:23:41 +0200
> 
> Using the tools moveconfig.py to move the following config in the
> defconfig files:
>  CONFIG_USB_HOST_ETHER
>  CONFIG_USB_ETHER_ASIX
>  CONFIG_USB_ETHER_MCS7830
>  CONFIG_USB_ETHER_SMSC95XX
> 
> These option are already migrated since the commit f58ad98a621c ("usb: net:
> migrate USB Ethernet adapters to Kconfig") and the commit ae3584498bf8
> ("usb: net: migrate CONFIG_USB_HOST_ETHER to Kconfig").
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  configs/dh_imx6_defconfig       | 2 ++
>  configs/kp_imx6q_tpc_defconfig  | 2 ++
>  configs/mx53ppd_defconfig       | 4 ++++
>  configs/stih410-b2260_defconfig | 4 ++++
>  include/configs/dh_imx6.h       | 2 --
>  include/configs/kp_imx6q_tpc.h  | 2 --
>  include/configs/mx53ppd.h       | 4 ----
>  include/configs/stih410-b2260.h | 5 -----
>  8 files changed, 12 insertions(+), 13 deletions(-)

Reviewed-by: Mark Kettenis <kettenis@openbsd.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
