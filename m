Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 582AB9DEC16
	for <lists+uboot-stm32@lfdr.de>; Fri, 29 Nov 2024 19:26:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0590EC78024;
	Fri, 29 Nov 2024 18:26:22 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2FCD7C71289
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 29 Nov 2024 18:26:14 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 2955C89464;
 Fri, 29 Nov 2024 19:26:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1732904773;
 bh=xEzga6axYbmyvQ5L92ZSj47M7FUFHXFt6T3JP/+D1yU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=jXyJ83Ib4JbzPky6a6M5dg8gRIAasoBBikxLpS9TYDOldQYn0v6gNVmMdIxN4N4L2
 L+AgjZ/IQNQj5MWxs+BE/wRyIdwVUC7ZYs629UihXx80PcSU03uuIw5VzscBc7eu3+
 zPe7tD1pIztelSnb9g84wn6usZ8fhbAzVa2RAHHTfVcf7HKm0fNj3BIspYeOHKoMc0
 AJXaoRKNS1vuyKT3pvQu1qAEg0utDG2amheW5pw023wC2SKoGmdX0IB9rZurrawmho
 hIU+6XdhfSXwBkfB5/DxXeYHV/12rEvHBqjInsw9abJGN6Cvx2KDDaElh3W2aStAgr
 RuCPC0WVQr1og==
Message-ID: <e38ca399-f61b-4f56-8a43-aaed19839764@denx.de>
Date: Fri, 29 Nov 2024 18:32:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrice Chotard <patrice.chotard@foss.st.com>, u-boot@lists.denx.de
References: <20241129124422.435998-1-patrice.chotard@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20241129124422.435998-1-patrice.chotard@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: Tom Rini <trini@konsulko.com>, Jonas Karlman <jonas@kwiboo.se>,
 Quentin Schulz <quentin.schulz@cherry.de>, Simon Glass <sjg@chromium.org>,
 Jaehoon Chung <jh80.chung@samsung.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH] power: regulator: replace some debug() by
	dev_dbg/err()
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

On 11/29/24 1:44 PM, Patrice Chotard wrote:
> Replace some debug() by dev_dbg() when dev variable
> is available/valid.
> 
> To ease debugging, use dev_err() instead of dev_dbg() for
> alerting when regulator has nonunique value.
> 
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
Reviewed-by: Marek Vasut <marex@denx.de>

Thanks !
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
