Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 768FB8AC135
	for <lists+uboot-stm32@lfdr.de>; Sun, 21 Apr 2024 22:29:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 165F2C6DD67;
	Sun, 21 Apr 2024 20:29:17 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4B9DFC6C83A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 21 Apr 2024 20:29:15 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 4F06C87ED0;
 Sun, 21 Apr 2024 22:29:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1713731354;
 bh=6iGttA6Lga+D0XYY7Ppgso9ZLkb+fFt+eIYTQJrxp8s=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=vbfZYIR/Dmdq2VwF4DdOJO3g7uj0mferVEHNVYu++Rtu0Ea0/sxKTl0eLqwpdFvRX
 LIufDxIe48/W5JS9sxDBWsXZ+O7qTU4Mt8RBqR4mcXIZTtY4lgPJcb0VNSbqrvER/1
 wiMp0iG/3MAF3SI/MaDaC7vWKkb+aJtoVJ+dkyi/9vR8d/yZKpKALQMGwAE/TcdZi3
 sE4g7IRWWi6JzTSUa7bhOViyYCbtbtVcp21B/JGWy1sNSdMALwyU9kKQCgszhzAZY8
 ZjmGOjp6YRVdMrFcrqx8nbmA5EYftzzzRVmJOSuy984jdnRiryQ1YvFIaHZBVDf9m/
 rthcaesQiCJTg==
Message-ID: <b8089d71-42f1-4cb7-9b5e-e3cd99e9ffa5@denx.de>
Date: Sun, 21 Apr 2024 22:27:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: u-boot@lists.denx.de, Tom Rini <trini@konsulko.com>
References: <20240319024534.103299-1-marex@denx.de>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20240319024534.103299-1-marex@denx.de>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com, u-boot@dh-electronics.com
Subject: Re: [Uboot-stm32] [PATCH 1/2] ARM: dts: stm32: add PWR regulators
 support on stm32mp131
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

On 3/19/24 3:45 AM, Marek Vasut wrote:
> This patch adds STM32 PWR regulators DT support on stm32mp131.
> This requires TFA to clear RCC_SECCFGR, is disabled by default
> and can only be enabled on board DT level.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>

It seems these patches have been missed from the recent PR ?

Is there any feedback on those patches ?
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
