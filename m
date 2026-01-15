Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 054A0D22211
	for <lists+uboot-stm32@lfdr.de>; Thu, 15 Jan 2026 03:34:02 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A9AD0C8F275;
	Thu, 15 Jan 2026 02:34:01 +0000 (UTC)
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B6709C8F261
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Jan 2026 02:34:00 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4ds6Vt34Xrz9t2K;
 Thu, 15 Jan 2026 03:33:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1768444438;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=87GaJH/3m42bREedivi7ShSFogY50JcX+9eXpOLTHyQ=;
 b=R5IYiJDN5WbY95FozOktsp8NJ3yMez3SHjaqDwvy/sfaLCgzMW+Uc+NeUk6k1zzIlAjFHs
 Vr5V82486MHMPpBwbST4Y0m5VmkhBgHHs2EbCfBU9I0a5sRmxCPoIC/kT+UStXyq2+Sc89
 r0ntx5660DZ2pi2VLQqlE5xFn5D01l3Jb4WNKJrwgrAJOI1c2GUiJ46Nd0WgLHs82xAEOn
 cmiJNhb3sxjfGiLgrdRx4OEYkUQc24dYMcxpJulobbAILhQKNPvvDpwgYTMP2uIagUaBeS
 TnggZN3wrOeSi1F2rM9uyXevVvbfTF8tS/4Mz4YMEUxn+mMIaGCm+qjQBIrc7g==
Message-ID: <e9169e36-9cdd-4c94-af44-1ae7ff5400ad@mailbox.org>
Date: Thu, 15 Jan 2026 03:33:54 +0100
MIME-Version: 1.0
To: Patrice CHOTARD <patrice.chotard@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 Peng Fan <peng.fan@nxp.com>
References: <20251215-restore_boot_for_stm32mp13_stm32mp25_boards_v2-v3-0-d055da246e55@foss.st.com>
 <20251215-restore_boot_for_stm32mp13_stm32mp25_boards_v2-v3-3-d055da246e55@foss.st.com>
 <869f8843-8d43-4c1f-b6ae-0116fcf64ac4@foss.st.com>
 <f6140b6b-2dba-4bfe-bdf8-11a9793916ee@mailbox.org>
 <020df345-65df-4d5b-945c-36db65428587@foss.st.com>
 <5f0174c7-6791-4fc3-80df-62812baed40c@foss.st.com>
 <5a4ea825-3a89-4856-b9d8-d1df827f9b9c@mailbox.org>
 <cecb567b-289d-49b8-a9dd-390a6d894500@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <cecb567b-289d-49b8-a9dd-390a6d894500@foss.st.com>
X-MBO-RS-ID: 17354f682fc9e15fe7c
X-MBO-RS-META: 5kesj6s9xn6agie8tm97huqpugxye8gf
Cc: Tom Rini <trini@konsulko.com>, Valentin Caron <valentin.caron@foss.st.com>,
 Lukasz Majewski <lukma@denx.de>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Lionel Debieve <lionel.debieve@foss.st.com>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH v3 3/3] clk: stm32: Update clock
 management for STM32MP13/25
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

On 1/14/26 5:55 PM, Patrice CHOTARD wrote:

Hello Patrice,

>> No, that is not enabled in the DHSBC config.
>>
>> You should be able to try the SPL on MP13 EV if you pick the changes from these three commits (a few DT changes and a few config options), it should be straightforward to port over and help you debug the problem:
>>
>> bf53344bff8d ("ARM: dts: stm32: Add STM32MP13x SPL specific DT additions")
>> 1143fd4c3507 ("ARM: dts: stm32: Add SPL specifics for DH STM32MP13xx DHCOR DHSBC")
>> 998da69da678 ("ARM: dts: stm32: Switch defconfig to SPL for DH STM32MP13xx DHCOR DHSBC")
>>
>> If this doesn't work quickly for you, I can try to set up the MP13 DHSBC with DEBUG_UART later this week.
> Hi Marek
> 
> Thanks for pointing these patches.
> I succeed to make stm32mp135f-dk board in SPL boot.
> 
> I will now investigate why SPL boot is no more functional with this patch.

Thank you for your help !
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
