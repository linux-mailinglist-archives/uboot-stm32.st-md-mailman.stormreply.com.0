Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C6EE7B7E65
	for <lists+uboot-stm32@lfdr.de>; Wed,  4 Oct 2023 13:41:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5C9CBC6C832;
	Wed,  4 Oct 2023 11:41:32 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DA9A4C6C831
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Oct 2023 11:41:30 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 11BA5874FB;
 Wed,  4 Oct 2023 13:41:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1696419690;
 bh=9WXTuMY1i00rT+7DRvvoiiWPXdMjPkUBrK4GTBxM64U=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=YkLDyhSVqC1GqgECqx42tRTQ/tlU2fXPMrpHKKso0ck812laky30MH9TySd80c/kA
 MGcrkgjjFg1b40pcScRP7yHYX1VmbLNR4KhigGCaynbSLfibUQnEG93C0aJDvng7Hd
 X2RwDvbNJO4g8j8WCTvOZokRWjHCMg4uc0O7UtAt3O7SyjYDCFWzBhwLDpMXZHRsqy
 oGclJp3u8e1H36yGeVz5+z//o/gB4t0HGhYQrBNimW1NafFuR0tN/V+IovxGIXqKH7
 mLf0d2S/U1BeQgQXwZzBLqCBkes6XPTa/m766uUuuoP+mWmDTXMcApTQVvFvLhwK8X
 1SRBa4EMHp9Gg==
Message-ID: <6334910c-baf3-4e6a-81b0-784f3dd372f6@denx.de>
Date: Wed, 4 Oct 2023 13:41:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrice CHOTARD <patrice.chotard@foss.st.com>, Harald Seiler
 <hws@denx.de>, u-boot@lists.denx.de
References: <20230927124625.247858-1-hws@denx.de>
 <7943bfcb-204d-526d-9208-fd38fbc567b4@denx.de>
 <756093f5-d3da-eeae-9619-763e48d297cc@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <756093f5-d3da-eeae-9619-763e48d297cc@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, u-boot@dh-electronics.com
Subject: Re: [Uboot-stm32] [PATCH 2/2] board: dh_stm32mp1: Only print board
 code with CONFIG_SPL_DISPLAY_PRINT
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

On 10/4/23 11:19, Patrice CHOTARD wrote:
> 
> 
> On 9/30/23 23:02, Marek Vasut wrote:
>> On 9/27/23 14:46, Harald Seiler wrote:
>>> Ensure that the SoM and board code information is only printed when
>>> CONFIG_SPL_DISPLAY_PRINT is set.
>>>
>>> Signed-off-by: Harald Seiler <hws@denx.de>
>>
>> Reviewed-by: Marek Vasut <marex@denx.de>
> 
> 
> Apply on stm32/next

This all should be on master, since we're way before 2024.01-rc1 now , 
2023.10 was just released on Monday.
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
