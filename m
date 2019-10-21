Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4495DDF4D3
	for <lists+uboot-stm32@lfdr.de>; Mon, 21 Oct 2019 20:09:17 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B7546C36B0A
	for <lists+uboot-stm32@lfdr.de>; Mon, 21 Oct 2019 18:09:15 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EB54DC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Oct 2019 18:09:13 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 46xl5P2VHDz1rGRb;
 Mon, 21 Oct 2019 20:09:13 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 46xl5P1mKTz1qqkC;
 Mon, 21 Oct 2019 20:09:13 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id 4MYEWHapcD6N; Mon, 21 Oct 2019 20:09:11 +0200 (CEST)
X-Auth-Info: mE1LO4L8FS0x9HDFDxAJ73jWp9LMXgVwL3ioiIIn9HI=
Received: from crub (p54833695.dip0.t-ipconnect.de [84.131.54.149])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Mon, 21 Oct 2019 20:09:11 +0200 (CEST)
Date: Mon, 21 Oct 2019 20:09:10 +0200
From: Anatolij Gustschin <agust@denx.de>
To: Patrick DELAUNAY <patrick.delaunay@st.com>
Message-ID: <20191021200910.2903a235@crub>
In-Reply-To: <c7cf2c4dbaa245dfa80caa9af22dd98f@SFHDAG6NODE3.st.com>
References: <20191018182922.22960-1-patrick.delaunay@st.com>
 <20191019220213.22f7a799@crub>
 <c7cf2c4dbaa245dfa80caa9af22dd98f@SFHDAG6NODE3.st.com>
MIME-Version: 1.0
Cc: Tom Rini <trini@konsulko.com>, Simon Glass <sjg@chromium.org>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Marek Vasut <marek.vasut+renesas@gmail.com>,
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

Hi Patrick,

On Mon, 21 Oct 2019 17:10:21 +0000
Patrick DELAUNAY patrick.delaunay@st.com wrote:
...
> I check deeper today the root cause of the issue and I have a clean solution
> with v2 patch: http://patchwork.ozlabs.org/patch/1180575/
> 
> The friday patch wasn't enough at least for my board, but ok for sandbox.

OK, thanks for fixing it!

--
Anatolij
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
