Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4429787665E
	for <lists+uboot-stm32@lfdr.de>; Fri,  8 Mar 2024 15:30:15 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 01B9CC6C83D;
	Fri,  8 Mar 2024 14:30:15 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C72AFC6B46B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 Mar 2024 14:30:13 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id E53E987C94;
 Fri,  8 Mar 2024 15:30:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1709908213;
 bh=9eOOH/Fk4XbFgkFQNo0HWUmox4M/hrWvk1gGaucOmao=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=w6mwj8wYKbaJC14UmTkO7tEBFDZbuCLI4wkLsqihm4JZp1lb1IsfF4gOEpahsIjRu
 1CtzMJNR751tBY1cExYPbpGDY9V3JsqVRFQEVse65yXFwcj8et7nY2AfvYiVqewr5+
 rD3dSz4nntiBMCsF6Uu/X3nPeVAGPwUpMOEQSTAqbFmb12vQKG3H1sIqQ6LW/CxuOj
 K+Y/8J/2CSnq7QUuuf1ZnoZx/8XFlKWVMsEiJN5mdAE3ZKfVZPsGWgygzZkRP+ZU+P
 XqxrGfvUx1lzZ/8EJ6M6H2aF5/EOsqVE3emJgNKu1NGNeCD51HVAiD59jaakHx5dSF
 wE/K87aoc1slg==
Message-ID: <22276045-8179-4544-8921-698166994bdc@denx.de>
Date: Fri, 8 Mar 2024 15:02:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrice Chotard <patrice.chotard@foss.st.com>, u-boot@lists.denx.de
References: <20240308135009.2621719-1-patrice.chotard@foss.st.com>
 <20240308135009.2621719-2-patrice.chotard@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20240308135009.2621719-2-patrice.chotard@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH 2/3] ARM: dts: stm32: Fix partition node
 name for stm32mp15xx-dhcor-u-boot
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
> Fixes: 90f992e6a58c ("arm: dts: stm32: Add partitions in flash0 and nand node for
> stm32mp15xx-dhcom/dhcor")
> 
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>

Reviewed-by: Marek Vasut <marex@denx.de>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
