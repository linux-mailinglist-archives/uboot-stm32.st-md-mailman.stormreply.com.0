Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE90B26794
	for <lists+uboot-stm32@lfdr.de>; Thu, 14 Aug 2025 15:37:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2E12DC35E00;
	Thu, 14 Aug 2025 13:37:11 +0000 (UTC)
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 15221C36B3F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Aug 2025 13:37:09 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4c2mW73ppwz9tFm;
 Thu, 14 Aug 2025 15:37:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1755178627;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nMDewS9h4e99F7/5HiBas2VBHtSLFsVMS1CmtdwaT78=;
 b=vAnMuSpynDp/0AFopp/8BM5ZRokrYlF/4uCH/dWSd+VIbm3txZoKQ9RtryKHGdnQaWN/eo
 kax0Sn6uY++M+zfTVe6mamFJ50zl8NvHXiHg/hryqh2a5b+mk4rkQcwATboeoYJ3hyCVBD
 RhRQBzV80+M+52Ydnk7D4RNYxMob+M0G6f+YxVnSGBHlymkWwtPXg8lDgqOqz+yC8EhU0B
 bbnZYj4B7evVkMF+aKPCPKi9o96dZZZsu0KNw3Yc9yK0XExu8Wr72QUn/v9tRj8KPyL+P+
 I8bDf2FmE/5Lvi7wTIMCokB99J2pJmNFDRhrVm8W9LatQ5tHqhqGfDmC2fyIaQ==
Message-ID: <a10f97cf-72d8-4f82-870f-cb845e5cb72e@mailbox.org>
Date: Thu, 14 Aug 2025 15:37:05 +0200
MIME-Version: 1.0
To: Patrice Chotard <patrice.chotard@foss.st.com>, u-boot@lists.denx.de
References: <20250814120938.1358059-1-patrice.chotard@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20250814120938.1358059-1-patrice.chotard@foss.st.com>
X-MBO-RS-ID: b61c2fbb653f223224a
X-MBO-RS-META: j18yg7w5aj6s5dcs43ec7nj3dek7thqg
Cc: Tom Rini <trini@konsulko.com>,
 Jerome Forissier <jerome.forissier@linaro.org>,
 Cheick Traore <cheick.traore@foss.st.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Sughosh Ganu <sughosh.ganu@linaro.org>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH v2] configs: stm32mp25: Enable
	OF_UPSTREAM_BUILD_VENDOR
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

On 8/14/25 2:09 PM, Patrice Chotard wrote:
> Initially, only one STM32MP25 based board was available, the
> stm32mp257f-ev1 board which was set by default in stm32mp25_defconfig.
> 
> Since commit 79f3e77133bd ("Subtree merge tag 'v6.16-dts' of dts repo [1] into dts/upstream")
> we inherited of a second MP25 based board which is the stm32mp257f-dk board.
> 
> Enable OF_UPSTREAM_BUILD_VENDOR and set OF_UPSTREAM_VENDOR to allow all
> STMicroelectronics DT compilation.
If I build stm32mp25_defconfig , I can run the result on both EV1 and DK 
now ?

It seems only the EV1 DT is built into the binary, so why compile all DTs ?

$ grep TREE configs/stm32mp25_defconfig
CONFIG_DEFAULT_DEVICE_TREE="st/stm32mp257f-ev1"

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
