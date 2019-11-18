Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BD2A31002A8
	for <lists+uboot-stm32@lfdr.de>; Mon, 18 Nov 2019 11:42:40 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7AE40C36B0A
	for <lists+uboot-stm32@lfdr.de>; Mon, 18 Nov 2019 10:42:40 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5AB96C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 Nov 2019 10:42:39 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 47GlsB3Y99z1rD8y;
 Mon, 18 Nov 2019 11:42:38 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 47GlsB38D5z1qqv7;
 Mon, 18 Nov 2019 11:42:38 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id 7wgqtpnbYsg1; Mon, 18 Nov 2019 11:42:37 +0100 (CET)
X-Auth-Info: 4WEO38lehnh1CeMSDUAGH5576kK3ttpx7SU6YrjXK9k=
Received: from crub (p54833695.dip0.t-ipconnect.de [84.131.54.149])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Mon, 18 Nov 2019 11:42:37 +0100 (CET)
Date: Mon, 18 Nov 2019 11:42:36 +0100
From: Anatolij Gustschin <agust@denx.de>
To: Patrick Delaunay <patrick.delaunay@st.com>, <u-boot@lists.denx.de>
Message-ID: <20191118114236.5b711de3@crub>
In-Reply-To: <20191112153954.1.Iff44a1504ac7a1605e9ea0706753235c6b9cab15@changeid>
References: <20191112153954.1.Iff44a1504ac7a1605e9ea0706753235c6b9cab15@changeid>
MIME-Version: 1.0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Yannick =?UTF-8?B?RmVydHLDqQ==?= <yannick.fertre@st.com>
Subject: Re: [Uboot-stm32] [PATCH] video: stm32: remove the compatible
 "synopsys, dw-mipi-dsi" support
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

On Tue, 12 Nov 2019 15:39:58 +0100
Patrick Delaunay patrick.delaunay@st.com wrote:
...
>  arch/arm/dts/stm32mp157c-dk2-u-boot.dtsi |  7 -------
>  arch/arm/dts/stm32mp157c-ev1-u-boot.dtsi |  5 -----
>  drivers/video/dw_mipi_dsi.c              |  6 ------
>  drivers/video/stm32/stm32_dsi.c          | 15 ++++++++++++++-
>  4 files changed, 14 insertions(+), 19 deletions(-)

Applied to u-boot-video, thanks!

--
Anatolij
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
