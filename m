Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D557F1A48AF
	for <lists+uboot-stm32@lfdr.de>; Fri, 10 Apr 2020 18:53:13 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 88095C36B0A
	for <lists+uboot-stm32@lfdr.de>; Fri, 10 Apr 2020 16:53:13 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4D89FC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Apr 2020 16:53:11 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 48zPGF0RVbz1rlht;
 Fri, 10 Apr 2020 18:53:08 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 48zPGD5vZhz1qqkg;
 Fri, 10 Apr 2020 18:53:08 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id ATGdVbozTPIV; Fri, 10 Apr 2020 18:53:07 +0200 (CEST)
X-Auth-Info: B29b6u9w/V/8YEMnNGD5xhPxHY7Ys2Ig2iMDLSQUuIY=
Received: from [IPv6:::1] (unknown [195.140.253.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Fri, 10 Apr 2020 18:53:07 +0200 (CEST)
To: Patrick Delaunay <patrick.delaunay@st.com>, u-boot@lists.denx.de
References: <20200410163403.1.I3190d9b77167a808c65f44883fd1bc1c1d15218a@changeid>
 <20200410163403.3.I2f2c3584fe42d6c42910d2e7e40d236910365a89@changeid>
From: Marek Vasut <marex@denx.de>
Message-ID: <bc8ebb55-fa80-6702-2585-1a9b645454df@denx.de>
Date: Fri, 10 Apr 2020 18:43:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200410163403.3.I2f2c3584fe42d6c42910d2e7e40d236910365a89@changeid>
Content-Language: en-US
Cc: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>,
 Pascal Linder <pascal.linder@edu.hefr.ch>, Simon Glass <sjg@chromium.org>,
 Kever Yang <kever.yang@rock-chips.com>, Ley Foon Tan <ley.foon.tan@intel.com>,
 Holger Brunck <holger.brunck@ch.abb.com>, Mario Six <mario.six@gdsys.cc>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Stefan Roese <sr@denx.de>, Marek Vasut <marek.vasut+renesas@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH 3/3] rmobile: rcar: removed used
	CONFIG_SYS_RCAR_I2C*_BASE
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

On 4/10/20 4:34 PM, Patrick Delaunay wrote:
> As this "CONFIG" are never used, CONFIG_SYS_RCAR_I2C*_BASE can
> be removed without effect and the file config_whitelist.txt is
> also clean-up.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
> 
>  arch/arm/mach-rmobile/include/mach/rcar-base.h | 6 ------
>  scripts/config_whitelist.txt                   | 4 ----
>  2 files changed, 10 deletions(-)

Update the README too, otherwise look good, thanks.
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
