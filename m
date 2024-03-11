Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E80877F71
	for <lists+uboot-stm32@lfdr.de>; Mon, 11 Mar 2024 13:02:16 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 47CCAC6DD9E;
	Mon, 11 Mar 2024 12:02:16 +0000 (UTC)
Received: from mail.manjaro.org (mail.manjaro.org [116.203.91.91])
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 06ADEC6DD73
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Mar 2024 12:02:14 +0000 (UTC)
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
 t=1710158533;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xlq9tXKGEeyRJJXWM60KcN5E64tSe5+49C64tueXO3s=;
 b=CK7NFQaZYRm/8g8dyG7bhFMsSniIqK7vSVMp0Bpear6yPoElaUlxGAYq2eFUL9Qie/7Ehx
 4jWpUf/TPsXIPn8eED9FzGG/Fp921Tu4bHkJPDPv9wS8J9biRgBzQfcB2lSNeMee5pcuRn
 3K97UbtcOKS58cAfwvAbLrD8AhMDtmDtZQYEKZoqcyAfcb92QZKaFAqcIqT+MAKsV7Q8E2
 5L6wfv6e5bUsw0hi1aRlZI9Y4pMCQ0pC+XPsAdKX5anU34UdUBfvGJvH/AHtyjcAlkFzhM
 d5hjMVXftY61wD/ct3WFct+wl/gJCI8K91XB+4fbt/6ZAyjL5xI1zKyyacV6fg==
Date: Mon, 11 Mar 2024 13:02:13 +0100
From: Dragan Simic <dsimic@manjaro.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
In-Reply-To: <5b95fea0-581a-44e5-b275-09393b7b02a1@moroto.mountain>
References: <20240308133404.2619848-1-patrice.chotard@foss.st.com>
 <5b95fea0-581a-44e5-b275-09393b7b02a1@moroto.mountain>
Message-ID: <e2d52a2d1d420c7b9da362a5c5f433fe@manjaro.org>
X-Sender: dsimic@manjaro.org
Authentication-Results: ORIGINATING;
 auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
Cc: Tom Rini <trini@konsulko.com>, Simon Glass <sjg@chromium.org>,
 Hugo Villeneuve <hvilleneuve@dimonoff.com>, u-boot@lists.denx.de,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH] fdt_support: fix
	fdt_copy_fixed_partitions function()
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

On 2024-03-11 12:37, Dan Carpenter wrote:
> On Fri, Mar 08, 2024 at 02:34:04PM +0100, Patrice Chotard wrote:
>> Move variable declaration at the beginning of the function.
> 
> The problem, presumably, is that when declarations are in the middle of
> a block then it triggers a GCC warning.  "declarations after code" or
> whatever...  The commit message is not really clear.

IIRC, there's at least one more such case of block-local variables in
the same source code file, so perhaps we should move those as well, if
the final decision is to move some of them.

> And when I built this file I don't get a warning.  Is there a specific
> config required to trigger the warning?
> 
> Btw, the Linux kernel recently silenced this warning because it doesn't
> work well with the cleanup.h code...  It will be interesting to see if
> people abandon this style guideline.
> 
> regards,
> dan carpenter
> 
>> Fixes: 163c5f60ebb4 ("fdt_support: add fdt_copy_fixed_partitions 
>> function")
>> 
>> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
>> ---
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
