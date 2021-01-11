Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 599F12F122C
	for <lists+uboot-stm32@lfdr.de>; Mon, 11 Jan 2021 13:15:12 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2D3E2C424C0;
	Mon, 11 Jan 2021 12:15:11 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 50CCBC32EA7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Jan 2021 12:15:08 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4DDt2350b2z1qs3d;
 Mon, 11 Jan 2021 13:15:07 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4DDt233YD8z1qr4M;
 Mon, 11 Jan 2021 13:15:07 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id kISlVmjp1A5c; Mon, 11 Jan 2021 13:15:05 +0100 (CET)
X-Auth-Info: nlPJMPa4agiNKxKzavF84eGlKODZ/qZkwTcl7nsCWSQ=
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Mon, 11 Jan 2021 13:15:05 +0100 (CET)
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, u-boot@lists.denx.de
References: <20210111123329.1.I62e8df98aef0f695209fcc494c90777fb5beccb4@changeid>
From: Marek Vasut <marex@denx.de>
Message-ID: <f8971553-1707-481d-b9a7-87acff670dc8@denx.de>
Date: Mon, 11 Jan 2021 13:15:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210111123329.1.I62e8df98aef0f695209fcc494c90777fb5beccb4@changeid>
Content-Language: en-US
Cc: uboot-stm32@st-md-mailman.stormreply.com, Tom Rini <trini@konsulko.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: Re: [Uboot-stm32] [PATCH] arm: dts: stm32mp15: alignment with
	v5.11-rc2
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

On 1/11/21 12:33 PM, Patrick Delaunay wrote:
> Device tree alignment with Linux kernel v5.11-rc2
> - fix DCMI DMA features on stm32mp15 family
> - Add alternate pinmux for FMC EBI bus
> - Harmonize EHCI/OHCI DT nodes name on stm32mp15
> - update sdmmc IP version for STM32MP15
> - Add LP timer irqs on stm32mp151
> - Add LP timer wakeup-source on stm32mp151
> - enable HASH by default on stm32mp15
> - enable CRC1 by default on stm32mp15
> - enable CRYP by default on stm32mp15
> - set bus-type in DCMI endpoint for stm32mp157c-ev1 board
> - reorder spi4 within stm32mp15-pinctrl
> - add STUSB1600 Type-C using I2C4 on stm32mp15xx-dkx
> - fix mdma1 clients channel priority level on stm32mp151
> - fix dmamux reg property on stm32mp151
> - adjust USB OTG gadget fifo sizes in stm32mp151
> - update stm32mp151 for remote proc synchronization support
> - support child mfd cells for the stm32mp1 TAMP syscon

Are you completely sure the dhcom based boards generate the same DT 
after the sync ?

I would rather prefer sync with Linux 5.10 (LTS), or is that not an 
option due to some extra DT patches ?

Either way, if you have an upstream queue for this DT sync somewhere, 
please give me a link, I plan to sync the dhcom boards after 2021.01 is 
out, so I would build on top of that.
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
