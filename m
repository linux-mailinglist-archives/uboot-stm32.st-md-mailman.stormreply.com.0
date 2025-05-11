Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E0097AB2B3D
	for <lists+uboot-stm32@lfdr.de>; Sun, 11 May 2025 22:57:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5FF73C78F7B;
	Sun, 11 May 2025 20:57:37 +0000 (UTC)
Received: from mx.denx.de (mx.denx.de [89.58.32.78])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B06DEC78F69
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 11 May 2025 20:57:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1338B1048C2EC; 
 Sun, 11 May 2025 22:57:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
 t=1746997055; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=/Ax/yWIt7J3hg262AYPPHS0aJ9MZFZcgFTYlpssnv/o=;
 b=JOW2e356S0P+pS5vplrI76WcyfwfwTJSJ5lS5Q/y4TfTk2mwsBXnn+WOSKu13+l9Jp+OZq
 DAL/31MyV+6PGuS2Re2rQZXOcwJ03+YwbLO3b7C3C7pjQujyBTnG+PYJGZeZXEHF/TpJ9k
 j4ZvVDpU+PJkheMwD7mSKBgyU+z9K10WIC++QYVZWxt0Khg+A2FBYbzP/tDLrU8SkXCnRM
 A4SC6I4lj3foOhp0dIjksY5aiDfQLj+DSc72D+y4dsbVAJxhgX+dqIIpdMCGTG16uiYxXH
 vReCjpWCGQgpQSCQq7nnslzPwSs0jPOmHp/jncGq5TiLMsUVOGbETsyisewJEg==
Message-ID: <831cd958-018d-4f39-91ed-5a9c44853bc2@denx.de>
Date: Sun, 11 May 2025 22:57:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Lukasz Majewski <lukma@denx.de>, Tom Rini <trini@konsulko.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>
References: <20250510065256.267546-1-lukma@denx.de>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20250510065256.267546-1-lukma@denx.de>
X-Last-TLS-Session-Version: TLSv1.3
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 Simon Glass <sjg@chromium.org>, Sughosh Ganu <sughosh.ganu@linaro.org>
Subject: Re: [Uboot-stm32] [PATCH] ARM: stm32mp: Correct sign extension for
 memory address in dram_bank_mmu_setup()
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

On 5/10/25 8:52 AM, Lukasz Majewski wrote:
> On a system based on stm32mp157c, with 1GiB SDRAM (starting from
> 0xC0000000) and CONFIG_PHYS_64BIT enabled

STM32MP15xx does not have 64bit PA range , why is CONFIG_PHYS_64BIT 
enabled ?
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
