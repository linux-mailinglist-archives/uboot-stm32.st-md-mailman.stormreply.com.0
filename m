Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C2451C128
	for <lists+uboot-stm32@lfdr.de>; Thu,  5 May 2022 15:45:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B1110C6047D;
	Thu,  5 May 2022 13:45:55 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8C4CFC5F1F1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 May 2022 13:45:54 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id ED25183BF4;
 Thu,  5 May 2022 15:45:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1651758354;
 bh=6NxQ2iFXAgt2ZFQw5p47N1W2OhDCMaD19pv4TDMIEsI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=PxTSQ8JG8wGSdSbvOpab+5Mpa5J58hdGAPELlXNB7vScW1l60WCqh/+Fw3S9J0EQD
 x6qxvW5R/B+zgBbwOEaYdJMgyFW5ZKzkuFa6I40Qs+HxS++sxhB+++g4vpPe8ZpJTg
 vfDRpTuTSgI/OS1QKoR+Kl5IpvPd3lmUclLGEDOk8YwQ74JVCCZj8vXuPIWLLSAl8r
 2xuZFV1dknPZwkk3Ou7Bi9TFnnzSITCn/MlkIoFUlj/PQ/ShcHDOh8Gd09OF2YeAAC
 49KkHQWzJn6rv6nbVEXN2FvZiSsc2pPlhE820VtUUo8mLWIcjROf3eDnkQi6/BKT//
 VSx6nYMnyy4zA==
Message-ID: <3a7461a5-9796-8424-07d6-688e37bfa36f@denx.de>
Date: Thu, 5 May 2022 15:45:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: Patrice Chotard <patrice.chotard@foss.st.com>, u-boot@lists.denx.de
References: <20220505151756.1.Ia5711b14a17cf1d042bdab9d3f28437d5c53272c@changeid>
 <20220505151756.2.Ic4641ddc829feecc12b775615bd175f3f35c3ea9@changeid>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20220505151756.2.Ic4641ddc829feecc12b775615bd175f3f35c3ea9@changeid>
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 2/2] usb: host: ehci-generic: Remove
	DM_REGULATOR flag
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

On 5/5/22 15:17, Patrice Chotard wrote:
> Currently, DM_REGULATOR flag is no more needed to protect no DM core,
> remove it.

DM_REGULATOR flag is actually Kconfig symbol.

Why is it no longer needed ? (answer should be in the commit message)
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
