Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC8E1BBB99
	for <lists+uboot-stm32@lfdr.de>; Tue, 28 Apr 2020 12:52:11 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 82DF3C36B0B
	for <lists+uboot-stm32@lfdr.de>; Tue, 28 Apr 2020 10:52:11 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 28801C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Apr 2020 10:52:09 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 49BJPN0PXWz1qs0h;
 Tue, 28 Apr 2020 12:52:08 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 49BJPM5z4Fz1r5Qb;
 Tue, 28 Apr 2020 12:52:07 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id xX4ADHSwLdNa; Tue, 28 Apr 2020 12:52:06 +0200 (CEST)
X-Auth-Info: OmTjl08EOsYYX/p51k0MzEqSv/OeUW9ZnsoLXvwRAng=
Received: from [127.0.0.1] (unknown [195.140.253.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Tue, 28 Apr 2020 12:52:06 +0200 (CEST)
To: Patrice Chotard <patrice.chotard@st.com>, u-boot@lists.denx.de
References: <20200428093804.20773-1-patrice.chotard@st.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <9c2a3b90-2e6a-766e-64c6-bb692ed4c083@denx.de>
Date: Tue, 28 Apr 2020 11:50:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200428093804.20773-1-patrice.chotard@st.com>
Content-Language: en-US
Cc: Stephen Warren <swarren@nvidia.com>, Simon Glass <sjg@chromium.org>,
 Ovidiu Panait <ovpanait@gmail.com>, Alexey Brodkin <abrodkin@synopsys.com>,
 Eric Perie <eric.perie@yahoo.com>, Patrick DELAUNAY <patrick.delaunay@st.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 Trevor Woerner <trevor@toganlabs.com>, Ramon Fried <rfried.dev@gmail.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH v2] cmd: cache: Fix non-cached memory
	cachability
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

On 4/28/20 11:38 AM, Patrice Chotard wrote:
> If dcache is switched OFF to ON state and if non-cached memory is
> used, this non-cached memory must be re-declared as uncached to mmu
> each time dcache is set ON.
> 
> Introduce noncached_set_region() to set this non-cached region's mmu
> settings. Let architecture override it by defining it as a weak
> function.
> 
> For ARM architecture, noncached_set_region() defines all noncached
> region as non-cacheable.
> 
> Issue found on STM32MP1 platform using dwc_eth_qos ethernet driver,
> when going from dcache OFF to dcache ON state, ethernet driver issued
> TX timeout errors when performing dhcp or ping.
> 
> It can be reproduced with the following sequence:
> 
> dhcp
> while true ; do
>   ping 192.168.1.300 ;
>   dcache off ;
>   ping 192.168.1.300 ;
>   dcache on ;
> done
> 
> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
> Cc: Marek Vasut <marex@denx.de>
> Cc: Joe Hershberger <joe.hershberger@ni.com>
> Cc: Ramon Fried <rfried.dev@gmail.com>
> Cc: Stephen Warren <swarren@nvidia.com>
> 
> ---
> 
> Changes in v2:
>     - make noncached_set_region a weak function
> 
>  arch/arm/lib/cache.c | 13 ++++++++++---
>  cmd/cache.c          |  5 +++++
>  2 files changed, 15 insertions(+), 3 deletions

Reviewed-by: Marek Vasut <marex@denx.de>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
