Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D547D7865B7
	for <lists+uboot-stm32@lfdr.de>; Thu, 24 Aug 2023 05:12:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 80F94C6B44B;
	Thu, 24 Aug 2023 03:12:48 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 754CCC6907A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Aug 2023 03:12:47 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 6633D86547;
 Thu, 24 Aug 2023 05:12:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1692846767;
 bh=VV+6KJbcIiX5gz6L7600Pb6EIWyKeAwnsdC6otRTAS8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=mUG3Kr3t8BM4k4m0Tc3th6w7u602t5+yItp/bSix/3b7MQkvJ5eh4rtAcpDPltVDE
 Bha7CstJh5sqiHY7R8jSjMxXIHCft1gRlFekeawYCofIQb4TaIWLUjJGHXg3cvSiyg
 7+51EEaSAh4YFwqzM8qvqyQ7aSG9D19FRItMcUwGGIrSd7bTTy5FdGA9VwsNnFgYdY
 M4CV1i9/Fk3QwME0yfRpI/SDIZp6L5zw6HCYf0Bm/Dk8piDZdcf1/waXQVyxXgtXJZ
 /L0IrHZ9vgxYWziVzAdyd6NEIKr7/dR3oW1qFXC8Jvcqk1SriPiNRjBBhfCg9dxOoK
 kOGrMmzJ+lGNg==
Message-ID: <3ab486b0-be22-48b9-7417-742ed8360f0f@denx.de>
Date: Thu, 24 Aug 2023 05:12:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
To: Simon Glass <sjg@chromium.org>, U-Boot Mailing List <u-boot@lists.denx.de>
References: <20230824030304.1555547-1-sjg@chromium.org>
 <20230824030304.1555547-7-sjg@chromium.org>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20230824030304.1555547-7-sjg@chromium.org>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: Tom Rini <trini@konsulko.com>, u-boot@dh-electronics.com,
 uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Kamil Lulko <kamil.lulko@gmail.com>, Dillon Min <dillon.minfei@gmail.com>,
 Vikas Manocha <vikas.manocha@st.com>
Subject: Re: [Uboot-stm32] [PATCH 6/6] stm32mp15: Use u-boot-spl-stm32.bin
 instead of u-boot-spl.stm32
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

On 8/24/23 05:02, Simon Glass wrote:
> A '.stm32' extension is not allowed anymore, so change it.

Why?

This will likely break a huge amount of scripts, I'm tempted to NAK it 
unless there is a very good reason.
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
