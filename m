Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F389A8FF2
	for <lists+uboot-stm32@lfdr.de>; Mon, 21 Oct 2024 21:36:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 633D4C78012;
	Mon, 21 Oct 2024 19:36:28 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1180DC6C855
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Oct 2024 19:36:27 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 1AF2088F20;
 Mon, 21 Oct 2024 21:36:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1729539386;
 bh=5CpDg+YXHD2qsaxleryrZOgFpG/kBdPC1jLUhJ4q3hs=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=GqKA44YfgwiE4zBFUWeqrqry2A04UxTrj3PJFThmBrilLgpxBR2lBDI6MjzJA2WqX
 tgBNIg356eiiFxHCosFMdHqMueXIr+NIF5zgL/dK8ngJ6IYZ2Bn7/w371leNHPveUK
 WxntfjJbSdZHPDu1ClQ7gI8G/CpMo+6SoVfpCz+55vSclXFGi9gViY7qvVzNTl3JIc
 EacgKjzy6bDK5wCJZE9rfRGh+hd0+hNIdgfMtYm8J9E6iFifbbP0OJw9GEERAXGYmt
 I8icjrGtbpLhV67Jo05ykqZfAbtvhCW1z+n/QJaxLmS0SjFrC/OTREDF6yC6QDYCWY
 OD25tcEu5FVYg==
Message-ID: <ebf485a1-efa8-48bf-ad02-e6ac543e489f@denx.de>
Date: Mon, 21 Oct 2024 21:34:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, u-boot@lists.denx.de
References: <20241021181210.1.If2ca2776660cebc50014960f9a4781e8ef937d1f@changeid>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20241021181210.1.If2ca2776660cebc50014960f9a4781e8ef937d1f@changeid>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>, u-boot@dh-electronics.com
Subject: Re: [Uboot-stm32] [PATCH] ARM: dts: stm32: remove unused include
	for dhcor
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

On 10/21/24 6:12 PM, Patrick Delaunay wrote:
> Remove device tree include files no more used with OF_UPSTREAM migration
> stm32mp135f-dhcor-dhsbc.dts
> 
> Fixes: cccb29fc1270 ("ARM: dts: stm32: Switch to using upstream DT on DH
> STM32 DHSOM")
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
I found two more unused files, I will send an extended patch shortly.

Thanks for noticing this.
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
