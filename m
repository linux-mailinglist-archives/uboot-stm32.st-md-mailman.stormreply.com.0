Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A87234E9FF
	for <lists+uboot-stm32@lfdr.de>; Tue, 30 Mar 2021 16:12:42 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 24F16C57B54;
	Tue, 30 Mar 2021 14:12:42 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5C13EC5719E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Mar 2021 14:12:39 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4F8rxf6t0Hz1qt3l;
 Tue, 30 Mar 2021 16:12:38 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4F8rxf671Zz1sP6c;
 Tue, 30 Mar 2021 16:12:38 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id LFGhgEgQr21c; Tue, 30 Mar 2021 16:12:37 +0200 (CEST)
X-Auth-Info: XNM9u9wCvZFmIjj/Dpu9wZOEBuehQ1mg+Z6KiMUuJwM=
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Tue, 30 Mar 2021 16:12:37 +0200 (CEST)
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, u-boot@lists.denx.de
References: <20210330143429.1.I654d7aeb07f9cd0602752861d06f4c17e9a0ee17@changeid>
From: Marek Vasut <marex@denx.de>
Message-ID: <5d06fe48-bf97-8d23-36e7-8a509f0127ed@denx.de>
Date: Tue, 30 Mar 2021 16:12:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210330143429.1.I654d7aeb07f9cd0602752861d06f4c17e9a0ee17@changeid>
Content-Language: en-US
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Joe Hershberger <joe.hershberger@ni.com>, Ramon Fried <rfried.dev@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH] net: dwc_eth_qos: cosmetic: remove unused
 define EQOS_DESCRIPTOR_ALIGN
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

On 3/30/21 2:34 PM, Patrick Delaunay wrote:
> Remove the define EQOS_DESCRIPTOR_ALIGN unused since the
> commit 6f1e668d964e ("net: dwc_eth_qos: Pad descriptors to cacheline size")
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Acked-by: Marek Vasut <marex@denx.de>

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
