Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F95A1061F
	for <lists+uboot-stm32@lfdr.de>; Wed,  1 May 2019 10:30:06 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 361A3C36B3F
	for <lists+uboot-stm32@lfdr.de>; Wed,  1 May 2019 08:29:56 +0000 (UTC)
Received: from mx1.mailbox.org (mx1.mailbox.org [80.241.60.212])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D9DEFC36B3E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  1 May 2019 08:29:54 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:105:465:1:2:0])
 (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
 (No client certificate requested)
 by mx1.mailbox.org (Postfix) with ESMTPS id 2949F4BBA7;
 Wed,  1 May 2019 10:29:54 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.241])
 by spamfilter04.heinlein-hosting.de (spamfilter04.heinlein-hosting.de
 [80.241.56.122]) (amavisd-new, port 10030)
 with ESMTP id V2b6zew98SyN; Wed,  1 May 2019 10:29:48 +0200 (CEST)
To: Patrice Chotard <patrice.chotard@st.com>, Simon Glass <sjg@chromium.org>, 
 michal.simek@xilinx.com, u-boot@lists.denx.de
References: <1556637983-5654-1-git-send-email-patrice.chotard@st.com>
 <1556637983-5654-4-git-send-email-patrice.chotard@st.com>
From: Stefan Roese <sr@denx.de>
Message-ID: <9d65bfb1-4d7b-c55f-b7c1-9ade37b1d1d8@denx.de>
Date: Wed, 1 May 2019 10:29:45 +0200
MIME-Version: 1.0
In-Reply-To: <1556637983-5654-4-git-send-email-patrice.chotard@st.com>
Content-Language: en-US
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH v2 3/4] watchdog: stm32mp: Add watchdog
	driver
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

On 30.04.19 17:26, Patrice Chotard wrote:
> This patch adds IWDG (Independent WatchDoG) support for
> STM32MP platform.
> 
> Signed-off-by: Christophe Kerello <christophe.kerello@st.com>
> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
> ---
> 
> Changes in v2:
>     - Rename timeout variable in timeout_ms in stm32mp_wdt_start()

Reviewed-by: Stefan Roese <sr@denx.de>

Thanks,
Stefan
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
