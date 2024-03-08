Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4260687665F
	for <lists+uboot-stm32@lfdr.de>; Fri,  8 Mar 2024 15:30:17 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0BB66C6C83D;
	Fri,  8 Mar 2024 14:30:17 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 433A1C6B46B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 Mar 2024 14:30:14 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 820DE87EED;
 Fri,  8 Mar 2024 15:30:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1709908213;
 bh=x1XBmFPdQxPcKFZhHI9/4LugzScPOkccyfBcqvQKj4U=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=MvzCa6Rw6vHW9J5tEn1MUv7fWdi7azxIJu/rni4OTd0h86B9OX7tfn988PrclVZv0
 gYKjLFpWf0vY+imnDczZZYEhZ7kYRIL/HZOE1Lj3Wse7CDtMl6kY9NfwWZokf6bxHC
 kzF4es7CQJg5KA1EQN2YOUf8oSkshRMRTbAvbXUxty6PmaFqq5qtLS8fxEIObI96CZ
 3sibgql/vUq2RCUFcY9NuP4UrVW69clEMIDmjGstYBAm6nwQecyYtEdZcwr6kuG6nG
 Xwb9U9CZJP+N93Jy5g6xY76pytW78+Dp7+JtsUSX+aHg2ETjGYNx1uXX8UR2Sp6XAN
 gdd+WgXzaW4BA==
Message-ID: <91fcb5d9-d38b-40f8-bb66-d4f7e8b1a697@denx.de>
Date: Fri, 8 Mar 2024 15:02:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Patrice Chotard <patrice.chotard@foss.st.com>, u-boot@lists.denx.de
References: <20240308135009.2621719-1-patrice.chotard@foss.st.com>
 <20240308135009.2621719-3-patrice.chotard@foss.st.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20240308135009.2621719-3-patrice.chotard@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@dh-electronics.com, Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH 3/3] ARM: dts: stm32: Fix partition node
 name for stm32mp15xx-dhcom-u-boot
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

On 3/8/24 2:50 PM, Patrice Chotard wrote:
> Fix flash@0 partition node name with correct offset.
> 
> Fixes: 90f992e6a58c ("arm: dts: stm32: Add partitions in flash0 and nand
> node for stm32mp15xx-dhcom/dhcor")
> 
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>

Reviewed-by: Marek Vasut <marex@denx.de>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
