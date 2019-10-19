Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BB639DDAC9
	for <lists+uboot-stm32@lfdr.de>; Sat, 19 Oct 2019 22:02:17 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 726CAC36B0A
	for <lists+uboot-stm32@lfdr.de>; Sat, 19 Oct 2019 20:02:17 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1EEC9C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 19 Oct 2019 20:02:16 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 46wYhk6frtz1qrJY;
 Sat, 19 Oct 2019 22:02:14 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 46wYhk5xnxz1qqkB;
 Sat, 19 Oct 2019 22:02:14 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id BY_rJ9CZk0CJ; Sat, 19 Oct 2019 22:02:13 +0200 (CEST)
X-Auth-Info: TRdkSVSXRSVqDnoDlBUThnuZsWC97i51zrjxYW9xbrU=
Received: from crub (p54833695.dip0.t-ipconnect.de [84.131.54.149])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Sat, 19 Oct 2019 22:02:13 +0200 (CEST)
Date: Sat, 19 Oct 2019 22:02:13 +0200
From: Anatolij Gustschin <agust@denx.de>
To: Tom Rini <trini@konsulko.com>
Message-ID: <20191019220213.22f7a799@crub>
In-Reply-To: <20191018182922.22960-1-patrick.delaunay@st.com>
References: <20191018182922.22960-1-patrick.delaunay@st.com>
MIME-Version: 1.0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de, Marek Vasut <marek.vasut+renesas@gmail.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Christoph Muellner <christoph.muellner@theobroma-systems.com>
Subject: Re: [Uboot-stm32] [U-Boot] [PATCH] dm: pinctrl: fix for introduce
 PINCONF_RECURSIVE option
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

Hi Tom,

On Fri, 18 Oct 2019 20:29:22 +0200
Patrick Delaunay patrick.delaunay@st.com wrote:
...
> This correct a regression introduced by
> commit c20851b3d850 ("dm: pinctrl: introduce PINCONF_RECURSIVE
> option")

Could you please apply this patch ASAP? It fixes broken eMMC, Ethernet,
I2C, GPIO, etc. on i.MX8QXP MEK board.

Many other boards are affected, too.

Thanks!

--
Anatolij

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
